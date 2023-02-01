// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_validate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountValidateModel _$AccountValidateModelFromJson(Map<String, dynamic> json) {
  return _AccountValidateModel.fromJson(json);
}

/// @nodoc
mixin _$AccountValidateModel {
  int? get code => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountValidateModelCopyWith<AccountValidateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountValidateModelCopyWith<$Res> {
  factory $AccountValidateModelCopyWith(AccountValidateModel value,
          $Res Function(AccountValidateModel) then) =
      _$AccountValidateModelCopyWithImpl<$Res, AccountValidateModel>;
  @useResult
  $Res call({int? code, int? id, String? level});
}

/// @nodoc
class _$AccountValidateModelCopyWithImpl<$Res,
        $Val extends AccountValidateModel>
    implements $AccountValidateModelCopyWith<$Res> {
  _$AccountValidateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? id = freezed,
    Object? level = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountValidateModelCopyWith<$Res>
    implements $AccountValidateModelCopyWith<$Res> {
  factory _$$_AccountValidateModelCopyWith(_$_AccountValidateModel value,
          $Res Function(_$_AccountValidateModel) then) =
      __$$_AccountValidateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, int? id, String? level});
}

/// @nodoc
class __$$_AccountValidateModelCopyWithImpl<$Res>
    extends _$AccountValidateModelCopyWithImpl<$Res, _$_AccountValidateModel>
    implements _$$_AccountValidateModelCopyWith<$Res> {
  __$$_AccountValidateModelCopyWithImpl(_$_AccountValidateModel _value,
      $Res Function(_$_AccountValidateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? id = freezed,
    Object? level = freezed,
  }) {
    return _then(_$_AccountValidateModel(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountValidateModel implements _AccountValidateModel {
  const _$_AccountValidateModel({this.code, this.id, this.level});

  factory _$_AccountValidateModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountValidateModelFromJson(json);

  @override
  final int? code;
  @override
  final int? id;
  @override
  final String? level;

  @override
  String toString() {
    return 'AccountValidateModel(code: $code, id: $id, level: $level)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountValidateModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, id, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountValidateModelCopyWith<_$_AccountValidateModel> get copyWith =>
      __$$_AccountValidateModelCopyWithImpl<_$_AccountValidateModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountValidateModelToJson(
      this,
    );
  }
}

abstract class _AccountValidateModel implements AccountValidateModel {
  const factory _AccountValidateModel(
      {final int? code,
      final int? id,
      final String? level}) = _$_AccountValidateModel;

  factory _AccountValidateModel.fromJson(Map<String, dynamic> json) =
      _$_AccountValidateModel.fromJson;

  @override
  int? get code;
  @override
  int? get id;
  @override
  String? get level;
  @override
  @JsonKey(ignore: true)
  _$$_AccountValidateModelCopyWith<_$_AccountValidateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
