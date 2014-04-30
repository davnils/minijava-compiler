module Backend where

import           AST
import           Control.Monad (forM_)
import           Control.Monad.State hiding (mapM)
import qualified Data.Map as M
import           Data.Monoid ((<>))
import           Interface

type JID = String

data JOutput
  = JClass JID [JOutput] [JOutput]
  | JField JID JOutput                                        -- Name and type
  | JMethod JID [JOutput] [JOutput] [JOutput] JOutput         -- Name, arguments, locals, code, and return expr
  | JVar JID JOutput                                          -- Name and type

  | JPushI Int
  | JMul JOutput JOutput
  | JAdd JOutput JOutput
  | JSub JOutput JOutput
  | JNegate JOutput

  | JInt
  | JBoolean
  | JIntArray
  | JStringArray
  | JClassType JID
  | JVoid
  deriving (Eq, Ord)

instance Show JOutput where
  show _ = ""

printJ :: JOutput -> String
printJ = undefined

compile :: UnnAST -> JOutput
compile = undefined

compileIntoFile :: UnnAST -> IO ()
compileIntoFile ast = do
  let compiled = compile ast
  -- for now, just touch the files for each class
  let classNames = map (\(Fix (AClass name _ _)) -> name) .
                   (\(Fix (AProgram l)) -> l) $ ast
  forM_ classNames $ \name -> writeFile (name <> ".s") ""
  return ()

-- (1) cataM with algebra mapping AST -> JOutput, with a map being constructed monadically, also maintain lengths
-- the state is carried throughout all sub-method computations

type AllocState = M.Map AId Integer
type AllocM = State (InterfaceEntry, AllocState) -- TODO: add accumulation of max-alloc

unFix (Fix f) = f

executeStage1 :: UnnAST -> InterfaceMap -> JOutput
executeStage1 c@(Fix (AClass name fields methods)) interfaces = JClass name fields' methods'
  where
  Just interface = M.lookup name interfaces
  fields'        = map ((\(AVar kind name) -> JField name $ mapType kind) . unFix) $ fields
  methods'       = map (processMethod . unFix) methods

  processMethod (AMethod _ name args vars code retExpr) = construct $ evalState (forM code evalBody) (interface, allocs)
    where
    evalBody s      = cataM alg1 s
    allocs          = M.fromList $ zip (map ((\(AVar _ name) -> name) . unFix) vars) [0..]
    construct stats = JMethod name undefined undefined undefined undefined

-- Mapping from AST types onto JOutput
mapType TypeIntegerArray   = JIntArray
mapType TypeBoolean        = JBoolean
mapType TypeInteger        = JInt
mapType TypeString         = error "Invalid String type in backend"
mapType TypeStringArray    = JStringArray
mapType (TypeAppDefined n) = JClassType n
mapType TypeVoid           = JVoid -- TODO: Should void be included?

getAllocation :: AId -> AllocM (Maybe Integer)
getAllocation name = do
  (_, allocs) <- get
  return $ M.lookup name allocs

alg1 :: AEntry JOutput -> AllocM JOutput

alg1 (APrint e) = undefined

-- won't this load the variable, expression, and then.. ?
-- perhaps need to make a distinction between loading / saving-to
alg1 (AAssignment name e) = undefined

alg1 (AIndexedAssignment name idx e) = undefined

alg1 (AExprOp op e1 e2) = undefined
  where
  trans _ = undefined

alg1 (AExprList e1 idx) = undefined

alg1 (AExprLength e) = undefined

alg1 (AExprInvocation e name args) = undefined

alg1 (AExprInt val) = return $ JPushI val

alg1 AExprTrue = return $ JPushI 1

alg1 AExprFalse = return $ JPushI 0

-- | Look up identifier (either local or field variable)
--   TODO: how are method arguments handled? additional case?
--
--   ALSO: need to return an field/alloced indicator, nothing more
alg1 (AExprIdentifier name) = do
  alloc <- getAllocation name
  case alloc of
    Just num -> return $ undefined
    Nothing  -> return $ undefined

alg1 AExprThis = undefined

alg1 (AExprIntArray name) = undefined

alg1 (AExprNewObject name) = undefined

alg1 (AExprNegation e) = return $ JNegate e

alg1 AExprVoid = undefined

alg1 _ = undefined

-- ALSO: should the inherent recursive structure be kept? might be nice to perform addtional cata calls
--                 (at least for "pretty-printing")

-- (2) show executed on top-most JOutput constructor (on the class level), rendering the source code
