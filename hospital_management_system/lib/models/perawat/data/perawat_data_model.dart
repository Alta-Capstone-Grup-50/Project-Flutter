import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_management_system/models/perawat/data/perawat_model.dart';

part 'perawat_data_model.freezed.dart';
part 'perawat_data_model.g.dart';

@freezed
class PerawatDataModel with _$PerawatDataModel {
  const factory PerawatDataModel({
    int? code,
    List<PerawatModel>? data,
  }) = _PerawatDataModel;

  factory PerawatDataModel.fromJson(Map<String, dynamic> json) =>
      _$PerawatDataModelFromJson(json);
}
