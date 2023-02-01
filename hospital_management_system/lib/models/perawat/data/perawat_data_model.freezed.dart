// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'perawat_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PerawatDataModel _$PerawatDataModelFromJson(Map<String, dynamic> json) {
  return _PerawatDataModel.fromJson(json);
}

/// @nodoc
mixin _$PerawatDataModel {
  int? get code => throw _privateConstructorUsedError;
  List<PerawatModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerawatDataModelCopyWith<PerawatDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerawatDataModelCopyWith<$Res> {
  factory $PerawatDataModelCopyWith(
          PerawatDataModel value, $Res Function(PerawatDataModel) then) =
      _$PerawatDataModelCopyWithImpl<$Res, PerawatDataModel>;
  @useResult
  $Res call({int? code, List<PerawatModel>? data});
}

/// @nodoc
class _$PerawatDataModelCopyWithImpl<$Res, $Val extends PerawatDataModel>
    implements $PerawatDataModelCopyWith<$Res> {
  _$PerawatDataModelCopyWithImpl(this._value, this._then);

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
              as List<PerawatModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PerawatDataModelCopyWith<$Res>
    implements $PerawatDataModelCopyWith<$Res> {
  factory _$$_PerawatDataModelCopyWith(
          _$_PerawatDataModel value, $Res Function(_$_PerawatDataModel) then) =
      __$$_PerawatDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, List<PerawatModel>? data});
}

/// @nodoc
class __$$_PerawatDataModelCopyWithImpl<$Res>
    extends _$PerawatDataModelCopyWithImpl<$Res, _$_PerawatDataModel>
    implements _$$_PerawatDataModelCopyWith<$Res> {
  __$$_PerawatDataModelCopyWithImpl(
      _$_PerawatDataModel _value, $Res Function(_$_PerawatDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_PerawatDataModel(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PerawatModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PerawatDataModel implements _PerawatDataModel {
  const _$_PerawatDataModel({this.code, final List<PerawatModel>? data})
      : _data = data;

  factory _$_PerawatDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_PerawatDataModelFromJson(json);

  @override
  final int? code;
  final List<PerawatModel>? _data;
  @override
  List<PerawatModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PerawatDataModel(code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PerawatDataModel &&
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
  _$$_PerawatDataModelCopyWith<_$_PerawatDataModel> get copyWith =>
      __$$_PerawatDataModelCopyWithImpl<_$_PerawatDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PerawatDataModelToJson(
      this,
    );
  }
}

abstract class _PerawatDataModel implements PerawatDataModel {
  const factory _PerawatDataModel(
      {final int? code, final List<PerawatModel>? data}) = _$_PerawatDataModel;

  factory _PerawatDataModel.fromJson(Map<String, dynamic> json) =
      _$_PerawatDataModel.fromJson;

  @override
  int? get code;
  @override
  List<PerawatModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_PerawatDataModelCopyWith<_$_PerawatDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
