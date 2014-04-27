module Main where

import           AST
import           Backend
import           Control.Monad (liftM, when)
import           Control.Monad.Trans (lift)
import           Control.Monad.Trans.Either (runEitherT, EitherT(..), left)
import           Lexer
import           Parser
import           ParserExtension
import           System.Environment (getArgs)
import           System.Exit (ExitCode(..),exitWith)
import           TypeCheck

main :: IO ()
main = do
  args <- getArgs
  when (length args < 2) $
    failWith "Usage: mjc <backend> <path-to-src> [-S]"

  let (backend : sourcePath : _) = args

  when (backend /= "JVM") $
    failWith "Only backend=JVM is supported"

  input <- readFile sourcePath
  checked <- runEitherT $ do
    tokens <- EitherT . return . fmap filterTokens $ runAlex input lex
    -- lift $ print tokens
    -- lift . print $ show (length tokens) ++ " tokens parsed"
    parsed <- fmap parseMiniJava $ checkTokens tokens
    -- lift $ print parsed
    verifyAST parsed
    checkAST parsed
    return parsed


  case checked of
    Left err -> failWith $ err
    Right tree -> do
      compileIntoFile tree
      exitWith ExitSuccess

  where
  failWith str = do
    putStrLn str
    exitWith $ ExitFailure 1

  lex = do
    t <- alexMonadScan
    case t of
      EOFToken -> return []
      t'       -> liftM (t' :) lex
