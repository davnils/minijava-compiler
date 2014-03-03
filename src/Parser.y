{
module Parser where

import AST
import Lexer

}

%name parseMiniJava
%tokentype { Token }
%error { parserError }

%token 
  class                       { TClass             }
  public                      { TPublic            }
  static                      { TStatic            }
  main                        { TMain              }
  new                         { TNew               }
  return                      { TReturn            }
  if                          { TIf                }
  else                        { TElse              }
  while                       { TWhile             }
  print                       { TPrint             }
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

  '='                         { TAssignment        }
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

  idliteral                   { TIdLiteral $$      }
  longliteral                 { TLongLiteral $$    }
  intliteral                  { TIntLiteral  $$    }

%%

MainClass
  : class idliteral '{' public static void main '(' string '[' ']' idliteral ')' '{' '}' '}' { Class $2 [] [MainMethod [] [] []] }

ClassDecl
  : class idliteral '{' VarDecl MethodDecl '}' { $1 }

VarDecl
  : Type idliteral ';'                  { $1 }

MethodDecl
  : public Type idliteral '(' FormalList ')' '{' VarDecl Stmt return Expr ';' '}' { $1 }

FormalList
  : Type idliteral FormalRest           { $1 $2 }

FormalRest
  : ',' Type idliteral                  { $2 $3 }

Type
  : int '[' ']'                         { TypeIntegerArray }
  | boolean                             { TypeBoolean }
  | int                                 { TypeInteger }
  | idliteral                           { $1 }

Stmt
  : if '(' Expr ')' Stmt else Stmt      { StatementIf $3 $5 $7 }
  | while '(' Expr ')' Stmt             { StatementWhile $3 $5 }
  | print '(' Expr ')' ';'              { StatementPrint $3 }
  | idliteral '=' Expr ';'              { StatementAssignment $1 $3 }
  | idliteral '[' Expr ']' '=' Expr ';' { StatementIndexedAssignment $1 $3 $6 }

Expr
  : Expr Op Expr                        { ExprOp $1 $2 $3 }
  | Expr '[' Expr ']'                   { ExprList $1 $3 }
  | Expr '.' length                     { ExprLength $1 }
  | Expr '.' idliteral '(' ExpList ')'  { ExprInvocation $1 $3 $5 }
  | intliteral                          { ExprInt $1 }
  | true                                { ExprTrue }
  | false                               { ExprFalse }
  | idliteral                           { $1 }
  | this                                { ExprThis }
  | new int '[' Expr ']'                { ExprIntArray $4 }
  | new idliteral '(' ')'               { ExprNewObject $2 }
  | '!' Expr                            { ExprNegation $2 }
  | '(' Expr ')'                        { $2 }

Op
  : '&&'                                { OperandLogicalAnd }
  | '<'                                 { OperandLess }
  | '+'                                 { OperandPlus }
  | '-'                                 { OperandMinus }
  | '*'                                 { OperandMult }

ExpList
  : Expr ExprRest                       { $1 }

ExprRest
  : ',' Expr                            { $2 }

{

parserError :: [Token] -> a
parserError tokens = error $ "Parse error, left over: " ++ concatMap show tokens

}
