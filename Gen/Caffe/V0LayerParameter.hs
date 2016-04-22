{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Gen.Caffe.V0LayerParameter
       (V0LayerParameter(..), name, type', num_output, biasterm, weight_filler, bias_filler, pad, kernelsize, group, stride, pool,
        dropout_ratio, local_size, alpha, beta, k, source, scale, meanfile, batchsize, cropsize, mirror, blobs, blobs_lr,
        weight_decay, rand_skip, det_fg_threshold, det_bg_threshold, det_fg_fraction, det_context_pad, det_crop_mode, new_num,
        new_channels, new_height, new_width, shuffle_images, concat_dim, hdf5_output_param)
       where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Gen.Caffe.BlobProto as Caffe (BlobProto)
import qualified Gen.Caffe.FillerParameter as Caffe (FillerParameter)
import qualified Gen.Caffe.HDF5OutputParameter as Caffe (HDF5OutputParameter)
import qualified Gen.Caffe.V0LayerParameter.PoolMethod as Caffe.V0LayerParameter (PoolMethod)

data V0LayerParameter = V0LayerParameter{_name :: !(P'.Maybe P'.Utf8), _type' :: !(P'.Maybe P'.Utf8),
                                         _num_output :: !(P'.Maybe P'.Word32), _biasterm :: !(P'.Maybe P'.Bool),
                                         _weight_filler :: !(P'.Maybe Caffe.FillerParameter),
                                         _bias_filler :: !(P'.Maybe Caffe.FillerParameter), _pad :: !(P'.Maybe P'.Word32),
                                         _kernelsize :: !(P'.Maybe P'.Word32), _group :: !(P'.Maybe P'.Word32),
                                         _stride :: !(P'.Maybe P'.Word32), _pool :: !(P'.Maybe Caffe.V0LayerParameter.PoolMethod),
                                         _dropout_ratio :: !(P'.Maybe P'.Float), _local_size :: !(P'.Maybe P'.Word32),
                                         _alpha :: !(P'.Maybe P'.Float), _beta :: !(P'.Maybe P'.Float), _k :: !(P'.Maybe P'.Float),
                                         _source :: !(P'.Maybe P'.Utf8), _scale :: !(P'.Maybe P'.Float),
                                         _meanfile :: !(P'.Maybe P'.Utf8), _batchsize :: !(P'.Maybe P'.Word32),
                                         _cropsize :: !(P'.Maybe P'.Word32), _mirror :: !(P'.Maybe P'.Bool),
                                         _blobs :: !(P'.Seq Caffe.BlobProto), _blobs_lr :: !(P'.Seq P'.Float),
                                         _weight_decay :: !(P'.Seq P'.Float), _rand_skip :: !(P'.Maybe P'.Word32),
                                         _det_fg_threshold :: !(P'.Maybe P'.Float), _det_bg_threshold :: !(P'.Maybe P'.Float),
                                         _det_fg_fraction :: !(P'.Maybe P'.Float), _det_context_pad :: !(P'.Maybe P'.Word32),
                                         _det_crop_mode :: !(P'.Maybe P'.Utf8), _new_num :: !(P'.Maybe P'.Int32),
                                         _new_channels :: !(P'.Maybe P'.Int32), _new_height :: !(P'.Maybe P'.Int32),
                                         _new_width :: !(P'.Maybe P'.Int32), _shuffle_images :: !(P'.Maybe P'.Bool),
                                         _concat_dim :: !(P'.Maybe P'.Word32),
                                         _hdf5_output_param :: !(P'.Maybe Caffe.HDF5OutputParameter)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

Control.Lens.TH.makeLenses ''V0LayerParameter

instance P'.Mergeable V0LayerParameter where
  mergeAppend
   (V0LayerParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24
     x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38)
   (V0LayerParameter y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19 y'20 y'21 y'22 y'23 y'24
     y'25 y'26 y'27 y'28 y'29 y'30 y'31 y'32 y'33 y'34 y'35 y'36 y'37 y'38)
   = V0LayerParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)
      (P'.mergeAppend x'13 y'13)
      (P'.mergeAppend x'14 y'14)
      (P'.mergeAppend x'15 y'15)
      (P'.mergeAppend x'16 y'16)
      (P'.mergeAppend x'17 y'17)
      (P'.mergeAppend x'18 y'18)
      (P'.mergeAppend x'19 y'19)
      (P'.mergeAppend x'20 y'20)
      (P'.mergeAppend x'21 y'21)
      (P'.mergeAppend x'22 y'22)
      (P'.mergeAppend x'23 y'23)
      (P'.mergeAppend x'24 y'24)
      (P'.mergeAppend x'25 y'25)
      (P'.mergeAppend x'26 y'26)
      (P'.mergeAppend x'27 y'27)
      (P'.mergeAppend x'28 y'28)
      (P'.mergeAppend x'29 y'29)
      (P'.mergeAppend x'30 y'30)
      (P'.mergeAppend x'31 y'31)
      (P'.mergeAppend x'32 y'32)
      (P'.mergeAppend x'33 y'33)
      (P'.mergeAppend x'34 y'34)
      (P'.mergeAppend x'35 y'35)
      (P'.mergeAppend x'36 y'36)
      (P'.mergeAppend x'37 y'37)
      (P'.mergeAppend x'38 y'38)

instance P'.Default V0LayerParameter where
  defaultValue
   = V0LayerParameter P'.defaultValue P'.defaultValue P'.defaultValue (Prelude'.Just Prelude'.True) P'.defaultValue P'.defaultValue
      (Prelude'.Just 0)
      P'.defaultValue
      (Prelude'.Just 1)
      (Prelude'.Just 1)
      (Prelude'.Just (Prelude'.read "MAX"))
      (Prelude'.Just 0.5)
      (Prelude'.Just 5)
      (Prelude'.Just 1.0)
      (Prelude'.Just 0.75)
      (Prelude'.Just 1.0)
      P'.defaultValue
      (Prelude'.Just 1.0)
      P'.defaultValue
      P'.defaultValue
      (Prelude'.Just 0)
      (Prelude'.Just Prelude'.False)
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      (Prelude'.Just 0)
      (Prelude'.Just 0.5)
      (Prelude'.Just 0.5)
      (Prelude'.Just 0.25)
      (Prelude'.Just 0)
      (Prelude'.Just (P'.Utf8 (P'.pack "warp")))
      (Prelude'.Just 0)
      (Prelude'.Just 0)
      (Prelude'.Just 0)
      (Prelude'.Just 0)
      (Prelude'.Just Prelude'.False)
      (Prelude'.Just 1)
      P'.defaultValue

instance P'.Wire V0LayerParameter where
  wireSize ft'
   self'@(V0LayerParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
           x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeOpt 1 13 x'3 + P'.wireSizeOpt 1 8 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 13 x'7
             + P'.wireSizeOpt 1 13 x'8
             + P'.wireSizeOpt 1 13 x'9
             + P'.wireSizeOpt 1 13 x'10
             + P'.wireSizeOpt 1 14 x'11
             + P'.wireSizeOpt 1 2 x'12
             + P'.wireSizeOpt 1 13 x'13
             + P'.wireSizeOpt 1 2 x'14
             + P'.wireSizeOpt 1 2 x'15
             + P'.wireSizeOpt 2 2 x'16
             + P'.wireSizeOpt 2 9 x'17
             + P'.wireSizeOpt 2 2 x'18
             + P'.wireSizeOpt 2 9 x'19
             + P'.wireSizeOpt 2 13 x'20
             + P'.wireSizeOpt 2 13 x'21
             + P'.wireSizeOpt 2 8 x'22
             + P'.wireSizeRep 2 11 x'23
             + P'.wireSizeRep 2 2 x'24
             + P'.wireSizeRep 2 2 x'25
             + P'.wireSizeOpt 2 13 x'26
             + P'.wireSizeOpt 2 2 x'27
             + P'.wireSizeOpt 2 2 x'28
             + P'.wireSizeOpt 2 2 x'29
             + P'.wireSizeOpt 2 13 x'30
             + P'.wireSizeOpt 2 9 x'31
             + P'.wireSizeOpt 2 5 x'32
             + P'.wireSizeOpt 2 5 x'33
             + P'.wireSizeOpt 2 5 x'34
             + P'.wireSizeOpt 2 5 x'35
             + P'.wireSizeOpt 2 8 x'36
             + P'.wireSizeOpt 2 13 x'37
             + P'.wireSizeOpt 2 11 x'38)
  wirePut ft'
   self'@(V0LayerParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
           x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38)
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
             P'.wirePutOpt 18 9 x'2
             P'.wirePutOpt 24 13 x'3
             P'.wirePutOpt 32 8 x'4
             P'.wirePutOpt 42 11 x'5
             P'.wirePutOpt 50 11 x'6
             P'.wirePutOpt 56 13 x'7
             P'.wirePutOpt 64 13 x'8
             P'.wirePutOpt 72 13 x'9
             P'.wirePutOpt 80 13 x'10
             P'.wirePutOpt 88 14 x'11
             P'.wirePutOpt 101 2 x'12
             P'.wirePutOpt 104 13 x'13
             P'.wirePutOpt 117 2 x'14
             P'.wirePutOpt 125 2 x'15
             P'.wirePutOpt 130 9 x'17
             P'.wirePutOpt 141 2 x'18
             P'.wirePutOpt 146 9 x'19
             P'.wirePutOpt 152 13 x'20
             P'.wirePutOpt 160 13 x'21
             P'.wirePutOpt 168 8 x'22
             P'.wirePutOpt 181 2 x'16
             P'.wirePutRep 402 11 x'23
             P'.wirePutRep 413 2 x'24
             P'.wirePutRep 421 2 x'25
             P'.wirePutOpt 424 13 x'26
             P'.wirePutOpt 437 2 x'27
             P'.wirePutOpt 445 2 x'28
             P'.wirePutOpt 453 2 x'29
             P'.wirePutOpt 464 13 x'30
             P'.wirePutOpt 474 9 x'31
             P'.wirePutOpt 480 5 x'32
             P'.wirePutOpt 488 5 x'33
             P'.wirePutOpt 496 5 x'34
             P'.wirePutOpt 504 5 x'35
             P'.wirePutOpt 512 8 x'36
             P'.wirePutOpt 520 13 x'37
             P'.wirePutOpt 8010 11 x'38
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_name = Prelude'.Just new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 9)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_num_output = Prelude'.Just new'Field}) (P'.wireGet 13)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_biasterm = Prelude'.Just new'Field}) (P'.wireGet 8)
             42 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_weight_filler = P'.mergeAppend (_weight_filler old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_bias_filler = P'.mergeAppend (_bias_filler old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_pad = Prelude'.Just new'Field}) (P'.wireGet 13)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_kernelsize = Prelude'.Just new'Field}) (P'.wireGet 13)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{_group = Prelude'.Just new'Field}) (P'.wireGet 13)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_stride = Prelude'.Just new'Field}) (P'.wireGet 13)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{_pool = Prelude'.Just new'Field}) (P'.wireGet 14)
             101 -> Prelude'.fmap (\ !new'Field -> old'Self{_dropout_ratio = Prelude'.Just new'Field}) (P'.wireGet 2)
             104 -> Prelude'.fmap (\ !new'Field -> old'Self{_local_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             117 -> Prelude'.fmap (\ !new'Field -> old'Self{_alpha = Prelude'.Just new'Field}) (P'.wireGet 2)
             125 -> Prelude'.fmap (\ !new'Field -> old'Self{_beta = Prelude'.Just new'Field}) (P'.wireGet 2)
             181 -> Prelude'.fmap (\ !new'Field -> old'Self{_k = Prelude'.Just new'Field}) (P'.wireGet 2)
             130 -> Prelude'.fmap (\ !new'Field -> old'Self{_source = Prelude'.Just new'Field}) (P'.wireGet 9)
             141 -> Prelude'.fmap (\ !new'Field -> old'Self{_scale = Prelude'.Just new'Field}) (P'.wireGet 2)
             146 -> Prelude'.fmap (\ !new'Field -> old'Self{_meanfile = Prelude'.Just new'Field}) (P'.wireGet 9)
             152 -> Prelude'.fmap (\ !new'Field -> old'Self{_batchsize = Prelude'.Just new'Field}) (P'.wireGet 13)
             160 -> Prelude'.fmap (\ !new'Field -> old'Self{_cropsize = Prelude'.Just new'Field}) (P'.wireGet 13)
             168 -> Prelude'.fmap (\ !new'Field -> old'Self{_mirror = Prelude'.Just new'Field}) (P'.wireGet 8)
             402 -> Prelude'.fmap (\ !new'Field -> old'Self{_blobs = P'.append (_blobs old'Self) new'Field}) (P'.wireGet 11)
             413 -> Prelude'.fmap (\ !new'Field -> old'Self{_blobs_lr = P'.append (_blobs_lr old'Self) new'Field}) (P'.wireGet 2)
             410 -> Prelude'.fmap (\ !new'Field -> old'Self{_blobs_lr = P'.mergeAppend (_blobs_lr old'Self) new'Field})
                     (P'.wireGetPacked 2)
             421 -> Prelude'.fmap (\ !new'Field -> old'Self{_weight_decay = P'.append (_weight_decay old'Self) new'Field})
                     (P'.wireGet 2)
             418 -> Prelude'.fmap (\ !new'Field -> old'Self{_weight_decay = P'.mergeAppend (_weight_decay old'Self) new'Field})
                     (P'.wireGetPacked 2)
             424 -> Prelude'.fmap (\ !new'Field -> old'Self{_rand_skip = Prelude'.Just new'Field}) (P'.wireGet 13)
             437 -> Prelude'.fmap (\ !new'Field -> old'Self{_det_fg_threshold = Prelude'.Just new'Field}) (P'.wireGet 2)
             445 -> Prelude'.fmap (\ !new'Field -> old'Self{_det_bg_threshold = Prelude'.Just new'Field}) (P'.wireGet 2)
             453 -> Prelude'.fmap (\ !new'Field -> old'Self{_det_fg_fraction = Prelude'.Just new'Field}) (P'.wireGet 2)
             464 -> Prelude'.fmap (\ !new'Field -> old'Self{_det_context_pad = Prelude'.Just new'Field}) (P'.wireGet 13)
             474 -> Prelude'.fmap (\ !new'Field -> old'Self{_det_crop_mode = Prelude'.Just new'Field}) (P'.wireGet 9)
             480 -> Prelude'.fmap (\ !new'Field -> old'Self{_new_num = Prelude'.Just new'Field}) (P'.wireGet 5)
             488 -> Prelude'.fmap (\ !new'Field -> old'Self{_new_channels = Prelude'.Just new'Field}) (P'.wireGet 5)
             496 -> Prelude'.fmap (\ !new'Field -> old'Self{_new_height = Prelude'.Just new'Field}) (P'.wireGet 5)
             504 -> Prelude'.fmap (\ !new'Field -> old'Self{_new_width = Prelude'.Just new'Field}) (P'.wireGet 5)
             512 -> Prelude'.fmap (\ !new'Field -> old'Self{_shuffle_images = Prelude'.Just new'Field}) (P'.wireGet 8)
             520 -> Prelude'.fmap (\ !new'Field -> old'Self{_concat_dim = Prelude'.Just new'Field}) (P'.wireGet 13)
             8010 -> Prelude'.fmap
                      (\ !new'Field ->
                        old'Self{_hdf5_output_param = P'.mergeAppend (_hdf5_output_param old'Self) (Prelude'.Just new'Field)})
                      (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> V0LayerParameter) V0LayerParameter where
  getVal m' f' = f' m'

instance P'.GPB V0LayerParameter

instance P'.ReflectDescriptor V0LayerParameter where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList
        [10, 18, 24, 32, 42, 50, 56, 64, 72, 80, 88, 101, 104, 117, 125, 130, 141, 146, 152, 160, 168, 181, 402, 410, 413, 418, 421,
         424, 437, 445, 453, 464, 474, 480, 488, 496, 504, 512, 520, 8010])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.V0LayerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"V0LayerParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"V0LayerParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.name\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.type\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.num_output\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"num_output\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.biasterm\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"biasterm\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.weight_filler\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"weight_filler\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.bias_filler\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"bias_filler\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.pad\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"pad\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.kernelsize\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"kernelsize\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.group\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"group\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.stride\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"stride\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.pool\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"pool\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.V0LayerParameter.PoolMethod\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName = MName \"PoolMethod\"}), hsRawDefault = Just \"MAX\", hsDefault = Just (HsDef'Enum \"MAX\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.dropout_ratio\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"dropout_ratio\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 101}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.5\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 2)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.local_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"local_size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"5\", hsDefault = Just (HsDef'Integer 5)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.alpha\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"alpha\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 117}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.beta\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"beta\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 125}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.75\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (3 % 4)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.k\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"k\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 22}, wireTag = WireTag {getWireTag = 181}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.source\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"source\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 130}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.scale\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"scale\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 141}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.meanfile\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"meanfile\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 146}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.batchsize\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"batchsize\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 152}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.cropsize\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"cropsize\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 20}, wireTag = WireTag {getWireTag = 160}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.mirror\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"mirror\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 21}, wireTag = WireTag {getWireTag = 168}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.blobs\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"blobs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 50}, wireTag = WireTag {getWireTag = 402}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.BlobProto\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"BlobProto\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.blobs_lr\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"blobs_lr\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 51}, wireTag = WireTag {getWireTag = 413}, packedTag = Just (WireTag {getWireTag = 413},WireTag {getWireTag = 410}), wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.weight_decay\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"weight_decay\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 52}, wireTag = WireTag {getWireTag = 421}, packedTag = Just (WireTag {getWireTag = 421},WireTag {getWireTag = 418}), wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.rand_skip\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"rand_skip\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 53}, wireTag = WireTag {getWireTag = 424}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.det_fg_threshold\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"det_fg_threshold\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 54}, wireTag = WireTag {getWireTag = 437}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.5\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 2)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.det_bg_threshold\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"det_bg_threshold\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 55}, wireTag = WireTag {getWireTag = 445}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.5\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 2)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.det_fg_fraction\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"det_fg_fraction\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 56}, wireTag = WireTag {getWireTag = 453}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.25\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 4)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.det_context_pad\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"det_context_pad\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 58}, wireTag = WireTag {getWireTag = 464}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.det_crop_mode\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"det_crop_mode\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 59}, wireTag = WireTag {getWireTag = 474}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Just \"warp\", hsDefault = Just (HsDef'ByteString \"warp\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.new_num\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"new_num\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 60}, wireTag = WireTag {getWireTag = 480}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.new_channels\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"new_channels\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 61}, wireTag = WireTag {getWireTag = 488}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.new_height\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"new_height\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 62}, wireTag = WireTag {getWireTag = 496}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.new_width\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"new_width\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 63}, wireTag = WireTag {getWireTag = 504}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.shuffle_images\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"shuffle_images\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 64}, wireTag = WireTag {getWireTag = 512}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.concat_dim\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"concat_dim\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 65}, wireTag = WireTag {getWireTag = 520}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V0LayerParameter.hdf5_output_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V0LayerParameter\"], baseName' = FName \"hdf5_output_param\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1001}, wireTag = WireTag {getWireTag = 8010}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.HDF5OutputParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"HDF5OutputParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType V0LayerParameter where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg V0LayerParameter where
  textPut msg
   = do
       P'.tellT "name" (_name msg)
       P'.tellT "type" (_type' msg)
       P'.tellT "num_output" (_num_output msg)
       P'.tellT "biasterm" (_biasterm msg)
       P'.tellT "weight_filler" (_weight_filler msg)
       P'.tellT "bias_filler" (_bias_filler msg)
       P'.tellT "pad" (_pad msg)
       P'.tellT "kernelsize" (_kernelsize msg)
       P'.tellT "group" (_group msg)
       P'.tellT "stride" (_stride msg)
       P'.tellT "pool" (_pool msg)
       P'.tellT "dropout_ratio" (_dropout_ratio msg)
       P'.tellT "local_size" (_local_size msg)
       P'.tellT "alpha" (_alpha msg)
       P'.tellT "beta" (_beta msg)
       P'.tellT "k" (_k msg)
       P'.tellT "source" (_source msg)
       P'.tellT "scale" (_scale msg)
       P'.tellT "meanfile" (_meanfile msg)
       P'.tellT "batchsize" (_batchsize msg)
       P'.tellT "cropsize" (_cropsize msg)
       P'.tellT "mirror" (_mirror msg)
       P'.tellT "blobs" (_blobs msg)
       P'.tellT "blobs_lr" (_blobs_lr msg)
       P'.tellT "weight_decay" (_weight_decay msg)
       P'.tellT "rand_skip" (_rand_skip msg)
       P'.tellT "det_fg_threshold" (_det_fg_threshold msg)
       P'.tellT "det_bg_threshold" (_det_bg_threshold msg)
       P'.tellT "det_fg_fraction" (_det_fg_fraction msg)
       P'.tellT "det_context_pad" (_det_context_pad msg)
       P'.tellT "det_crop_mode" (_det_crop_mode msg)
       P'.tellT "new_num" (_new_num msg)
       P'.tellT "new_channels" (_new_channels msg)
       P'.tellT "new_height" (_new_height msg)
       P'.tellT "new_width" (_new_width msg)
       P'.tellT "shuffle_images" (_shuffle_images msg)
       P'.tellT "concat_dim" (_concat_dim msg)
       P'.tellT "hdf5_output_param" (_hdf5_output_param msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_name, parse'_type', parse'_num_output, parse'_biasterm, parse'_weight_filler, parse'_bias_filler,
                   parse'_pad, parse'_kernelsize, parse'_group, parse'_stride, parse'_pool, parse'_dropout_ratio, parse'_local_size,
                   parse'_alpha, parse'_beta, parse'_k, parse'_source, parse'_scale, parse'_meanfile, parse'_batchsize,
                   parse'_cropsize, parse'_mirror, parse'_blobs, parse'_blobs_lr, parse'_weight_decay, parse'_rand_skip,
                   parse'_det_fg_threshold, parse'_det_bg_threshold, parse'_det_fg_fraction, parse'_det_context_pad,
                   parse'_det_crop_mode, parse'_new_num, parse'_new_channels, parse'_new_height, parse'_new_width,
                   parse'_shuffle_images, parse'_concat_dim, parse'_hdf5_output_param])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_num_output
         = P'.try
            (do
               v <- P'.getT "num_output"
               Prelude'.return (\ o -> o{_num_output = v}))
        parse'_biasterm
         = P'.try
            (do
               v <- P'.getT "biasterm"
               Prelude'.return (\ o -> o{_biasterm = v}))
        parse'_weight_filler
         = P'.try
            (do
               v <- P'.getT "weight_filler"
               Prelude'.return (\ o -> o{_weight_filler = v}))
        parse'_bias_filler
         = P'.try
            (do
               v <- P'.getT "bias_filler"
               Prelude'.return (\ o -> o{_bias_filler = v}))
        parse'_pad
         = P'.try
            (do
               v <- P'.getT "pad"
               Prelude'.return (\ o -> o{_pad = v}))
        parse'_kernelsize
         = P'.try
            (do
               v <- P'.getT "kernelsize"
               Prelude'.return (\ o -> o{_kernelsize = v}))
        parse'_group
         = P'.try
            (do
               v <- P'.getT "group"
               Prelude'.return (\ o -> o{_group = v}))
        parse'_stride
         = P'.try
            (do
               v <- P'.getT "stride"
               Prelude'.return (\ o -> o{_stride = v}))
        parse'_pool
         = P'.try
            (do
               v <- P'.getT "pool"
               Prelude'.return (\ o -> o{_pool = v}))
        parse'_dropout_ratio
         = P'.try
            (do
               v <- P'.getT "dropout_ratio"
               Prelude'.return (\ o -> o{_dropout_ratio = v}))
        parse'_local_size
         = P'.try
            (do
               v <- P'.getT "local_size"
               Prelude'.return (\ o -> o{_local_size = v}))
        parse'_alpha
         = P'.try
            (do
               v <- P'.getT "alpha"
               Prelude'.return (\ o -> o{_alpha = v}))
        parse'_beta
         = P'.try
            (do
               v <- P'.getT "beta"
               Prelude'.return (\ o -> o{_beta = v}))
        parse'_k
         = P'.try
            (do
               v <- P'.getT "k"
               Prelude'.return (\ o -> o{_k = v}))
        parse'_source
         = P'.try
            (do
               v <- P'.getT "source"
               Prelude'.return (\ o -> o{_source = v}))
        parse'_scale
         = P'.try
            (do
               v <- P'.getT "scale"
               Prelude'.return (\ o -> o{_scale = v}))
        parse'_meanfile
         = P'.try
            (do
               v <- P'.getT "meanfile"
               Prelude'.return (\ o -> o{_meanfile = v}))
        parse'_batchsize
         = P'.try
            (do
               v <- P'.getT "batchsize"
               Prelude'.return (\ o -> o{_batchsize = v}))
        parse'_cropsize
         = P'.try
            (do
               v <- P'.getT "cropsize"
               Prelude'.return (\ o -> o{_cropsize = v}))
        parse'_mirror
         = P'.try
            (do
               v <- P'.getT "mirror"
               Prelude'.return (\ o -> o{_mirror = v}))
        parse'_blobs
         = P'.try
            (do
               v <- P'.getT "blobs"
               Prelude'.return (\ o -> o{_blobs = P'.append (_blobs o) v}))
        parse'_blobs_lr
         = P'.try
            (do
               v <- P'.getT "blobs_lr"
               Prelude'.return (\ o -> o{_blobs_lr = P'.append (_blobs_lr o) v}))
        parse'_weight_decay
         = P'.try
            (do
               v <- P'.getT "weight_decay"
               Prelude'.return (\ o -> o{_weight_decay = P'.append (_weight_decay o) v}))
        parse'_rand_skip
         = P'.try
            (do
               v <- P'.getT "rand_skip"
               Prelude'.return (\ o -> o{_rand_skip = v}))
        parse'_det_fg_threshold
         = P'.try
            (do
               v <- P'.getT "det_fg_threshold"
               Prelude'.return (\ o -> o{_det_fg_threshold = v}))
        parse'_det_bg_threshold
         = P'.try
            (do
               v <- P'.getT "det_bg_threshold"
               Prelude'.return (\ o -> o{_det_bg_threshold = v}))
        parse'_det_fg_fraction
         = P'.try
            (do
               v <- P'.getT "det_fg_fraction"
               Prelude'.return (\ o -> o{_det_fg_fraction = v}))
        parse'_det_context_pad
         = P'.try
            (do
               v <- P'.getT "det_context_pad"
               Prelude'.return (\ o -> o{_det_context_pad = v}))
        parse'_det_crop_mode
         = P'.try
            (do
               v <- P'.getT "det_crop_mode"
               Prelude'.return (\ o -> o{_det_crop_mode = v}))
        parse'_new_num
         = P'.try
            (do
               v <- P'.getT "new_num"
               Prelude'.return (\ o -> o{_new_num = v}))
        parse'_new_channels
         = P'.try
            (do
               v <- P'.getT "new_channels"
               Prelude'.return (\ o -> o{_new_channels = v}))
        parse'_new_height
         = P'.try
            (do
               v <- P'.getT "new_height"
               Prelude'.return (\ o -> o{_new_height = v}))
        parse'_new_width
         = P'.try
            (do
               v <- P'.getT "new_width"
               Prelude'.return (\ o -> o{_new_width = v}))
        parse'_shuffle_images
         = P'.try
            (do
               v <- P'.getT "shuffle_images"
               Prelude'.return (\ o -> o{_shuffle_images = v}))
        parse'_concat_dim
         = P'.try
            (do
               v <- P'.getT "concat_dim"
               Prelude'.return (\ o -> o{_concat_dim = v}))
        parse'_hdf5_output_param
         = P'.try
            (do
               v <- P'.getT "hdf5_output_param"
               Prelude'.return (\ o -> o{_hdf5_output_param = v}))