module Main where

import Lexer
import Parser

main :: IO ()
main = do
  input <- getContents
  let tokens = alexScanTokens input
  print $ tokens
  print . parseMiniJava . map fst $ tokens
