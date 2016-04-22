{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.LossParameter (LossParameter(..), ignore_label, normalize) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data LossParameter = LossParameter{_ignore_label :: !(P'.Maybe P'.Int32), _normalize :: !(P'.Maybe P'.Bool)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''LossParameter

instance P'.Mergeable LossParameter where
  mergeAppend (LossParameter x'1 x'2) (LossParameter y'1 y'2) = LossParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default LossParameter where
  defaultValue = LossParameter P'.defaultValue (Prelude'.Just Prelude'.True)

instance P'.Wire LossParameter where
  wireSize ft' self'@(LossParameter x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 5 x'1 + P'.wireSizeOpt 1 8 x'2)
  wirePut ft' self'@(LossParameter x'1 x'2)
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
             P'.wirePutOpt 16 8 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_ignore_label = Prelude'.Just new'Field}) (P'.wireGet 5)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_normalize = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> LossParameter) LossParameter where
  getVal m' f' = f' m'

instance P'.GPB LossParameter

instance P'.ReflectDescriptor LossParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.LossParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"LossParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"LossParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LossParameter.ignore_label\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LossParameter\"], baseName' = FName \"ignore_label\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LossParameter.normalize\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LossParameter\"], baseName' = FName \"normalize\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType LossParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg LossParameter where
  textPut msg
   = do
       P'.tellT "ignore_label" (_ignore_label msg)
       P'.tellT "normalize" (_normalize msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_ignore_label, parse'_normalize]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_ignore_label
         = P'.try
            (do
               v <- P'.getT "ignore_label"
               Prelude'.return (\ o -> o{_ignore_label = v}))
        parse'_normalize
         = P'.try
            (do
               v <- P'.getT "normalize"
               Prelude'.return (\ o -> o{_normalize = v}))