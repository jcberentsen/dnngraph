module NN.Backend.Caffe(caffePasses, middleEnd, backend, addConnection, addLabels, optimizeInPlaceLayer) where

import           Gen.Caffe.LayerParameter   as LP
import           Gen.Caffe.NetParameter     as NP

import           Control.Lens
import           Data.Char
import qualified Data.Foldable              as F
import           Data.Graph.Inductive.Graph hiding ((&))
import qualified Data.Graph.Inductive.Graph as G
import           Data.Graph.Inductive.Query
import           Data.Maybe
import qualified Data.Sequence              as S

import           Text.Printf
import           Text.ProtocolBuffers       as P

import           NN.DSL
import           NN.Passes

caffePasses :: [Pass]
caffePasses = [addConnection, addLabels] ++ optimizeInPlaceLayer ReLU ++ optimizeInPlaceLayer Dropout

middleEnd :: Net -> Net
middleEnd = optimizeWith caffePasses

layerName :: LayerParameter -> Int -> Utf8
layerName l i = case LP._name l of
    Just n -> n
    _ -> printf "%s_%d" (_type' l & fromJust & toString & map toLower) i & s

backend :: Net -> NetParameter
backend gr = def & layer <>~ S.fromList (topsort' gr)

addLabels :: Pass
addLabels (_, _, lp) = lp & update (layerTy lp)
    where
      -- Data has labels going out
      update Data = LP.top <>~ S.singleton (s "label")
      -- Criterion have labels coming in
      update SoftmaxWithLoss = LP.bottom <>~ S.singleton (s "label")
      update Accuracy = LP.bottom <>~ S.singleton (s "label")
      -- Everything else can be ignored
      update _ = id

-- |If our layerTy is the given layer that is performed in-place, then
-- update `top` to point to `bottom`.
-- If any of our parents are performed in-place, update `bottom` to
-- point to our parents `top`
optimizeInPlaceLayer :: LayerTy -> [Pass]
optimizeInPlaceLayer layerTy' = [updateIfInPlace, updateIfParentInPlace] where
    inPlace lp = layerTy lp == layerTy'
    inPlaceParents gr i = filter inPlace . map fst $ pres gr i

    updateIfInPlace (_, i, lp) =
        case (layerTy lp == layerTy', F.toList (LP._top lp)) of
          (True, [_]) -> lp & LP.top .~ LP._bottom lp
          (True, _) -> error $ printf "Can only have one output for an in-place layer" ++ show (layerName lp i)
          (False, _) -> lp

    updateIfParentInPlace :: Pass
    updateIfParentInPlace (gr, i, lp) =
        case updateFromParents (gr, i, lp) of
          Left e -> error e
          Right lp' -> lp'

    updateFromParents :: (Net, Node, LayerParameter) -> Either String LayerParameter
    updateFromParents (gr, i, lp) =
       case inPlaceParents gr i of
         [] -> Right lp
         parents ->
             -- TODO this is super dodgy and incorrect in the general
             -- case (there are some weird invariants we rely on), but it works for now.
             if length parents /= (length . F.toList . LP._bottom) lp
             then Left $ printf "Must have all parents in-place for in-place optimizations" ++ show (layerName lp i)
             else let parentTops = F.concatMap (F.toList . LP._top) parents in
                  if length parentTops == length ((F.toList . LP._bottom) lp)
                  then Right $ lp & LP.bottom .~ S.fromList parentTops
                  else Left $ error "asdf"

labelled :: Net -> [Node] -> [(LayerParameter, Node)]
labelled gr ns = zip (lab' . context gr <$> ns) ns

pres :: Net -> Node -> [(LayerParameter, Node)]
pres gr j = labelled gr (G.pre gr j)

addConnection :: Pass
addConnection (gr, i, lp) = lp
                            & LP.name ?~ layerName lp i
                            & LP.bottom .~ S.fromList (map (uncurry layerName) (pres gr i))
                            & LP.top <>~ S.singleton (layerName lp i)
