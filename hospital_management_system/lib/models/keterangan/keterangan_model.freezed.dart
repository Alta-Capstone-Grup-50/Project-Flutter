// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keterangan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KeteranganModel _$KeteranganModelFromJson(Map<String, dynamic> json) {
  return _KeteranganModel.fromJson(json);
}

/// @nodoc
mixin _$KeteranganModel {
  int? get id => throw _privateConstructorUsedError;
  String? get namaPasien => throw _privateConstructorUsedError;
  String? get keterangan => throw _privateConstructorUsedError;
  String? get tanggal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeteranganModelCopyWith<KeteranganModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeteranganModelCopyWith<$Res> {
  factory $KeteranganModelCopyWith(
          KeteranganModel value, $Res Function(KeteranganModel) then) =
      _$KeteranganModelCopyWithImpl<$Res, KeteranganModel>;
  @useResult
  $Res call({int? id, String? namaPasien, String? keterangan, String? tanggal});
}

/// @nodoc
class _$KeteranganModelCopyWithImpl<$Res, $Val extends KeteranganModel>
    implements $KeteranganModelCopyWith<$Res> {
  _$KeteranganModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? namaPasien = freezed,
    Object? keterangan = freezed,
    Object? tanggal = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      namaPasien: freezed == namaPasien
          ? _value.namaPasien
          : namaPasien // ignore: cast_nullable_to_non_nullable
              as String?,
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
      tanggal: freezed == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KeteranganModelCopyWith<$Res>
    implements $KeteranganModelCopyWith<$Res> {
  factory _$$_KeteranganModelCopyWith(
          _$_KeteranganModel value, $Res Function(_$_KeteranganModel) then) =
      __$$_KeteranganModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? namaPasien, String? keterangan, String? tanggal});
}

/// @nodoc
class __$$_KeteranganModelCopyWithImpl<$Res>
    extends _$KeteranganModelCopyWithImpl<$Res, _$_KeteranganModel>
    implements _$$_KeteranganModelCopyWith<$Res> {
  __$$_KeteranganModelCopyWithImpl(
      _$_KeteranganModel _value, $Res Function(_$_KeteranganModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? namaPasien = freezed,
    Object? keterangan = freezed,
    Object? tanggal = freezed,
  }) {
    return _then(_$_KeteranganModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      namaPasien: freezed == namaPasien
          ? _value.namaPasien
          : namaPasien // ignore: cast_nullable_to_non_nullable
              as String?,
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
      tanggal: freezed == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeteranganModel implements _KeteranganModel {
  const _$_KeteranganModel(
      {this.id, this.namaPasien, this.keterangan, this.tanggal});

  factory _$_KeteranganModel.fromJson(Map<String, dynamic> json) =>
      _$$_KeteranganModelFromJson(json);

  @override
  final int? id;
  @override
  final String? namaPasien;
  @override
  final String? keterangan;
  @override
  final String? tanggal;

  @override
  String toString() {
    return 'KeteranganModel(id: $id, namaPasien: $namaPasien, keterangan: $keterangan, tanggal: $tanggal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeteranganModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namaPasien, namaPasien) ||
                other.namaPasien == namaPasien) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, namaPasien, keterangan, tanggal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KeteranganModelCopyWith<_$_KeteranganModel> get copyWith =>
      __$$_KeteranganModelCopyWithImpl<_$_KeteranganModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeteranganModelToJson(
      this,
    );
  }
}

abstract class _KeteranganModel implements KeteranganModel {
  const factory _KeteranganModel(
      {final int? id,
      final String? namaPasien,
      final String? keterangan,
      final String? tanggal}) = _$_KeteranganModel;

  factory _KeteranganModel.fromJson(Map<String, dynamic> json) =
      _$_KeteranganModel.fromJson;

  @override
  int? get id;
  @override
  String? get namaPasien;
  @override
  String? get keterangan;
  @override
  String? get tanggal;
  @override
  @JsonKey(ignore: true)
  _$$_KeteranganModelCopyWith<_$_KeteranganModel> get copyWith =>
      throw _privateConstructorUsedError;
}
