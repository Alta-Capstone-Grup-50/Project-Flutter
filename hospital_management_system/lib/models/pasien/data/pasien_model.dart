import 'package:freezed_annotation/freezed_annotation.dart';

part 'pasien_model.freezed.dart';
part 'pasien_model.g.dart';

@freezed
class PasienModel with _$PasienModel {
  const factory PasienModel({
    int? id,
    String? nik,
    String? nama,
    String? jenisKelamin,
    String? poli,
    String? namaDokter,
    String? alamat,
    String? noTelepon,
    String? tempatLahir,
    String? tanggalLahir,
  }) = _PasienModel;

  factory PasienModel.fromJson(Map<String, dynamic> json) =>
      _$PasienModelFromJson(json);
}
