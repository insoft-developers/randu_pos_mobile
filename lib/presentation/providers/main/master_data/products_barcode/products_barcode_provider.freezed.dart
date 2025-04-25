// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_barcode_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductsBarcodeState {
  List<ProductModel> get products => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;

  /// Create a copy of ProductsBarcodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsBarcodeStateCopyWith<ProductsBarcodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsBarcodeStateCopyWith<$Res> {
  factory $ProductsBarcodeStateCopyWith(ProductsBarcodeState value,
          $Res Function(ProductsBarcodeState) then) =
      _$ProductsBarcodeStateCopyWithImpl<$Res, ProductsBarcodeState>;
  @useResult
  $Res call({List<ProductModel> products, ProductModel? product});

  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$ProductsBarcodeStateCopyWithImpl<$Res,
        $Val extends ProductsBarcodeState>
    implements $ProductsBarcodeStateCopyWith<$Res> {
  _$ProductsBarcodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsBarcodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ) as $Val);
  }

  /// Create a copy of ProductsBarcodeState
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
abstract class _$$ProductsBarcodeStateImplCopyWith<$Res>
    implements $ProductsBarcodeStateCopyWith<$Res> {
  factory _$$ProductsBarcodeStateImplCopyWith(_$ProductsBarcodeStateImpl value,
          $Res Function(_$ProductsBarcodeStateImpl) then) =
      __$$ProductsBarcodeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductModel> products, ProductModel? product});

  @override
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$ProductsBarcodeStateImplCopyWithImpl<$Res>
    extends _$ProductsBarcodeStateCopyWithImpl<$Res, _$ProductsBarcodeStateImpl>
    implements _$$ProductsBarcodeStateImplCopyWith<$Res> {
  __$$ProductsBarcodeStateImplCopyWithImpl(_$ProductsBarcodeStateImpl _value,
      $Res Function(_$ProductsBarcodeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsBarcodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? product = freezed,
  }) {
    return _then(_$ProductsBarcodeStateImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ));
  }
}

/// @nodoc

class _$ProductsBarcodeStateImpl implements _ProductsBarcodeState {
  const _$ProductsBarcodeStateImpl(
      {final List<ProductModel> products = const [], this.product})
      : _products = products;

  final List<ProductModel> _products;
  @override
  @JsonKey()
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final ProductModel? product;

  @override
  String toString() {
    return 'ProductsBarcodeState(products: $products, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsBarcodeStateImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_products), product);

  /// Create a copy of ProductsBarcodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsBarcodeStateImplCopyWith<_$ProductsBarcodeStateImpl>
      get copyWith =>
          __$$ProductsBarcodeStateImplCopyWithImpl<_$ProductsBarcodeStateImpl>(
              this, _$identity);
}

abstract class _ProductsBarcodeState implements ProductsBarcodeState {
  const factory _ProductsBarcodeState(
      {final List<ProductModel> products,
      final ProductModel? product}) = _$ProductsBarcodeStateImpl;

  @override
  List<ProductModel> get products;
  @override
  ProductModel? get product;

  /// Create a copy of ProductsBarcodeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsBarcodeStateImplCopyWith<_$ProductsBarcodeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
