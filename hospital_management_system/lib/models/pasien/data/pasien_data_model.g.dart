// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pasien_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PasienDataModel _$$_PasienDataModelFromJson(Map<String, dynamic> json) =>
    _$_PasienDataModel(
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PasienModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PasienDataModelToJson(_$_PasienDataModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
