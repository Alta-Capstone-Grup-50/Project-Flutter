// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_create_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountCreateModel _$AccountCreateModelFromJson(Map<String, dynamic> json) {
  return _AccountCreateModel.fromJson(json);
}

/// @nodoc
mixin _$AccountCreateModel {
  String? get nama => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCreateModelCopyWith<AccountCreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCreateModelCopyWith<$Res> {
  factory $AccountCreateModelCopyWith(
          AccountCreateModel value, $Res Function(AccountCreateModel) then) =
      _$AccountCreateModelCopyWithImpl<$Res, AccountCreateModel>;
  @useResult
  $Res call({String? nama, String? email, String? password, String? level});
}

/// @nodoc
class _$AccountCreateModelCopyWithImpl<$Res, $Val extends AccountCreateModel>
    implements $AccountCreateModelCopyWith<$Res> {
  _$AccountCreateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? level = freezed,
  }) {
    return _then(_value.copyWith(
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountCreateModelCopyWith<$Res>
    implements $AccountCreateModelCopyWith<$Res> {
  factory _$$_AccountCreateModelCopyWith(_$_AccountCreateModel value,
          $Res Function(_$_AccountCreateModel) then) =
      __$$_AccountCreateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nama, String? email, String? password, String? level});
}

/// @nodoc
class __$$_AccountCreateModelCopyWithImpl<$Res>
    extends _$AccountCreateModelCopyWithImpl<$Res, _$_AccountCreateModel>
    implements _$$_AccountCreateModelCopyWith<$Res> {
  __$$_AccountCreateModelCopyWithImpl(
      _$_AccountCreateModel _value, $Res Function(_$_AccountCreateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? level = freezed,
  }) {
    return _then(_$_AccountCreateModel(
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountCreateModel implements _AccountCreateModel {
  const _$_AccountCreateModel(
      {required this.nama,
      required this.email,
      required this.password,
      this.level = 'Dokter'});

  factory _$_AccountCreateModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountCreateModelFromJson(json);

  @override
  final String? nama;
  @override
  final String? email;
  @override
  final String? password;
  @override
  @JsonKey()
  final String? level;

  @override
  String toString() {
    return 'AccountCreateModel(nama: $nama, email: $email, password: $password, level: $level)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountCreateModel &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nama, email, password, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountCreateModelCopyWith<_$_AccountCreateModel> get copyWith =>
      __$$_AccountCreateModelCopyWithImpl<_$_AccountCreateModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountCreateModelToJson(
      this,
    );
  }
}

abstract class _AccountCreateModel implements AccountCreateModel {
  const factory _AccountCreateModel(
      {required final String? nama,
      required final String? email,
      required final String? password,
      final String? level}) = _$_AccountCreateModel;

  factory _AccountCreateModel.fromJson(Map<String, dynamic> json) =
      _$_AccountCreateModel.fromJson;

  @override
  String? get nama;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get level;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCreateModelCopyWith<_$_AccountCreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
