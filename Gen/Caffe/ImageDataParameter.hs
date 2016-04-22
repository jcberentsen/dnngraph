{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.ImageDataParameter
       (ImageDataParameter(..), source, batch_size, rand_skip, shuffle, new_height, new_width, is_color, scale, mean_file,
        crop_size, mirror, root_folder)
       where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data ImageDataParameter = ImageDataParameter{_source :: !(P'.Maybe P'.Utf8), _batch_size :: !(P'.Maybe P'.Word32),
                                             _rand_skip :: !(P'.Maybe P'.Word32), _shuffle :: !(P'.Maybe P'.Bool),
                                             _new_height :: !(P'.Maybe P'.Word32), _new_width :: !(P'.Maybe P'.Word32),
                                             _is_color :: !(P'.Maybe P'.Bool), _scale :: !(P'.Maybe P'.Float),
                                             _mean_file :: !(P'.Maybe P'.Utf8), _crop_size :: !(P'.Maybe P'.Word32),
                                             _mirror :: !(P'.Maybe P'.Bool), _root_folder :: !(P'.Maybe P'.Utf8)}
                        deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''ImageDataParameter

instance P'.Mergeable ImageDataParameter where
  mergeAppend (ImageDataParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   (ImageDataParameter y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12)
   = ImageDataParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)

instance P'.Default ImageDataParameter where
  defaultValue
   = ImageDataParameter P'.defaultValue P'.defaultValue (Prelude'.Just 0) (Prelude'.Just Prelude'.False) (Prelude'.Just 0)
      (Prelude'.Just 0)
      (Prelude'.Just Prelude'.True)
      (Prelude'.Just 1.0)
      P'.defaultValue
      (Prelude'.Just 0)
      (Prelude'.Just Prelude'.False)
      (Prelude'.Just (P'.Utf8 (P'.pack "")))

instance P'.Wire ImageDataParameter where
  wireSize ft' self'@(ImageDataParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 13 x'2 + P'.wireSizeOpt 1 13 x'3 + P'.wireSizeOpt 1 8 x'4 +
             P'.wireSizeOpt 1 13 x'5
             + P'.wireSizeOpt 1 13 x'6
             + P'.wireSizeOpt 1 8 x'7
             + P'.wireSizeOpt 1 2 x'8
             + P'.wireSizeOpt 1 9 x'9
             + P'.wireSizeOpt 1 13 x'10
             + P'.wireSizeOpt 1 8 x'11
             + P'.wireSizeOpt 1 9 x'12)
  wirePut ft' self'@(ImageDataParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
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
             P'.wirePutOpt 21 2 x'8
             P'.wirePutOpt 26 9 x'9
             P'.wirePutOpt 32 13 x'2
             P'.wirePutOpt 40 13 x'10
             P'.wirePutOpt 48 8 x'11
             P'.wirePutOpt 56 13 x'3
             P'.wirePutOpt 64 8 x'4
             P'.wirePutOpt 72 13 x'5
             P'.wirePutOpt 80 13 x'6
             P'.wirePutOpt 88 8 x'7
             P'.wirePutOpt 98 9 x'12
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
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_shuffle = Prelude'.Just new'Field}) (P'.wireGet 8)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{_new_height = Prelude'.Just new'Field}) (P'.wireGet 13)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_new_width = Prelude'.Just new'Field}) (P'.wireGet 13)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{_is_color = Prelude'.Just new'Field}) (P'.wireGet 8)
             21 -> Prelude'.fmap (\ !new'Field -> old'Self{_scale = Prelude'.Just new'Field}) (P'.wireGet 2)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_mean_file = Prelude'.Just new'Field}) (P'.wireGet 9)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_crop_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_mirror = Prelude'.Just new'Field}) (P'.wireGet 8)
             98 -> Prelude'.fmap (\ !new'Field -> old'Self{_root_folder = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ImageDataParameter) ImageDataParameter where
  getVal m' f' = f' m'

instance P'.GPB ImageDataParameter

instance P'.ReflectDescriptor ImageDataParameter where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 21, 26, 32, 40, 48, 56, 64, 72, 80, 88, 98])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.ImageDataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ImageDataParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"ImageDataParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ImageDataParameter.source\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ImageDataParameter\"], baseName' = FName \"source\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ImageDataParameter.batch_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ImageDataParameter\"], baseName' = FName \"batch_size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ImageDataParameter.rand_skip\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ImageDataParameter\"], baseName' = FName \"rand_skip\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ImageDataParameter.shuffle\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ImageDataParameter\"], baseName' = FName \"shuffle\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ImageDataParameter.new_height\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ImageDataParameter\"], baseName' = FName \"new_height\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ImageDataParameter.new_width\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ImageDataParameter\"], baseName' = FName \"new_width\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ImageDataParameter.is_color\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ImageDataParameter\"], baseName' = FName \"is_color\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ImageDataParameter.scale\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ImageDataParameter\"], baseName' = FName \"scale\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 21}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ImageDataParameter.mean_file\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ImageDataParameter\"], baseName' = FName \"mean_file\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ImageDataParameter.crop_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ImageDataParameter\"], baseName' = FName \"crop_size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ImageDataParameter.mirror\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ImageDataParameter\"], baseName' = FName \"mirror\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ImageDataParameter.root_folder\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ImageDataParameter\"], baseName' = FName \"root_folder\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Just \"\", hsDefault = Just (HsDef'ByteString \"\")}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType ImageDataParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ImageDataParameter where
  textPut msg
   = do
       P'.tellT "source" (_source msg)
       P'.tellT "batch_size" (_batch_size msg)
       P'.tellT "rand_skip" (_rand_skip msg)
       P'.tellT "shuffle" (_shuffle msg)
       P'.tellT "new_height" (_new_height msg)
       P'.tellT "new_width" (_new_width msg)
       P'.tellT "is_color" (_is_color msg)
       P'.tellT "scale" (_scale msg)
       P'.tellT "mean_file" (_mean_file msg)
       P'.tellT "crop_size" (_crop_size msg)
       P'.tellT "mirror" (_mirror msg)
       P'.tellT "root_folder" (_root_folder msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_source, parse'_batch_size, parse'_rand_skip, parse'_shuffle, parse'_new_height, parse'_new_width,
                   parse'_is_color, parse'_scale, parse'_mean_file, parse'_crop_size, parse'_mirror, parse'_root_folder])
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
        parse'_shuffle
         = P'.try
            (do
               v <- P'.getT "shuffle"
               Prelude'.return (\ o -> o{_shuffle = v}))
        parse'_new_height
         = P'.try
            (do
               v <- P'.getT "new_height"
               Prelude'.return (\ o -> o{_new_height = v}))
        parse'_new_width
         = P'.try
            (do
               v <- P'.getT "new_width"
               Prelude'.return (\ o -> o{_new_width = v}))
        parse'_is_color
         = P'.try
            (do
               v <- P'.getT "is_color"
               Prelude'.return (\ o -> o{_is_color = v}))
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
        parse'_root_folder
         = P'.try
            (do
               v <- P'.getT "root_folder"
               Prelude'.return (\ o -> o{_root_folder = v}))