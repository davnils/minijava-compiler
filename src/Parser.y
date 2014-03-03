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

MainClass : class idliteral '{' public static void main '(' string '[' ']' idliteral ')' '{' '}' '}' { Class $2 [] [MainMethod [] [] []] }

{

parserError :: [Token] -> a
parserError tokens = error $ "Parse error, left over: " ++ concatMap show tokens

}
