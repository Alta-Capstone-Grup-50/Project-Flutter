// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountModel _$$_AccountModelFromJson(Map<String, dynamic> json) =>
    _$_AccountModel(
      id: json['id'] as int?,
      sip: json['sip'] as String?,
      nama: json['nama'] as String?,
      jenisKelamin: json['jenisKelamin'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      level: json['level'] as String?,
    );

Map<String, dynamic> _$$_AccountModelToJson(_$_AccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sip': instance.sip,
      'nama': instance.nama,
      'jenisKelamin': instance.jenisKelamin,
      'email': instance.email,
      'password': instance.password,
      'level': instance.level,
    };
