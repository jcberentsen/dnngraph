{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.MemoryDataParameter (MemoryDataParameter(..), batch_size, channels, height, width) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data MemoryDataParameter = MemoryDataParameter{_batch_size :: !(P'.Maybe P'.Word32), _channels :: !(P'.Maybe P'.Word32),
                                               _height :: !(P'.Maybe P'.Word32), _width :: !(P'.Maybe P'.Word32)}
                         deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''MemoryDataParameter

instance P'.Mergeable MemoryDataParameter where
  mergeAppend (MemoryDataParameter x'1 x'2 x'3 x'4) (MemoryDataParameter y'1 y'2 y'3 y'4)
   = MemoryDataParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default MemoryDataParameter where
  defaultValue = MemoryDataParameter P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire MemoryDataParameter where
  wireSize ft' self'@(MemoryDataParameter x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 13 x'1 + P'.wireSizeOpt 1 13 x'2 + P'.wireSizeOpt 1 13 x'3 + P'.wireSizeOpt 1 13 x'4)
  wirePut ft' self'@(MemoryDataParameter x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 13 x'1
             P'.wirePutOpt 16 13 x'2
             P'.wirePutOpt 24 13 x'3
             P'.wirePutOpt 32 13 x'4
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_batch_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_channels = Prelude'.Just new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_height = Prelude'.Just new'Field}) (P'.wireGet 13)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_width = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> MemoryDataParameter) MemoryDataParameter where
  getVal m' f' = f' m'

instance P'.GPB MemoryDataParameter

instance P'.ReflectDescriptor MemoryDataParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 24, 32])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.MemoryDataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"MemoryDataParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"MemoryDataParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.MemoryDataParameter.batch_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"MemoryDataParameter\"], baseName' = FName \"batch_size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.MemoryDataParameter.channels\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"MemoryDataParameter\"], baseName' = FName \"channels\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.MemoryDataParameter.height\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"MemoryDataParameter\"], baseName' = FName \"height\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.MemoryDataParameter.width\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"MemoryDataParameter\"], baseName' = FName \"width\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType MemoryDataParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg MemoryDataParameter where
  textPut msg
   = do
       P'.tellT "batch_size" (_batch_size msg)
       P'.tellT "channels" (_channels msg)
       P'.tellT "height" (_height msg)
       P'.tellT "width" (_width msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_batch_size, parse'_channels, parse'_height, parse'_width]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_batch_size
         = P'.try
            (do
               v <- P'.getT "batch_size"
               Prelude'.return (\ o -> o{_batch_size = v}))
        parse'_channels
         = P'.try
            (do
               v <- P'.getT "channels"
               Prelude'.return (\ o -> o{_channels = v}))
        parse'_height
         = P'.try
            (do
               v <- P'.getT "height"
               Prelude'.return (\ o -> o{_height = v}))
        parse'_width
         = P'.try
            (do
               v <- P'.getT "width"
               Prelude'.return (\ o -> o{_width = v}))