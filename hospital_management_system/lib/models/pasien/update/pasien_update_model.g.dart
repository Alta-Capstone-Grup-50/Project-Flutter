// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pasien_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PasienUpdateModel _$$_PasienUpdateModelFromJson(Map<String, dynamic> json) =>
    _$_PasienUpdateModel(
      nik: json['nik'] as String,
      nama: json['nama'] as String,
      alamat: json['alamat'] as String,
      jenisKelamin: json['jenisKelamin'] as String,
      poli: json['poli'] as String,
      noTelepon: json['noTelepon'] as String,
      tempatLahir: json['tempatLahir'] as String,
      tanggalLahir: json['tanggalLahir'] as String,
    );

Map<String, dynamic> _$$_PasienUpdateModelToJson(
        _$_PasienUpdateModel instance) =>
    <String, dynamic>{
      'nik': instance.nik,
      'nama': instance.nama,
      'alamat': instance.alamat,
      'jenisKelamin': instance.jenisKelamin,
      'poli': instance.poli,
      'noTelepon': instance.noTelepon,
      'tempatLahir': instance.tempatLahir,
      'tanggalLahir': instance.tanggalLahir,
    };
