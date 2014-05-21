{-# LANGUAGE DeriveFoldable, DeriveFunctor, DeriveTraversable, NoMonomorphismRestriction, ScopedTypeVariables, TupleSections #-}

module TypeCheck where

import           Control.Monad
import           Data.Either (Either)
import           Control.Monad.State
import           Control.Monad.Trans.Either (runEitherT, EitherT(..), left)
import           Data.Foldable (Foldable)
import qualified Data.Map as M
import           Data.Monoid ((<>))
import           Data.Traversable (Traversable)
import           System.IO.Unsafe (unsafePerformIO) -- TODO: REMOVE

import AST
import Interface

checkAST :: Monad m => UnnAST -> EitherT String m (InterfaceMap, AnnA)
checkAST (Fix ast) = do
  interfaces <- return $ buildInterface (Fix ast)

  case interfaces of
    Just interfaces' -> do
      let state = (M.empty, Nothing, interfaces')
      ast' <- EitherT $ return $ evalState (runEitherT $ check ast) state
      return (interfaces', ast')
    Nothing         -> do
      left "Failed to build class interface"

type CheckState = (M.Map AId AVarType, Maybe (AId, InterfaceEntry), InterfaceMap)
type MCheck = EitherT String (State CheckState)

withSnapshot action = do
  snap <- lift get
  ret <- action
  lift $ put snap
  return ret

reserve :: AId -> AVarType -> MCheck ()
reserve name kind = do
  (prev, _, interfaces) <- lift get

  let addEntry = lift . modify $ \(_, _2, _3) -> (M.insert name kind prev, _2, _3)
  case (kind, M.lookup name prev) of
    (_, Just val)                -> left $ errorMsg val

    (TypeAppDefined classRef, _) -> do
      when (M.lookup classRef interfaces == Nothing) (left $ missingType classRef)
      addEntry

    (_, Nothing)                 -> addEntry
  where
  errorMsg val = "Identifier '" <> name <> "'" <>
                 " already declared as type '" <> show val <> "'"
  missingType kind = "Identifier declared with invalid type " <> kind

unFix (Fix f) = f
mapUnfix = map unFix

getVarType :: AId -> MCheck AVarType
getVarType name = do
  (locals, (Just (_, (interface, _))), _3) <- get
  case (M.lookup name $ M.union locals interface) of
    Nothing -> left $ "Invalid variable reference '" <> name <> "'"
    Just t  -> return t

arrayMapping = M.fromList [(TypeIntegerArray, TypeInteger), (TypeStringArray, TypeString)]

newtype Ann tag a = Ann (tag, AEntry a)
   deriving (Functor, Foldable, Traversable)

type AnnA = Fix (Ann AVarType)

check :: AEntry UnnAST -> MCheck AnnA

------------------- Programs ------------------- 

check (AProgram classes) = do
  res <- mapM (check . unFix) classes
  return . Fix . Ann $ (TypeVoid, AProgram res)

------------------- Classes ------------------- 

check (AClass name vars methods) = do
  (_, _, interface) <- get
  let Just interface' = M.lookup name interface
  modify $ \(_1, _, _3) -> (_1, Just (name, interface'), _3)

  res <- mapM (check . unFix) methods

  modify $ \(_1, _, _3) -> (_1, Nothing, _3)
  return . Fix . Ann $ (TypeVoid, AClass name vars' res) -- TODO: need to handle vars
  where
  vars' = map (\(Fix (AVar k n)) -> Fix (Ann (k, AVar k n))) vars

check (AVar kind name) = do
  reserve name kind
  return . Fix . Ann $ (TypeVoid, AVar kind name) -- TODO: Check if actual type is needed

------------------- Methods ------------------- 

check (AMethod refRet name args vars code (Fix retExpr)) = withSnapshot $ do
  args' <- mapM check $ mapUnfix args
  vars' <- mapM check $ mapUnfix vars
  code' <- mapM (check . unFix) code
  ret@(Fix (Ann (inferredRet, _))) <- check retExpr
  when (inferredRet /= refRet) $ 
    left $ "Invalid type of return expression (" <>
            show refRet <> " indicated, " <>
            show inferredRet <> " used)"

  return . Fix . Ann $ (TypeVoid, AMethod refRet name args' vars' code' ret)

------------------- Statements ------------------- 

check (AStatScope s) = withSnapshot $ do
  res <- forM s $ \(Fix s') -> do
    subRes@(Fix (Ann (statType, _))) <- check s'
    when (statType /= TypeVoid) $
      left $ "Invalid statement in scope block"
    return subRes

  return . Fix . Ann $ (TypeVoid, AStatScope res)

check (AIf (Fix guard) (Fix s1) (Fix s2)) = withSnapshot $ do
  guard'@(Fix (Ann (guardType, _))) <- check guard
  when (guardType /= TypeBoolean) $
    left $ "Non-boolean type of guard in if-statement"

  [body1, body2] <- forM [s1, s2] $ \body -> do
    subRes@(Fix (Ann (bodyType, _))) <- check body
    when (bodyType /= TypeVoid) $
      left $ "Invalid statement body in if-statement"
    return subRes

  return . Fix . Ann $ (TypeVoid, AIf guard' body1 body2)

check (AWhile (Fix guard) (Fix s)) = withSnapshot $ do
  guard'@(Fix (Ann (guardType, _))) <- check guard
  when (guardType /= TypeBoolean) $
    left $ "Non-boolean type of guard in while-statement"

  s'@(Fix (Ann (bodyType, _))) <- check s
  when (bodyType /= TypeVoid) $
    left $ "Invalid loop body in while-statement"

  return . Fix . Ann $ (TypeVoid, AWhile guard' s')

check (APrint (Fix e)) = do
  subRes@(Fix (Ann (inner, _))) <- check e
  when (not $ elem inner [TypeInteger, TypeBoolean]) $
    left $ "Invalid print call on type " <> show inner
  
  return . Fix . Ann $ (TypeVoid, APrint subRes)

check (AAssignment (Fix name) (Fix e)) = do
  res1@(Fix (Ann (outerType, _))) <- check name
  res2@(Fix (Ann (asssnType, _))) <- check e
  when (outerType /= asssnType) $
    left $ "Assignment with incompatible types, variable " <> show name

  return . Fix . Ann $ (TypeVoid, AAssignment res1 res2)

check (AIndexedAssignment (Fix name) (Fix e1) (Fix e2)) = do
  res1@(Fix (Ann (outerType, _))) <- check name
  when (outerType /= TypeIntegerArray && outerType /= TypeStringArray) $
    left $ "Invalid [] access to non-array variable " <> show name
    
  res2@(Fix (Ann (innerType, _))) <- check e1
  when (innerType /= TypeInteger) $
    left $ "Invalid non-integer index into variable " <> show name
    
  res3@(Fix (Ann (asssnType, _))) <- check e2
  when (M.lookup outerType arrayMapping /= Just asssnType) $
    left $ "Invalid non-array-type assignment into variable " <> show name

  return . Fix . Ann $ (TypeVoid, AIndexedAssignment res1 res2 res3)

------------------- Expressions ------------------- 

check (AExprOp op (Fix e1) (Fix e2)) = do
  e1'@(Fix (Ann (t1, _))) <- check e1
  e2'@(Fix (Ann (t2, _))) <- check e2
  res <- inf op t1 t2
  return . Fix . Ann $ (res, AExprOp op e1' e2')
  where
  inf OperandLess       TypeInteger TypeInteger = return $ TypeBoolean
  inf OperandLessEqual  TypeInteger TypeInteger = return $ TypeBoolean
  inf OperandEqual      TypeInteger TypeInteger = return $ TypeBoolean
  inf OperandEqual      TypeBoolean TypeBoolean = return $ TypeBoolean
  inf OperandEqual      (TypeAppDefined _) (TypeAppDefined _) = return $ TypeBoolean
  inf OperandEqual      TypeIntegerArray TypeIntegerArray = return $ TypeBoolean
  inf OperandLogicalAnd TypeBoolean TypeBoolean = return $ TypeBoolean
  inf _                 TypeInteger TypeInteger = return $ TypeInteger
  inf _                 t1          t2          = left   $ 
    "Invalid operator '" <> show op <> "'" <>
    " on types " <> show t1 <> " and " <> show t2

check (AExprList (Fix e1) (Fix e2)) = do
  e2'@(Fix (Ann (innerType, _))) <- check e2
  when (innerType /= TypeInteger) $
    left "Invalid expression of type in [] operation"

  e1'@(Fix (Ann (outerType, _))) <- check e1
  res <- case M.lookup outerType arrayMapping of
    Nothing -> left "Invalid [] operation on non-array type"
    Just resType -> return resType

  return . Fix . Ann $ (res, AExprList e1' e2')

check (AExprLength e) = do
  e'@(Fix (Ann (exprType, _))) <- check $ unFix e
  when (exprType /= TypeIntegerArray && exprType /= TypeStringArray) $
    left "Invalid .length access to non-array type"
  return . Fix . Ann $ (TypeInteger, AExprLength e')

check (AExprInvocation (Fix expr) name args) = do
  -- validate object reference
  expr'@(Fix (Ann (exprType, _))) <- check expr
  className <- case exprType of
    TypeAppDefined className -> return $ className
    t                        -> left $ "Invalid method-invocation on type: " <> show t

  -- lookup method in interface map
  (_, _, interfaces) <- get
  let methodRef = M.lookup className interfaces >>=  M.lookup name . snd

  -- validate inferred argument types
  args' <- mapM (check . unFix) args
  retType <- case methodRef of
    Nothing            -> left $
      "Invalid method reference, couldn't find " <> name <> " in " <> className
    Just (iRet, iArgs) -> do
      let types = map (\(Fix (Ann (t, _))) -> t) args'
      when (types /= iArgs) $ left "Invalid type(s) of method argument."
      return iRet

  return . Fix . Ann $ (retType, AExprInvocation expr' name args')

check (AExprInt i) = do
  when (i > maxInt) $
    left $ "Integer literal out of range: " <> show i
  return . Fix . Ann $ (TypeInteger, AExprInt i)
  where
  maxInt = 2 ^ 31 - 1

check AExprTrue = return . Fix . Ann $ (TypeBoolean, AExprTrue)

check AExprFalse = return . Fix . Ann $ (TypeBoolean, AExprFalse)

check (AExprIdentifier name) = do
  res <- getVarType name
  return . Fix . Ann $ (res, AExprIdentifier name)

check AExprThis = do
  (_, Just (thisClass, _), _) <- get
  return . Fix . Ann $ (TypeAppDefined thisClass, AExprThis)

check (AExprIntArray (Fix e)) = do
  e'@(Fix (Ann (subExpr, _))) <- check e
  when (subExpr /= TypeInteger) $ left "Invalid subexpr in new int []"
  return . Fix . Ann $ (TypeIntegerArray, AExprIntArray e')

check (AExprNewObject name) = do
  (_, _, interfaces) <- get
  res <- case M.lookup name interfaces of
    Nothing -> left $ "Missing class declaration of " <> name
    Just _  -> return $ TypeAppDefined name
  return . Fix . Ann $ (res, AExprNewObject name)

check (AExprNegation (Fix e)) = do
  e'@(Fix (Ann (t, _))) <- check e
  when (t /= TypeBoolean) $
    left $ "Negation of non-boolean variable" <> show e
  return . Fix . Ann $ (t, AExprNegation e')

check AExprVoid = return . Fix . Ann $ (TypeVoid, AExprVoid)
