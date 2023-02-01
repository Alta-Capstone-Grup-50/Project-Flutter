import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_validate_model.freezed.dart';
part 'account_validate_model.g.dart';

@freezed
class AccountValidateModel with _$AccountValidateModel {
  const factory AccountValidateModel({
    int? code,
    int? id,
    String? level,
  }) = _AccountValidateModel;

  factory AccountValidateModel.fromJson(Map<String, dynamic> json) =>
      _$AccountValidateModelFromJson(json);
}
