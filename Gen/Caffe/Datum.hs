{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.Datum (Datum(..), channels, height, width, data', label, float_data, encoded) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Datum = Datum{_channels :: !(P'.Maybe P'.Int32), _height :: !(P'.Maybe P'.Int32), _width :: !(P'.Maybe P'.Int32),
                   _data' :: !(P'.Maybe P'.ByteString), _label :: !(P'.Maybe P'.Int32), _float_data :: !(P'.Seq P'.Float),
                   _encoded :: !(P'.Maybe P'.Bool)}
           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''Datum

instance P'.Mergeable Datum where
  mergeAppend (Datum x'1 x'2 x'3 x'4 x'5 x'6 x'7) (Datum y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = Datum (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)

instance P'.Default Datum where
  defaultValue
   = Datum P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      (Prelude'.Just Prelude'.False)

instance P'.Wire Datum where
  wireSize ft' self'@(Datum x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 5 x'1 + P'.wireSizeOpt 1 5 x'2 + P'.wireSizeOpt 1 5 x'3 + P'.wireSizeOpt 1 12 x'4 +
             P'.wireSizeOpt 1 5 x'5
             + P'.wireSizeRep 1 2 x'6
             + P'.wireSizeOpt 1 8 x'7)
  wirePut ft' self'@(Datum x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 5 x'1
             P'.wirePutOpt 16 5 x'2
             P'.wirePutOpt 24 5 x'3
             P'.wirePutOpt 34 12 x'4
             P'.wirePutOpt 40 5 x'5
             P'.wirePutRep 53 2 x'6
             P'.wirePutOpt 56 8 x'7
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_channels = Prelude'.Just new'Field}) (P'.wireGet 5)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_height = Prelude'.Just new'Field}) (P'.wireGet 5)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_width = Prelude'.Just new'Field}) (P'.wireGet 5)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_data' = Prelude'.Just new'Field}) (P'.wireGet 12)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_label = Prelude'.Just new'Field}) (P'.wireGet 5)
             53 -> Prelude'.fmap (\ !new'Field -> old'Self{_float_data = P'.append (_float_data old'Self) new'Field}) (P'.wireGet 2)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_float_data = P'.mergeAppend (_float_data old'Self) new'Field})
                    (P'.wireGetPacked 2)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_encoded = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Datum) Datum where
  getVal m' f' = f' m'

instance P'.GPB Datum

instance P'.ReflectDescriptor Datum where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 24, 34, 40, 50, 53, 56])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.Datum\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"Datum\"}, descFilePath = [\"Gen\",\"Caffe\",\"Datum.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.Datum.channels\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"Datum\"], baseName' = FName \"channels\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.Datum.height\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"Datum\"], baseName' = FName \"height\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.Datum.width\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"Datum\"], baseName' = FName \"width\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.Datum.data\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"Datum\"], baseName' = FName \"data'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.Datum.label\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"Datum\"], baseName' = FName \"label\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.Datum.float_data\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"Datum\"], baseName' = FName \"float_data\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 53}, packedTag = Just (WireTag {getWireTag = 53},WireTag {getWireTag = 50}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.Datum.encoded\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"Datum\"], baseName' = FName \"encoded\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType Datum where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Datum where
  textPut msg
   = do
       P'.tellT "channels" (_channels msg)
       P'.tellT "height" (_height msg)
       P'.tellT "width" (_width msg)
       P'.tellT "data" (_data' msg)
       P'.tellT "label" (_label msg)
       P'.tellT "float_data" (_float_data msg)
       P'.tellT "encoded" (_encoded msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_channels, parse'_height, parse'_width, parse'_data', parse'_label, parse'_float_data, parse'_encoded])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
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
        parse'_data'
         = P'.try
            (do
               v <- P'.getT "data"
               Prelude'.return (\ o -> o{_data' = v}))
        parse'_label
         = P'.try
            (do
               v <- P'.getT "label"
               Prelude'.return (\ o -> o{_label = v}))
        parse'_float_data
         = P'.try
            (do
               v <- P'.getT "float_data"
               Prelude'.return (\ o -> o{_float_data = P'.append (_float_data o) v}))
        parse'_encoded
         = P'.try
            (do
               v <- P'.getT "encoded"
               Prelude'.return (\ o -> o{_encoded = v}))