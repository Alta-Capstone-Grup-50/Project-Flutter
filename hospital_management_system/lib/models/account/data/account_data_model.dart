import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_management_system/models/account/data/account_model.dart';

part 'account_data_model.freezed.dart';
part 'account_data_model.g.dart';

@freezed
class AccountDataModel with _$AccountDataModel {
  const factory AccountDataModel({
    required int? code,
    required List<AccountModel>? dataManage,
  }) = _AccountDataModel;

  factory AccountDataModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDataModelFromJson(json);
}
