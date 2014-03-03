module Main where

import Lexer
import Parser

main :: IO ()
main = getContents >>= print . parseMiniJava . alexScanTokens
