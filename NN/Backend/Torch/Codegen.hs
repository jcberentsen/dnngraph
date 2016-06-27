{-# LANGUAGE DeriveFunctor              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}
module NN.Backend.Torch.Codegen where

import           Control.Lens               hiding (assign)
import           Control.Monad.State.Strict
import qualified Data.Foldable              as F
import           Data.Monoid
import           Gen.Caffe.LayerParameter   as LP
import           Language.Lua.PrettyPrinter
import           Language.Lua.Syntax
import           Text.Printf
import qualified Data.Text as T

import           NN.Backend.Torch.Flat
import           NN.Backend.Torch.Lua
import           NN.Backend.Torch.Torch


data TorchState = TorchState {
      _statements :: [Stat],
      _count      :: Int
    }
makeLenses ''TorchState

instance Monoid TorchState where
    mempty = TorchState [] 0
    (TorchState ls lc) `mappend` (TorchState rs rc) =
        TorchState (ls <> rs) (max lc rc)

newtype Torch a = Torch { _unTorch :: State TorchState a }
    deriving (Functor, Applicative, Monad, MonadState TorchState)

(<>+) :: MonadState s m => ASetter' s [t] -> t -> m ()
xs <>+ x = xs <>= [x]

imports :: Torch ()
imports = statements <>+ require (Name "nn")

fresh :: T.Text -> Torch Name
fresh prefix = do
  c <- use count
  count += 1
  return $ Name $ T.pack $ printf "%s%d" (show prefix) c

finalize :: Name -> [Exp] -> Torch Block
finalize id' criteria' = do
  criteriaNames' <- forM criteria' $ \exp' -> do
                           name' <- fresh "criteria"
                           statements <>+ assign name' exp'
                           return name'
  statements' <- use statements
  return $ Block statements' (Just $ return' <$> id':criteriaNames')

insertContainer :: Name -> Exp -> [Flat Exp] -> Torch Name
insertContainer (Name prefix) containerModule exps' = do
  name' <- fresh prefix
  statements <>+ assign name' containerModule
  forM_ exps' $ \exp' -> do
    innerName' <- insert exp'
    statements <>+ methCall name' (Name "add") [var' innerName']
  return name'


insert :: Flat Exp -> Torch Name
insert (Single exp') = do
  name' <- fresh "mod"
  statements <>+ assign name' exp'
  return name'
insert (Seq exps') = insertContainer (Name "seq") sequential' exps'
    where
      sequential' = torchExp (TorchModule (Name "nn") (Name "Sequential") [])
insert (Par exps') = insertContainer (Name "par") depthConcat' exps'
    where
      depthConcat' = torchExp (TorchModule (Name "nn") (Name "DepthConcat") [])

runTorch :: Flat LayerParameter -> Torch Block
runTorch root = do
  imports
  id' <- insert innerExps
  finalize id' criteriaExps
      where
        exps = (((torchExp <$>) <$>) . torchModules) <$> root
        innerExps = (simplify . nested . (inners <$>)) exps
        criteriaExps = F.concat (criteria <$> exps)

lower :: Flat LayerParameter -> Block
lower layers = (evalState . _unTorch) (runTorch layers) mempty

codegen :: Block -> String
codegen block = pprint block & renderPretty 0.4 200 & displayS & \f -> f ""
