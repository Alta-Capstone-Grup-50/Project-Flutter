import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_management_system/models/pasien/data/pasien_model.dart';

part 'pasien_data_model.freezed.dart';
part 'pasien_data_model.g.dart';

@freezed
class PasienDataModel with _$PasienDataModel {
  const factory PasienDataModel({
    required int? code,
    required List<PasienModel>? data,
  }) = _PasienDataModel;

  factory PasienDataModel.fromJson(Map<String, dynamic> json) =>
      _$PasienDataModelFromJson(json);
}
