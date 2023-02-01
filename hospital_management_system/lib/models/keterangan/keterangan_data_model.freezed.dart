// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keterangan_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KeteranganDataModel _$KeteranganDataModelFromJson(Map<String, dynamic> json) {
  return _KeteranganDataModel.fromJson(json);
}

/// @nodoc
mixin _$KeteranganDataModel {
  List<KeteranganModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeteranganDataModelCopyWith<KeteranganDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeteranganDataModelCopyWith<$Res> {
  factory $KeteranganDataModelCopyWith(
          KeteranganDataModel value, $Res Function(KeteranganDataModel) then) =
      _$KeteranganDataModelCopyWithImpl<$Res, KeteranganDataModel>;
  @useResult
  $Res call({List<KeteranganModel>? data});
}

/// @nodoc
class _$KeteranganDataModelCopyWithImpl<$Res, $Val extends KeteranganDataModel>
    implements $KeteranganDataModelCopyWith<$Res> {
  _$KeteranganDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<KeteranganModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KeteranganDataModelCopyWith<$Res>
    implements $KeteranganDataModelCopyWith<$Res> {
  factory _$$_KeteranganDataModelCopyWith(_$_KeteranganDataModel value,
          $Res Function(_$_KeteranganDataModel) then) =
      __$$_KeteranganDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<KeteranganModel>? data});
}

/// @nodoc
class __$$_KeteranganDataModelCopyWithImpl<$Res>
    extends _$KeteranganDataModelCopyWithImpl<$Res, _$_KeteranganDataModel>
    implements _$$_KeteranganDataModelCopyWith<$Res> {
  __$$_KeteranganDataModelCopyWithImpl(_$_KeteranganDataModel _value,
      $Res Function(_$_KeteranganDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_KeteranganDataModel(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<KeteranganModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeteranganDataModel implements _KeteranganDataModel {
  const _$_KeteranganDataModel({final List<KeteranganModel>? data})
      : _data = data;

  factory _$_KeteranganDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_KeteranganDataModelFromJson(json);

  final List<KeteranganModel>? _data;
  @override
  List<KeteranganModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'KeteranganDataModel(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeteranganDataModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KeteranganDataModelCopyWith<_$_KeteranganDataModel> get copyWith =>
      __$$_KeteranganDataModelCopyWithImpl<_$_KeteranganDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeteranganDataModelToJson(
      this,
    );
  }
}

abstract class _KeteranganDataModel implements KeteranganDataModel {
  const factory _KeteranganDataModel({final List<KeteranganModel>? data}) =
      _$_KeteranganDataModel;

  factory _KeteranganDataModel.fromJson(Map<String, dynamic> json) =
      _$_KeteranganDataModel.fromJson;

  @override
  List<KeteranganModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_KeteranganDataModelCopyWith<_$_KeteranganDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
