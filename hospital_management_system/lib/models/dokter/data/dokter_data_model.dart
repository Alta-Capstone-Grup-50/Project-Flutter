import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_management_system/models/dokter/data/dokter_model.dart';

part 'dokter_data_model.freezed.dart';
part 'dokter_data_model.g.dart';

@freezed
class DokterDataModel with _$DokterDataModel {
  const factory DokterDataModel({
    int? code,
    List<DokterModel>? data,
  }) = _DokterDataModel;

  factory DokterDataModel.fromJson(Map<String, dynamic> json) =>
      _$DokterDataModelFromJson(json);
}
