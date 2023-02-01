// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rawatJalan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RawatJalanModel _$$_RawatJalanModelFromJson(Map<String, dynamic> json) =>
    _$_RawatJalanModel(
      id: json['id'] as int?,
      nik: json['nik'] as String?,
      nama: json['nama'] as String?,
      alamat: json['alamat'] as String?,
      jenisKelamin: json['jenisKelamin'] as String?,
      jadwalRawatJalan: json['jadwalRawatJalan'] as String?,
      noAntrian: json['noAntrian'] as String?,
      proses: json['proses'] as bool?,
      keterangan: json['keterangan'] as String?,
      noHp: json['noHp'] as String?,
      tempatLahir: json['tempatLahir'] as String?,
      tanggalKeterangan: json['tanggalKeterangan'] as String?,
      tanggalLahir: json['tanggalLahir'] as String?,
      jenisPenyakit: json['jenisPenyakit'] as String?,
      jenisPenanganan: json['jenisPenanganan'] as String?,
    );

Map<String, dynamic> _$$_RawatJalanModelToJson(_$_RawatJalanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama': instance.nama,
      'alamat': instance.alamat,
      'jenisKelamin': instance.jenisKelamin,
      'jadwalRawatJalan': instance.jadwalRawatJalan,
      'noAntrian': instance.noAntrian,
      'proses': instance.proses,
      'keterangan': instance.keterangan,
      'noHp': instance.noHp,
      'tempatLahir': instance.tempatLahir,
      'tanggalKeterangan': instance.tanggalKeterangan,
      'tanggalLahir': instance.tanggalLahir,
      'jenisPenyakit': instance.jenisPenyakit,
      'jenisPenanganan': instance.jenisPenanganan,
    };
