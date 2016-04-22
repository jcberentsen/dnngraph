{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.DataParameter (DataParameter(..), source, batch_size, rand_skip, backend, scale, mean_file, crop_size, mirror)
       where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.DataParameter.DB as Caffe.DataParameter (DB)

data DataParameter = DataParameter{_source :: !(P'.Maybe P'.Utf8), _batch_size :: !(P'.Maybe P'.Word32),
                                   _rand_skip :: !(P'.Maybe P'.Word32), _backend :: !(P'.Maybe Caffe.DataParameter.DB),
                                   _scale :: !(P'.Maybe P'.Float), _mean_file :: !(P'.Maybe P'.Utf8),
                                   _crop_size :: !(P'.Maybe P'.Word32), _mirror :: !(P'.Maybe P'.Bool)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''DataParameter

instance P'.Mergeable DataParameter where
  mergeAppend (DataParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8) (DataParameter y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8)
   = DataParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)

instance P'.Default DataParameter where
  defaultValue
   = DataParameter P'.defaultValue P'.defaultValue (Prelude'.Just 0) (Prelude'.Just (Prelude'.read "LEVELDB")) (Prelude'.Just 1.0)
      P'.defaultValue
      (Prelude'.Just 0)
      (Prelude'.Just Prelude'.False)

instance P'.Wire DataParameter where
  wireSize ft' self'@(DataParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 13 x'2 + P'.wireSizeOpt 1 13 x'3 + P'.wireSizeOpt 1 14 x'4 +
             P'.wireSizeOpt 1 2 x'5
             + P'.wireSizeOpt 1 9 x'6
             + P'.wireSizeOpt 1 13 x'7
             + P'.wireSizeOpt 1 8 x'8)
  wirePut ft' self'@(DataParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 9 x'1
             P'.wirePutOpt 21 2 x'5
             P'.wirePutOpt 26 9 x'6
             P'.wirePutOpt 32 13 x'2
             P'.wirePutOpt 40 13 x'7
             P'.wirePutOpt 48 8 x'8
             P'.wirePutOpt 56 13 x'3
             P'.wirePutOpt 64 14 x'4
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_source = Prelude'.Just new'Field}) (P'.wireGet 9)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_batch_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_rand_skip = Prelude'.Just new'Field}) (P'.wireGet 13)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_backend = Prelude'.Just new'Field}) (P'.wireGet 14)
             21 -> Prelude'.fmap (\ !new'Field -> old'Self{_scale = Prelude'.Just new'Field}) (P'.wireGet 2)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_mean_file = Prelude'.Just new'Field}) (P'.wireGet 9)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_crop_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_mirror = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DataParameter) DataParameter where
  getVal m' f' = f' m'

instance P'.GPB DataParameter

instance P'.ReflectDescriptor DataParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 21, 26, 32, 40, 48, 56, 64])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.DataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"DataParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"DataParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DataParameter.source\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DataParameter\"], baseName' = FName \"source\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DataParameter.batch_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DataParameter\"], baseName' = FName \"batch_size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DataParameter.rand_skip\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DataParameter\"], baseName' = FName \"rand_skip\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DataParameter.backend\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DataParameter\"], baseName' = FName \"backend\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.DataParameter.DB\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"DataParameter\"], baseName = MName \"DB\"}), hsRawDefault = Just \"LEVELDB\", hsDefault = Just (HsDef'Enum \"LEVELDB\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DataParameter.scale\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DataParameter\"], baseName' = FName \"scale\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 21}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DataParameter.mean_file\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DataParameter\"], baseName' = FName \"mean_file\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DataParameter.crop_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DataParameter\"], baseName' = FName \"crop_size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DataParameter.mirror\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DataParameter\"], baseName' = FName \"mirror\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType DataParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DataParameter where
  textPut msg
   = do
       P'.tellT "source" (_source msg)
       P'.tellT "batch_size" (_batch_size msg)
       P'.tellT "rand_skip" (_rand_skip msg)
       P'.tellT "backend" (_backend msg)
       P'.tellT "scale" (_scale msg)
       P'.tellT "mean_file" (_mean_file msg)
       P'.tellT "crop_size" (_crop_size msg)
       P'.tellT "mirror" (_mirror msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_source, parse'_batch_size, parse'_rand_skip, parse'_backend, parse'_scale, parse'_mean_file,
                   parse'_crop_size, parse'_mirror])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_source
         = P'.try
            (do
               v <- P'.getT "source"
               Prelude'.return (\ o -> o{_source = v}))
        parse'_batch_size
         = P'.try
            (do
               v <- P'.getT "batch_size"
               Prelude'.return (\ o -> o{_batch_size = v}))
        parse'_rand_skip
         = P'.try
            (do
               v <- P'.getT "rand_skip"
               Prelude'.return (\ o -> o{_rand_skip = v}))
        parse'_backend
         = P'.try
            (do
               v <- P'.getT "backend"
               Prelude'.return (\ o -> o{_backend = v}))
        parse'_scale
         = P'.try
            (do
               v <- P'.getT "scale"
               Prelude'.return (\ o -> o{_scale = v}))
        parse'_mean_file
         = P'.try
            (do
               v <- P'.getT "mean_file"
               Prelude'.return (\ o -> o{_mean_file = v}))
        parse'_crop_size
         = P'.try
            (do
               v <- P'.getT "crop_size"
               Prelude'.return (\ o -> o{_crop_size = v}))
        parse'_mirror
         = P'.try
            (do
               v <- P'.getT "mirror"
               Prelude'.return (\ o -> o{_mirror = v}))