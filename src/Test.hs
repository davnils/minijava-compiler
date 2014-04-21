{-# LANGUAGE Rank2Types, FlexibleInstances, DeriveFunctor, DeriveFoldable, DeriveTraversable, GADTs, StandaloneDeriving, UndecidableInstances, ViewPatterns #-}

module Test where

import           Control.Applicative ((<$>), pure)
import           Control.Monad hiding (mapM)
import           Control.Monad.Trans.Maybe
import           Data.Either (Either)
import           Data.Foldable (foldMap, Foldable, foldl')
import           Data.List (group, sort)
import           Data.Traversable (mapM, Traversable)
import           Control.Monad.State hiding (mapM)
import           Control.Monad.Trans.Either (runEitherT, EitherT, left)
import qualified Data.Map as M
import           Data.Monoid ((<>))
import           Prelude hiding (foldl', mapM)

p = AProgram [Fix $ AClass "class1" [field "field1", field "field2"] [method "onlyMethod"], Fix $ AClass "class2" [] [method "otherMethod"]]

method name = Fix $ AMethod TypeInteger name [Fix $ AVar TypeInteger "arg1", Fix $ AVar TypeInteger "arg2"] [] [] (Fix AExprTrue)

field name = Fix $ AVar TypeBoolean name

type AId = String

-- include constructor "AMany t" replacing "[t]" ?
data AEntry t
  = AProgram           [t]
  | AClass             AId [t] [t]
  | AVar               AVarType AId
  | AMethod            AVarType AId [t] [t] [t] t
  | AStatScope         [t]
  | AIf                t t t
  | AWhile             t t
  | APrint             t
  | AAssignment        AId t
  | AIndexedAssignment AId t t
  | AExprOp            AOperand t t
  | AExprList          t t
  | AExprLength        t
  | AExprInvocation    t AId [t]
  | AExprInt           Int
  | AExprTrue
  | AExprFalse
  | AExprIdentifier    AId
  | AExprThis
  | AExprIntArray      t
  | AExprNewObject     AId
  | AExprNegation      t
  deriving (Functor, Foldable, Show, Traversable)

data AVarType
  = TypeIntegerArray
  | TypeBoolean
  | TypeInteger
  | TypeString
  | TypeAppDefined String
  deriving (Eq, Ord, Show)

data AOperand
  = OperandLogicalAnd
  | OperandLess
  | OperandPlus
  | OperandMinus
  | OperandMult
  deriving (Eq, Ord, Show)

newtype Fix f = Fix (f (Fix f))

instance (Show (f (Fix f))) => Show (Fix f) where
  showsPrec p (Fix f) = showsPrec p f

----------------------------------------------------

-- Consider explicit recursion over the AST
-- Need to check local var names, check existence of references, and type check

type MCheck = EitherT String (State (M.Map AId AVarType))
check :: UnnAST -> MCheck ()
check (Fix (AProgram classes)) = undefined
check _ = undefined

-- AProgram           [t]
-- AClass             AId [t] [t]
-- AVar               AVarType AId
-- AMethod            AVarType AId [t] [t] [t] t


----------------------------------------------------

-- http://stackoverflow.com/questions/4434292/catamorphism-and-tree-traversing-in-haskell?rq=1

cata :: Functor f => (f r -> r) -> Fix f -> r
cata f (Fix t) = f (cata f <$> t)

cataM :: (Traversable f, Monad m) => (f r -> m r) -> Fix f -> m r
cataM f (Fix t) = mapM (cataM f) t >>= f

type UnnAST = Fix AEntry
view :: UnnAST -> AEntry UnnAST
view (Fix e) = e

type MethodEntry  = (AVarType, [AVarType])
type VarEntry     = AVarType
type InterfaceMap = M.Map AId (M.Map AId VarEntry, M.Map AId MethodEntry)

type BuildM = EitherT String (State InterfaceMap) ()

data PartialEntry
  = ReducedMethod AId MethodEntry
  | ReducedVar AId VarEntry
  | ReducedClass InterfaceMap
  | ReducedProgram InterfaceMap
  deriving Show

alg :: AEntry (Maybe PartialEntry) -> Maybe PartialEntry
alg (AProgram interfaces) = sequence interfaces >>= merge . map (\(ReducedClass l) -> l)
  where
  merge maps
    | any ((>1) . length) (group . sort $ map M.keys maps) = Nothing
    | otherwise = Just . ReducedProgram $ M.unions maps

alg (AClass name fields methods) = do
  fieldsMap  <- buildMap fields  $ \(ReducedVar name val) -> (name, val)
  methodsMap <- buildMap methods $ \(ReducedMethod name val) -> (name, val)
  return . ReducedClass $ M.singleton name (fieldsMap, methodsMap)
  where
  buildMap items f = do
    items' <- sequence items
    evalState (runMaybeT (forM items' $ addEntry . f) >>= handleError) M.empty
  
  handleError Nothing  = return Nothing
  handleError (Just _) = Just <$> get

  addEntry (name, entry) = do
    m <- get
    case M.lookup name m of
      Just _ -> mzero
      Nothing -> put $ M.insert name entry m

alg (AVar kind name)              = Just  $ ReducedVar name kind
alg (AMethod ret name args _ _ _) = liftM f $ sequence args
  where
  f xs = ReducedMethod name (ret, (getTypes xs))
  getTypes = map (\(ReducedVar _ kind) -> kind)
alg _                                 = Nothing

buildInterface :: Fix AEntry -> Maybe InterfaceMap
buildInterface = liftM (\(ReducedProgram m) -> m) . cata alg
