module Main where

import AST
import Backend
import Control.Monad (when)
import Lexer
import Parser
import System.Environment (getArgs)
import System.Exit (ExitCode(..),exitWith)
import TypeCheck

excludedTokens = [TSingleLineComment, TMultiLineComment]

main :: IO ()
main = do
  args <- getArgs
  when (length args < 2) $
    failWith "Usage: mjc <backend> <path-to-src> [-S]"

  let (backend : sourcePath : _) = args

  when (backend /= "JVM") $
    failWith "Only backend=JVM is supported"

  -- TODO: Add explicit error handling to lexer and parser

  input <- readFile sourcePath
  let tokens   = alexScanTokens input
      parsed   = parseMiniJava . filter (not . flip elem excludedTokens) . map fst $ tokens
      checked  = checkAST parsed

  case checked of
    Left err -> failWith $ err
    Right _  -> do
      compileIntoFile parsed
      exitWith ExitSuccess

  {- print tokens
  print parsed
  print checked -}

  where
  failWith str = do
    putStrLn str
    exitWith $ ExitFailure 1
