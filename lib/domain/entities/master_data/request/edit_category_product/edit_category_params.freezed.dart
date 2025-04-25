// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_category_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditCategoryParams _$EditCategoryParamsFromJson(Map<String, dynamic> json) {
  return _EditCategoryParams.fromJson(json);
}

/// @nodoc
mixin _$EditCategoryParams {
  int get id => throw _privateConstructorUsedError;
  CreateCategoryProductRequestModel get request =>
      throw _privateConstructorUsedError;

  /// Serializes this EditCategoryParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditCategoryParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditCategoryParamsCopyWith<EditCategoryParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCategoryParamsCopyWith<$Res> {
  factory $EditCategoryParamsCopyWith(
          EditCategoryParams value, $Res Function(EditCategoryParams) then) =
      _$EditCategoryParamsCopyWithImpl<$Res, EditCategoryParams>;
  @useResult
  $Res call({int id, CreateCategoryProductRequestModel request});

  $CreateCategoryProductRequestModelCopyWith<$Res> get request;
}

/// @nodoc
class _$EditCategoryParamsCopyWithImpl<$Res, $Val extends EditCategoryParams>
    implements $EditCategoryParamsCopyWith<$Res> {
  _$EditCategoryParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditCategoryParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as CreateCategoryProductRequestModel,
    ) as $Val);
  }

  /// Create a copy of EditCategoryParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateCategoryProductRequestModelCopyWith<$Res> get request {
    return $CreateCategoryProductRequestModelCopyWith<$Res>(_value.request,
        (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditCategoryParamsImplCopyWith<$Res>
    implements $EditCategoryParamsCopyWith<$Res> {
  factory _$$EditCategoryParamsImplCopyWith(_$EditCategoryParamsImpl value,
          $Res Function(_$EditCategoryParamsImpl) then) =
      __$$EditCategoryParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, CreateCategoryProductRequestModel request});

  @override
  $CreateCategoryProductRequestModelCopyWith<$Res> get request;
}

/// @nodoc
class __$$EditCategoryParamsImplCopyWithImpl<$Res>
    extends _$EditCategoryParamsCopyWithImpl<$Res, _$EditCategoryParamsImpl>
    implements _$$EditCategoryParamsImplCopyWith<$Res> {
  __$$EditCategoryParamsImplCopyWithImpl(_$EditCategoryParamsImpl _value,
      $Res Function(_$EditCategoryParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditCategoryParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$EditCategoryParamsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as CreateCategoryProductRequestModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditCategoryParamsImpl implements _EditCategoryParams {
  const _$EditCategoryParamsImpl({required this.id, required this.request});

  factory _$EditCategoryParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditCategoryParamsImplFromJson(json);

  @override
  final int id;
  @override
  final CreateCategoryProductRequestModel request;

  @override
  String toString() {
    return 'EditCategoryParams(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditCategoryParamsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of EditCategoryParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditCategoryParamsImplCopyWith<_$EditCategoryParamsImpl> get copyWith =>
      __$$EditCategoryParamsImplCopyWithImpl<_$EditCategoryParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditCategoryParamsImplToJson(
      this,
    );
  }
}

abstract class _EditCategoryParams implements EditCategoryParams {
  const factory _EditCategoryParams(
          {required final int id,
          required final CreateCategoryProductRequestModel request}) =
      _$EditCategoryParamsImpl;

  factory _EditCategoryParams.fromJson(Map<String, dynamic> json) =
      _$EditCategoryParamsImpl.fromJson;

  @override
  int get id;
  @override
  CreateCategoryProductRequestModel get request;

  /// Create a copy of EditCategoryParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditCategoryParamsImplCopyWith<_$EditCategoryParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
