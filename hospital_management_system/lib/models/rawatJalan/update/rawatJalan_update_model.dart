import 'package:freezed_annotation/freezed_annotation.dart';

part 'rawatJalan_update_model.freezed.dart';
part 'rawatJalan_update_model.g.dart';

@freezed
class RawatJalanUpdateModel with _$RawatJalanUpdateModel {
  const factory RawatJalanUpdateModel({
    String? jadwalRawatJalan,
  }) = _RawatJalanUpdateModel;

  factory RawatJalanUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$RawatJalanUpdateModelFromJson(json);
}
