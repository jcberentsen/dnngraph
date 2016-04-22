{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.TanHParameter (TanHParameter(..), engine) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.TanHParameter.Engine as Caffe.TanHParameter (Engine)

data TanHParameter = TanHParameter{_engine :: !(P'.Maybe Caffe.TanHParameter.Engine)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''TanHParameter

instance P'.Mergeable TanHParameter where
  mergeAppend (TanHParameter x'1) (TanHParameter y'1) = TanHParameter (P'.mergeAppend x'1 y'1)

instance P'.Default TanHParameter where
  defaultValue = TanHParameter (Prelude'.Just (Prelude'.read "DEFAULT"))

instance P'.Wire TanHParameter where
  wireSize ft' self'@(TanHParameter x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1)
  wirePut ft' self'@(TanHParameter x'1)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 14 x'1
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_engine = Prelude'.Just new'Field}) (P'.wireGet 14)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TanHParameter) TanHParameter where
  getVal m' f' = f' m'

instance P'.GPB TanHParameter

instance P'.ReflectDescriptor TanHParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.TanHParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"TanHParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"TanHParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.TanHParameter.engine\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"TanHParameter\"], baseName' = FName \"engine\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.TanHParameter.Engine\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"TanHParameter\"], baseName = MName \"Engine\"}), hsRawDefault = Just \"DEFAULT\", hsDefault = Just (HsDef'Enum \"DEFAULT\")}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType TanHParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TanHParameter where
  textPut msg
   = do
       P'.tellT "engine" (_engine msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_engine]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_engine
         = P'.try
            (do
               v <- P'.getT "engine"
               Prelude'.return (\ o -> o{_engine = v}))