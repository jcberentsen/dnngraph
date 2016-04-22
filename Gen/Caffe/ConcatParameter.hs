{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.ConcatParameter (ConcatParameter(..), concat_dim) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data ConcatParameter = ConcatParameter{_concat_dim :: !(P'.Maybe P'.Word32)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''ConcatParameter

instance P'.Mergeable ConcatParameter where
  mergeAppend (ConcatParameter x'1) (ConcatParameter y'1) = ConcatParameter (P'.mergeAppend x'1 y'1)

instance P'.Default ConcatParameter where
  defaultValue = ConcatParameter (Prelude'.Just 1)

instance P'.Wire ConcatParameter where
  wireSize ft' self'@(ConcatParameter x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 13 x'1)
  wirePut ft' self'@(ConcatParameter x'1)
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_concat_dim = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ConcatParameter) ConcatParameter where
  getVal m' f' = f' m'

instance P'.GPB ConcatParameter

instance P'.ReflectDescriptor ConcatParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.ConcatParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ConcatParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"ConcatParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConcatParameter.concat_dim\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConcatParameter\"], baseName' = FName \"concat_dim\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType ConcatParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ConcatParameter where
  textPut msg
   = do
       P'.tellT "concat_dim" (_concat_dim msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_concat_dim]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_concat_dim
         = P'.try
            (do
               v <- P'.getT "concat_dim"
               Prelude'.return (\ o -> o{_concat_dim = v}))