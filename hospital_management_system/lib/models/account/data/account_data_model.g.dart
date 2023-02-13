// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountDataModel _$$_AccountDataModelFromJson(Map<String, dynamic> json) =>
    _$_AccountDataModel(
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AccountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AccountDataModelToJson(_$_AccountDataModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
