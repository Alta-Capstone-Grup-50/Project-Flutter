import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_management_system/models/rawatJalan/data/rawatJalan_model.dart';

part 'rawatJalan_data_model.freezed.dart';
part 'rawatJalan_data_model.g.dart';

@freezed
class RawatJalanDataModel with _$RawatJalanDataModel {
  const factory RawatJalanDataModel({
    int? code,
    List<RawatJalanModel>? data,
  }) = _RawatJalanDataModel;

  factory RawatJalanDataModel.fromJson(Map<String, dynamic> json) =>
      _$RawatJalanDataModelFromJson(json);
}
