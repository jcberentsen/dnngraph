{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.ParamSpec (ParamSpec(..), name, share_mode, lr_mult, decay_mult) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.ParamSpec.DimCheckMode as Caffe.ParamSpec (DimCheckMode)

data ParamSpec = ParamSpec{_name :: !(P'.Maybe P'.Utf8), _share_mode :: !(P'.Maybe Caffe.ParamSpec.DimCheckMode),
                           _lr_mult :: !(P'.Maybe P'.Float), _decay_mult :: !(P'.Maybe P'.Float)}
               deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''ParamSpec

instance P'.Mergeable ParamSpec where
  mergeAppend (ParamSpec x'1 x'2 x'3 x'4) (ParamSpec y'1 y'2 y'3 y'4)
   = ParamSpec (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default ParamSpec where
  defaultValue = ParamSpec P'.defaultValue P'.defaultValue (Prelude'.Just 1.0) (Prelude'.Just 1.0)

instance P'.Wire ParamSpec where
  wireSize ft' self'@(ParamSpec x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 14 x'2 + P'.wireSizeOpt 1 2 x'3 + P'.wireSizeOpt 1 2 x'4)
  wirePut ft' self'@(ParamSpec x'1 x'2 x'3 x'4)
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
             P'.wirePutOpt 16 14 x'2
             P'.wirePutOpt 29 2 x'3
             P'.wirePutOpt 37 2 x'4
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_name = Prelude'.Just new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_share_mode = Prelude'.Just new'Field}) (P'.wireGet 14)
             29 -> Prelude'.fmap (\ !new'Field -> old'Self{_lr_mult = Prelude'.Just new'Field}) (P'.wireGet 2)
             37 -> Prelude'.fmap (\ !new'Field -> old'Self{_decay_mult = Prelude'.Just new'Field}) (P'.wireGet 2)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ParamSpec) ParamSpec where
  getVal m' f' = f' m'

instance P'.GPB ParamSpec

instance P'.ReflectDescriptor ParamSpec where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 29, 37])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.ParamSpec\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ParamSpec\"}, descFilePath = [\"Gen\",\"Caffe\",\"ParamSpec.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ParamSpec.name\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ParamSpec\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ParamSpec.share_mode\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ParamSpec\"], baseName' = FName \"share_mode\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ParamSpec.DimCheckMode\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"ParamSpec\"], baseName = MName \"DimCheckMode\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ParamSpec.lr_mult\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ParamSpec\"], baseName' = FName \"lr_mult\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 29}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ParamSpec.decay_mult\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ParamSpec\"], baseName' = FName \"decay_mult\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 37}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType ParamSpec where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ParamSpec where
  textPut msg
   = do
       P'.tellT "name" (_name msg)
       P'.tellT "share_mode" (_share_mode msg)
       P'.tellT "lr_mult" (_lr_mult msg)
       P'.tellT "decay_mult" (_decay_mult msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_name, parse'_share_mode, parse'_lr_mult, parse'_decay_mult]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))
        parse'_share_mode
         = P'.try
            (do
               v <- P'.getT "share_mode"
               Prelude'.return (\ o -> o{_share_mode = v}))
        parse'_lr_mult
         = P'.try
            (do
               v <- P'.getT "lr_mult"
               Prelude'.return (\ o -> o{_lr_mult = v}))
        parse'_decay_mult
         = P'.try
            (do
               v <- P'.getT "decay_mult"
               Prelude'.return (\ o -> o{_decay_mult = v}))