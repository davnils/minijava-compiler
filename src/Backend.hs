module Backend where

import AST
import Control.Monad (forM_)
import Data.Monoid ((<>))

data JOutput
  = Bla
  | Bla2

printJ :: JOutput -> String
printJ = undefined

compile :: UnnAST -> JOutput
compile = undefined

compileIntoFile :: UnnAST -> IO ()
compileIntoFile ast = do
  let compiled = compile ast
  -- for now, just touch the files for each class
  let classNames = map (\(Fix (AClass name _ _)) -> name) .
                   (\(Fix (AProgram l)) -> l) $ ast
  forM_ classNames $ \name -> writeFile (name <> ".s") ""
  return ()
