import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_management_system/models/keterangan/keterangan_model.dart';

part 'keterangan_data_model.freezed.dart';
part 'keterangan_data_model.g.dart';

@freezed
class KeteranganDataModel with _$KeteranganDataModel {
  const factory KeteranganDataModel({
    List<KeteranganModel>? data,
  }) = _KeteranganDataModel;

  factory KeteranganDataModel.fromJson(Map<String, dynamic> json) =>
      _$KeteranganDataModelFromJson(json);
}
