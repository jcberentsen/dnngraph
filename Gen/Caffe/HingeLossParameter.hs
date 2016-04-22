{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.HingeLossParameter (HingeLossParameter(..), norm) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.HingeLossParameter.Norm as Caffe.HingeLossParameter (Norm)

data HingeLossParameter = HingeLossParameter{_norm :: !(P'.Maybe Caffe.HingeLossParameter.Norm)}
                        deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''HingeLossParameter

instance P'.Mergeable HingeLossParameter where
  mergeAppend (HingeLossParameter x'1) (HingeLossParameter y'1) = HingeLossParameter (P'.mergeAppend x'1 y'1)

instance P'.Default HingeLossParameter where
  defaultValue = HingeLossParameter (Prelude'.Just (Prelude'.read "L1"))

instance P'.Wire HingeLossParameter where
  wireSize ft' self'@(HingeLossParameter x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1)
  wirePut ft' self'@(HingeLossParameter x'1)
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
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_norm = Prelude'.Just new'Field}) (P'.wireGet 14)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> HingeLossParameter) HingeLossParameter where
  getVal m' f' = f' m'

instance P'.GPB HingeLossParameter

instance P'.ReflectDescriptor HingeLossParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.HingeLossParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"HingeLossParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"HingeLossParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.HingeLossParameter.norm\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"HingeLossParameter\"], baseName' = FName \"norm\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.HingeLossParameter.Norm\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"HingeLossParameter\"], baseName = MName \"Norm\"}), hsRawDefault = Just \"L1\", hsDefault = Just (HsDef'Enum \"L1\")}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType HingeLossParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg HingeLossParameter where
  textPut msg
   = do
       P'.tellT "norm" (_norm msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_norm]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_norm
         = P'.try
            (do
               v <- P'.getT "norm"
               Prelude'.return (\ o -> o{_norm = v}))