// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pasien_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PasienCreateModel _$$_PasienCreateModelFromJson(Map<String, dynamic> json) =>
    _$_PasienCreateModel(
      code: json['code'] as int?,
      nik: json['nik'] as String?,
      nama: json['nama'] as String?,
      jenisKelamin: json['jenisKelamin'] as String?,
      poli: json['poli'] as String?,
      alamat: json['alamat'] as String?,
      noTelepon: json['noTelepon'] as String?,
      tempatLahir: json['tempatLahir'] as String?,
      tanggalLahir: json['tanggalLahir'] as String?,
      jenisPenanganan: json['jenisPenanganan'] as String?,
    );

Map<String, dynamic> _$$_PasienCreateModelToJson(
        _$_PasienCreateModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'nik': instance.nik,
      'nama': instance.nama,
      'jenisKelamin': instance.jenisKelamin,
      'poli': instance.poli,
      'alamat': instance.alamat,
      'noTelepon': instance.noTelepon,
      'tempatLahir': instance.tempatLahir,
      'tanggalLahir': instance.tanggalLahir,
      'jenisPenanganan': instance.jenisPenanganan,
    };
