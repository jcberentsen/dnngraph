{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.BlobProtoVector (BlobProtoVector(..), blobs) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.BlobProto as Caffe (BlobProto)

data BlobProtoVector = BlobProtoVector{_blobs :: !(P'.Seq Caffe.BlobProto)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''BlobProtoVector

instance P'.Mergeable BlobProtoVector where
  mergeAppend (BlobProtoVector x'1) (BlobProtoVector y'1) = BlobProtoVector (P'.mergeAppend x'1 y'1)

instance P'.Default BlobProtoVector where
  defaultValue = BlobProtoVector P'.defaultValue

instance P'.Wire BlobProtoVector where
  wireSize ft' self'@(BlobProtoVector x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1)
  wirePut ft' self'@(BlobProtoVector x'1)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutRep 10 11 x'1
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_blobs = P'.append (_blobs old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> BlobProtoVector) BlobProtoVector where
  getVal m' f' = f' m'

instance P'.GPB BlobProtoVector

instance P'.ReflectDescriptor BlobProtoVector where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.BlobProtoVector\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"BlobProtoVector\"}, descFilePath = [\"Gen\",\"Caffe\",\"BlobProtoVector.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.BlobProtoVector.blobs\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"BlobProtoVector\"], baseName' = FName \"blobs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.BlobProto\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"BlobProto\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType BlobProtoVector where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg BlobProtoVector where
  textPut msg
   = do
       P'.tellT "blobs" (_blobs msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_blobs]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_blobs
         = P'.try
            (do
               v <- P'.getT "blobs"
               Prelude'.return (\ o -> o{_blobs = P'.append (_blobs o) v}))