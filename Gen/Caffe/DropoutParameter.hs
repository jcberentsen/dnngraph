{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.DropoutParameter (DropoutParameter(..), dropout_ratio) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data DropoutParameter = DropoutParameter{_dropout_ratio :: !(P'.Maybe P'.Float)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''DropoutParameter

instance P'.Mergeable DropoutParameter where
  mergeAppend (DropoutParameter x'1) (DropoutParameter y'1) = DropoutParameter (P'.mergeAppend x'1 y'1)

instance P'.Default DropoutParameter where
  defaultValue = DropoutParameter (Prelude'.Just 0.5)

instance P'.Wire DropoutParameter where
  wireSize ft' self'@(DropoutParameter x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 2 x'1)
  wirePut ft' self'@(DropoutParameter x'1)
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
             13 -> Prelude'.fmap (\ !new'Field -> old'Self{_dropout_ratio = Prelude'.Just new'Field}) (P'.wireGet 2)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DropoutParameter) DropoutParameter where
  getVal m' f' = f' m'

instance P'.GPB DropoutParameter

instance P'.ReflectDescriptor DropoutParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [13])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.DropoutParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"DropoutParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"DropoutParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.DropoutParameter.dropout_ratio\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"DropoutParameter\"], baseName' = FName \"dropout_ratio\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 13}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.5\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 2)))}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType DropoutParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DropoutParameter where
  textPut msg
   = do
       P'.tellT "dropout_ratio" (_dropout_ratio msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_dropout_ratio]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_dropout_ratio
         = P'.try
            (do
               v <- P'.getT "dropout_ratio"
               Prelude'.return (\ o -> o{_dropout_ratio = v}))