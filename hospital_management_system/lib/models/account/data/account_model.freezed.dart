// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) {
  return _AccountModel.fromJson(json);
}

/// @nodoc
mixin _$AccountModel {
  int? get id => throw _privateConstructorUsedError;
  String? get sip => throw _privateConstructorUsedError;
  String? get nama => throw _privateConstructorUsedError;
  String? get jenisKelamin => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountModelCopyWith<AccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountModelCopyWith<$Res> {
  factory $AccountModelCopyWith(
          AccountModel value, $Res Function(AccountModel) then) =
      _$AccountModelCopyWithImpl<$Res, AccountModel>;
  @useResult
  $Res call(
      {int? id,
      String? sip,
      String? nama,
      String? jenisKelamin,
      String? email,
      String? password,
      String? level});
}

/// @nodoc
class _$AccountModelCopyWithImpl<$Res, $Val extends AccountModel>
    implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sip = freezed,
    Object? nama = freezed,
    Object? jenisKelamin = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? level = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sip: freezed == sip
          ? _value.sip
          : sip // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      jenisKelamin: freezed == jenisKelamin
          ? _value.jenisKelamin
          : jenisKelamin // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_AccountModelCopyWith<$Res>
    implements $AccountModelCopyWith<$Res> {
  factory _$$_AccountModelCopyWith(
          _$_AccountModel value, $Res Function(_$_AccountModel) then) =
      __$$_AccountModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? sip,
      String? nama,
      String? jenisKelamin,
      String? email,
      String? password,
      String? level});
}

/// @nodoc
class __$$_AccountModelCopyWithImpl<$Res>
    extends _$AccountModelCopyWithImpl<$Res, _$_AccountModel>
    implements _$$_AccountModelCopyWith<$Res> {
  __$$_AccountModelCopyWithImpl(
      _$_AccountModel _value, $Res Function(_$_AccountModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sip = freezed,
    Object? nama = freezed,
    Object? jenisKelamin = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? level = freezed,
  }) {
    return _then(_$_AccountModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sip: freezed == sip
          ? _value.sip
          : sip // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      jenisKelamin: freezed == jenisKelamin
          ? _value.jenisKelamin
          : jenisKelamin // ignore: cast_nullable_to_non_nullable
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
class _$_AccountModel implements _AccountModel {
  const _$_AccountModel(
      {required this.id,
      required this.sip,
      required this.nama,
      required this.jenisKelamin,
      required this.email,
      required this.password,
      required this.level});

  factory _$_AccountModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountModelFromJson(json);

  @override
  final int? id;
  @override
  final String? sip;
  @override
  final String? nama;
  @override
  final String? jenisKelamin;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? level;

  @override
  String toString() {
    return 'AccountModel(id: $id, sip: $sip, nama: $nama, jenisKelamin: $jenisKelamin, email: $email, password: $password, level: $level)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sip, sip) || other.sip == sip) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jenisKelamin, jenisKelamin) ||
                other.jenisKelamin == jenisKelamin) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, sip, nama, jenisKelamin, email, password, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountModelCopyWith<_$_AccountModel> get copyWith =>
      __$$_AccountModelCopyWithImpl<_$_AccountModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountModelToJson(
      this,
    );
  }
}

abstract class _AccountModel implements AccountModel {
  const factory _AccountModel(
      {required final int? id,
      required final String? sip,
      required final String? nama,
      required final String? jenisKelamin,
      required final String? email,
      required final String? password,
      required final String? level}) = _$_AccountModel;

  factory _AccountModel.fromJson(Map<String, dynamic> json) =
      _$_AccountModel.fromJson;

  @override
  int? get id;
  @override
  String? get sip;
  @override
  String? get nama;
  @override
  String? get jenisKelamin;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get level;
  @override
  @JsonKey(ignore: true)
  _$$_AccountModelCopyWith<_$_AccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}
