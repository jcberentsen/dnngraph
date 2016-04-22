{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.TanHParameter.Engine (Engine(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Engine = DEFAULT
            | CAFFE
            | CUDNN
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

instance P'.Mergeable Engine

instance Prelude'.Bounded Engine where
  minBound = DEFAULT
  maxBound = CUDNN

instance P'.Default Engine where
  defaultValue = DEFAULT

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Engine
toMaybe'Enum 0 = Prelude'.Just DEFAULT
toMaybe'Enum 1 = Prelude'.Just CAFFE
toMaybe'Enum 2 = Prelude'.Just CUDNN
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Engine where
  fromEnum DEFAULT = 0
  fromEnum CAFFE = 1
  fromEnum CUDNN = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.TanHParameter.Engine") . toMaybe'Enum
  succ DEFAULT = CAFFE
  succ CAFFE = CUDNN
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.TanHParameter.Engine"
  pred CAFFE = DEFAULT
  pred CUDNN = CAFFE
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.TanHParameter.Engine"

instance P'.Wire Engine where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Engine

instance P'.MessageAPI msg' (msg' -> Engine) Engine where
  getVal m' f' = f' m'

instance P'.ReflectEnum Engine where
  reflectEnum = [(0, "DEFAULT", DEFAULT), (1, "CAFFE", CAFFE), (2, "CUDNN", CUDNN)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.TanHParameter.Engine") ["Gen"] ["Caffe", "TanHParameter"] "Engine")
      ["Gen", "Caffe", "TanHParameter", "Engine.hs"]
      [(0, "DEFAULT"), (1, "CAFFE"), (2, "CUDNN")]

instance P'.TextType Engine where
  tellT = P'.tellShow
  getT = P'.getRead