// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dokter_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DokterDataModel _$$_DokterDataModelFromJson(Map<String, dynamic> json) =>
    _$_DokterDataModel(
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DokterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DokterDataModelToJson(_$_DokterDataModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
