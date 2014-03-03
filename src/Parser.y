{
module Parser where

import Lexer

}

%name parseMiniJava
%tokentype { Token }
%error { parserError }

%token 
  class                       { TClass             }
  public                      { TPublic            }
  static                      { TStatic            }
  new                         { TNew               }
  return                      { TReturn            }
  if                          { TIf                }
  else                        { TElse              }
  while                       { TWhile             }
  System.out.println          { TPrint             }
  length                      { TLength            }
  this                        { TThis              }

  void                        { TVoid              }
  string                      { TString            }
  int                         { TInt               }
  boolean                     { TBoolean           }
  true                        { TTrue              }
  false                       { TFalse             }

  '!'                         { TNegation          }
  '&&'                        { TLogicAnd          }
  '<'                         { TCompareLess       }
  '+'                         { TAdd               }
  '-'                         { TSub               }
  '*'                         { TMul               }

  ','                         { TComma             }
  '.'                         { TDot               }
  ';'                         { TSemiColon         }
  '('                         { TLeftParen         }
  ')'                         { TRightParen        }
  '['                         { TLeftBracket       }
  ']'                         { TRightBracket      }
  '{'                         { TLeftBrace         }
  '}'                         { TRightBrace        }
  singlecomment               { TSingleLineComment }
  multicomment                { TMultiLineComment  }

  idliteral                   { TIdLiteral         }
  longliteral                 { TLongLiteral       }
  intliteral                  { TIntLiteral        }

Exp     : let var '=' Exp in Exp  { Let $2 $4 $6 }
        | Exp1                    { Exp1 $1 }

{

parseError :: [Token] -> a
parseError _ = error "Parse error"

type AIdentifier = String

data AProgram
  = AProgram [AClass]

data AClass
  = Class AIdentifier [AVariable] [AMethod]

data AVariable
  = Variable AVariableType AIdentifier

data AMethod =
  Method AVariableType AIdentifier [AVariable] [AVariable] [AStatement] AExpr

data AVariableType
  = TypeIntegerArray
  | TypeBoolean
  | TypeInteger

data AStatement
  = StatementIf AExpr AStatement AStatement
  | StatementWhile AExpr AStatement
  | StatementPrint AExpr
  | StatementAssignment AIdentifier AExpr
  | StatementIndexedAssignment AIdentifier AExpr

data AExpr
  = ExprOp AOperand AExpr
  | ExprList [AExpr]
  | ExprLength AExpr
  | ExprInvocation AExpr AIdentifier [AExpr]
  | ExprInt Int
  | ExprTrue
  | ExprFalse
  | ExprIdentifier AIdentifier
  | ExprThis
  | ExprIntArray [AExpr]
  | ExprNewObject AIdentifier
  | ExprNegation AExpr

data AOperand
  = OperandLogicalAnd
  | OperandLess
  | OperandPlus
  | OperandMinus
  | OperandMult

}
