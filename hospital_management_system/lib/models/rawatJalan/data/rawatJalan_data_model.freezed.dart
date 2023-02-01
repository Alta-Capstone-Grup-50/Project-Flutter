// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rawatJalan_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RawatJalanDataModel _$RawatJalanDataModelFromJson(Map<String, dynamic> json) {
  return _RawatJalanDataModel.fromJson(json);
}

/// @nodoc
mixin _$RawatJalanDataModel {
  int? get code => throw _privateConstructorUsedError;
  List<RawatJalanModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RawatJalanDataModelCopyWith<RawatJalanDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RawatJalanDataModelCopyWith<$Res> {
  factory $RawatJalanDataModelCopyWith(
          RawatJalanDataModel value, $Res Function(RawatJalanDataModel) then) =
      _$RawatJalanDataModelCopyWithImpl<$Res, RawatJalanDataModel>;
  @useResult
  $Res call({int? code, List<RawatJalanModel>? data});
}

/// @nodoc
class _$RawatJalanDataModelCopyWithImpl<$Res, $Val extends RawatJalanDataModel>
    implements $RawatJalanDataModelCopyWith<$Res> {
  _$RawatJalanDataModelCopyWithImpl(this._value, this._then);

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
              as List<RawatJalanModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RawatJalanDataModelCopyWith<$Res>
    implements $RawatJalanDataModelCopyWith<$Res> {
  factory _$$_RawatJalanDataModelCopyWith(_$_RawatJalanDataModel value,
          $Res Function(_$_RawatJalanDataModel) then) =
      __$$_RawatJalanDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, List<RawatJalanModel>? data});
}

/// @nodoc
class __$$_RawatJalanDataModelCopyWithImpl<$Res>
    extends _$RawatJalanDataModelCopyWithImpl<$Res, _$_RawatJalanDataModel>
    implements _$$_RawatJalanDataModelCopyWith<$Res> {
  __$$_RawatJalanDataModelCopyWithImpl(_$_RawatJalanDataModel _value,
      $Res Function(_$_RawatJalanDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_RawatJalanDataModel(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RawatJalanModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RawatJalanDataModel implements _RawatJalanDataModel {
  const _$_RawatJalanDataModel({this.code, final List<RawatJalanModel>? data})
      : _data = data;

  factory _$_RawatJalanDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_RawatJalanDataModelFromJson(json);

  @override
  final int? code;
  final List<RawatJalanModel>? _data;
  @override
  List<RawatJalanModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RawatJalanDataModel(code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RawatJalanDataModel &&
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
  _$$_RawatJalanDataModelCopyWith<_$_RawatJalanDataModel> get copyWith =>
      __$$_RawatJalanDataModelCopyWithImpl<_$_RawatJalanDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RawatJalanDataModelToJson(
      this,
    );
  }
}

abstract class _RawatJalanDataModel implements RawatJalanDataModel {
  const factory _RawatJalanDataModel(
      {final int? code,
      final List<RawatJalanModel>? data}) = _$_RawatJalanDataModel;

  factory _RawatJalanDataModel.fromJson(Map<String, dynamic> json) =
      _$_RawatJalanDataModel.fromJson;

  @override
  int? get code;
  @override
  List<RawatJalanModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_RawatJalanDataModelCopyWith<_$_RawatJalanDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
