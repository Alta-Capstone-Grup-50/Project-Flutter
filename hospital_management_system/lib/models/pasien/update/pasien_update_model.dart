import 'package:freezed_annotation/freezed_annotation.dart';

part 'pasien_update_model.freezed.dart';
part 'pasien_update_model.g.dart';

@freezed
class PasienUpdateModel with _$PasienUpdateModel {
  const factory PasienUpdateModel({
    required String nik,
    required String nama,
    required String alamat,
    required String jenisKelamin,
    required String poli,
    required String noTelepon,
    required String tempatLahir,
    required String tanggalLahir,
  }) = _PasienUpdateModel;

  factory PasienUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$PasienUpdateModelFromJson(json);
}
