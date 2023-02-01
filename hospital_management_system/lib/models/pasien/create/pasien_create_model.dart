import 'package:freezed_annotation/freezed_annotation.dart';

part 'pasien_create_model.freezed.dart';
part 'pasien_create_model.g.dart';

@freezed
class PasienCreateModel with _$PasienCreateModel {
  const factory PasienCreateModel({
    int? code,
    String? nik,
    String? nama,
    String? jenisKelamin,
    String? poli,
    String? alamat,
    String? noTelepon,
    String? tempatLahir,
    String? tanggalLahir,
    String? jenisPenanganan,
  }) = _PasienCreateModel;

  factory PasienCreateModel.fromJson(Map<String, dynamic> json) =>
      _$PasienCreateModelFromJson(json);
}
