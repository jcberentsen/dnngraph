{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.DummyDataParameter (DummyDataParameter(..), data_filler, num, channels, height, width) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.FillerParameter as Caffe (FillerParameter)

data DummyDataParameter = DummyDataParameter{_data_filler :: !(P'.Seq Caffe.FillerParameter), _num :: !(P'.Seq P'.Word32),
                                             _channels :: !(P'.Seq P'.Word32), _height :: !(P'.Seq P'.Word32),
                                             _width :: !(P'.Seq P'.Word32)}
                        deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''DummyDataParameter

instance P'.Mergeable DummyDataParameter where
  mergeAppend (DummyDataParameter x'1 x'2 x'3 x'4 x'5) (DummyDataParameter y'1 y'2 y'3 y'4 y'5)
   = DummyDataParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default DummyDataParameter where
  defaultValue = DummyDataParameter P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire DummyDataParameter where
  wireSize ft' self'@(DummyDataParameter x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeRep 1 13 x'2 + P'.wireSizeRep 1 13 x'3 + P'.wireSizeRep 1 13 x'4 +
             P'.wireSizeRep 1 13 x'5)
  wirePut ft' self'@(DummyDataParameter x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutRep 10 11 x'1
             P'.wirePutRep 16 13 x'2
             P'.wirePutRep 24 13 x'3
             P'.wirePutRep 32 13 x'4
             P'.wirePutRep 40 13 x'5
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_data_filler = P'.append (_data_filler old'Self) new'Field})
                    (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_num = P'.append (_num old'Self) new'Field}) (P'.wireGet 13)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_num = P'.mergeAppend (_num old'Self) new'Field}) (P'.wireGetPacked 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_channels = P'.append (_channels old'Self) new'Field}) (P'.wireGet 13)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_channels = P'.mergeAppend (_channels old'Self) new'Field})
                    (P'.wireGetPacked 13)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_height = P'.append (_height old'Self) new'Field}) (P'.wireGet 13)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_height = P'.mergeAppend (_height old'Self) new'Field})
                    (P'.wireGetPacked 13)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_width = P'.append (_width old'Self) new'Field}) (P'.wireGet 13)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_width = P'.mergeAppend (_width old'Self) new'Field})
                    (P'.wireGetPacked 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DummyDataParameter) DummyDataParameter where
  getVal m' f' = f' m'

instance P'.GPB DummyDataParameter

instance P'.ReflectDescriptor DummyDataParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 18, 24, 26, 32, 34, 40, 42])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.DummyDataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"DummyDataParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"DummyDataParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DummyDataParameter.data_filler\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DummyDataParameter\"], baseName' = FName \"data_filler\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DummyDataParameter.num\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DummyDataParameter\"], baseName' = FName \"num\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Just (WireTag {getWireTag = 16},WireTag {getWireTag = 18}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DummyDataParameter.channels\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DummyDataParameter\"], baseName' = FName \"channels\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Just (WireTag {getWireTag = 24},WireTag {getWireTag = 26}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DummyDataParameter.height\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DummyDataParameter\"], baseName' = FName \"height\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Just (WireTag {getWireTag = 32},WireTag {getWireTag = 34}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DummyDataParameter.width\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DummyDataParameter\"], baseName' = FName \"width\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Just (WireTag {getWireTag = 40},WireTag {getWireTag = 42}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType DummyDataParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DummyDataParameter where
  textPut msg
   = do
       P'.tellT "data_filler" (_data_filler msg)
       P'.tellT "num" (_num msg)
       P'.tellT "channels" (_channels msg)
       P'.tellT "height" (_height msg)
       P'.tellT "width" (_width msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_data_filler, parse'_num, parse'_channels, parse'_height, parse'_width]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_data_filler
         = P'.try
            (do
               v <- P'.getT "data_filler"
               Prelude'.return (\ o -> o{_data_filler = P'.append (_data_filler o) v}))
        parse'_num
         = P'.try
            (do
               v <- P'.getT "num"
               Prelude'.return (\ o -> o{_num = P'.append (_num o) v}))
        parse'_channels
         = P'.try
            (do
               v <- P'.getT "channels"
               Prelude'.return (\ o -> o{_channels = P'.append (_channels o) v}))
        parse'_height
         = P'.try
            (do
               v <- P'.getT "height"
               Prelude'.return (\ o -> o{_height = P'.append (_height o) v}))
        parse'_width
         = P'.try
            (do
               v <- P'.getT "width"
               Prelude'.return (\ o -> o{_width = P'.append (_width o) v}))