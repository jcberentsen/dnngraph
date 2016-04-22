{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.WindowDataParameter
       (WindowDataParameter(..), source, scale, mean_file, batch_size, crop_size, mirror, fg_threshold, bg_threshold, fg_fraction,
        context_pad, crop_mode, cache_images, root_folder)
       where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data WindowDataParameter = WindowDataParameter{_source :: !(P'.Maybe P'.Utf8), _scale :: !(P'.Maybe P'.Float),
                                               _mean_file :: !(P'.Maybe P'.Utf8), _batch_size :: !(P'.Maybe P'.Word32),
                                               _crop_size :: !(P'.Maybe P'.Word32), _mirror :: !(P'.Maybe P'.Bool),
                                               _fg_threshold :: !(P'.Maybe P'.Float), _bg_threshold :: !(P'.Maybe P'.Float),
                                               _fg_fraction :: !(P'.Maybe P'.Float), _context_pad :: !(P'.Maybe P'.Word32),
                                               _crop_mode :: !(P'.Maybe P'.Utf8), _cache_images :: !(P'.Maybe P'.Bool),
                                               _root_folder :: !(P'.Maybe P'.Utf8)}
                         deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''WindowDataParameter

instance P'.Mergeable WindowDataParameter where
  mergeAppend (WindowDataParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13)
   (WindowDataParameter y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13)
   = WindowDataParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)
      (P'.mergeAppend x'13 y'13)

instance P'.Default WindowDataParameter where
  defaultValue
   = WindowDataParameter P'.defaultValue (Prelude'.Just 1.0) P'.defaultValue P'.defaultValue (Prelude'.Just 0)
      (Prelude'.Just Prelude'.False)
      (Prelude'.Just 0.5)
      (Prelude'.Just 0.5)
      (Prelude'.Just 0.25)
      (Prelude'.Just 0)
      (Prelude'.Just (P'.Utf8 (P'.pack "warp")))
      (Prelude'.Just Prelude'.False)
      (Prelude'.Just (P'.Utf8 (P'.pack "")))

instance P'.Wire WindowDataParameter where
  wireSize ft' self'@(WindowDataParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 2 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 13 x'4 +
             P'.wireSizeOpt 1 13 x'5
             + P'.wireSizeOpt 1 8 x'6
             + P'.wireSizeOpt 1 2 x'7
             + P'.wireSizeOpt 1 2 x'8
             + P'.wireSizeOpt 1 2 x'9
             + P'.wireSizeOpt 1 13 x'10
             + P'.wireSizeOpt 1 9 x'11
             + P'.wireSizeOpt 1 8 x'12
             + P'.wireSizeOpt 1 9 x'13)
  wirePut ft' self'@(WindowDataParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13)
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
             P'.wirePutOpt 21 2 x'2
             P'.wirePutOpt 26 9 x'3
             P'.wirePutOpt 32 13 x'4
             P'.wirePutOpt 40 13 x'5
             P'.wirePutOpt 48 8 x'6
             P'.wirePutOpt 61 2 x'7
             P'.wirePutOpt 69 2 x'8
             P'.wirePutOpt 77 2 x'9
             P'.wirePutOpt 80 13 x'10
             P'.wirePutOpt 90 9 x'11
             P'.wirePutOpt 96 8 x'12
             P'.wirePutOpt 106 9 x'13
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_source = Prelude'.Just new'Field}) (P'.wireGet 9)
             21 -> Prelude'.fmap (\ !new'Field -> old'Self{_scale = Prelude'.Just new'Field}) (P'.wireGet 2)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_mean_file = Prelude'.Just new'Field}) (P'.wireGet 9)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_batch_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_crop_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_mirror = Prelude'.Just new'Field}) (P'.wireGet 8)
             61 -> Prelude'.fmap (\ !new'Field -> old'Self{_fg_threshold = Prelude'.Just new'Field}) (P'.wireGet 2)
             69 -> Prelude'.fmap (\ !new'Field -> old'Self{_bg_threshold = Prelude'.Just new'Field}) (P'.wireGet 2)
             77 -> Prelude'.fmap (\ !new'Field -> old'Self{_fg_fraction = Prelude'.Just new'Field}) (P'.wireGet 2)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_context_pad = Prelude'.Just new'Field}) (P'.wireGet 13)
             90 -> Prelude'.fmap (\ !new'Field -> old'Self{_crop_mode = Prelude'.Just new'Field}) (P'.wireGet 9)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{_cache_images = Prelude'.Just new'Field}) (P'.wireGet 8)
             106 -> Prelude'.fmap (\ !new'Field -> old'Self{_root_folder = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> WindowDataParameter) WindowDataParameter where
  getVal m' f' = f' m'

instance P'.GPB WindowDataParameter

instance P'.ReflectDescriptor WindowDataParameter where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 21, 26, 32, 40, 48, 61, 69, 77, 80, 90, 96, 106])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.WindowDataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"WindowDataParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"WindowDataParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.source\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"source\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.scale\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"scale\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 21}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.mean_file\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"mean_file\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.batch_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"batch_size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.crop_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"crop_size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.mirror\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"mirror\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.fg_threshold\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"fg_threshold\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 61}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.5\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 2)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.bg_threshold\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"bg_threshold\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 69}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.5\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 2)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.fg_fraction\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"fg_fraction\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 77}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.25\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 4)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.context_pad\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"context_pad\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.crop_mode\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"crop_mode\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Just \"warp\", hsDefault = Just (HsDef'ByteString \"warp\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.cache_images\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"cache_images\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.WindowDataParameter.root_folder\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"WindowDataParameter\"], baseName' = FName \"root_folder\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Just \"\", hsDefault = Just (HsDef'ByteString \"\")}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType WindowDataParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg WindowDataParameter where
  textPut msg
   = do
       P'.tellT "source" (_source msg)
       P'.tellT "scale" (_scale msg)
       P'.tellT "mean_file" (_mean_file msg)
       P'.tellT "batch_size" (_batch_size msg)
       P'.tellT "crop_size" (_crop_size msg)
       P'.tellT "mirror" (_mirror msg)
       P'.tellT "fg_threshold" (_fg_threshold msg)
       P'.tellT "bg_threshold" (_bg_threshold msg)
       P'.tellT "fg_fraction" (_fg_fraction msg)
       P'.tellT "context_pad" (_context_pad msg)
       P'.tellT "crop_mode" (_crop_mode msg)
       P'.tellT "cache_images" (_cache_images msg)
       P'.tellT "root_folder" (_root_folder msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_source, parse'_scale, parse'_mean_file, parse'_batch_size, parse'_crop_size, parse'_mirror,
                   parse'_fg_threshold, parse'_bg_threshold, parse'_fg_fraction, parse'_context_pad, parse'_crop_mode,
                   parse'_cache_images, parse'_root_folder])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_source
         = P'.try
            (do
               v <- P'.getT "source"
               Prelude'.return (\ o -> o{_source = v}))
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
        parse'_batch_size
         = P'.try
            (do
               v <- P'.getT "batch_size"
               Prelude'.return (\ o -> o{_batch_size = v}))
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
        parse'_fg_threshold
         = P'.try
            (do
               v <- P'.getT "fg_threshold"
               Prelude'.return (\ o -> o{_fg_threshold = v}))
        parse'_bg_threshold
         = P'.try
            (do
               v <- P'.getT "bg_threshold"
               Prelude'.return (\ o -> o{_bg_threshold = v}))
        parse'_fg_fraction
         = P'.try
            (do
               v <- P'.getT "fg_fraction"
               Prelude'.return (\ o -> o{_fg_fraction = v}))
        parse'_context_pad
         = P'.try
            (do
               v <- P'.getT "context_pad"
               Prelude'.return (\ o -> o{_context_pad = v}))
        parse'_crop_mode
         = P'.try
            (do
               v <- P'.getT "crop_mode"
               Prelude'.return (\ o -> o{_crop_mode = v}))
        parse'_cache_images
         = P'.try
            (do
               v <- P'.getT "cache_images"
               Prelude'.return (\ o -> o{_cache_images = v}))
        parse'_root_folder
         = P'.try
            (do
               v <- P'.getT "root_folder"
               Prelude'.return (\ o -> o{_root_folder = v}))