// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pasien_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PasienModel _$$_PasienModelFromJson(Map<String, dynamic> json) =>
    _$_PasienModel(
      id: json['id'] as int?,
      nik: json['nik'] as String?,
      nama: json['nama'] as String?,
      jenisKelamin: json['jenisKelamin'] as String?,
      poli: json['poli'] as String?,
      namaDokter: json['namaDokter'] as String?,
      alamat: json['alamat'] as String?,
      noTelepon: json['noTelepon'] as String?,
      tempatLahir: json['tempatLahir'] as String?,
      tanggalLahir: json['tanggalLahir'] as String?,
    );

Map<String, dynamic> _$$_PasienModelToJson(_$_PasienModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama': instance.nama,
      'jenisKelamin': instance.jenisKelamin,
      'poli': instance.poli,
      'namaDokter': instance.namaDokter,
      'alamat': instance.alamat,
      'noTelepon': instance.noTelepon,
      'tempatLahir': instance.tempatLahir,
      'tanggalLahir': instance.tanggalLahir,
    };
