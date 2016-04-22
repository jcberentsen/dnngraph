{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.TransformationParameter (TransformationParameter(..), scale, mirror, crop_size, mean_file, mean_value) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data TransformationParameter = TransformationParameter{_scale :: !(P'.Maybe P'.Float), _mirror :: !(P'.Maybe P'.Bool),
                                                       _crop_size :: !(P'.Maybe P'.Word32), _mean_file :: !(P'.Maybe P'.Utf8),
                                                       _mean_value :: !(P'.Seq P'.Float)}
                             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''TransformationParameter

instance P'.Mergeable TransformationParameter where
  mergeAppend (TransformationParameter x'1 x'2 x'3 x'4 x'5) (TransformationParameter y'1 y'2 y'3 y'4 y'5)
   = TransformationParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default TransformationParameter where
  defaultValue
   = TransformationParameter (Prelude'.Just 1.0) (Prelude'.Just Prelude'.False) (Prelude'.Just 0) P'.defaultValue P'.defaultValue

instance P'.Wire TransformationParameter where
  wireSize ft' self'@(TransformationParameter x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 2 x'1 + P'.wireSizeOpt 1 8 x'2 + P'.wireSizeOpt 1 13 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeRep 1 2 x'5)
  wirePut ft' self'@(TransformationParameter x'1 x'2 x'3 x'4 x'5)
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
             P'.wirePutOpt 16 8 x'2
             P'.wirePutOpt 24 13 x'3
             P'.wirePutOpt 34 9 x'4
             P'.wirePutRep 45 2 x'5
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             13 -> Prelude'.fmap (\ !new'Field -> old'Self{_scale = Prelude'.Just new'Field}) (P'.wireGet 2)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_mirror = Prelude'.Just new'Field}) (P'.wireGet 8)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_crop_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_mean_file = Prelude'.Just new'Field}) (P'.wireGet 9)
             45 -> Prelude'.fmap (\ !new'Field -> old'Self{_mean_value = P'.append (_mean_value old'Self) new'Field}) (P'.wireGet 2)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_mean_value = P'.mergeAppend (_mean_value old'Self) new'Field})
                    (P'.wireGetPacked 2)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TransformationParameter) TransformationParameter where
  getVal m' f' = f' m'

instance P'.GPB TransformationParameter

instance P'.ReflectDescriptor TransformationParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [13, 16, 24, 34, 42, 45])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.TransformationParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"TransformationParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"TransformationParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.TransformationParameter.scale\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"TransformationParameter\"], baseName' = FName \"scale\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 13}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.TransformationParameter.mirror\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"TransformationParameter\"], baseName' = FName \"mirror\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.TransformationParameter.crop_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"TransformationParameter\"], baseName' = FName \"crop_size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.TransformationParameter.mean_file\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"TransformationParameter\"], baseName' = FName \"mean_file\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.TransformationParameter.mean_value\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"TransformationParameter\"], baseName' = FName \"mean_value\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 45}, packedTag = Just (WireTag {getWireTag = 45},WireTag {getWireTag = 42}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType TransformationParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TransformationParameter where
  textPut msg
   = do
       P'.tellT "scale" (_scale msg)
       P'.tellT "mirror" (_mirror msg)
       P'.tellT "crop_size" (_crop_size msg)
       P'.tellT "mean_file" (_mean_file msg)
       P'.tellT "mean_value" (_mean_value msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_scale, parse'_mirror, parse'_crop_size, parse'_mean_file, parse'_mean_value])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_scale
         = P'.try
            (do
               v <- P'.getT "scale"
               Prelude'.return (\ o -> o{_scale = v}))
        parse'_mirror
         = P'.try
            (do
               v <- P'.getT "mirror"
               Prelude'.return (\ o -> o{_mirror = v}))
        parse'_crop_size
         = P'.try
            (do
               v <- P'.getT "crop_size"
               Prelude'.return (\ o -> o{_crop_size = v}))
        parse'_mean_file
         = P'.try
            (do
               v <- P'.getT "mean_file"
               Prelude'.return (\ o -> o{_mean_file = v}))
        parse'_mean_value
         = P'.try
            (do
               v <- P'.getT "mean_value"
               Prelude'.return (\ o -> o{_mean_value = P'.append (_mean_value o) v}))