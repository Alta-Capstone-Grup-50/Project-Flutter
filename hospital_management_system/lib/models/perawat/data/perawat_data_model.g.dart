// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perawat_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PerawatDataModel _$$_PerawatDataModelFromJson(Map<String, dynamic> json) =>
    _$_PerawatDataModel(
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PerawatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PerawatDataModelToJson(_$_PerawatDataModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
