module ParserExtension
(filterTokens, verifyAST)
where

import           AST
import           Control.Monad (liftM)
import           Control.Monad.Trans.Either (runEitherT, EitherT, left)
import           Data.Either (Either(..))
import           Interface -- TODO: refactor catamorphisms
import           Lexer

excludedTokens = [TSingleLineComment, TMultiLineComment]

filterTokens :: [Token] -> [Token]
filterTokens = filter (not . flip elem excludedTokens)

data PartialEntry
  = PArrayAlloc
  | POther

verifyAST :: Monad m => UnnAST -> EitherT String m ()
verifyAST ast = cataM alg ast >> return ()

alg (AExprIntArray _) = return PArrayAlloc
alg (AExprList (PArrayAlloc) _)
                      = left "Invalid declaration of double-array"
alg _                 = return POther
