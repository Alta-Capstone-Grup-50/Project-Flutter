import 'package:freezed_annotation/freezed_annotation.dart';

part 'rawatJalan_model.freezed.dart';
part 'rawatJalan_model.g.dart';

@freezed
class RawatJalanModel with _$RawatJalanModel {
  const factory RawatJalanModel({
    int? id,
    String? nik,
    String? nama,
    String? alamat,
    String? jenisKelamin,
    String? jadwalRawatJalan,
    String? noAntrian,
    bool? proses,
    String? keterangan,
    String? noHp,
    String? tempatLahir,
    String? tanggalKeterangan,
    String? tanggalLahir,
    String? jenisPenyakit,
    String? jenisPenanganan,
  }) = _RawatJalanModel;

  factory RawatJalanModel.fromJson(Map<String, dynamic> json) =>
      _$RawatJalanModelFromJson(json);
}
