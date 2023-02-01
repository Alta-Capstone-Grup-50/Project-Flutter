import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_save_model.freezed.dart';
part 'account_save_model.g.dart';

@freezed
class AccountSaveModel with _$AccountSaveModel {
  const factory AccountSaveModel({
    String? email,
    String? password,
  }) = _AccountSaveModel;

  factory AccountSaveModel.fromJson(Map<String, dynamic> json) =>
      _$AccountSaveModelFromJson(json);
}
