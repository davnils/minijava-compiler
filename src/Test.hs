{-# LANGUAGE FlexibleInstances, DeriveFunctor, DeriveFoldable, DeriveTraversable, GADTs, StandaloneDeriving, ViewPatterns #-}

module Test where

import           Control.Applicative ((<$>), pure)
import           Control.Monad hiding (mapM)
import           Data.Either (Either)
import           Data.Foldable (foldMap, Foldable, foldl')
import           Data.Traversable (mapM, Traversable)
import           Control.Monad.State hiding (mapM)
import           Control.Monad.Trans.Either (runEitherT, EitherT, left)
import qualified Data.Map as M
import           Data.Monoid ((<>))
import           Prelude hiding (foldl', mapM)

type AId = String

f st (AClass name _ _) = st <> ", class: " <> name
f st (APrint _) = st <> ", print "
f st (AExprThis) = st <> ", this "
f st _ = st

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

-- http://stackoverflow.com/questions/4434292/catamorphism-and-tree-traversing-in-haskell?rq=1

cata :: Functor f => (f r -> r) -> Fix f -> r
cata f (Fix t) = f (cata f <$> t)

cataM :: (Traversable f, Monad m) => (f r -> m r) -> Fix f -> m r
cataM f (Fix t) = mapM (cataM f) t >>= f

type UnnAST = Fix AEntry
view :: UnnAST -> AEntry UnnAST
view (Fix e) = e

type MethodEntry  = (AVarType, [AVarType])
type FieldEntry   = [UnnAST]
type InterfaceMap = M.Map AId (M.Map AId MethodEntry, M.Map AId FieldEntry)

type BuildM = EitherT String (State InterfaceMap) ()

{-

-- methods need to be parsed in the context of a class
-- the same applies when type checking
-- one solution is to pass a lens (function from state to something)
-- is it possible to unify into a single type by splitting up the process?

-- State s ()

* use separate functions for exporing the various sections here
* lkajsd

-}

{-build :: UnAnn -> BuildM
build (view -> AProgram classes)           = mapM_ build classes
build (view -> AClass name fields methods) = do
  checkClass
  mapM_ build fields
  mapM_ build methods
  where
  checkClass = do
    st <- get
    when (M.member name st) $
      left "Interface error: class '" <> name <> "' already exists"
    M.insert name (M.empty, M.empty) st
    put st

build (view -> AVar name varType) = checkVar
  where
  checkVar =  do
    st <- get
    when (M.member name st) $
      left "Interface error: field '" <> name <> "' already exists"
    M.insert name (M.empty, M.empty) st
    put st

build _                                    = return ()-}
