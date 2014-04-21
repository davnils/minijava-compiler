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

%%

-- problem: need to parse the following
-- Type name; ...
-- Statement; ...
--
-- where Statement might be String = ..;
-- and vardecl might be String name;

Program
  : MainClass ClassDeclList             { Fix . AProgram $ fixMap ($1 : $2) }

MainClass
  : class idliteral '{' public static void main '(' string '[' ']' idliteral ')' '{' VarDeclList StmtList '}' '}'
                                        { AClass $2 [] [Fix $ mainMethod $12 $15 $16] }

ClassDeclList
  : class idliteral '{' VarDeclList MethodDeclList '}' ClassDeclList
                                        { AClass $2 (fixMap $4) (fixMap $5) : $7}
  | {- empty -}                         { [] }

VarDeclList
  : {- empty -}                         { [] }
  | VarDeclList Type idliteral ';'      { $1 ++ [AVar $2 $3] }

MethodDeclList
  : public Type idliteral '(' FormalList ')' '{' VarDeclList StmtList return Expr ';' '}' MethodDeclList
                                        { AMethod $2 $3 (fixMap $5) (fixMap $8) (fixMap $9) (Fix $11) : $14 }
  | {- empty -}                         { [] }

FormalList
  : Type idliteral ',' FormalList       { AVar $1 $2 : $4 }
  | Type idliteral                      { [AVar $1 $2] }
  | {- empty -}                         { [] }

Type
  : int '[' ']'                         { TypeIntegerArray }
  | boolean                             { TypeBoolean }
  | int                                 { TypeInteger }
  | idliteral                           { TypeAppDefined $1 }

Stmt
  : '{' StmtList '}'                    { AStatScope (fixMap $2) }
  | if '(' Expr ')' Stmt else Stmt      { AIf (Fix $3) (Fix $5) (Fix $7) }
  | while '(' Expr ')' Stmt             { AWhile (Fix $3) (Fix $5) }
  | print '(' Expr ')' ';'              { APrint (Fix $3) }
  | idliteral '=' Expr ';'              { AAssignment (Fix $ AExprIdentifier $1) (Fix $3) }
  | idliteral '[' Expr ']' '=' Expr ';' { AIndexedAssignment (Fix $ AExprIdentifier $1) (Fix $3) (Fix $6) }

StmtList 
  : Stmt StmtList                       { $1 : $2 }
  | {- empty -}                         { [] }

Expr
  : Expr Op Expr                        { AExprOp $2 (Fix $1) (Fix $3) }
  | Expr '[' Expr ']'                   { AExprList (Fix $1) (Fix $3) }
  | Expr '.' length                     { AExprLength (Fix $1) }
  | Expr '.' idliteral '(' ExpList ')'  { AExprInvocation (Fix $1) $3 (fixMap $5) }
  | intliteral                          { AExprInt $1 }
  | true                                { AExprTrue }
  | false                               { AExprFalse }
  | idliteral                           { AExprIdentifier $1 }
  | this                                { AExprThis }
  | new int '[' Expr ']'                { AExprIntArray (Fix $4) }
  | new idliteral '(' ')'               { AExprNewObject $2 }
  | '!' Expr                            { AExprNegation (Fix $2) }
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

mainMethod arg vars code = AMethod TypeVoid "main" [Fix $ AVar TypeString arg] (fixMap vars) (fixMap code) (Fix AExprVoid)

fixMap = map Fix

parserError :: [Token] -> a
parserError tokens = error $ "Parse error, left over: " ++ concatMap show tokens

}
