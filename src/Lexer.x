{
module Lexer where

import Data.Char (isAlpha)

}

%wrapper "monad"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-
      $white+                       ;

<0>   "class"                       {tag' TClass                    }
<0>   "public"                      {tag' TPublic                   }
<0>   "static"                      {tag' TStatic                   }
<0>   "new"                         {tag' TNew                      }
<0>   "return"                      {tag' TReturn                   }
<0>   "if"                          {tag' TIf                       }
<0>   "else"                        {tag' TElse                     }
<0>   "while"                       {tag' TWhile                    }
<0>   "System.out.println"          {tag' TPrint                    }
<0>   "this"                        {tag' TThis                     }

<0>   "main"                        {tag' TMain                     }
<0>   "length"                      {tag' TLength                   }

<0>   "void"                        {tag' TVoid                     }
<0>   "String"                      {tag' TString                   }
<0>   "int"                         {tag' TInt                      }
<0>   "boolean"                     {tag' TBoolean                  }
<0>   "true"                        {tag' TTrue                     }
<0>   "false"                       {tag' TFalse                    }
   
<0>   "!"                           {tag' TNegation                 }
<0>   "&&"                          {tag' TLogicAnd                 }
<0>   "<"                           {tag' TCompareLess              }
<0>   "+"                           {tag' TAdd                      }
<0>   "-"                           {tag' TSub                      }
<0>   "*"                           {tag' TMul                      }
   
<0>   "="                           {tag' TAssignment               }
<0>   ","                           {tag' TComma                    }
<0>   "."                           {tag' TDot                      }
<0>   ";"                           {tag' TSemiColon                }
<0>   "("                           {tag' TLeftParen                }
<0>   ")"                           {tag' TRightParen               }
<0>   "["                           {tag' TLeftBracket              }
<0>   "]"                           {tag' TRightBracket             }
<0>   "{"                           {tag' TLeftBrace                }
<0>   "}"                           {tag' TRightBrace               }
<0>   "//".*                        {tag' TSingleLineComment        }
<0>   "/*"                          {begin ign                      }
<ign> "*/"                          {begin 0                        }
<ign> .                             ;

<0>   [$alpha _][$alpha $digit _]*  {tag $ TIdLiteral               }
<0>   0                             {tag $ TIntLiteral . read       }
<0>   [1-9]$digit*                  {tag $ TIntLiteral . read       }


{

data Token
 = TClass
 | TPublic
 | TStatic
 | TMain
 | TNew
 | TReturn
 | TIf
 | TElse
 | TWhile
 | TPrint
 | TLength
 | TThis

 | TIdLiteral String
 | TIntLiteral Int

 | TVoid
 | TString
 | TInt
 | TBoolean
 | TTrue
 | TFalse

 | TNegation
 | TLogicAnd
 | TCompareLess
 | TAdd
 | TSub
 | TMul

 | TAssignment
 | TComma
 | TDot
 | TSemiColon
 | TLeftParen
 | TRightParen
 | TLeftBracket
 | TRightBracket
 | TLeftBrace
 | TRightBrace
 | TSingleLineComment
 | TMultiLineComment

 | EOFToken
 | TOther
 deriving (Eq, Ord, Show)

tag :: (String -> Token) -> AlexInput -> Int -> Alex Token
tag f (_, _, _, token) len = return $ f (take len token)

tag' :: Token -> AlexInput -> Int -> Alex Token
tag' token _ _ = return token

alexEOF = return EOFToken

}
