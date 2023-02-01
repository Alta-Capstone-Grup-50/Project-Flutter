// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dokter_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DokterDataModel _$DokterDataModelFromJson(Map<String, dynamic> json) {
  return _DokterDataModel.fromJson(json);
}

/// @nodoc
mixin _$DokterDataModel {
  int? get code => throw _privateConstructorUsedError;
  List<DokterModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DokterDataModelCopyWith<DokterDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DokterDataModelCopyWith<$Res> {
  factory $DokterDataModelCopyWith(
          DokterDataModel value, $Res Function(DokterDataModel) then) =
      _$DokterDataModelCopyWithImpl<$Res, DokterDataModel>;
  @useResult
  $Res call({int? code, List<DokterModel>? data});
}

/// @nodoc
class _$DokterDataModelCopyWithImpl<$Res, $Val extends DokterDataModel>
    implements $DokterDataModelCopyWith<$Res> {
  _$DokterDataModelCopyWithImpl(this._value, this._then);

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
              as List<DokterModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DokterDataModelCopyWith<$Res>
    implements $DokterDataModelCopyWith<$Res> {
  factory _$$_DokterDataModelCopyWith(
          _$_DokterDataModel value, $Res Function(_$_DokterDataModel) then) =
      __$$_DokterDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, List<DokterModel>? data});
}

/// @nodoc
class __$$_DokterDataModelCopyWithImpl<$Res>
    extends _$DokterDataModelCopyWithImpl<$Res, _$_DokterDataModel>
    implements _$$_DokterDataModelCopyWith<$Res> {
  __$$_DokterDataModelCopyWithImpl(
      _$_DokterDataModel _value, $Res Function(_$_DokterDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_DokterDataModel(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DokterModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DokterDataModel implements _DokterDataModel {
  const _$_DokterDataModel({this.code, final List<DokterModel>? data})
      : _data = data;

  factory _$_DokterDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_DokterDataModelFromJson(json);

  @override
  final int? code;
  final List<DokterModel>? _data;
  @override
  List<DokterModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DokterDataModel(code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DokterDataModel &&
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
  _$$_DokterDataModelCopyWith<_$_DokterDataModel> get copyWith =>
      __$$_DokterDataModelCopyWithImpl<_$_DokterDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DokterDataModelToJson(
      this,
    );
  }
}

abstract class _DokterDataModel implements DokterDataModel {
  const factory _DokterDataModel(
      {final int? code, final List<DokterModel>? data}) = _$_DokterDataModel;

  factory _DokterDataModel.fromJson(Map<String, dynamic> json) =
      _$_DokterDataModel.fromJson;

  @override
  int? get code;
  @override
  List<DokterModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_DokterDataModelCopyWith<_$_DokterDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
