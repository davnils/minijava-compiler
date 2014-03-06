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

Program
  : MainClass ClassDeclList             { $1 : $2 }

MainClass
  : class idliteral '{' public static void main '(' string '[' ']' idliteral ')' '{' VarDeclList StmtList '}' '}'
                                        { Class $2 [{- empty -}] [MainMethod [Variable TypeString $12] $15 $16] }

ClassDeclList
  : class idliteral '{' VarDeclList MethodDeclList '}' ClassDeclList
                                        { Class $2 $4 $5 : $7}
  | {- empty -}                         { [] }

VarDeclList
  : Type idliteral ';' VarDeclList      { Variable $1 $2 : $4 }
  | {- empty -}                         { [] }

MethodDeclList
  : public Type idliteral '(' FormalList ')' '{' VarDeclList StmtList return Expr ';' '}' MethodDeclList
                                        { Method $2 $3 $5 $8 $9 $11 : $14 }
  | {- empty -}                         { [] }

FormalList
  : Type idliteral ',' FormalList       { Variable $1 $2 : $4 }
  | Type idliteral                      { [Variable $1 $2] }
  | {- empty -}                         { [] }

Type
  : int '[' ']'                         { TypeIntegerArray }
  | boolean                             { TypeBoolean }
  | int                                 { TypeInteger }
  | idliteral                           { TypeAppDefined $1 }

Stmt
  : '{' StmtList '}'                    { StatementScope $2 }
  | if '(' Expr ')' Stmt else Stmt      { StatementIf $3 $5 $7 }
  | while '(' Expr ')' Stmt             { StatementWhile $3 $5 }
  | print '(' Expr ')' ';'              { StatementPrint $3 }
  | idliteral '=' Expr ';'              { StatementAssignment $1 $3 }
  | idliteral '[' Expr ']' '=' Expr ';' { StatementIndexedAssignment $1 $3 $6 }

StmtList 
  : Stmt StmtList                       { $1 : $2 }
  | {- empty -}                         { [] }

Expr
  : Expr Op Expr                        { ExprOp $2 $1 $3 }
  | Expr '[' Expr ']'                   { ExprList $1 $3 }
  | Expr '.' length                     { ExprLength $1 }
  | Expr '.' idliteral '(' ExpList ')'  { ExprInvocation $1 $3 $5 }
  | intliteral                          { ExprInt $1 }
  | true                                { ExprTrue }
  | false                               { ExprFalse }
  | idliteral                           { ExprIdentifier $1 }
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
  : Expr ExpRest                        { $1 : $2 }

ExpRest
  : ',' Expr ExpRest                    { $2 : $3 }
  | {- empty -}                         { [] }

{

parserError :: [Token] -> a
parserError tokens = error $ "Parse error, left over: " ++ concatMap show tokens

}
