// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_category_product_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateCategoryProductRequestModel _$CreateCategoryProductRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreateCategoryProductRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateCategoryProductRequestModel {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Serializes this CreateCategoryProductRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateCategoryProductRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateCategoryProductRequestModelCopyWith<CreateCategoryProductRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCategoryProductRequestModelCopyWith<$Res> {
  factory $CreateCategoryProductRequestModelCopyWith(
          CreateCategoryProductRequestModel value,
          $Res Function(CreateCategoryProductRequestModel) then) =
      _$CreateCategoryProductRequestModelCopyWithImpl<$Res,
          CreateCategoryProductRequestModel>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$CreateCategoryProductRequestModelCopyWithImpl<$Res,
        $Val extends CreateCategoryProductRequestModel>
    implements $CreateCategoryProductRequestModelCopyWith<$Res> {
  _$CreateCategoryProductRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateCategoryProductRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateCategoryProductRequestModelImplCopyWith<$Res>
    implements $CreateCategoryProductRequestModelCopyWith<$Res> {
  factory _$$CreateCategoryProductRequestModelImplCopyWith(
          _$CreateCategoryProductRequestModelImpl value,
          $Res Function(_$CreateCategoryProductRequestModelImpl) then) =
      __$$CreateCategoryProductRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$CreateCategoryProductRequestModelImplCopyWithImpl<$Res>
    extends _$CreateCategoryProductRequestModelCopyWithImpl<$Res,
        _$CreateCategoryProductRequestModelImpl>
    implements _$$CreateCategoryProductRequestModelImplCopyWith<$Res> {
  __$$CreateCategoryProductRequestModelImplCopyWithImpl(
      _$CreateCategoryProductRequestModelImpl _value,
      $Res Function(_$CreateCategoryProductRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateCategoryProductRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$CreateCategoryProductRequestModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateCategoryProductRequestModelImpl
    implements _CreateCategoryProductRequestModel {
  const _$CreateCategoryProductRequestModelImpl(
      {required this.name, required this.code});

  factory _$CreateCategoryProductRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateCategoryProductRequestModelImplFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'CreateCategoryProductRequestModel(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCategoryProductRequestModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  /// Create a copy of CreateCategoryProductRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCategoryProductRequestModelImplCopyWith<
          _$CreateCategoryProductRequestModelImpl>
      get copyWith => __$$CreateCategoryProductRequestModelImplCopyWithImpl<
          _$CreateCategoryProductRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCategoryProductRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CreateCategoryProductRequestModel
    implements CreateCategoryProductRequestModel {
  const factory _CreateCategoryProductRequestModel(
      {required final String name,
      required final String code}) = _$CreateCategoryProductRequestModelImpl;

  factory _CreateCategoryProductRequestModel.fromJson(
          Map<String, dynamic> json) =
      _$CreateCategoryProductRequestModelImpl.fromJson;

  @override
  String get name;
  @override
  String get code;

  /// Create a copy of CreateCategoryProductRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCategoryProductRequestModelImplCopyWith<
          _$CreateCategoryProductRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
