module ParserExtension
(checkTokens, filterTokens, verifyAST)
where

import           AST
import           Control.Monad (liftM)
import           Control.Monad.Trans.Either (runEitherT, EitherT, left)
import           Data.Either (Either(..))
import           Interface -- TODO: refactor catamorphisms
import           Lexer

excludedTokens = [TOther, TSingleLineComment, TMultiLineComment]

filterTokens :: [Token] -> [Token]
filterTokens = filter (not . flip elem excludedTokens)

checkTokens :: Monad m => [Token] -> EitherT String m [Token]
checkTokens tokens = checkDoubleAlloc tokens >> return tokens
  where
  checkDoubleAlloc (TRightBracket:TLeftBracket:_) =
    left "Invalid double bracket dereference (multi-dim-allocation?)"
  checkDoubleAlloc (_:xs) = checkDoubleAlloc xs
  checkDoubleAlloc _ = return ()

data PartialEntry
  = PArrayAlloc
  | POther

verifyAST :: Monad m => UnnAST -> EitherT String m ()
verifyAST ast = return ()
