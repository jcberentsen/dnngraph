{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.SolverState (SolverState(..), iter, learned_net, history, current_step) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.BlobProto as Caffe (BlobProto)

data SolverState = SolverState{_iter :: !(P'.Maybe P'.Int32), _learned_net :: !(P'.Maybe P'.Utf8),
                               _history :: !(P'.Seq Caffe.BlobProto), _current_step :: !(P'.Maybe P'.Int32)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''SolverState

instance P'.Mergeable SolverState where
  mergeAppend (SolverState x'1 x'2 x'3 x'4) (SolverState y'1 y'2 y'3 y'4)
   = SolverState (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default SolverState where
  defaultValue = SolverState P'.defaultValue P'.defaultValue P'.defaultValue (Prelude'.Just 0)

instance P'.Wire SolverState where
  wireSize ft' self'@(SolverState x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 5 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeOpt 1 5 x'4)
  wirePut ft' self'@(SolverState x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 5 x'1
             P'.wirePutOpt 18 9 x'2
             P'.wirePutRep 26 11 x'3
             P'.wirePutOpt 32 5 x'4
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_iter = Prelude'.Just new'Field}) (P'.wireGet 5)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_learned_net = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_history = P'.append (_history old'Self) new'Field}) (P'.wireGet 11)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_current_step = Prelude'.Just new'Field}) (P'.wireGet 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> SolverState) SolverState where
  getVal m' f' = f' m'

instance P'.GPB SolverState

instance P'.ReflectDescriptor SolverState where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 26, 32])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.SolverState\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SolverState\"}, descFilePath = [\"Gen\",\"Caffe\",\"SolverState.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverState.iter\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverState\"], baseName' = FName \"iter\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverState.learned_net\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverState\"], baseName' = FName \"learned_net\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverState.history\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverState\"], baseName' = FName \"history\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.BlobProto\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"BlobProto\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverState.current_step\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverState\"], baseName' = FName \"current_step\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType SolverState where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg SolverState where
  textPut msg
   = do
       P'.tellT "iter" (_iter msg)
       P'.tellT "learned_net" (_learned_net msg)
       P'.tellT "history" (_history msg)
       P'.tellT "current_step" (_current_step msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_iter, parse'_learned_net, parse'_history, parse'_current_step]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_iter
         = P'.try
            (do
               v <- P'.getT "iter"
               Prelude'.return (\ o -> o{_iter = v}))
        parse'_learned_net
         = P'.try
            (do
               v <- P'.getT "learned_net"
               Prelude'.return (\ o -> o{_learned_net = v}))
        parse'_history
         = P'.try
            (do
               v <- P'.getT "history"
               Prelude'.return (\ o -> o{_history = P'.append (_history o) v}))
        parse'_current_step
         = P'.try
            (do
               v <- P'.getT "current_step"
               Prelude'.return (\ o -> o{_current_step = v}))