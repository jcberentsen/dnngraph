{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.SliceParameter (SliceParameter(..), slice_dim, slice_point) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data SliceParameter = SliceParameter{_slice_dim :: !(P'.Maybe P'.Word32), _slice_point :: !(P'.Seq P'.Word32)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''SliceParameter

instance P'.Mergeable SliceParameter where
  mergeAppend (SliceParameter x'1 x'2) (SliceParameter y'1 y'2) = SliceParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default SliceParameter where
  defaultValue = SliceParameter (Prelude'.Just 1) P'.defaultValue

instance P'.Wire SliceParameter where
  wireSize ft' self'@(SliceParameter x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 13 x'1 + P'.wireSizeRep 1 13 x'2)
  wirePut ft' self'@(SliceParameter x'1 x'2)
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
             P'.wirePutRep 16 13 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_slice_dim = Prelude'.Just new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_slice_point = P'.append (_slice_point old'Self) new'Field})
                    (P'.wireGet 13)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_slice_point = P'.mergeAppend (_slice_point old'Self) new'Field})
                    (P'.wireGetPacked 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> SliceParameter) SliceParameter where
  getVal m' f' = f' m'

instance P'.GPB SliceParameter

instance P'.ReflectDescriptor SliceParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.SliceParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SliceParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"SliceParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SliceParameter.slice_dim\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SliceParameter\"], baseName' = FName \"slice_dim\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SliceParameter.slice_point\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SliceParameter\"], baseName' = FName \"slice_point\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Just (WireTag {getWireTag = 16},WireTag {getWireTag = 18}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType SliceParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg SliceParameter where
  textPut msg
   = do
       P'.tellT "slice_dim" (_slice_dim msg)
       P'.tellT "slice_point" (_slice_point msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_slice_dim, parse'_slice_point]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_slice_dim
         = P'.try
            (do
               v <- P'.getT "slice_dim"
               Prelude'.return (\ o -> o{_slice_dim = v}))
        parse'_slice_point
         = P'.try
            (do
               v <- P'.getT "slice_point"
               Prelude'.return (\ o -> o{_slice_point = P'.append (_slice_point o) v}))