{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.ArgMaxParameter (ArgMaxParameter(..), out_max_val, top_k) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data ArgMaxParameter = ArgMaxParameter{_out_max_val :: !(P'.Maybe P'.Bool), _top_k :: !(P'.Maybe P'.Word32)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''ArgMaxParameter

instance P'.Mergeable ArgMaxParameter where
  mergeAppend (ArgMaxParameter x'1 x'2) (ArgMaxParameter y'1 y'2)
   = ArgMaxParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default ArgMaxParameter where
  defaultValue = ArgMaxParameter (Prelude'.Just Prelude'.False) (Prelude'.Just 1)

instance P'.Wire ArgMaxParameter where
  wireSize ft' self'@(ArgMaxParameter x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 8 x'1 + P'.wireSizeOpt 1 13 x'2)
  wirePut ft' self'@(ArgMaxParameter x'1 x'2)
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
             P'.wirePutOpt 16 13 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_out_max_val = Prelude'.Just new'Field}) (P'.wireGet 8)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_top_k = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ArgMaxParameter) ArgMaxParameter where
  getVal m' f' = f' m'

instance P'.GPB ArgMaxParameter

instance P'.ReflectDescriptor ArgMaxParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.ArgMaxParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ArgMaxParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"ArgMaxParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ArgMaxParameter.out_max_val\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ArgMaxParameter\"], baseName' = FName \"out_max_val\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ArgMaxParameter.top_k\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ArgMaxParameter\"], baseName' = FName \"top_k\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType ArgMaxParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ArgMaxParameter where
  textPut msg
   = do
       P'.tellT "out_max_val" (_out_max_val msg)
       P'.tellT "top_k" (_top_k msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_out_max_val, parse'_top_k]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_out_max_val
         = P'.try
            (do
               v <- P'.getT "out_max_val"
               Prelude'.return (\ o -> o{_out_max_val = v}))
        parse'_top_k
         = P'.try
            (do
               v <- P'.getT "top_k"
               Prelude'.return (\ o -> o{_top_k = v}))