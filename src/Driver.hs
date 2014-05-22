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
import           System.IO -- (hSetEncoding, stdin, utf8)
import           TypeCheck

main :: IO ()
main = do
  args <- getArgs
  when (length args < 2) $
    failWith "Usage: mjc <backend> <path-to-src> [-S]"

  let (backend : sourcePath : _) = args

  when (backend /= "JVM") $
    failWith "Only backend=JVM is supported"

  withFile sourcePath ReadMode $ \hInput ->  do

  hSetEncoding hInput latin1
  input <- hGetContents hInput

  res <- runEitherT $ do
    tokens <- EitherT . return . fmap filterTokens $ runAlex input lex
    parsed <- fmap parseMiniJava $ checkTokens tokens
    verifyAST parsed
    (interfaces, ast') <- checkAST parsed
    return (ast', interfaces)


  case res of
    Left err -> failWith $ err
    Right (tree, interfaces) -> do
      compileIntoFile tree interfaces 
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
