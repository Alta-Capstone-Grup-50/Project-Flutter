import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_create_model.freezed.dart';
part 'account_create_model.g.dart';

@freezed
class AccountCreateModel with _$AccountCreateModel {
  const factory AccountCreateModel({
    required String? nama,
    required String? email,
    required String? password,
    @Default('Dokter') String? level,
  }) = _AccountCreateModel;

  factory AccountCreateModel.fromJson(Map<String, dynamic> json) =>
      _$AccountCreateModelFromJson(json);
}
