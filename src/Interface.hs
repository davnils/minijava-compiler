{-# LANGUAGE UndecidableInstances, ViewPatterns #-}

module Interface 
(cata, cataM, para, paraM, InterfaceEntry, InterfaceMap, buildInterface, MethodEntry)
where

import           Control.Applicative ((<$>), pure)
import           Control.Monad hiding (mapM)
import           Control.Monad.Trans.Maybe
import           Data.Either (Either)
import           Data.Foldable (foldMap, Foldable, foldl')
import           Data.List (group, sort)
import           Data.Traversable (mapM, Traversable)
import           Control.Monad.State hiding (mapM)
import           Control.Monad.Trans.Either (runEitherT, EitherT, left)
import qualified Data.Map as M
import           Data.Monoid ((<>))
import           Prelude hiding (foldl', mapM)

import AST

type MethodEntry    = (AVarType, [AVarType])
type VarEntry       = AVarType
type InterfaceEntry = (M.Map AId VarEntry, M.Map AId MethodEntry)
type InterfaceMap   = M.Map AId InterfaceEntry

type BuildM = EitherT String (State InterfaceMap) ()

data PartialEntry
  = ReducedMethod AId MethodEntry
  | ReducedVar AId VarEntry
  | ReducedClass InterfaceMap
  | ReducedProgram InterfaceMap
  deriving Show

cata :: Functor f => (f r -> r) -> Fix f -> r
cata f (Fix t) = f (cata f <$> t)

para :: Functor f => ((Fix f, f r) -> r) -> Fix f -> r
para f (Fix t) = f (Fix t, (para f <$> t))

cataM :: (Traversable f, Monad m) => (f r -> m r) -> Fix f -> m r
cataM f (Fix t) = mapM (cataM f) t >>= f

paraM :: (Traversable f, Monad m) => ((Fix f, f r) -> m r) -> Fix f -> m r
paraM f (Fix t) = do
  subRes <- mapM (paraM f) t
  f (Fix t, subRes)

view :: UnnAST -> AEntry UnnAST
view (Fix e) = e

alg :: AEntry (Maybe PartialEntry) -> Maybe PartialEntry
alg (AProgram interfaces) = sequence interfaces >>= merge . map (\(ReducedClass l) -> l)
  where
  merge maps
    | any ((>1) . length) (group . sort $ map M.keys maps) = Nothing
    | otherwise = Just . ReducedProgram $ M.unions maps

alg (AClass name fields methods) = do
  fieldsMap  <- buildMap fields  $ \(ReducedVar name val) -> (name, val)
  methodsMap <- buildMap methods $ \(ReducedMethod name val) -> (name, val)
  return . ReducedClass $ M.singleton name (fieldsMap, methodsMap)
  where
  buildMap items f = do
    items' <- sequence items
    evalState (runMaybeT (forM items' $ addEntry . f) >>= handleError) M.empty
  
  handleError Nothing  = return Nothing
  handleError (Just _) = Just <$> get

  addEntry (name, entry) = do
    m <- get
    case M.lookup name m of
      Just _ -> mzero
      Nothing -> put $ M.insert name entry m

alg (AVar kind name)              = Just  $ ReducedVar name kind
alg (AMethod ret name args _ _ _) = liftM f $ sequence args
  where
  f xs = ReducedMethod name (ret, (getTypes xs))
  getTypes = map (\(ReducedVar _ kind) -> kind)
alg _                                 = Nothing

buildInterface :: Fix AEntry -> Maybe InterfaceMap
buildInterface = liftM (\(ReducedProgram m) -> m) . cata alg
