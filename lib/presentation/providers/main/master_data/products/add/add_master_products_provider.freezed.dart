// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_master_products_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddMasterProductsState {
  GeneralResponse<dynamic>? get response => throw _privateConstructorUsedError;
  List<CategoryModel>? get categoriesProduct =>
      throw _privateConstructorUsedError;
  CreateProductRequestModel get requestModel =>
      throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;

  /// Create a copy of AddMasterProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddMasterProductsStateCopyWith<AddMasterProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMasterProductsStateCopyWith<$Res> {
  factory $AddMasterProductsStateCopyWith(AddMasterProductsState value,
          $Res Function(AddMasterProductsState) then) =
      _$AddMasterProductsStateCopyWithImpl<$Res, AddMasterProductsState>;
  @useResult
  $Res call(
      {GeneralResponse<dynamic>? response,
      List<CategoryModel>? categoriesProduct,
      CreateProductRequestModel requestModel,
      ProductModel? product});

  $GeneralResponseCopyWith<dynamic, $Res>? get response;
  $CreateProductRequestModelCopyWith<$Res> get requestModel;
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$AddMasterProductsStateCopyWithImpl<$Res,
        $Val extends AddMasterProductsState>
    implements $AddMasterProductsStateCopyWith<$Res> {
  _$AddMasterProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddMasterProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? categoriesProduct = freezed,
    Object? requestModel = null,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GeneralResponse<dynamic>?,
      categoriesProduct: freezed == categoriesProduct
          ? _value.categoriesProduct
          : categoriesProduct // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      requestModel: null == requestModel
          ? _value.requestModel
          : requestModel // ignore: cast_nullable_to_non_nullable
              as CreateProductRequestModel,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ) as $Val);
  }

  /// Create a copy of AddMasterProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneralResponseCopyWith<dynamic, $Res>? get response {
    if (_value.response == null) {
      return null;
    }

    return $GeneralResponseCopyWith<dynamic, $Res>(_value.response!, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }

  /// Create a copy of AddMasterProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateProductRequestModelCopyWith<$Res> get requestModel {
    return $CreateProductRequestModelCopyWith<$Res>(_value.requestModel,
        (value) {
      return _then(_value.copyWith(requestModel: value) as $Val);
    });
  }

  /// Create a copy of AddMasterProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddMasterProductsStateImplCopyWith<$Res>
    implements $AddMasterProductsStateCopyWith<$Res> {
  factory _$$AddMasterProductsStateImplCopyWith(
          _$AddMasterProductsStateImpl value,
          $Res Function(_$AddMasterProductsStateImpl) then) =
      __$$AddMasterProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GeneralResponse<dynamic>? response,
      List<CategoryModel>? categoriesProduct,
      CreateProductRequestModel requestModel,
      ProductModel? product});

  @override
  $GeneralResponseCopyWith<dynamic, $Res>? get response;
  @override
  $CreateProductRequestModelCopyWith<$Res> get requestModel;
  @override
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$AddMasterProductsStateImplCopyWithImpl<$Res>
    extends _$AddMasterProductsStateCopyWithImpl<$Res,
        _$AddMasterProductsStateImpl>
    implements _$$AddMasterProductsStateImplCopyWith<$Res> {
  __$$AddMasterProductsStateImplCopyWithImpl(
      _$AddMasterProductsStateImpl _value,
      $Res Function(_$AddMasterProductsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddMasterProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? categoriesProduct = freezed,
    Object? requestModel = null,
    Object? product = freezed,
  }) {
    return _then(_$AddMasterProductsStateImpl(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GeneralResponse<dynamic>?,
      categoriesProduct: freezed == categoriesProduct
          ? _value._categoriesProduct
          : categoriesProduct // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      requestModel: null == requestModel
          ? _value.requestModel
          : requestModel // ignore: cast_nullable_to_non_nullable
              as CreateProductRequestModel,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ));
  }
}

/// @nodoc

class _$AddMasterProductsStateImpl extends _AddMasterProductsState {
  const _$AddMasterProductsStateImpl(
      {this.response,
      final List<CategoryModel>? categoriesProduct,
      this.requestModel = const CreateProductRequestModel(
          name: '',
          categoryId: 0,
          sku: '',
          price: 0,
          priceTa: 0,
          priceMp: 0,
          priceCus: 0),
      this.product})
      : _categoriesProduct = categoriesProduct,
        super._();

  @override
  final GeneralResponse<dynamic>? response;
  final List<CategoryModel>? _categoriesProduct;
  @override
  List<CategoryModel>? get categoriesProduct {
    final value = _categoriesProduct;
    if (value == null) return null;
    if (_categoriesProduct is EqualUnmodifiableListView)
      return _categoriesProduct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final CreateProductRequestModel requestModel;
  @override
  final ProductModel? product;

  @override
  String toString() {
    return 'AddMasterProductsState(response: $response, categoriesProduct: $categoriesProduct, requestModel: $requestModel, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMasterProductsStateImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            const DeepCollectionEquality()
                .equals(other._categoriesProduct, _categoriesProduct) &&
            (identical(other.requestModel, requestModel) ||
                other.requestModel == requestModel) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      response,
      const DeepCollectionEquality().hash(_categoriesProduct),
      requestModel,
      product);

  /// Create a copy of AddMasterProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMasterProductsStateImplCopyWith<_$AddMasterProductsStateImpl>
      get copyWith => __$$AddMasterProductsStateImplCopyWithImpl<
          _$AddMasterProductsStateImpl>(this, _$identity);
}

abstract class _AddMasterProductsState extends AddMasterProductsState {
  const factory _AddMasterProductsState(
      {final GeneralResponse<dynamic>? response,
      final List<CategoryModel>? categoriesProduct,
      final CreateProductRequestModel requestModel,
      final ProductModel? product}) = _$AddMasterProductsStateImpl;
  const _AddMasterProductsState._() : super._();

  @override
  GeneralResponse<dynamic>? get response;
  @override
  List<CategoryModel>? get categoriesProduct;
  @override
  CreateProductRequestModel get requestModel;
  @override
  ProductModel? get product;

  /// Create a copy of AddMasterProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddMasterProductsStateImplCopyWith<_$AddMasterProductsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
