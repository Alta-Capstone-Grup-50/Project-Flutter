// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountDataModel _$AccountDataModelFromJson(Map<String, dynamic> json) {
  return _AccountDataModel.fromJson(json);
}

/// @nodoc
mixin _$AccountDataModel {
  int? get code => throw _privateConstructorUsedError;
  List<AccountModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDataModelCopyWith<AccountDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDataModelCopyWith<$Res> {
  factory $AccountDataModelCopyWith(
          AccountDataModel value, $Res Function(AccountDataModel) then) =
      _$AccountDataModelCopyWithImpl<$Res, AccountDataModel>;
  @useResult
  $Res call({int? code, List<AccountModel>? data});
}

/// @nodoc
class _$AccountDataModelCopyWithImpl<$Res, $Val extends AccountDataModel>
    implements $AccountDataModelCopyWith<$Res> {
  _$AccountDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AccountModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountDataModelCopyWith<$Res>
    implements $AccountDataModelCopyWith<$Res> {
  factory _$$_AccountDataModelCopyWith(
          _$_AccountDataModel value, $Res Function(_$_AccountDataModel) then) =
      __$$_AccountDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, List<AccountModel>? data});
}

/// @nodoc
class __$$_AccountDataModelCopyWithImpl<$Res>
    extends _$AccountDataModelCopyWithImpl<$Res, _$_AccountDataModel>
    implements _$$_AccountDataModelCopyWith<$Res> {
  __$$_AccountDataModelCopyWithImpl(
      _$_AccountDataModel _value, $Res Function(_$_AccountDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_AccountDataModel(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AccountModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountDataModel implements _AccountDataModel {
  const _$_AccountDataModel(
      {required this.code, required final List<AccountModel>? data})
      : _data = data;

  factory _$_AccountDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountDataModelFromJson(json);

  @override
  final int? code;
  final List<AccountModel>? _data;
  @override
  List<AccountModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AccountDataModel(code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountDataModel &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountDataModelCopyWith<_$_AccountDataModel> get copyWith =>
      __$$_AccountDataModelCopyWithImpl<_$_AccountDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountDataModelToJson(
      this,
    );
  }
}

abstract class _AccountDataModel implements AccountDataModel {
  const factory _AccountDataModel(
      {required final int? code,
      required final List<AccountModel>? data}) = _$_AccountDataModel;

  factory _AccountDataModel.fromJson(Map<String, dynamic> json) =
      _$_AccountDataModel.fromJson;

  @override
  int? get code;
  @override
  List<AccountModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_AccountDataModelCopyWith<_$_AccountDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
