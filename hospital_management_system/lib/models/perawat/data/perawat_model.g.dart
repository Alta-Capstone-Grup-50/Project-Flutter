// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perawat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PerawatModel _$$_PerawatModelFromJson(Map<String, dynamic> json) =>
    _$_PerawatModel(
      id: json['id'] as int?,
      sip: json['sip'] as String?,
      nama: json['nama'] as String?,
      jenisKelamin: json['jenisKelamin'] as String?,
      poli: json['poli'] as String?,
      jadwalKerja: json['jadwalKerja'] as String?,
      jabatan: json['jabatan'] as String?,
      noTelepon: json['noTelepon'] as String?,
      noStr: json['noStr'] as String?,
    );

Map<String, dynamic> _$$_PerawatModelToJson(_$_PerawatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sip': instance.sip,
      'nama': instance.nama,
      'jenisKelamin': instance.jenisKelamin,
      'poli': instance.poli,
      'jadwalKerja': instance.jadwalKerja,
      'jabatan': instance.jabatan,
      'noTelepon': instance.noTelepon,
      'noStr': instance.noStr,
    };
