module Main where

import AST
import Lexer
import Parser
import TypeCheck

main :: IO ()
main = do
  input <- getContents
  let tokens = alexScanTokens input
  print $ tokens
  print . parseMiniJava . map fst $ tokens
