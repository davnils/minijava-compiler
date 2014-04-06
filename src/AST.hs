{-# LANGUAGE GADTs #-}
module AST where

type AIdentifier = String

-- GADT allowing unification into single type? nice for pattern matching

{-data AST r where
 AProgramX :: [AST Int] -> AST r
 AClassX :: AIdentifier -> [AST r] -> [AST r'] -> AST r''-}

data AProgram
  = Program [AClass]
  deriving (Eq, Ord, Show)

data AClass
  = Class AIdentifier [AVariable] [AMethod]
  deriving (Eq, Ord, Show)

data AVariable
  = Variable AVariableType AIdentifier
  deriving (Eq, Ord, Show)

data AMethod
  = Method AVariableType AIdentifier [AVariable] [AVariable] [AStatement] AExpr
  | MainMethod [AVariable] [AVariable] [AStatement]
  deriving (Eq, Ord, Show)

data AStatement
  = StatementScope [AStatement]
  | StatementIf AExpr AStatement AStatement
  | StatementWhile AExpr AStatement
  | StatementPrint AExpr
  | StatementAssignment AIdentifier AExpr
  | StatementIndexedAssignment AIdentifier AExpr AExpr
  deriving (Eq, Ord, Show)

data AExpr
  = ExprOp AOperand AExpr AExpr
  | ExprList AExpr AExpr
  | ExprLength AExpr
  | ExprInvocation AExpr AIdentifier [AExpr]
  | ExprInt Int
  | ExprTrue
  | ExprFalse
  | ExprIdentifier AIdentifier
  | ExprThis
  | ExprIntArray AExpr
  | ExprNewObject AIdentifier
  | ExprNegation AExpr
  deriving (Eq, Ord, Show)
