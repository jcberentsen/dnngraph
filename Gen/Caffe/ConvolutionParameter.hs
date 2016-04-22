{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.ConvolutionParameter
       (ConvolutionParameter(..), num_input, num_output, bias_term, pad, pad_h, pad_w, kernel_size, kernel_h, kernel_w, group,
        stride, stride_h, stride_w, weight_filler, bias_filler, engine)
       where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.ConvolutionParameter.Engine as Caffe.ConvolutionParameter (Engine)
import qualified Gen.Caffe.FillerParameter as Caffe (FillerParameter)

data ConvolutionParameter = ConvolutionParameter{_num_input :: !(P'.Maybe P'.Word32), _num_output :: !(P'.Maybe P'.Word32),
                                                 _bias_term :: !(P'.Maybe P'.Bool), _pad :: !(P'.Maybe P'.Word32),
                                                 _pad_h :: !(P'.Maybe P'.Word32), _pad_w :: !(P'.Maybe P'.Word32),
                                                 _kernel_size :: !(P'.Maybe P'.Word32), _kernel_h :: !(P'.Maybe P'.Word32),
                                                 _kernel_w :: !(P'.Maybe P'.Word32), _group :: !(P'.Maybe P'.Word32),
                                                 _stride :: !(P'.Maybe P'.Word32), _stride_h :: !(P'.Maybe P'.Word32),
                                                 _stride_w :: !(P'.Maybe P'.Word32),
                                                 _weight_filler :: !(P'.Maybe Caffe.FillerParameter),
                                                 _bias_filler :: !(P'.Maybe Caffe.FillerParameter),
                                                 _engine :: !(P'.Maybe Caffe.ConvolutionParameter.Engine)}
                          deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''ConvolutionParameter

instance P'.Mergeable ConvolutionParameter where
  mergeAppend (ConvolutionParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16)
   (ConvolutionParameter y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16)
   = ConvolutionParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)
      (P'.mergeAppend x'13 y'13)
      (P'.mergeAppend x'14 y'14)
      (P'.mergeAppend x'15 y'15)
      (P'.mergeAppend x'16 y'16)

instance P'.Default ConvolutionParameter where
  defaultValue
   = ConvolutionParameter P'.defaultValue P'.defaultValue (Prelude'.Just Prelude'.True) (Prelude'.Just 0) (Prelude'.Just 0)
      (Prelude'.Just 0)
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      (Prelude'.Just 1)
      (Prelude'.Just 1)
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      (Prelude'.Just (Prelude'.read "DEFAULT"))

instance P'.Wire ConvolutionParameter where
  wireSize ft' self'@(ConvolutionParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 2 13 x'1 + P'.wireSizeOpt 1 13 x'2 + P'.wireSizeOpt 1 8 x'3 + P'.wireSizeOpt 1 13 x'4 +
             P'.wireSizeOpt 1 13 x'5
             + P'.wireSizeOpt 1 13 x'6
             + P'.wireSizeOpt 1 13 x'7
             + P'.wireSizeOpt 1 13 x'8
             + P'.wireSizeOpt 1 13 x'9
             + P'.wireSizeOpt 1 13 x'10
             + P'.wireSizeOpt 1 13 x'11
             + P'.wireSizeOpt 1 13 x'12
             + P'.wireSizeOpt 1 13 x'13
             + P'.wireSizeOpt 1 11 x'14
             + P'.wireSizeOpt 1 11 x'15
             + P'.wireSizeOpt 1 14 x'16)
  wirePut ft' self'@(ConvolutionParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 13 x'2
             P'.wirePutOpt 16 8 x'3
             P'.wirePutOpt 24 13 x'4
             P'.wirePutOpt 32 13 x'7
             P'.wirePutOpt 40 13 x'10
             P'.wirePutOpt 48 13 x'11
             P'.wirePutOpt 58 11 x'14
             P'.wirePutOpt 66 11 x'15
             P'.wirePutOpt 72 13 x'5
             P'.wirePutOpt 80 13 x'6
             P'.wirePutOpt 88 13 x'8
             P'.wirePutOpt 96 13 x'9
             P'.wirePutOpt 104 13 x'12
             P'.wirePutOpt 112 13 x'13
             P'.wirePutOpt 120 14 x'16
             P'.wirePutOpt 800 13 x'1
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             800 -> Prelude'.fmap (\ !new'Field -> old'Self{_num_input = Prelude'.Just new'Field}) (P'.wireGet 13)
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_num_output = Prelude'.Just new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_bias_term = Prelude'.Just new'Field}) (P'.wireGet 8)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_pad = Prelude'.Just new'Field}) (P'.wireGet 13)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{_pad_h = Prelude'.Just new'Field}) (P'.wireGet 13)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_pad_w = Prelude'.Just new'Field}) (P'.wireGet 13)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_kernel_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{_kernel_h = Prelude'.Just new'Field}) (P'.wireGet 13)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{_kernel_w = Prelude'.Just new'Field}) (P'.wireGet 13)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_group = Prelude'.Just new'Field}) (P'.wireGet 13)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_stride = Prelude'.Just new'Field}) (P'.wireGet 13)
             104 -> Prelude'.fmap (\ !new'Field -> old'Self{_stride_h = Prelude'.Just new'Field}) (P'.wireGet 13)
             112 -> Prelude'.fmap (\ !new'Field -> old'Self{_stride_w = Prelude'.Just new'Field}) (P'.wireGet 13)
             58 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_weight_filler = P'.mergeAppend (_weight_filler old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_bias_filler = P'.mergeAppend (_bias_filler old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{_engine = Prelude'.Just new'Field}) (P'.wireGet 14)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ConvolutionParameter) ConvolutionParameter where
  getVal m' f' = f' m'

instance P'.GPB ConvolutionParameter

instance P'.ReflectDescriptor ConvolutionParameter where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList [8, 16, 24, 32, 40, 48, 58, 66, 72, 80, 88, 96, 104, 112, 120, 800])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.ConvolutionParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ConvolutionParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"ConvolutionParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.num_input\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"num_input\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 100}, wireTag = WireTag {getWireTag = 800}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.num_output\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"num_output\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.bias_term\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"bias_term\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.pad\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"pad\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.pad_h\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"pad_h\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.pad_w\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"pad_w\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.kernel_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"kernel_size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.kernel_h\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"kernel_h\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.kernel_w\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"kernel_w\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.group\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"group\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.stride\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"stride\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.stride_h\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"stride_h\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.stride_w\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"stride_w\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 112}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.weight_filler\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"weight_filler\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.bias_filler\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"bias_filler\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.engine\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"engine\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ConvolutionParameter.Engine\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName = MName \"Engine\"}), hsRawDefault = Just \"DEFAULT\", hsDefault = Just (HsDef'Enum \"DEFAULT\")}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType ConvolutionParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ConvolutionParameter where
  textPut msg
   = do
       P'.tellT "num_input" (_num_input msg)
       P'.tellT "num_output" (_num_output msg)
       P'.tellT "bias_term" (_bias_term msg)
       P'.tellT "pad" (_pad msg)
       P'.tellT "pad_h" (_pad_h msg)
       P'.tellT "pad_w" (_pad_w msg)
       P'.tellT "kernel_size" (_kernel_size msg)
       P'.tellT "kernel_h" (_kernel_h msg)
       P'.tellT "kernel_w" (_kernel_w msg)
       P'.tellT "group" (_group msg)
       P'.tellT "stride" (_stride msg)
       P'.tellT "stride_h" (_stride_h msg)
       P'.tellT "stride_w" (_stride_w msg)
       P'.tellT "weight_filler" (_weight_filler msg)
       P'.tellT "bias_filler" (_bias_filler msg)
       P'.tellT "engine" (_engine msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_num_input, parse'_num_output, parse'_bias_term, parse'_pad, parse'_pad_h, parse'_pad_w,
                   parse'_kernel_size, parse'_kernel_h, parse'_kernel_w, parse'_group, parse'_stride, parse'_stride_h,
                   parse'_stride_w, parse'_weight_filler, parse'_bias_filler, parse'_engine])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_num_input
         = P'.try
            (do
               v <- P'.getT "num_input"
               Prelude'.return (\ o -> o{_num_input = v}))
        parse'_num_output
         = P'.try
            (do
               v <- P'.getT "num_output"
               Prelude'.return (\ o -> o{_num_output = v}))
        parse'_bias_term
         = P'.try
            (do
               v <- P'.getT "bias_term"
               Prelude'.return (\ o -> o{_bias_term = v}))
        parse'_pad
         = P'.try
            (do
               v <- P'.getT "pad"
               Prelude'.return (\ o -> o{_pad = v}))
        parse'_pad_h
         = P'.try
            (do
               v <- P'.getT "pad_h"
               Prelude'.return (\ o -> o{_pad_h = v}))
        parse'_pad_w
         = P'.try
            (do
               v <- P'.getT "pad_w"
               Prelude'.return (\ o -> o{_pad_w = v}))
        parse'_kernel_size
         = P'.try
            (do
               v <- P'.getT "kernel_size"
               Prelude'.return (\ o -> o{_kernel_size = v}))
        parse'_kernel_h
         = P'.try
            (do
               v <- P'.getT "kernel_h"
               Prelude'.return (\ o -> o{_kernel_h = v}))
        parse'_kernel_w
         = P'.try
            (do
               v <- P'.getT "kernel_w"
               Prelude'.return (\ o -> o{_kernel_w = v}))
        parse'_group
         = P'.try
            (do
               v <- P'.getT "group"
               Prelude'.return (\ o -> o{_group = v}))
        parse'_stride
         = P'.try
            (do
               v <- P'.getT "stride"
               Prelude'.return (\ o -> o{_stride = v}))
        parse'_stride_h
         = P'.try
            (do
               v <- P'.getT "stride_h"
               Prelude'.return (\ o -> o{_stride_h = v}))
        parse'_stride_w
         = P'.try
            (do
               v <- P'.getT "stride_w"
               Prelude'.return (\ o -> o{_stride_w = v}))
        parse'_weight_filler
         = P'.try
            (do
               v <- P'.getT "weight_filler"
               Prelude'.return (\ o -> o{_weight_filler = v}))
        parse'_bias_filler
         = P'.try
            (do
               v <- P'.getT "bias_filler"
               Prelude'.return (\ o -> o{_bias_filler = v}))
        parse'_engine
         = P'.try
            (do
               v <- P'.getT "engine"
               Prelude'.return (\ o -> o{_engine = v}))