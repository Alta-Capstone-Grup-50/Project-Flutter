import 'package:freezed_annotation/freezed_annotation.dart';

part 'dokter_update_model.freezed.dart';
part 'dokter_update_model.g.dart';

@freezed
class DokterUpdateModel with _$DokterUpdateModel {
  const factory DokterUpdateModel({
    String? sip,
    String? nama,
    String? jenisKelamin,
    String? poli,
    String? jadwalPraktek,
    String? noStr,
    String? noTelepon,
  }) = _DokterUpdateModel;

  factory DokterUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$DokterUpdateModelFromJson(json);
}
