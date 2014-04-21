{-# LANGUAGE NoMonomorphismRestriction, ScopedTypeVariables, TupleSections #-}

module TypeCheck where

import           Control.Monad
import           Data.Either (Either)
import           Control.Monad.State
import           Control.Monad.Trans.Either (runEitherT, EitherT, left)
import qualified Data.Map as M
import           Data.Monoid ((<>))

import AST
import Interface

checkAST :: UnnAST -> Either String ()
checkAST (Fix ast) = do
  interfaces <- return $ buildInterface (Fix ast)
  case interfaces of
    Just interfaces' -> do
      let state = (M.empty, Nothing, interfaces')
      evalState (runEitherT . void $ check ast) state
    Nothing         -> do
      fail "Failed to build class interface"

type CheckState = (M.Map AId AVarType, Maybe (AId, InterfaceEntry), InterfaceMap)
type MCheck = EitherT String (State CheckState)

withSnapshot action = do
  snap <- lift get
  ret <- action
  lift $ put snap
  return ret

reserve :: AId -> AVarType -> MCheck ()
reserve name kind = do
  (prev, _, _) <- lift get
  case M.lookup name prev of
    Just val -> left $ errorMsg val
    Nothing  -> lift . modify $ \(_, _2, _3) -> (M.insert name kind prev, _2, _3)
  where
  errorMsg val = "Identifier '" <> name <> "'" <>
                 " already declared as type '" <> show val <> "'"

unFix (Fix f) = f
mapUnfix = map unFix

getVarType :: AId -> MCheck AVarType
getVarType name = do
  (locals, (Just (_, (interface, _))), _3) <- get
  case (M.lookup name $ M.union locals interface) of
    Nothing -> left $ "Invalid variable reference '" <> name <> "'"
    Just t  -> return t

check :: AEntry UnnAST -> MCheck AVarType

------------------- Programs ------------------- 

check (AProgram classes) = mapM_ (check . unFix) classes >> return TypeVoid

------------------- Classes ------------------- 

check (AClass name _ methods) = do
  (_, _, interface) <- get
  let Just interface' = M.lookup name interface
  modify $ \(_1, _, _3) -> (_1, Just (name, interface'), _3)

  mapM_ (check . unFix) methods

  modify $ \(_1, _, _3) -> (_1, Nothing, _3)
  return TypeVoid

check (AVar kind name) = reserve name kind >> return TypeVoid

------------------- Methods ------------------- 

check (AMethod refRet name args vars code (Fix retExpr)) = withSnapshot $ do
  mapM_ check $ (mapUnfix args) <> (mapUnfix vars)
  mapM_ (check . unFix) code
  inferredRet <- check retExpr
  when (inferredRet /= refRet) $ 
    left $ "Invalid type of return expression (" <>
            show refRet <> " indicated, " <>
            show inferredRet <> " used)"
  return TypeVoid

------------------- Statements ------------------- 

check (AStatScope s) = withSnapshot $ do
  forM_ s $ \(Fix s') -> do
    statType <- check s'
    when (statType /= TypeVoid) $
      left $ "Invalid statement in scope block"

  return TypeVoid

check (AIf (Fix guard) (Fix s1) (Fix s2)) = withSnapshot $ do
  guardType <- check guard
  when (guardType /= TypeBoolean) $
    left $ "Non-boolean type of guard in if-statement"

  forM_ [s1, s2] $ \body -> do
    bodyType <- check body
    when (bodyType /= TypeVoid) $
      left $ "Invalid statement body in if-statement"

  return TypeVoid

check (AWhile (Fix guard) (Fix s)) = withSnapshot $ do
  guardType <- check guard
  when (guardType /= TypeBoolean) $
    left $ "Non-boolean type of guard in while-statement"

  bodyType <- check s
  when (bodyType /= TypeVoid) $
    left $ "Invalid loop body in while-statement"

  return TypeVoid

check (APrint (Fix e)) = do
  inner <- check e
  when (inner == TypeVoid) $
    left "Invalid print call on void type"
  
  return $ TypeVoid

check (AAssignment (Fix name) (Fix e)) = do
  outerType <- check name
  asssnType <- check e
  when (outerType /= asssnType) $
    left $ "Assignment with incompatible types, variable " <> show name

  return TypeVoid

check (AIndexedAssignment (Fix name) (Fix e1) (Fix e2)) = do
  outerType <- check name
  when (outerType /= TypeIntegerArray) $
    left $ "Invalid [] access to non-array variable " <> show name
    
  innerType <- check e1
  when (outerType /= TypeInteger) $
    left $ "Invalid non-integer index into variable " <> show name
    
  asssnType <- check e2
  when (asssnType /= TypeInteger) $
    left $ "Invalid non-integer assignment into variable " <> show name

  return TypeVoid

------------------- Expressions ------------------- 

check (AExprOp op (Fix e1) (Fix e2)) = do
  t1 <- check e1
  t2 <- check e2
  inf op t1 t2
  where
  inf OperandLess       TypeInteger TypeInteger = return $ TypeBoolean
  inf OperandLogicalAnd TypeBoolean TypeBoolean = return $ TypeBoolean
  inf _                 TypeInteger TypeInteger = return $ TypeInteger
  inf _                 t1          t2          = left   $ 
    "Invalid operator '" <> show op <> "'" <>
    " on types " <> show t1 <> " and " <> show t2

check (AExprList (Fix e1) (Fix e2)) = do
  outerType <- check e1
  when (outerType /= TypeIntegerArray) $
    left "Invalid [] operation on non-array type"

  innerType <- check e2
  when (innerType /= TypeInteger) $
    left "Invalid expression of type in [] operation"

  return TypeInteger

check (AExprLength e) = do
 exprType <- check $ unFix e
 when (exprType /= TypeIntegerArray) $
   left "Invalid .length access to non-array type"
 return TypeInteger

check (AExprInvocation (Fix expr) name args) = do
  -- validate object reference
  exprType <- check expr
  className <- case exprType of
    TypeAppDefined className -> return $ className
    t                        -> left $ "Invalid method-invocation on type: " <> show t

  -- lookup method in interface map
  (_, _, interfaces) <- get
  let methodRef = M.lookup className interfaces >>=  M.lookup name . snd

  -- validate inferred argument types
  case methodRef of
    Nothing            -> left $ "Invalid method reference"
    Just (iRet, iArgs) -> do
      types <- mapM (check . unFix) args
      when (types /= iArgs) $ left "Invalid type(s) of method argument."
      return iRet

check (AExprInt _) = return TypeInteger

check AExprTrue = return TypeBoolean

check AExprFalse = return TypeBoolean

check (AExprIdentifier name) = do
  (scope, _, _) <- get
  case M.lookup name scope of
    Nothing -> left $ "Undeclared identifier: " <> name
    Just t  -> return t

check AExprThis = do
  (_, Just (thisClass, _), _) <- get
  return $ TypeAppDefined thisClass

check (AExprIntArray (Fix e)) = do
  subExpr <- check e
  when (subExpr /= TypeInteger) $ left "Invalid subexpr in new int []"
  return TypeIntegerArray

check (AExprNewObject name) = do
  (_, _, interfaces) <- get
  case M.lookup name interfaces of
    Nothing -> left $ "Missing class decleration of " <> name
    Just _  -> return $ TypeAppDefined name

check (AExprNegation (Fix e)) = check e

check AExprVoid = return TypeVoid
