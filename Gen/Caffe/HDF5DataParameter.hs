{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.HDF5DataParameter (HDF5DataParameter(..), source, batch_size) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data HDF5DataParameter = HDF5DataParameter{_source :: !(P'.Maybe P'.Utf8), _batch_size :: !(P'.Maybe P'.Word32)}
                       deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''HDF5DataParameter

instance P'.Mergeable HDF5DataParameter where
  mergeAppend (HDF5DataParameter x'1 x'2) (HDF5DataParameter y'1 y'2)
   = HDF5DataParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default HDF5DataParameter where
  defaultValue = HDF5DataParameter P'.defaultValue P'.defaultValue

instance P'.Wire HDF5DataParameter where
  wireSize ft' self'@(HDF5DataParameter x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 13 x'2)
  wirePut ft' self'@(HDF5DataParameter x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 9 x'1
             P'.wirePutOpt 16 13 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_source = Prelude'.Just new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_batch_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> HDF5DataParameter) HDF5DataParameter where
  getVal m' f' = f' m'

instance P'.GPB HDF5DataParameter

instance P'.ReflectDescriptor HDF5DataParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.HDF5DataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"HDF5DataParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"HDF5DataParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.HDF5DataParameter.source\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"HDF5DataParameter\"], baseName' = FName \"source\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.HDF5DataParameter.batch_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"HDF5DataParameter\"], baseName' = FName \"batch_size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType HDF5DataParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg HDF5DataParameter where
  textPut msg
   = do
       P'.tellT "source" (_source msg)
       P'.tellT "batch_size" (_batch_size msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_source, parse'_batch_size]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_source
         = P'.try
            (do
               v <- P'.getT "source"
               Prelude'.return (\ o -> o{_source = v}))
        parse'_batch_size
         = P'.try
            (do
               v <- P'.getT "batch_size"
               Prelude'.return (\ o -> o{_batch_size = v}))