// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_product_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditProductParams {
  int get idProduct => throw _privateConstructorUsedError;
  CreateProductRequestModel get request => throw _privateConstructorUsedError;

  /// Create a copy of EditProductParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditProductParamsCopyWith<EditProductParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProductParamsCopyWith<$Res> {
  factory $EditProductParamsCopyWith(
          EditProductParams value, $Res Function(EditProductParams) then) =
      _$EditProductParamsCopyWithImpl<$Res, EditProductParams>;
  @useResult
  $Res call({int idProduct, CreateProductRequestModel request});

  $CreateProductRequestModelCopyWith<$Res> get request;
}

/// @nodoc
class _$EditProductParamsCopyWithImpl<$Res, $Val extends EditProductParams>
    implements $EditProductParamsCopyWith<$Res> {
  _$EditProductParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditProductParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idProduct = null,
    Object? request = null,
  }) {
    return _then(_value.copyWith(
      idProduct: null == idProduct
          ? _value.idProduct
          : idProduct // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as CreateProductRequestModel,
    ) as $Val);
  }

  /// Create a copy of EditProductParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateProductRequestModelCopyWith<$Res> get request {
    return $CreateProductRequestModelCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditProductParamsImplCopyWith<$Res>
    implements $EditProductParamsCopyWith<$Res> {
  factory _$$EditProductParamsImplCopyWith(_$EditProductParamsImpl value,
          $Res Function(_$EditProductParamsImpl) then) =
      __$$EditProductParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int idProduct, CreateProductRequestModel request});

  @override
  $CreateProductRequestModelCopyWith<$Res> get request;
}

/// @nodoc
class __$$EditProductParamsImplCopyWithImpl<$Res>
    extends _$EditProductParamsCopyWithImpl<$Res, _$EditProductParamsImpl>
    implements _$$EditProductParamsImplCopyWith<$Res> {
  __$$EditProductParamsImplCopyWithImpl(_$EditProductParamsImpl _value,
      $Res Function(_$EditProductParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProductParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idProduct = null,
    Object? request = null,
  }) {
    return _then(_$EditProductParamsImpl(
      idProduct: null == idProduct
          ? _value.idProduct
          : idProduct // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as CreateProductRequestModel,
    ));
  }
}

/// @nodoc

class _$EditProductParamsImpl implements _EditProductParams {
  const _$EditProductParamsImpl(
      {required this.idProduct, required this.request});

  @override
  final int idProduct;
  @override
  final CreateProductRequestModel request;

  @override
  String toString() {
    return 'EditProductParams(idProduct: $idProduct, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProductParamsImpl &&
            (identical(other.idProduct, idProduct) ||
                other.idProduct == idProduct) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idProduct, request);

  /// Create a copy of EditProductParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProductParamsImplCopyWith<_$EditProductParamsImpl> get copyWith =>
      __$$EditProductParamsImplCopyWithImpl<_$EditProductParamsImpl>(
          this, _$identity);
}

abstract class _EditProductParams implements EditProductParams {
  const factory _EditProductParams(
          {required final int idProduct,
          required final CreateProductRequestModel request}) =
      _$EditProductParamsImpl;

  @override
  int get idProduct;
  @override
  CreateProductRequestModel get request;

  /// Create a copy of EditProductParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditProductParamsImplCopyWith<_$EditProductParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
