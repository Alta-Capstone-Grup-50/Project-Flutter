import 'package:freezed_annotation/freezed_annotation.dart';

part 'perawat_update_model.freezed.dart';
part 'perawat_update_model.g.dart';

@freezed
class PerawatUpdateModel with _$PerawatUpdateModel {
  const factory PerawatUpdateModel({
    String? sip,
    String? nama,
    String? jenisKelamin,
    String? poli,
    String? jadwalKerja,
    String? jabatan,
    String? noTelepon,
    String? noStr,
  }) = _PerawatUpdateModel;

  factory PerawatUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$PerawatUpdateModelFromJson(json);
}
