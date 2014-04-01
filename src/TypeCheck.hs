module TypeCheck where

import           Control.Monad
import           Data.Either (Either)
import           Control.Monad.State
import           Control.Monad.Trans.Either (runEitherT, EitherT, left)
import qualified Data.Map as M
import           Data.Monoid ((<>))

import AST

checkAST :: AProgram -> Either String ()
checkAST tree = evalState (runEitherT $ checkProgram tree) M.empty

data TypeBinding
  = TClass
  | TMethod AVariableType [AVariableType]
  | TVar AVariableType
  deriving
  (Eq, Ord, Show)

type MCheck = EitherT String (State (M.Map AIdentifier TypeBinding))

-- TODO: Should field overloading be supported? Can be implmented in 'reserve'

withSnapshot :: MCheck b -> MCheck b
withSnapshot action = do
  snap <- lift get
  ret <- action
  lift $ put snap
  return ret

reserve :: AIdentifier -> TypeBinding -> MCheck ()
reserve name kind = do
  prev <- lift get
  case M.lookup name prev of
    Just val -> left $ errorMsg val
    Nothing  -> lift . put $ M.insert name kind prev
  where
  errorMsg val = "Identifier '" <> name <> "'" <>
                 " already declared as type '" <> show val <> "'"

checkPredicate :: (Bool -> Bool) -> AIdentifier -> Maybe TypeBinding -> MCheck ()
checkPredicate pred name kind = do
  -- TODO: implement kind checking
  prev <- lift get
  when (pred $ M.lookup name prev == Nothing) (left errorMsg)
  where
  errorMsg = "Identifier '" <> name <> "' does not exist"

------------------- Programs ------------------- 

checkProgram (Program classes) = mapM_ (checkClass) classes

------------------- Classes ------------------- 

checkClass (Class name vars methods) = do
  reserve name TClass
  withSnapshot $ do
    mapM_ checkVariable vars
    mapM_ checkMethod methods

checkVariable (Variable kind name) = reserve name (TVar kind)

------------------- Methods ------------------- 

checkMethod (Method ret name args vars code retCode) = do
  reserve name $ TMethod ret $ map (\(Variable kind _) -> kind) args
  withSnapshot $ do
    mapM_ checkVariable $ args <> vars
    mapM_ checkStatement code
    checkExpression retCode
    -- TODO: check return type?

checkMethod (MainMethod args vars code) = do
  reserve "main" $ TMethod undefined undefined -- TODO
  withSnapshot $ do
    mapM_ checkVariable $ args <> vars
    mapM_ checkStatement code

------------------- Statements ------------------- 

checkStatement (StatementScope s) = mapM_ checkStatement s

checkStatement (StatementIf guard s1 s2) = withSnapshot $ do
  checkExpression guard
  checkStatement s1
  checkStatement s2

checkStatement (StatementWhile guard s) = withSnapshot $ do
  checkExpression guard
  checkStatement s

checkStatement (StatementPrint e) = withSnapshot $ do
  checkExpression e

checkStatement (StatementAssignment name e) = withSnapshot $ do
  checkExpression e
  checkPredicate id name (Just $ TVar TypeInteger)

checkStatement (StatementIndexedAssignment name e1 e2) = withSnapshot $ do
  checkExpression e1
  checkExpression e2
  checkPredicate id name Nothing

------------------- Expressions ------------------- 

checkExpression (ExprOp op e1 e2) = do
  checkExpression e1
  checkExpression e2

checkExpression (ExprList e1 e2) = do
  checkExpression e1
  checkExpression e2

checkExpression (ExprLength e) = checkExpression e

checkExpression (ExprInvocation e name args) = do
  checkExpression e
  mapM_ checkExpression args

  -- TODO: Should more properties be verified?
  map <- lift get
  case M.lookup name map of
    Just (TMethod _ args') -> when (length args' /= length args) fail
    _                      -> fail
  where
  fail = left $ "Invalid call to method '" <> name <> "'"

checkExpression (ExprInt _) = return ()

checkExpression ExprTrue = return ()

checkExpression ExprFalse = return ()

checkExpression (ExprIdentifier name) = checkPredicate id name Nothing

checkExpression ExprThis = return ()

checkExpression (ExprIntArray e) = checkExpression e

checkExpression (ExprNewObject name) = checkPredicate not name Nothing

checkExpression (ExprNegation e) = checkExpression e
