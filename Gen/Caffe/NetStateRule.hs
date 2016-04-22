{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.NetStateRule (NetStateRule(..), phase, min_level, max_level, stage, not_stage) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.Phase as Caffe (Phase)

data NetStateRule = NetStateRule{_phase :: !(P'.Maybe Caffe.Phase), _min_level :: !(P'.Maybe P'.Int32),
                                 _max_level :: !(P'.Maybe P'.Int32), _stage :: !(P'.Seq P'.Utf8), _not_stage :: !(P'.Seq P'.Utf8)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''NetStateRule

instance P'.Mergeable NetStateRule where
  mergeAppend (NetStateRule x'1 x'2 x'3 x'4 x'5) (NetStateRule y'1 y'2 y'3 y'4 y'5)
   = NetStateRule (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default NetStateRule where
  defaultValue = NetStateRule P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire NetStateRule where
  wireSize ft' self'@(NetStateRule x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 5 x'2 + P'.wireSizeOpt 1 5 x'3 + P'.wireSizeRep 1 9 x'4 +
             P'.wireSizeRep 1 9 x'5)
  wirePut ft' self'@(NetStateRule x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 14 x'1
             P'.wirePutOpt 16 5 x'2
             P'.wirePutOpt 24 5 x'3
             P'.wirePutRep 34 9 x'4
             P'.wirePutRep 42 9 x'5
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_phase = Prelude'.Just new'Field}) (P'.wireGet 14)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_min_level = Prelude'.Just new'Field}) (P'.wireGet 5)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_max_level = Prelude'.Just new'Field}) (P'.wireGet 5)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_stage = P'.append (_stage old'Self) new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_not_stage = P'.append (_not_stage old'Self) new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> NetStateRule) NetStateRule where
  getVal m' f' = f' m'

instance P'.GPB NetStateRule

instance P'.ReflectDescriptor NetStateRule where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 24, 34, 42])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.NetStateRule\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetStateRule\"}, descFilePath = [\"Gen\",\"Caffe\",\"NetStateRule.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetStateRule.phase\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetStateRule\"], baseName' = FName \"phase\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.Phase\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"Phase\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetStateRule.min_level\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetStateRule\"], baseName' = FName \"min_level\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetStateRule.max_level\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetStateRule\"], baseName' = FName \"max_level\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetStateRule.stage\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetStateRule\"], baseName' = FName \"stage\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetStateRule.not_stage\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetStateRule\"], baseName' = FName \"not_stage\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType NetStateRule where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg NetStateRule where
  textPut msg
   = do
       P'.tellT "phase" (_phase msg)
       P'.tellT "min_level" (_min_level msg)
       P'.tellT "max_level" (_max_level msg)
       P'.tellT "stage" (_stage msg)
       P'.tellT "not_stage" (_not_stage msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_phase, parse'_min_level, parse'_max_level, parse'_stage, parse'_not_stage]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_phase
         = P'.try
            (do
               v <- P'.getT "phase"
               Prelude'.return (\ o -> o{_phase = v}))
        parse'_min_level
         = P'.try
            (do
               v <- P'.getT "min_level"
               Prelude'.return (\ o -> o{_min_level = v}))
        parse'_max_level
         = P'.try
            (do
               v <- P'.getT "max_level"
               Prelude'.return (\ o -> o{_max_level = v}))
        parse'_stage
         = P'.try
            (do
               v <- P'.getT "stage"
               Prelude'.return (\ o -> o{_stage = P'.append (_stage o) v}))
        parse'_not_stage
         = P'.try
            (do
               v <- P'.getT "not_stage"
               Prelude'.return (\ o -> o{_not_stage = P'.append (_not_stage o) v}))