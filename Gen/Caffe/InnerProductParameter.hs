{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.InnerProductParameter (InnerProductParameter(..), num_input, num_output, bias_term, weight_filler, bias_filler)
       where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.FillerParameter as Caffe (FillerParameter)

data InnerProductParameter = InnerProductParameter{_num_input :: !(P'.Maybe P'.Word32), _num_output :: !(P'.Maybe P'.Word32),
                                                   _bias_term :: !(P'.Maybe P'.Bool),
                                                   _weight_filler :: !(P'.Maybe Caffe.FillerParameter),
                                                   _bias_filler :: !(P'.Maybe Caffe.FillerParameter)}
                           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''InnerProductParameter

instance P'.Mergeable InnerProductParameter where
  mergeAppend (InnerProductParameter x'1 x'2 x'3 x'4 x'5) (InnerProductParameter y'1 y'2 y'3 y'4 y'5)
   = InnerProductParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default InnerProductParameter where
  defaultValue = InnerProductParameter P'.defaultValue P'.defaultValue (Prelude'.Just Prelude'.True) P'.defaultValue P'.defaultValue

instance P'.Wire InnerProductParameter where
  wireSize ft' self'@(InnerProductParameter x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 2 13 x'1 + P'.wireSizeOpt 1 13 x'2 + P'.wireSizeOpt 1 8 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5)
  wirePut ft' self'@(InnerProductParameter x'1 x'2 x'3 x'4 x'5)
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
             P'.wirePutOpt 26 11 x'4
             P'.wirePutOpt 34 11 x'5
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
             26 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_weight_filler = P'.mergeAppend (_weight_filler old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_bias_filler = P'.mergeAppend (_bias_filler old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> InnerProductParameter) InnerProductParameter where
  getVal m' f' = f' m'

instance P'.GPB InnerProductParameter

instance P'.ReflectDescriptor InnerProductParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 26, 34, 800])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.InnerProductParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"InnerProductParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"InnerProductParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.InnerProductParameter.num_input\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"InnerProductParameter\"], baseName' = FName \"num_input\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 100}, wireTag = WireTag {getWireTag = 800}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.InnerProductParameter.num_output\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"InnerProductParameter\"], baseName' = FName \"num_output\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.InnerProductParameter.bias_term\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"InnerProductParameter\"], baseName' = FName \"bias_term\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.InnerProductParameter.weight_filler\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"InnerProductParameter\"], baseName' = FName \"weight_filler\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.InnerProductParameter.bias_filler\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"InnerProductParameter\"], baseName' = FName \"bias_filler\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType InnerProductParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg InnerProductParameter where
  textPut msg
   = do
       P'.tellT "num_input" (_num_input msg)
       P'.tellT "num_output" (_num_output msg)
       P'.tellT "bias_term" (_bias_term msg)
       P'.tellT "weight_filler" (_weight_filler msg)
       P'.tellT "bias_filler" (_bias_filler msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice [parse'_num_input, parse'_num_output, parse'_bias_term, parse'_weight_filler, parse'_bias_filler])
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