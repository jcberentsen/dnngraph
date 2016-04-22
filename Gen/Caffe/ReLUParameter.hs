{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.ReLUParameter (ReLUParameter(..), negative_slope, engine) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.ReLUParameter.Engine as Caffe.ReLUParameter (Engine)

data ReLUParameter = ReLUParameter{_negative_slope :: !(P'.Maybe P'.Float), _engine :: !(P'.Maybe Caffe.ReLUParameter.Engine)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''ReLUParameter

instance P'.Mergeable ReLUParameter where
  mergeAppend (ReLUParameter x'1 x'2) (ReLUParameter y'1 y'2) = ReLUParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default ReLUParameter where
  defaultValue = ReLUParameter (Prelude'.Just 0.0) (Prelude'.Just (Prelude'.read "DEFAULT"))

instance P'.Wire ReLUParameter where
  wireSize ft' self'@(ReLUParameter x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 2 x'1 + P'.wireSizeOpt 1 14 x'2)
  wirePut ft' self'@(ReLUParameter x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 13 2 x'1
             P'.wirePutOpt 16 14 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             13 -> Prelude'.fmap (\ !new'Field -> old'Self{_negative_slope = Prelude'.Just new'Field}) (P'.wireGet 2)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_engine = Prelude'.Just new'Field}) (P'.wireGet 14)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ReLUParameter) ReLUParameter where
  getVal m' f' = f' m'

instance P'.GPB ReLUParameter

instance P'.ReflectDescriptor ReLUParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [13, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.ReLUParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ReLUParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"ReLUParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ReLUParameter.negative_slope\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ReLUParameter\"], baseName' = FName \"negative_slope\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 13}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (0 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ReLUParameter.engine\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ReLUParameter\"], baseName' = FName \"engine\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ReLUParameter.Engine\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"ReLUParameter\"], baseName = MName \"Engine\"}), hsRawDefault = Just \"DEFAULT\", hsDefault = Just (HsDef'Enum \"DEFAULT\")}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType ReLUParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ReLUParameter where
  textPut msg
   = do
       P'.tellT "negative_slope" (_negative_slope msg)
       P'.tellT "engine" (_engine msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_negative_slope, parse'_engine]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_negative_slope
         = P'.try
            (do
               v <- P'.getT "negative_slope"
               Prelude'.return (\ o -> o{_negative_slope = v}))
        parse'_engine
         = P'.try
            (do
               v <- P'.getT "engine"
               Prelude'.return (\ o -> o{_engine = v}))