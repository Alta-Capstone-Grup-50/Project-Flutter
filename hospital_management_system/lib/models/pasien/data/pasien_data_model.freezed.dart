// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pasien_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PasienDataModel _$PasienDataModelFromJson(Map<String, dynamic> json) {
  return _PasienDataModel.fromJson(json);
}

/// @nodoc
mixin _$PasienDataModel {
  int? get code => throw _privateConstructorUsedError;
  List<PasienModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasienDataModelCopyWith<PasienDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasienDataModelCopyWith<$Res> {
  factory $PasienDataModelCopyWith(
          PasienDataModel value, $Res Function(PasienDataModel) then) =
      _$PasienDataModelCopyWithImpl<$Res, PasienDataModel>;
  @useResult
  $Res call({int? code, List<PasienModel>? data});
}

/// @nodoc
class _$PasienDataModelCopyWithImpl<$Res, $Val extends PasienDataModel>
    implements $PasienDataModelCopyWith<$Res> {
  _$PasienDataModelCopyWithImpl(this._value, this._then);

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
              as List<PasienModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PasienDataModelCopyWith<$Res>
    implements $PasienDataModelCopyWith<$Res> {
  factory _$$_PasienDataModelCopyWith(
          _$_PasienDataModel value, $Res Function(_$_PasienDataModel) then) =
      __$$_PasienDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, List<PasienModel>? data});
}

/// @nodoc
class __$$_PasienDataModelCopyWithImpl<$Res>
    extends _$PasienDataModelCopyWithImpl<$Res, _$_PasienDataModel>
    implements _$$_PasienDataModelCopyWith<$Res> {
  __$$_PasienDataModelCopyWithImpl(
      _$_PasienDataModel _value, $Res Function(_$_PasienDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_PasienDataModel(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PasienModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PasienDataModel implements _PasienDataModel {
  const _$_PasienDataModel(
      {required this.code, required final List<PasienModel>? data})
      : _data = data;

  factory _$_PasienDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_PasienDataModelFromJson(json);

  @override
  final int? code;
  final List<PasienModel>? _data;
  @override
  List<PasienModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PasienDataModel(code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasienDataModel &&
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
  _$$_PasienDataModelCopyWith<_$_PasienDataModel> get copyWith =>
      __$$_PasienDataModelCopyWithImpl<_$_PasienDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PasienDataModelToJson(
      this,
    );
  }
}

abstract class _PasienDataModel implements PasienDataModel {
  const factory _PasienDataModel(
      {required final int? code,
      required final List<PasienModel>? data}) = _$_PasienDataModel;

  factory _PasienDataModel.fromJson(Map<String, dynamic> json) =
      _$_PasienDataModel.fromJson;

  @override
  int? get code;
  @override
  List<PasienModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_PasienDataModelCopyWith<_$_PasienDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
