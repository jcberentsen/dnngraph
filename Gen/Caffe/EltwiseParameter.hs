{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.EltwiseParameter (EltwiseParameter(..), operation, coeff, stable_prod_grad) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.EltwiseParameter.EltwiseOp as Caffe.EltwiseParameter (EltwiseOp)

data EltwiseParameter = EltwiseParameter{_operation :: !(P'.Maybe Caffe.EltwiseParameter.EltwiseOp), _coeff :: !(P'.Seq P'.Float),
                                         _stable_prod_grad :: !(P'.Maybe P'.Bool)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''EltwiseParameter

instance P'.Mergeable EltwiseParameter where
  mergeAppend (EltwiseParameter x'1 x'2 x'3) (EltwiseParameter y'1 y'2 y'3)
   = EltwiseParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default EltwiseParameter where
  defaultValue = EltwiseParameter (Prelude'.Just (Prelude'.read "SUM")) P'.defaultValue (Prelude'.Just Prelude'.True)

instance P'.Wire EltwiseParameter where
  wireSize ft' self'@(EltwiseParameter x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeRep 1 2 x'2 + P'.wireSizeOpt 1 8 x'3)
  wirePut ft' self'@(EltwiseParameter x'1 x'2 x'3)
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
             P'.wirePutRep 21 2 x'2
             P'.wirePutOpt 24 8 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_operation = Prelude'.Just new'Field}) (P'.wireGet 14)
             21 -> Prelude'.fmap (\ !new'Field -> old'Self{_coeff = P'.append (_coeff old'Self) new'Field}) (P'.wireGet 2)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_coeff = P'.mergeAppend (_coeff old'Self) new'Field})
                    (P'.wireGetPacked 2)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_stable_prod_grad = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> EltwiseParameter) EltwiseParameter where
  getVal m' f' = f' m'

instance P'.GPB EltwiseParameter

instance P'.ReflectDescriptor EltwiseParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 21, 24])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.EltwiseParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"EltwiseParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"EltwiseParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.EltwiseParameter.operation\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"EltwiseParameter\"], baseName' = FName \"operation\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.EltwiseParameter.EltwiseOp\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"EltwiseParameter\"], baseName = MName \"EltwiseOp\"}), hsRawDefault = Just \"SUM\", hsDefault = Just (HsDef'Enum \"SUM\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.EltwiseParameter.coeff\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"EltwiseParameter\"], baseName' = FName \"coeff\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 21}, packedTag = Just (WireTag {getWireTag = 21},WireTag {getWireTag = 18}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.EltwiseParameter.stable_prod_grad\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"EltwiseParameter\"], baseName' = FName \"stable_prod_grad\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType EltwiseParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg EltwiseParameter where
  textPut msg
   = do
       P'.tellT "operation" (_operation msg)
       P'.tellT "coeff" (_coeff msg)
       P'.tellT "stable_prod_grad" (_stable_prod_grad msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_operation, parse'_coeff, parse'_stable_prod_grad]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_operation
         = P'.try
            (do
               v <- P'.getT "operation"
               Prelude'.return (\ o -> o{_operation = v}))
        parse'_coeff
         = P'.try
            (do
               v <- P'.getT "coeff"
               Prelude'.return (\ o -> o{_coeff = P'.append (_coeff o) v}))
        parse'_stable_prod_grad
         = P'.try
            (do
               v <- P'.getT "stable_prod_grad"
               Prelude'.return (\ o -> o{_stable_prod_grad = v}))