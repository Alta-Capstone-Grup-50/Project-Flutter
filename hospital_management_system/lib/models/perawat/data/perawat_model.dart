import 'package:freezed_annotation/freezed_annotation.dart';

part 'perawat_model.freezed.dart';
part 'perawat_model.g.dart';

@freezed
class PerawatModel with _$PerawatModel {
  const factory PerawatModel({
    int? id,
    String? sip,
    String? nama,
    String? jenisKelamin,
    String? poli,
    String? jadwalKerja,
    String? jabatan,
    String? noTelepon,
    String? noStr,
  }) = _PerawatModel;

  factory PerawatModel.fromJson(Map<String, dynamic> json) =>
      _$PerawatModelFromJson(json);
}
