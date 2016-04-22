{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.MVNParameter (MVNParameter(..), normalize_variance, across_channels) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data MVNParameter = MVNParameter{_normalize_variance :: !(P'.Maybe P'.Bool), _across_channels :: !(P'.Maybe P'.Bool)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''MVNParameter

instance P'.Mergeable MVNParameter where
  mergeAppend (MVNParameter x'1 x'2) (MVNParameter y'1 y'2) = MVNParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default MVNParameter where
  defaultValue = MVNParameter (Prelude'.Just Prelude'.True) (Prelude'.Just Prelude'.False)

instance P'.Wire MVNParameter where
  wireSize ft' self'@(MVNParameter x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 8 x'1 + P'.wireSizeOpt 1 8 x'2)
  wirePut ft' self'@(MVNParameter x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 8 x'1
             P'.wirePutOpt 16 8 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_normalize_variance = Prelude'.Just new'Field}) (P'.wireGet 8)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_across_channels = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> MVNParameter) MVNParameter where
  getVal m' f' = f' m'

instance P'.GPB MVNParameter

instance P'.ReflectDescriptor MVNParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.MVNParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"MVNParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"MVNParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.MVNParameter.normalize_variance\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"MVNParameter\"], baseName' = FName \"normalize_variance\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.MVNParameter.across_channels\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"MVNParameter\"], baseName' = FName \"across_channels\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType MVNParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg MVNParameter where
  textPut msg
   = do
       P'.tellT "normalize_variance" (_normalize_variance msg)
       P'.tellT "across_channels" (_across_channels msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_normalize_variance, parse'_across_channels]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_normalize_variance
         = P'.try
            (do
               v <- P'.getT "normalize_variance"
               Prelude'.return (\ o -> o{_normalize_variance = v}))
        parse'_across_channels
         = P'.try
            (do
               v <- P'.getT "across_channels"
               Prelude'.return (\ o -> o{_across_channels = v}))