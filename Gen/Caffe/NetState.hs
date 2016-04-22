{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.NetState (NetState(..), phase, level, stage) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.Phase as Caffe (Phase)

data NetState = NetState{_phase :: !(P'.Maybe Caffe.Phase), _level :: !(P'.Maybe P'.Int32), _stage :: !(P'.Seq P'.Utf8)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''NetState

instance P'.Mergeable NetState where
  mergeAppend (NetState x'1 x'2 x'3) (NetState y'1 y'2 y'3)
   = NetState (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default NetState where
  defaultValue = NetState (Prelude'.Just (Prelude'.read "TEST")) (Prelude'.Just 0) P'.defaultValue

instance P'.Wire NetState where
  wireSize ft' self'@(NetState x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 5 x'2 + P'.wireSizeRep 1 9 x'3)
  wirePut ft' self'@(NetState x'1 x'2 x'3)
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
             P'.wirePutRep 26 9 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_phase = Prelude'.Just new'Field}) (P'.wireGet 14)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_level = Prelude'.Just new'Field}) (P'.wireGet 5)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_stage = P'.append (_stage old'Self) new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> NetState) NetState where
  getVal m' f' = f' m'

instance P'.GPB NetState

instance P'.ReflectDescriptor NetState where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.NetState\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetState\"}, descFilePath = [\"Gen\",\"Caffe\",\"NetState.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetState.phase\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetState\"], baseName' = FName \"phase\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.Phase\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"Phase\"}), hsRawDefault = Just \"TEST\", hsDefault = Just (HsDef'Enum \"TEST\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetState.level\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetState\"], baseName' = FName \"level\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetState.stage\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetState\"], baseName' = FName \"stage\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType NetState where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg NetState where
  textPut msg
   = do
       P'.tellT "phase" (_phase msg)
       P'.tellT "level" (_level msg)
       P'.tellT "stage" (_stage msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_phase, parse'_level, parse'_stage]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_phase
         = P'.try
            (do
               v <- P'.getT "phase"
               Prelude'.return (\ o -> o{_phase = v}))
        parse'_level
         = P'.try
            (do
               v <- P'.getT "level"
               Prelude'.return (\ o -> o{_level = v}))
        parse'_stage
         = P'.try
            (do
               v <- P'.getT "stage"
               Prelude'.return (\ o -> o{_stage = P'.append (_stage o) v}))