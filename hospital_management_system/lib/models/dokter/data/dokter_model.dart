import 'package:freezed_annotation/freezed_annotation.dart';

part 'dokter_model.freezed.dart';
part 'dokter_model.g.dart';

@freezed
class DokterModel with _$DokterModel {
  const factory DokterModel({
    int? id,
    String? sip,
    String? nama,
    String? poli,
    String? jenisKelamin,
    String? jadwalPraktek,
    String? noStr,
    String? noTelepon,
  }) = _DokterModel;

  factory DokterModel.fromJson(Map<String, dynamic> json) =>
      _$DokterModelFromJson(json);
}
