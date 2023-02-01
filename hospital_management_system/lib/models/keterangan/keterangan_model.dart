import 'package:freezed_annotation/freezed_annotation.dart';

part 'keterangan_model.freezed.dart';
part 'keterangan_model.g.dart';

@freezed
class KeteranganModel with _$KeteranganModel {
  const factory KeteranganModel({
    int? id,
    String? namaPasien,
    String? keterangan,
    String? tanggal,
  }) = _KeteranganModel;

  factory KeteranganModel.fromJson(Map<String, dynamic> json) =>
      _$KeteranganModelFromJson(json);
}
