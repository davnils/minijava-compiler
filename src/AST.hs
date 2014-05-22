{-# LANGUAGE DeriveFunctor, DeriveFoldable, DeriveTraversable, UndecidableInstances #-}

module AST where

import           Data.Foldable (Foldable)
import           Data.Traversable (Traversable)

type AId = String

data AEntry t
  = AProgram           [t]
  | AClass             AId [t] [t]
  | AVar               AVarType AId
  | AMethod            AVarType AId [t] [t] [t] t -- retType name args vars code retExpr
  | AStatScope         [t]
  | AIf                t t t
  | AWhile             t t
  | APrint             t
  | AAssignment        t t
  | AIndexedAssignment t t t
  | AExprOp            AOperand t t
  | AExprList          t t
  | AExprLength        t
  | AExprInvocation    t AId [t]                  -- expression, method name, args
  | AExprInt           Int
  | AExprTrue
  | AExprFalse
  | AExprIdentifier    AId
  | AExprThis
  | AExprIntArray      t
  | AExprNewObject     AId
  | AExprNegation      t
  | AExprVoid
  deriving (Functor, Foldable, Show, Traversable)

data AVarType
  = TypeIntegerArray
  | TypeBoolean
  | TypeInteger
  | TypeString
  | TypeStringArray
  | TypeAppDefined AId
  | TypeVoid
  deriving (Eq, Ord, Show)

data AOperand
  = OperandLogicalAnd
  | OperandLogicalOr
  | OperandLess
  | OperandLessEqual
  | OperandEqual
  | OperandPlus
  | OperandMinus
  | OperandMult
  deriving (Eq, Ord, Show)

newtype Fix f = Fix (f (Fix f))

instance (Show (f (Fix f))) => Show (Fix f) where
  showsPrec p (Fix f) = showsPrec p f

type UnnAST = Fix AEntry

view :: UnnAST -> AEntry UnnAST
view (Fix e) = e
