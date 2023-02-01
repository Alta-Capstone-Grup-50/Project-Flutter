// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rawatJalan_update_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RawatJalanUpdateModel _$RawatJalanUpdateModelFromJson(
    Map<String, dynamic> json) {
  return _RawatJalanUpdateModel.fromJson(json);
}

/// @nodoc
mixin _$RawatJalanUpdateModel {
  String? get jadwalRawatJalan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RawatJalanUpdateModelCopyWith<RawatJalanUpdateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RawatJalanUpdateModelCopyWith<$Res> {
  factory $RawatJalanUpdateModelCopyWith(RawatJalanUpdateModel value,
          $Res Function(RawatJalanUpdateModel) then) =
      _$RawatJalanUpdateModelCopyWithImpl<$Res, RawatJalanUpdateModel>;
  @useResult
  $Res call({String? jadwalRawatJalan});
}

/// @nodoc
class _$RawatJalanUpdateModelCopyWithImpl<$Res,
        $Val extends RawatJalanUpdateModel>
    implements $RawatJalanUpdateModelCopyWith<$Res> {
  _$RawatJalanUpdateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jadwalRawatJalan = freezed,
  }) {
    return _then(_value.copyWith(
      jadwalRawatJalan: freezed == jadwalRawatJalan
          ? _value.jadwalRawatJalan
          : jadwalRawatJalan // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RawatJalanUpdateModelCopyWith<$Res>
    implements $RawatJalanUpdateModelCopyWith<$Res> {
  factory _$$_RawatJalanUpdateModelCopyWith(_$_RawatJalanUpdateModel value,
          $Res Function(_$_RawatJalanUpdateModel) then) =
      __$$_RawatJalanUpdateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? jadwalRawatJalan});
}

/// @nodoc
class __$$_RawatJalanUpdateModelCopyWithImpl<$Res>
    extends _$RawatJalanUpdateModelCopyWithImpl<$Res, _$_RawatJalanUpdateModel>
    implements _$$_RawatJalanUpdateModelCopyWith<$Res> {
  __$$_RawatJalanUpdateModelCopyWithImpl(_$_RawatJalanUpdateModel _value,
      $Res Function(_$_RawatJalanUpdateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jadwalRawatJalan = freezed,
  }) {
    return _then(_$_RawatJalanUpdateModel(
      jadwalRawatJalan: freezed == jadwalRawatJalan
          ? _value.jadwalRawatJalan
          : jadwalRawatJalan // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RawatJalanUpdateModel implements _RawatJalanUpdateModel {
  const _$_RawatJalanUpdateModel({this.jadwalRawatJalan});

  factory _$_RawatJalanUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$$_RawatJalanUpdateModelFromJson(json);

  @override
  final String? jadwalRawatJalan;

  @override
  String toString() {
    return 'RawatJalanUpdateModel(jadwalRawatJalan: $jadwalRawatJalan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RawatJalanUpdateModel &&
            (identical(other.jadwalRawatJalan, jadwalRawatJalan) ||
                other.jadwalRawatJalan == jadwalRawatJalan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, jadwalRawatJalan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RawatJalanUpdateModelCopyWith<_$_RawatJalanUpdateModel> get copyWith =>
      __$$_RawatJalanUpdateModelCopyWithImpl<_$_RawatJalanUpdateModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RawatJalanUpdateModelToJson(
      this,
    );
  }
}

abstract class _RawatJalanUpdateModel implements RawatJalanUpdateModel {
  const factory _RawatJalanUpdateModel({final String? jadwalRawatJalan}) =
      _$_RawatJalanUpdateModel;

  factory _RawatJalanUpdateModel.fromJson(Map<String, dynamic> json) =
      _$_RawatJalanUpdateModel.fromJson;

  @override
  String? get jadwalRawatJalan;
  @override
  @JsonKey(ignore: true)
  _$$_RawatJalanUpdateModelCopyWith<_$_RawatJalanUpdateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
