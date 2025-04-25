// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paper_size.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaperSizeModel _$PaperSizeModelFromJson(Map<String, dynamic> json) {
  return _PaperSizeModel.fromJson(json);
}

/// @nodoc
mixin _$PaperSizeModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  int get width => throw _privateConstructorUsedError;

  /// Serializes this PaperSizeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaperSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaperSizeModelCopyWith<PaperSizeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaperSizeModelCopyWith<$Res> {
  factory $PaperSizeModelCopyWith(
          PaperSizeModel value, $Res Function(PaperSizeModel) then) =
      _$PaperSizeModelCopyWithImpl<$Res, PaperSizeModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) int width});
}

/// @nodoc
class _$PaperSizeModelCopyWithImpl<$Res, $Val extends PaperSizeModel>
    implements $PaperSizeModelCopyWith<$Res> {
  _$PaperSizeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaperSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? width = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaperSizeModelImplCopyWith<$Res>
    implements $PaperSizeModelCopyWith<$Res> {
  factory _$$PaperSizeModelImplCopyWith(_$PaperSizeModelImpl value,
          $Res Function(_$PaperSizeModelImpl) then) =
      __$$PaperSizeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) int width});
}

/// @nodoc
class __$$PaperSizeModelImplCopyWithImpl<$Res>
    extends _$PaperSizeModelCopyWithImpl<$Res, _$PaperSizeModelImpl>
    implements _$$PaperSizeModelImplCopyWith<$Res> {
  __$$PaperSizeModelImplCopyWithImpl(
      _$PaperSizeModelImpl _value, $Res Function(_$PaperSizeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaperSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? width = null,
  }) {
    return _then(_$PaperSizeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 16, adapterName: 'PaperSizeModelAdapter')
class _$PaperSizeModelImpl implements _PaperSizeModel {
  const _$PaperSizeModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.width});

  factory _$PaperSizeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaperSizeModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final int width;

  @override
  String toString() {
    return 'PaperSizeModel(id: $id, name: $name, width: $width)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaperSizeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.width, width) || other.width == width));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, width);

  /// Create a copy of PaperSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaperSizeModelImplCopyWith<_$PaperSizeModelImpl> get copyWith =>
      __$$PaperSizeModelImplCopyWithImpl<_$PaperSizeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaperSizeModelImplToJson(
      this,
    );
  }
}

abstract class _PaperSizeModel implements PaperSizeModel {
  const factory _PaperSizeModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final int width}) = _$PaperSizeModelImpl;

  factory _PaperSizeModel.fromJson(Map<String, dynamic> json) =
      _$PaperSizeModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  int get width;

  /// Create a copy of PaperSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaperSizeModelImplCopyWith<_$PaperSizeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
