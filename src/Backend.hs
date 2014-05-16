{-# LANGUAGE DeriveFunctor, FlexibleInstances, NoMonomorphismRestriction #-}

module Backend where

import           AST
import           Control.Monad (forM_)
import           Control.Monad.State hiding (mapM)
import qualified Data.Map as M
import           Data.Maybe (fromMaybe)
import           Data.Monoid ((<>))
import           Interface

type JID = String

data JOutput t
  = JClass JID [t] [t]
  | JField JID t                    -- Name and type
  | JMethod JID [t] [t] (Maybe t) t -- Name, arguments, locals, code, and return type
  | JVar JID t                      -- Name and type
  | JSequence t t

  | JLoadObject Int
  | JLoadLocalI Int
  | JStoreLocalI Int
  | JPushI Int                      -- ldc instruction
  | JPutField t JID
  | JGetField t JID
  | JMul t t
  | JAdd t t
  | JSub t t
  | JNegate t
  | JSwap

  | JInt
  | JBoolean
  | JIntArray
  | JStringArray
  | JClassType JID
  | JVoid

  | JGetStatic JID JID
  | JPrint PrintType
  | JReturn

  | JIntermediateRef t

  | JNewArray
  | JArrayLength

  | Field t JID           -- type and name
  | LocalVariable Int
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

-- hihi
emptySpace :: [a]
emptySpace = []

instance Show (JOutput String) where
  show (JClass name fields methods) = emitMulti [
    -- [".source", name <> ".s"],
    [".class", "public", name],
    [".super", "java/lang/Object"],
    [".method", "public", "<init>()V"],
    ["aload_0"],
    ["invokespecial", "java/lang/Object/<init>()V"],
    ["return"],
    [".end", "method "],
    emptySpace,
    fields,
    emptySpace,
    methods]

  show (JField name kind) = emit [".field", "public", name, kind]
  show (JMethod name args vars code ret) = emitMulti [
    [".method", "public", attrib, name <> "(" <> concat args <> ")" <> ret],
    [".limit", "stack", "10"], -- TODO
    [".limit", "locals", show $ length args + length vars + 1],
    [fromMaybe "" code],
    [".end", "method"]]
    where
    attrib = if (ret == "V") then "static" else ""
    -- :)

  show (JPutField kind name) = emit ["putfield", name, kind]

  show (JInt) = "I"
  show (JVoid) = "V"
  show (JStringArray) = "[Ljava/lang/String;"

  show (JLoadObject num) = emit ["aload", show num]
  show (JLoadLocalI num) = emit ["iload", show num]
  show (JStoreLocalI num) = emit ["istore", show num]
  show (JPushI num) = emit ["ldc", show num]

  show (JSequence e t) = emitMulti [[e], [t]]

  show (JSwap) = "swap"

  -- TODO: restructure when print needs to infer the type of its argument
  --       how is the distinction of int/boolean handled? ("true" instead of 1..)
  --       should this translation be done by hand?
  show (JGetStatic obj method) = emit ["getstatic", obj, method]
  show (JPrint arg) = emit ["invokevirtual", "java/io/PrintStream/println(" <> argType <> ")V"]
    where
    argType = if arg == PrintInteger then "I" else "Ljava/lang/String;"
  show JReturn = "return"

  show _ = ""

compile :: UnnAST -> InterfaceMap -> [JAST]
compile ast interfaces = compiled
  where
  ast' = cata handleMain ast
  handleMain m@(AMethod _ "main" [Fix (AVar TypeVoid _)] v c _) = Fix (defaultMain v c)
  handleMain e = Fix e
  defaultMain v c = AMethod TypeVoid "main" [Fix $ AVar TypeStringArray ""] v c (Fix AExprVoid)

  compiled = map (\c -> executeStage1 c interfaces) classes
  classes = (\(Fix (AProgram l)) -> l) $ ast'

printJ :: JAST -> String
printJ = executeStage2

compileIntoFile :: UnnAST -> InterfaceMap -> IO ()
compileIntoFile ast interfaces = do
  let compiled = map printJ $ compile ast interfaces
  forM_ compiled $ putStrLn
  -- forM_ classNames $ \name -> writeFile (name <> ".s") ""

-- (1) cataM with algebra mapping AST -> JOutput, with a map being constructed monadically, also maintain lengths

-- | Mapping of local vars onto the naturals.
type AllocState = M.Map AId Int

-- | Class name, class interface, and mapping of local vars.
type AllocM = State (AId, InterfaceEntry, AllocState) -- TODO: add accumulation of max-alloc

unFix (Fix f) = f

-- | Transformation strategy
--
--   Pop arguments from the stack.
--   Reserve local 0 for 'this'.
--   Reserve 1.. for arguments.
executeStage1 :: UnnAST -> InterfaceMap -> JAST
executeStage1 c@(Fix (AClass n f m)) interfaces = Fix $ JClass n fields' methods'
  where
  Just interface = M.lookup n interfaces
  fields'        = map (Fix . (\(AVar kind name) -> JField name . Fix $ mapType kind) . unFix) $ f
  methods'       = map (Fix . processMethod . unFix) m

  processMethod (AMethod retType name' args vars code retExpr) = construct $ evalState worker state
    where
    state           = (n, interface, allocs)
    worker          = forM (code <> [retExpr]) $ cataM alg1
    allocs          = M.fromList $ zip (map ((\(AVar _ name'') -> name'') . unFix) vars) [1+length args..]
    args'           = map processVar args
    vars'           = map processVar vars
    construct ins   = JMethod name' args' vars' ins' (Fix $ mapType retType)
      where
      ins'
        | null ins  = Nothing
        | otherwise = Just $ toSequence ins
    processVar (Fix (AVar kind name)) = Fix $ mapType kind
    -- TODO: verify that only type of args and vars is needed

-- Mapping from AST types onto JOutput
mapType TypeIntegerArray   = JIntArray
mapType TypeBoolean        = JBoolean
mapType TypeInteger        = JInt
mapType TypeString         = error "Invalid String type in backend"
mapType TypeStringArray    = JStringArray
mapType (TypeAppDefined n) = JClassType n
mapType TypeVoid           = JVoid -- TODO: Should void be included?

getAllocation :: AId -> AllocM (Maybe Int)
getAllocation name = do
  (_, _, allocs) <- get
  return $ M.lookup name allocs

toSequence :: [Fix JOutput] -> Fix JOutput
toSequence [x]    = x
toSequence (x:xs) = Fix $ JSequence x (toSequence xs)

-- would be nice with a strengthened type system in these situations
-- like the possiblity of excluding "weird :: a" from having a "proof"
-- | Take a var identifier, some computation, and assign the result
write :: JOutput (Fix JOutput) -> JOutput (Fix JOutput) -> AllocM (Fix JOutput)

write (JIntermediateRef (Fix (Field kind name))) expr = return . toSequence $
  Fix (JLoadObject 0) : Fix expr : [Fix $ JPutField kind name]

write (JIntermediateRef (Fix (LocalVariable alloc))) expr = return . toSequence $
  Fix expr : [Fix $ JStoreLocalI alloc]

readV (JIntermediateRef (Fix (Field kind name))) = unFix . toSequence $
  Fix (JLoadObject 0) : [Fix $ JGetField kind name]

readV (JIntermediateRef (Fix (LocalVariable alloc))) = JLoadLocalI alloc

readV expr = expr

alg1 :: AEntry JAST -> AllocM JAST

-- TODO: derive type of original expr in some way.
--       emit string "true"/"false" if boolean.
alg1 (APrint e) = return $ toSequence [push e, Fix $ JGetStatic "java/lang/System/out" "Ljava/io/PrintStream;", Fix JSwap, Fix $ JPrint PrintInteger]
  where
  push (Fix (JIntermediateRef (Fix (Field kind name)))) = Fix $ JGetField kind name
  push (Fix (JIntermediateRef (Fix (LocalVariable num)))) = Fix $ JLoadLocalI num
  push _                            = e

alg1 (AAssignment (Fix target) (Fix e)) = write target (readV e)

-- write(target) > -- > (push idx?)
alg1 (AIndexedAssignment target idx e) = undefined

alg1 (AExprOp op e1 e2) = undefined
  where
  trans _ = undefined

alg1 (AExprList e1 idx) = undefined

alg1 (AExprLength e) = undefined

alg1 (AExprInvocation e name args) = undefined

alg1 (AExprInt val) = return . Fix $ JPushI val

alg1 AExprTrue = return . Fix $ JPushI 1

alg1 AExprFalse = return . Fix $ JPushI 0

-- | Look up identifier (either local or field variable)
alg1 (AExprIdentifier name) = do
  alloc <- getAllocation name
  fmap Fix $ case alloc of
    Just num -> return . JIntermediateRef . Fix $ LocalVariable num
    Nothing  -> do
      -- reference to the current class, prepend class name
      (className, (varInterface, _), _) <- get
      let Just kind = fmap mapType $ M.lookup name varInterface
      return . JIntermediateRef . Fix $ Field (Fix kind) (className  <> "/" <> name)

alg1 AExprThis = undefined

alg1 (AExprIntArray name) = undefined

alg1 (AExprNewObject name) = undefined

alg1 (AExprNegation e) = return . Fix $ JNegate e

alg1 AExprVoid = return . Fix $ JReturn

alg1 _ = undefined


-- (2) render the entire source tree

executeStage2 :: JAST -> String
executeStage2 = cata show
