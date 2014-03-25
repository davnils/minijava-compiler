module AST where

type AIdentifier = String

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

data AVariableType
  = TypeIntegerArray
  | TypeBoolean
  | TypeInteger
  | TypeString
  | TypeAppDefined String
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

data AOperand
  = OperandLogicalAnd
  | OperandLess
  | OperandPlus
  | OperandMinus
  | OperandMult
  deriving (Eq, Ord, Show)
