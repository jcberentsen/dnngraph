{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.AccuracyParameter (AccuracyParameter(..), top_k) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data AccuracyParameter = AccuracyParameter{_top_k :: !(P'.Maybe P'.Word32)}
                       deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''AccuracyParameter

instance P'.Mergeable AccuracyParameter where
  mergeAppend (AccuracyParameter x'1) (AccuracyParameter y'1) = AccuracyParameter (P'.mergeAppend x'1 y'1)

instance P'.Default AccuracyParameter where
  defaultValue = AccuracyParameter (Prelude'.Just 1)

instance P'.Wire AccuracyParameter where
  wireSize ft' self'@(AccuracyParameter x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 13 x'1)
  wirePut ft' self'@(AccuracyParameter x'1)
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
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_top_k = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> AccuracyParameter) AccuracyParameter where
  getVal m' f' = f' m'

instance P'.GPB AccuracyParameter

instance P'.ReflectDescriptor AccuracyParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.AccuracyParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"AccuracyParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"AccuracyParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.AccuracyParameter.top_k\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"AccuracyParameter\"], baseName' = FName \"top_k\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType AccuracyParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg AccuracyParameter where
  textPut msg
   = do
       P'.tellT "top_k" (_top_k msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_top_k]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_top_k
         = P'.try
            (do
               v <- P'.getT "top_k"
               Prelude'.return (\ o -> o{_top_k = v}))