// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keterangan_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KeteranganDataModel _$$_KeteranganDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_KeteranganDataModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => KeteranganModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_KeteranganDataModelToJson(
        _$_KeteranganDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
