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

  idliteral                   { TIdLiteral $$      }
  intliteral                  { TIntLiteral  $$    }

%left '&&'
%nonassoc '<'
%left '+' '-'
%left '*'
%left '!'

%%

Program
  : MainClass ClassDeclList             { Fix . AProgram $ fixMap ($1 : $2) }

MainClass
  : class IdLiteral '{' public static void main '(' string '[' ']' IdLiteral ')' '{' VarDeclList StmtList '}' '}'
                                        { AClass $2 [] [Fix $ mainMethod $12 $15 $16] }

ClassDeclList
  : class IdLiteral '{' VarDeclList MethodDeclList '}' ClassDeclList
                                        { AClass $2 (fixMap $4) (fixMap $5) : $7}
  | {- empty -}                         { [] }

VarDeclList
  : {- empty -}                         { [] }
  | VarDeclList Type IdLiteral ';'      { $1 ++ [AVar $2 $3] }

MethodDeclList
  : public Type IdLiteral '(' FormalList ')' '{' VarDeclList StmtList return Expr ';' '}' MethodDeclList
                                        { AMethod $2 $3 (fixMap $5) (fixMap $8) (fixMap $9) (Fix $11) : $14 }
  | {- empty -}                         { [] }

FormalList
  : Type IdLiteral ',' FormalList       { AVar $1 $2 : $4 }
  | Type IdLiteral                      { [AVar $1 $2] }
  | {- empty -}                         { [] }

Type
  : int '[' ']'                         { TypeIntegerArray }
  | boolean                             { TypeBoolean }
  | int                                 { TypeInteger }
  | IdLiteral                           { TypeAppDefined $1 }

Stmt
  : '{' StmtList '}'                    { AStatScope (fixMap $2) }
  | if '(' Expr ')' Stmt else Stmt      { AIf (Fix $3) (Fix $5) (Fix $7) }
  | while '(' Expr ')' Stmt             { AWhile (Fix $3) (Fix $5) }
  | print '(' Expr ')' ';'              { APrint (Fix $3) }
  | IdLiteral '=' Expr ';'              { AAssignment (Fix $ AExprIdentifier $1) (Fix $3) }
  | IdLiteral '[' Expr ']' '=' Expr ';' { AIndexedAssignment (Fix $ AExprIdentifier $1) (Fix $3) (Fix $6) }

StmtList 
  : Stmt StmtList                       { $1 : $2 }
  | {- empty -}                         { [] }

Expr
  : Expr '&&' Expr                      { AExprOp OperandLogicalAnd (Fix $1) (Fix $3)  }
  | Expr '+' Expr                       { AExprOp OperandPlus (Fix $1) (Fix $3)  }
  | Expr '-' Expr                       { AExprOp OperandMinus (Fix $1) (Fix $3)  }
  | Expr '*' Expr                       { AExprOp OperandMult (Fix $1) (Fix $3)  }
  | Expr '<' Expr                       { AExprOp OperandLess (Fix $1) (Fix $3)  }
  | intliteral                          { AExprInt $1 }
  | true                                { AExprTrue }
  | false                               { AExprFalse }
  | '!' Expr                            { AExprNegation (Fix $2) }
  | ExprC                               { $1 }

ExprC
  : '(' Expr ')'                        { $2 }
  | IdLiteral                           { AExprIdentifier $1 }
  | this                                { AExprThis }
  | new int '[' Expr ']'                { AExprIntArray (Fix $4) }
  | new IdLiteral '(' ')'               { AExprNewObject $2 }
  | ExprC '[' Expr ']'                  { AExprList (Fix $1) (Fix $3) }
  | ExprC '.' length                    { AExprLength (Fix $1) }
  | ExprC '.' IdLiteral '(' ExpList ')' { AExprInvocation (Fix $1) $3 (fixMap $5) }

ExpList
  : Expr ExpRest                        { $1 : $2  }
  | {- empty -}                         { []       }

ExpRest
  : ',' Expr ExpRest                    { $2 : $3  }
  | {- empty -}                         { []       }

IdLiteral
  : idliteral                           { $1       }
  | main                                { "main"   }

{

mainMethod arg vars code = AMethod TypeVoid "main" [Fix $ AVar TypeStringArray arg] (fixMap vars) (fixMap code) (Fix AExprVoid)

fixMap = map Fix

parserError :: [Token] -> a
parserError (t1:t2:t3:t4:t5:_) = error $ "Parse error, next tokens:" ++ renderTokens [t1, t2, t3, t4, t5]

parserError tokens = error $ "Parse error @eof:" ++ renderTokens tokens

renderTokens = concatMap ((" " ++) . show)

}
