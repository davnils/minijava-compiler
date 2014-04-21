module Main where

import AST
import Lexer
import Parser
import TypeCheck

excludedTokens = [TSingleLineComment, TMultiLineComment]

main :: IO ()
main = do
  input <- getContents
  let tokens   = alexScanTokens input
      parsed   = parseMiniJava . filter (not . flip elem excludedTokens) . map fst $ tokens
      checked  = checkAST parsed

  print tokens
  print parsed
  print checked
