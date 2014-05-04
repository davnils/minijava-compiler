module Backend where

import           AST
import           Control.Monad (forM_)
import           Control.Monad.State hiding (mapM)
import qualified Data.Map as M
import           Data.Monoid ((<>))
import           Interface

type JID = String

data VarType
  = Field JOutput JID                                         -- type and name
  | LocalVariable Integer
  deriving (Eq, Ord, Show)

data JOutput
  = JClass JID [JOutput] [JOutput]
  | JField JID JOutput                                        -- Name and type
  | JMethod JID [JOutput] [JOutput] [JOutput] JOutput         -- Name, arguments, locals, code, and return expr
  | JVar JID JOutput                                          -- Name and type
  | JSequence JOutput JOutput

  | JLoadObject Int
  | JLoadLocal Int
  | JPushI Int                                                -- ldc instruction
  | JPutField JOutput JID
  | JGetField JOutput JID
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

  | JIntermediateRef VarType
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

-- | Mapping of local vars onto the naturals.
type AllocState = M.Map AId Integer

-- | Class name, class interface, and mapping of local vars.
type AllocM = State (AId, InterfaceEntry, AllocState) -- TODO: add accumulation of max-alloc

unFix (Fix f) = f

executeStage1 :: UnnAST -> InterfaceMap -> JOutput
executeStage1 c@(Fix (AClass name fields methods)) interfaces = JClass name fields' methods'
  where
  Just interface = M.lookup name interfaces
  fields'        = map ((\(AVar kind name) -> JField name $ mapType kind) . unFix) $ fields
  methods'       = map (processMethod . unFix) methods

  processMethod (AMethod _ name' args vars code retExpr) = construct $ evalState (forM code evalBody) (name, interface, allocs)
    where
    evalBody s      = cataM alg1 s
    allocs          = M.fromList $ zip (map ((\(AVar _ name'') -> name'') . unFix) vars) [0..]
    construct stats = JMethod name' undefined undefined undefined undefined

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
  (_, _, allocs) <- get
  return $ M.lookup name allocs

toSequence :: [JOutput] -> JOutput
toSequence [x]    = x
toSequence (x:xs) = JSequence x (toSequence xs)

write :: JOutput -> JOutput -> AllocM JOutput
write (JIntermediateRef (Field kind name)) expr = return . toSequence $
  JLoadObject 0 : expr : [JPutField kind name]

alg1 :: AEntry JOutput -> AllocM JOutput

alg1 (APrint e) = undefined

alg1 (AAssignment target e) = write target e

alg1 (AIndexedAssignment target idx e) = undefined

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
alg1 (AExprIdentifier name) = do
  alloc <- getAllocation name
  case alloc of
    Just num -> return . JIntermediateRef $ LocalVariable num
    Nothing  -> do
      -- reference to the current class, prepend class name
      (className, (varInterface, _), _) <- get
      let Just kind = fmap mapType $ M.lookup name varInterface
      return $ JIntermediateRef $ Field kind (className  <> "/" <> name)

alg1 AExprThis = undefined

alg1 (AExprIntArray name) = undefined

alg1 (AExprNewObject name) = undefined

alg1 (AExprNegation e) = return $ JNegate e

alg1 AExprVoid = undefined

alg1 _ = undefined

-- ALSO: should the inherent recursive structure be kept? might be nice to perform addtional cata calls
--                 (at least for "pretty-printing")

-- (2) show executed on top-most JOutput constructor (on the class level), rendering the source code
