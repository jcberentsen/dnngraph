{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.ContrastiveLossParameter (ContrastiveLossParameter(..), margin) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data ContrastiveLossParameter = ContrastiveLossParameter{_margin :: !(P'.Maybe P'.Float)}
                              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''ContrastiveLossParameter

instance P'.Mergeable ContrastiveLossParameter where
  mergeAppend (ContrastiveLossParameter x'1) (ContrastiveLossParameter y'1) = ContrastiveLossParameter (P'.mergeAppend x'1 y'1)

instance P'.Default ContrastiveLossParameter where
  defaultValue = ContrastiveLossParameter (Prelude'.Just 1.0)

instance P'.Wire ContrastiveLossParameter where
  wireSize ft' self'@(ContrastiveLossParameter x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 2 x'1)
  wirePut ft' self'@(ContrastiveLossParameter x'1)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 13 2 x'1
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             13 -> Prelude'.fmap (\ !new'Field -> old'Self{_margin = Prelude'.Just new'Field}) (P'.wireGet 2)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ContrastiveLossParameter) ContrastiveLossParameter where
  getVal m' f' = f' m'

instance P'.GPB ContrastiveLossParameter

instance P'.ReflectDescriptor ContrastiveLossParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [13])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.ContrastiveLossParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ContrastiveLossParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"ContrastiveLossParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ContrastiveLossParameter.margin\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ContrastiveLossParameter\"], baseName' = FName \"margin\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 13}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType ContrastiveLossParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ContrastiveLossParameter where
  textPut msg
   = do
       P'.tellT "margin" (_margin msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_margin]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_margin
         = P'.try
            (do
               v <- P'.getT "margin"
               Prelude'.return (\ o -> o{_margin = v}))