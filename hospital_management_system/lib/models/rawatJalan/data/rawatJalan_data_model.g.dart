// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rawatJalan_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RawatJalanDataModel _$$_RawatJalanDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_RawatJalanDataModel(
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RawatJalanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RawatJalanDataModelToJson(
        _$_RawatJalanDataModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
