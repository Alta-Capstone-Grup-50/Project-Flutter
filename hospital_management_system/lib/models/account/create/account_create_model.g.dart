// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountCreateModel _$$_AccountCreateModelFromJson(
        Map<String, dynamic> json) =>
    _$_AccountCreateModel(
      nama: json['nama'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      level: json['level'] as String? ?? 'Dokter',
    );

Map<String, dynamic> _$$_AccountCreateModelToJson(
        _$_AccountCreateModel instance) =>
    <String, dynamic>{
      'nama': instance.nama,
      'email': instance.email,
      'password': instance.password,
      'level': instance.level,
    };
