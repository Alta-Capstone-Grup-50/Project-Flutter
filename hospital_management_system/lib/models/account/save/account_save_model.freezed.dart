// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_save_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountSaveModel _$AccountSaveModelFromJson(Map<String, dynamic> json) {
  return _AccountSaveModel.fromJson(json);
}

/// @nodoc
mixin _$AccountSaveModel {
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountSaveModelCopyWith<AccountSaveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSaveModelCopyWith<$Res> {
  factory $AccountSaveModelCopyWith(
          AccountSaveModel value, $Res Function(AccountSaveModel) then) =
      _$AccountSaveModelCopyWithImpl<$Res, AccountSaveModel>;
  @useResult
  $Res call({String? email, String? password});
}

/// @nodoc
class _$AccountSaveModelCopyWithImpl<$Res, $Val extends AccountSaveModel>
    implements $AccountSaveModelCopyWith<$Res> {
  _$AccountSaveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountSaveModelCopyWith<$Res>
    implements $AccountSaveModelCopyWith<$Res> {
  factory _$$_AccountSaveModelCopyWith(
          _$_AccountSaveModel value, $Res Function(_$_AccountSaveModel) then) =
      __$$_AccountSaveModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email, String? password});
}

/// @nodoc
class __$$_AccountSaveModelCopyWithImpl<$Res>
    extends _$AccountSaveModelCopyWithImpl<$Res, _$_AccountSaveModel>
    implements _$$_AccountSaveModelCopyWith<$Res> {
  __$$_AccountSaveModelCopyWithImpl(
      _$_AccountSaveModel _value, $Res Function(_$_AccountSaveModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_AccountSaveModel(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountSaveModel implements _AccountSaveModel {
  const _$_AccountSaveModel({this.email, this.password});

  factory _$_AccountSaveModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountSaveModelFromJson(json);

  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString() {
    return 'AccountSaveModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountSaveModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountSaveModelCopyWith<_$_AccountSaveModel> get copyWith =>
      __$$_AccountSaveModelCopyWithImpl<_$_AccountSaveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountSaveModelToJson(
      this,
    );
  }
}

abstract class _AccountSaveModel implements AccountSaveModel {
  const factory _AccountSaveModel(
      {final String? email, final String? password}) = _$_AccountSaveModel;

  factory _AccountSaveModel.fromJson(Map<String, dynamic> json) =
      _$_AccountSaveModel.fromJson;

  @override
  String? get email;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$_AccountSaveModelCopyWith<_$_AccountSaveModel> get copyWith =>
      throw _privateConstructorUsedError;
}
