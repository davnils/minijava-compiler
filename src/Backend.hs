{-# LANGUAGE DeriveFunctor, FlexibleInstances, NoMonomorphismRestriction #-}

module Backend where

import           AST
import           Control.Monad (forM_)
import           Control.Monad.State hiding (mapM)
import qualified Data.Map as M
import           Data.Maybe (catMaybes, fromMaybe)
import           Data.Monoid ((<>))
import           Interface
import           TypeCheck

newtype JID = JID String
showID (JID str) = "'" <> str <> "'"
unsafeEscape (JID str) = str

type Label = String

data JOutput t
  = JClass JID [t] [t]
  | JField JID t                    -- Name and type
  | JMethod JID [t] [t] (Maybe t) t -- Name, arguments, locals, code, and return type
  | JVar JID t                      -- Name and type
  | JSequence t t

  | JLoadObject Int
  | JLoadLocalI Int
  | JStoreObject Int
  | JStoreLocalI Int
  | JPushI Int                      -- ldc instruction
  | JPutField t JID
  | JGetField t JID
  | JMul
  | JAdd
  | JSub
  | JSwap

  | JInt
  | JBoolean
  | JIntArray
  | JStringArray
  | JClassType JID
  | JVoid

  | JGetStatic JID JID
  | JPrint PrintType
  | JInvokeVirtual JID
  | JInvokeSpecial JID
  | JReturn
  | JReturnI
  | JReturnObject

  | JIntermediateRef t

  | JArrayLength
  | JLoadIArray
  | JStoreIArray

  | Field t JID           -- type and name
  | LocalVariable Int

  | JIfEq Label
  | JCmpGe Label
  | JCmpGt Label
  | JCmpNe Label
  | JCmpNeA Label
  | JGoto Label
  | JLabel Label
  | JAndI

  | JDup
  | JNewObject JID
  | JNewIntArray

  | JNop
  deriving Functor

data PrintType
  = PrintInteger
  | PrintBoolean
  deriving Eq

type JAST = Fix JOutput

emit :: [String] -> String
emit = unwords

emitMulti :: [[String]] -> String
emitMulti = unlines . map emit

emptySpace :: [a]
emptySpace = []

instance Show (JOutput String) where
  show (JClass name fields methods) = emitMulti [
    -- [".source", name <> ".s"],
    [".class", "public", showID name],
    [".super", "java/lang/Object"],
    emptySpace,
    fields,
    emptySpace,
    [".method", "public", "<init>()V"],
    ["aload_0"],
    ["invokespecial", "java/lang/Object/<init>()V"],
    ["return"],
    [".end", "method "],
    emptySpace,
    methods]

  show (JField name kind) = emitMulti [[".field", "public", showID name, kind]]
  show (JMethod name args vars code ret) = emitMulti [
    [".method", "public", attrib, showID (JID $ (unsafeEscape name) <> "(" <> concat args <> ")" <> ret)],
    [".limit", "stack", "512"], -- TODO: calculate dynamically
    [".limit", "locals", show $ length args + length vars + 1],
    [fromMaybe "" code],
    [".end", "method"]]
    where
    attrib = if (ret == "V") then "static" else ""

  show (JGetField kind name) = emit ["getfield", showID name, kind]
  show (JPutField kind name) = emit ["putfield", showID name, kind]

  show (JInt) = "I"
  show (JBoolean) = "I"
  show (JVoid) = "V"
  show (JIntArray) = "[I"
  show (JStringArray) = "[Ljava/lang/String;"
  show (JClassType name) = "L" <> unsafeEscape name <> ";"

  show (JLoadObject num) = emit ["aload", show num]
  show (JLoadLocalI num) = emit ["iload", show num]
  show (JStoreObject num) = emit ["astore", show num]
  show (JStoreLocalI num) = emit ["istore", show num]
  show (JPushI num) = emit ["ldc", show num]

  show (JSequence e t) = emitMulti [[e], [t]]


  show JMul    = "imul"
  show JAdd    = "iadd"
  show JSub    = "isub"
  show JSwap = "swap"

  show (JInvokeSpecial arg) = emit ["invokespecial", showID arg]
  show (JInvokeVirtual arg) = emit ["invokevirtual", showID arg]
  show JDup = "dup"
  show (JNewObject arg) = emit ["new", showID arg]
  show JNewIntArray = emit ["newarray", "int"]
  show JArrayLength = "arraylength"
  show JLoadIArray = "iaload"
  show JStoreIArray = "iastore"

  show (JGetStatic obj method) = emit ["getstatic", showID obj, showID method]
  show (JPrint arg) = emit ["invokevirtual", "java/io/PrintStream/println(" <> argType <> ")V"]
    where
    argType = if arg == PrintInteger then "I" else "Z"
  show JReturn = "return"
  show JReturnI = "ireturn"
  show JReturnObject = "areturn"

  show (JIfEq lbl) = emit ["ifeq", lbl]
  show (JCmpGe lbl) = emit ["if_icmpge", lbl]
  show (JCmpGt lbl) = emit ["if_icmpgt", lbl]
  show (JCmpNe lbl) = emit ["if_icmpne", lbl]
  show (JCmpNeA lbl) = emit ["if_acmpne", lbl]
  show (JGoto lbl) = emit ["goto", lbl]
  show (JLabel lbl) = lbl <> ":"
  show (JAndI) = "iand"

  show _ = ""

compile :: AnnA -> InterfaceMap -> [(String, JAST)]
compile ast interfaces = zipWith (\(Fix (Ann (_, AClass x _ _))) y -> (x,y)) classes compiled
  where
  ast' = cata handleMain ast
  handleMain (Ann (_, AMethod _ "main" [Fix (Ann (_, (AVar TypeVoid _)))] v c _)) = Fix (Ann (TypeVoid, defaultMain v c))
  handleMain x = Fix x
  defaultMain v c = AMethod TypeVoid "main" [Fix $ Ann (TypeStringArray, AVar TypeStringArray "")] v c (Fix $ Ann (TypeVoid, AExprVoid))

  compiled = map (\c -> executeStage1 c interfaces) classes
  classes = (\(Fix (Ann (_, AProgram l))) -> l) $ ast'

printJ :: JAST -> String
printJ = executeStage2

compileIntoFile :: AnnA -> InterfaceMap -> IO ()
compileIntoFile ast interfaces = do
  let compiled = compile ast interfaces
      serialized = map (\(name, code) -> (name, printJ code)) compiled
  forM_ serialized $ \(name, str) -> writeFile (name <> ".s") str

-- (1) cataM with algebra mapping AST -> JOutput, with a map being constructed monadically, also maintain lengths

-- | Mapping of local vars onto the naturals.
type AllocState = M.Map AId Int

-- | Class name, class interface, and mapping of local vars.
type AllocM = State (AId, InterfaceMap, AllocState, Integer) -- TODO: add accumulation of max-alloc

-- all read-only computations are evaluated using a catamorphism.
-- algStat is mapped over the body of a method
-- it can recurse on itself in the case of while etc

getAllocation :: AId -> AllocM (Maybe Int)
getAllocation name = do
  (_, _, allocs, _) <- get
  return $ M.lookup name allocs

describeAllocation (AExprIdentifier name) = do
  alloc <- getAllocation name
  case alloc of
    Just num -> return $ LocalVariable num
    Nothing  -> do
      -- reference to the current class, prepend class name
      (className, iMap, _, _) <- get
      let Just (varInterface, _) = M.lookup className iMap
      let Just kind = fmap mapType $ M.lookup name varInterface
      return $ Field (Fix kind) (JID $ className  <> "/" <> name)

buildMethodSignature :: String -> String -> AllocM String
buildMethodSignature className methodName = do
  (_, iMap, _, _) <- get
  let Just (retType, args) = do
      (_, methodMap) <- M.lookup className iMap
      M.lookup methodName methodMap

  let (ret':args') = map (show . (mapType :: AVarType -> JOutput String)) (retType:args)
  return $ className <> "/" <> methodName <> "(" <> concat args' <> ")" <> ret'

makeLabel = do
  (_1, _2, _3, count) <- get
  put (_1, _2, _3, count + 1)
  return $ "label" <> show count

algStat :: AEntry AnnA -> AllocM (Maybe JAST)

algStat (AStatScope code) = do
  code' <- mapM (algStat . unFA) code
  case catMaybes code' of
    [] -> return Nothing
    l  -> return . Just $ toSequence l

algStat (AIf cond branch1 branch2) = do
  [b1, b2] <- mapM (algStat . unFA) [branch1, branch2]
  let defaultIns = fromMaybe (Fix JNop)
      (b1', b2') = (defaultIns b1, defaultIns b2)
  guard <- evalExpr cond
  [lbl2, lblDone] <- mapM (const makeLabel) [1, 2]
  return . Just $ toSequence [
      guard,
      Fix $ JIfEq lbl2,
      b1',
      Fix $ JGoto lblDone,
      Fix $ JLabel lbl2,
      b2',
      Fix $ JLabel lblDone]

algStat (AWhile cond branch) = do
  branch' <- fmap (fromMaybe (Fix JNop)) $ algStat (unFA branch)
  [lblStart, lblDone] <- mapM (const makeLabel) [1, 2]
  guard <- evalExpr cond
  return . Just $ toSequence [
      Fix $ JLabel lblStart,
      guard,
      Fix $ JIfEq lblDone,
      branch',
      Fix $ JGoto lblStart,
      Fix $ JLabel lblDone]

algStat (AAssignment (Fix (Ann (kind, target))) expr) = do
  expr' <- evalExpr expr
  desc <- describeAllocation target
  fmap Just $ write kind desc expr'
  where
  write _ (Field kind name) expr = return . toSequence $
    Fix (JLoadObject 0) : expr : [Fix $ JPutField kind name]

  write (TypeAppDefined _) (LocalVariable alloc) expr = return . toSequence $
    expr : [Fix $ JStoreObject alloc]

  write (TypeIntegerArray) (LocalVariable alloc) expr = return . toSequence $
    expr : [Fix $ JStoreObject alloc]

  write _ (LocalVariable alloc) expr = return . toSequence $
    expr : [Fix $ JStoreLocalI alloc]

algStat (AIndexedAssignment target idx expr) = do
  [target', idx', expr'] <- mapM evalExpr [target, idx, expr]

  return . Just $ toSequence [
    target',
    idx',
    expr',
    Fix $ JStoreIArray]

algStat (APrint expr) = do
  expr' <- evalExpr expr
  let Ann (kind, _) = unFix expr
      printType = if kind == TypeBoolean then PrintBoolean else PrintInteger

  return . Just $ toSequence
    [expr',
     Fix $ JGetStatic (JID "java/lang/System/out") (JID "Ljava/io/PrintStream;"),
     Fix JSwap,
     Fix $ JPrint printType]

algStat _ = return Nothing

-- evalExpr evaluates the given expression (given as tagged AEntry node) and puts the result on the stack
evalExpr :: AnnA -> AllocM JAST
evalExpr = paraM algExpr 

unFA = (\(Ann (_, t)) -> t) . unFix

-- | Transformation strategy
--
--   Pop arguments from the stack.
--   Reserve local 0 for 'this'.
--   Reserve 1.. for arguments.
executeStage1 :: AnnA -> InterfaceMap -> JAST
executeStage1 c@(Fix (Ann (_, (AClass n f m)))) interfaces = Fix $ JClass (JID n) fields' methods'
  where
  -- Just interface = M.lookup n interfaces
  fields'        = map (Fix . (\(AVar kind name) -> JField (JID name) . Fix $ mapType kind) . unFA) $ f
  methods'       = map (Fix . processMethod . unFA) m

  processMethod (AMethod retType name' args vars code retExpr) = construct $ evalState worker state
    where
    state           = (n, interfaces, allocs, 1)
    worker          = fmap catMaybes $ do
                        body <- forM code (algStat . unFA)
                        ret <- processRet retType retExpr
                        return $ body <> ret
    allocs          = M.fromList $ zip (map ((\(AVar _ name'') -> name'') . unFA) (args <> vars)) [1..]
    args'           = map processVar args
    vars'           = map processVar vars
    construct ins   = JMethod (JID name') args' vars' ins' (Fix $ mapType retType)
      where
      ins'
        | null ins  = Nothing
        | otherwise = Just $ toSequence ins
    processVar (Fix (Ann (_, (AVar kind name)))) = Fix $ mapType kind

-- Mapping from AST types onto JOutput
mapType TypeIntegerArray   = JIntArray
mapType TypeBoolean        = JBoolean
mapType TypeInteger        = JInt
mapType TypeString         = error "Invalid String type in backend"
mapType TypeStringArray    = JStringArray
mapType (TypeAppDefined n) = JClassType (JID n)
mapType TypeVoid           = JVoid -- TODO: Should void be included?

toSequence :: [Fix JOutput] -> Fix JOutput
toSequence [x]    = x
toSequence (x:xs) = Fix $ JSequence x (toSequence xs)

processRet kind expr = do
  expr' <- evalExpr expr
  return . return . Just . toSequence $ [expr'] <> getRet kind
  where
  getRet TypeInteger = [Fix JReturnI]
  getRet TypeBoolean = [Fix JReturnI]
  getRet TypeVoid    = []
  getRet _           = [Fix JReturnObject]

opSkeleton op = do
  lblTrue <- makeLabel
  lblAfter <- makeLabel
  return $ toSequence [Fix $ op lblTrue,
                       Fix $ JPushI 1,
                       Fix $ JGoto lblAfter,
                       Fix $ JLabel lblTrue,
                       Fix $ JPushI 0,
                       Fix $ JLabel lblAfter]

algExpr :: (AnnA, Ann AVarType JAST) -> AllocM JAST

-- identify equality testing on objects and arrays
algExpr (Fix (Ann (_, AExprOp _ (Fix (Ann (TypeAppDefined _,_))) _)), (Ann (_, AExprOp op e1 e2))) = do
  when (op /= OperandEqual) (error "internal error: unexpected object operator")
  op' <- opSkeleton JCmpNeA
  return . toSequence $ [
    e1,
    e2,
    op'
    ]

algExpr (Fix (Ann (_, AExprOp _ (Fix (Ann (TypeIntegerArray,_))) _)), (Ann (_, AExprOp op e1 e2))) = do
  when (op /= OperandEqual) (error "internal error: unexpected array operator")
  op' <- opSkeleton JCmpNeA
  return . toSequence $ [
    e1,
    e2,
    op'
    ]

-- handle all the other cases
algExpr (_, (Ann (_, AExprOp op e1 e2))) = do
  op' <- trans op
  case op of
    OperandLogicalAnd -> do
      lblTerminate <- makeLabel
      lblDone <- makeLabel
      return . toSequence $ [
        e1,
        Fix $ JIfEq lblTerminate,
        Fix $ JPushI 1,
        e2,
        op',
        Fix $ JGoto lblDone,
        Fix $ JLabel lblTerminate,
        Fix $ JPushI 0,
        Fix $ JLabel lblDone]

    _ -> return . toSequence $ [e1, e2, op']
  where
  trans OperandLogicalAnd = return . Fix $ JAndI

  trans OperandLess       = opSkeleton JCmpGe
  trans OperandLessEqual  = opSkeleton JCmpGt
  trans OperandEqual      = opSkeleton JCmpNe

  trans OperandPlus       = return $ Fix JAdd
  trans OperandMult       = return $ Fix JMul
  trans OperandMinus      = return $ Fix JSub

algExpr (_, (Ann (_, (AExprList e1 idx)))) = return $ toSequence [
  e1,
  idx,
  Fix JLoadIArray]

algExpr (_, (Ann (_, (AExprLength e)))) = return $ toSequence [
  e,
  Fix JArrayLength]

algExpr (node, (Ann (_, (AExprInvocation obj name args)))) = do
  signature <- buildMethodSignature (getClass node) name
  return . toSequence $ [obj] <> args <> [Fix $ JInvokeVirtual (JID signature)]
  where
  getClass (Fix (Ann (_, (AExprInvocation (Fix (Ann (TypeAppDefined objType, _))) _ _)))) = objType

algExpr (_, (Ann (_, (AExprInt val)))) = return . Fix $ JPushI val

algExpr (_, (Ann (_, AExprTrue))) = return . Fix $ JPushI 1

algExpr (_, (Ann (_, AExprFalse))) = return . Fix $ JPushI 0

algExpr (_, (Ann (_, AExprThis))) = return . Fix $ JLoadObject 0

algExpr (_, (Ann (_, AExprIntArray push))) = return $ toSequence [
  push,
  Fix $ JNewIntArray]

algExpr (_, (Ann (_, AExprNewObject name))) = return . toSequence $ [
  Fix . JNewObject $ JID name,
  Fix JDup,
  Fix . JInvokeSpecial . JID $ name <> "/<init>()V"]

algExpr (_, (Ann (_, AExprNegation e))) = do
  lblFalse <- makeLabel
  lblAfter <- makeLabel
  return $ toSequence [
    e,
    Fix $ JIfEq lblFalse,
    Fix $ JPushI 0,
    Fix $ JGoto lblAfter,
    Fix $ JLabel lblFalse,
    Fix $ JPushI 1,
    Fix $ JLabel lblAfter]

algExpr (_, (Ann (_, AExprVoid))) = return . Fix $ JReturn

-- | Look up identifier (either local or field variable)
algExpr (_,(Ann (kind, entry))) = do
  alloc <- describeAllocation entry
  return $ read kind alloc

  where
  read _ (Field kind name) = toSequence $
    Fix (JLoadObject 0) : [Fix $ JGetField kind name]

  read (TypeAppDefined _) (LocalVariable alloc) = Fix $ JLoadObject alloc
  read (TypeIntegerArray) (LocalVariable alloc) = Fix $ JLoadObject alloc
  read _                  (LocalVariable alloc) = Fix $ JLoadLocalI alloc

algExpr _ = error "algExpr: unexpected AST node"


-- (2) render the entire source tree

executeStage2 :: JAST -> String
executeStage2 = cata show
