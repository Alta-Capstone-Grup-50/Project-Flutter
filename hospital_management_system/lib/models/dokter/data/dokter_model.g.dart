// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dokter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DokterModel _$$_DokterModelFromJson(Map<String, dynamic> json) =>
    _$_DokterModel(
      id: json['id'] as int?,
      sip: json['sip'] as String?,
      nama: json['nama'] as String?,
      poli: json['poli'] as String?,
      jenisKelamin: json['jenisKelamin'] as String?,
      jadwalPraktek: json['jadwalPraktek'] as String?,
      noStr: json['noStr'] as String?,
      noTelepon: json['noTelepon'] as String?,
    );

Map<String, dynamic> _$$_DokterModelToJson(_$_DokterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sip': instance.sip,
      'nama': instance.nama,
      'poli': instance.poli,
      'jenisKelamin': instance.jenisKelamin,
      'jadwalPraktek': instance.jadwalPraktek,
      'noStr': instance.noStr,
      'noTelepon': instance.noTelepon,
    };
