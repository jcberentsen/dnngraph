{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.PowerParameter (PowerParameter(..), power, scale, shift) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data PowerParameter = PowerParameter{_power :: !(P'.Maybe P'.Float), _scale :: !(P'.Maybe P'.Float), _shift :: !(P'.Maybe P'.Float)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''PowerParameter

instance P'.Mergeable PowerParameter where
  mergeAppend (PowerParameter x'1 x'2 x'3) (PowerParameter y'1 y'2 y'3)
   = PowerParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default PowerParameter where
  defaultValue = PowerParameter (Prelude'.Just 1.0) (Prelude'.Just 1.0) (Prelude'.Just 0.0)

instance P'.Wire PowerParameter where
  wireSize ft' self'@(PowerParameter x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 2 x'1 + P'.wireSizeOpt 1 2 x'2 + P'.wireSizeOpt 1 2 x'3)
  wirePut ft' self'@(PowerParameter x'1 x'2 x'3)
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
             P'.wirePutOpt 21 2 x'2
             P'.wirePutOpt 29 2 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             13 -> Prelude'.fmap (\ !new'Field -> old'Self{_power = Prelude'.Just new'Field}) (P'.wireGet 2)
             21 -> Prelude'.fmap (\ !new'Field -> old'Self{_scale = Prelude'.Just new'Field}) (P'.wireGet 2)
             29 -> Prelude'.fmap (\ !new'Field -> old'Self{_shift = Prelude'.Just new'Field}) (P'.wireGet 2)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> PowerParameter) PowerParameter where
  getVal m' f' = f' m'

instance P'.GPB PowerParameter

instance P'.ReflectDescriptor PowerParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [13, 21, 29])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.PowerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"PowerParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"PowerParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PowerParameter.power\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PowerParameter\"], baseName' = FName \"power\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 13}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PowerParameter.scale\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PowerParameter\"], baseName' = FName \"scale\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 21}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PowerParameter.shift\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PowerParameter\"], baseName' = FName \"shift\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 29}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (0 % 1)))}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType PowerParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg PowerParameter where
  textPut msg
   = do
       P'.tellT "power" (_power msg)
       P'.tellT "scale" (_scale msg)
       P'.tellT "shift" (_shift msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_power, parse'_scale, parse'_shift]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_power
         = P'.try
            (do
               v <- P'.getT "power"
               Prelude'.return (\ o -> o{_power = v}))
        parse'_scale
         = P'.try
            (do
               v <- P'.getT "scale"
               Prelude'.return (\ o -> o{_scale = v}))
        parse'_shift
         = P'.try
            (do
               v <- P'.getT "shift"
               Prelude'.return (\ o -> o{_shift = v}))