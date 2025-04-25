// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartItem {
  @HiveField(0)
  ProductModel get product => throw _privateConstructorUsedError;
  @HiveField(1)
  List<Map<VariantModel, int>> get variants =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  String get note => throw _privateConstructorUsedError;
  @HiveField(3)
  int get quantity => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get id => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {@HiveField(0) ProductModel product,
      @HiveField(1) List<Map<VariantModel, int>> variants,
      @HiveField(2) String note,
      @HiveField(3) int quantity,
      @HiveField(4) int? id});

  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? variants = null,
    Object? note = null,
    Object? quantity = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Map<VariantModel, int>>,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) ProductModel product,
      @HiveField(1) List<Map<VariantModel, int>> variants,
      @HiveField(2) String note,
      @HiveField(3) int quantity,
      @HiveField(4) int? id});

  @override
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? variants = null,
    Object? note = null,
    Object? quantity = null,
    Object? id = freezed,
  }) {
    return _then(_$CartItemImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Map<VariantModel, int>>,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 7, adapterName: 'CartItemAdapter')
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl(
      {@HiveField(0) required this.product,
      @HiveField(1) final List<Map<VariantModel, int>> variants = const [],
      @HiveField(2) required this.note,
      @HiveField(3) this.quantity = 1,
      @HiveField(4) this.id})
      : _variants = variants;

  @override
  @HiveField(0)
  final ProductModel product;
  final List<Map<VariantModel, int>> _variants;
  @override
  @JsonKey()
  @HiveField(1)
  List<Map<VariantModel, int>> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  @override
  @HiveField(2)
  final String note;
  @override
  @JsonKey()
  @HiveField(3)
  final int quantity;
  @override
  @HiveField(4)
  final int? id;

  @override
  String toString() {
    return 'CartItem(product: $product, variants: $variants, note: $note, quantity: $quantity, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product,
      const DeepCollectionEquality().hash(_variants), note, quantity, id);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);
}

abstract class _CartItem implements CartItem {
  const factory _CartItem(
      {@HiveField(0) required final ProductModel product,
      @HiveField(1) final List<Map<VariantModel, int>> variants,
      @HiveField(2) required final String note,
      @HiveField(3) final int quantity,
      @HiveField(4) final int? id}) = _$CartItemImpl;

  @override
  @HiveField(0)
  ProductModel get product;
  @override
  @HiveField(1)
  List<Map<VariantModel, int>> get variants;
  @override
  @HiveField(2)
  String get note;
  @override
  @HiveField(3)
  int get quantity;
  @override
  @HiveField(4)
  int? get id;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SavedCartInfo {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(2)
  List<CartItem>? get deletedCartItems => throw _privateConstructorUsedError;

  /// Create a copy of SavedCartInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedCartInfoCopyWith<SavedCartInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedCartInfoCopyWith<$Res> {
  factory $SavedCartInfoCopyWith(
          SavedCartInfo value, $Res Function(SavedCartInfo) then) =
      _$SavedCartInfoCopyWithImpl<$Res, SavedCartInfo>;
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) DateTime? createdAt,
      @HiveField(2) List<CartItem>? deletedCartItems});
}

/// @nodoc
class _$SavedCartInfoCopyWithImpl<$Res, $Val extends SavedCartInfo>
    implements $SavedCartInfoCopyWith<$Res> {
  _$SavedCartInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedCartInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? deletedCartItems = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedCartItems: freezed == deletedCartItems
          ? _value.deletedCartItems
          : deletedCartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedCartInfoImplCopyWith<$Res>
    implements $SavedCartInfoCopyWith<$Res> {
  factory _$$SavedCartInfoImplCopyWith(
          _$SavedCartInfoImpl value, $Res Function(_$SavedCartInfoImpl) then) =
      __$$SavedCartInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) DateTime? createdAt,
      @HiveField(2) List<CartItem>? deletedCartItems});
}

/// @nodoc
class __$$SavedCartInfoImplCopyWithImpl<$Res>
    extends _$SavedCartInfoCopyWithImpl<$Res, _$SavedCartInfoImpl>
    implements _$$SavedCartInfoImplCopyWith<$Res> {
  __$$SavedCartInfoImplCopyWithImpl(
      _$SavedCartInfoImpl _value, $Res Function(_$SavedCartInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavedCartInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? deletedCartItems = freezed,
  }) {
    return _then(_$SavedCartInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedCartItems: freezed == deletedCartItems
          ? _value._deletedCartItems
          : deletedCartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 14, adapterName: 'SavedCartInfoAdapter')
class _$SavedCartInfoImpl implements _SavedCartInfo {
  _$SavedCartInfoImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.createdAt,
      @HiveField(2) final List<CartItem>? deletedCartItems})
      : _deletedCartItems = deletedCartItems;

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final DateTime? createdAt;
  final List<CartItem>? _deletedCartItems;
  @override
  @HiveField(2)
  List<CartItem>? get deletedCartItems {
    final value = _deletedCartItems;
    if (value == null) return null;
    if (_deletedCartItems is EqualUnmodifiableListView)
      return _deletedCartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SavedCartInfo(id: $id, createdAt: $createdAt, deletedCartItems: $deletedCartItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedCartInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._deletedCartItems, _deletedCartItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt,
      const DeepCollectionEquality().hash(_deletedCartItems));

  /// Create a copy of SavedCartInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedCartInfoImplCopyWith<_$SavedCartInfoImpl> get copyWith =>
      __$$SavedCartInfoImplCopyWithImpl<_$SavedCartInfoImpl>(this, _$identity);
}

abstract class _SavedCartInfo implements SavedCartInfo {
  factory _SavedCartInfo(
          {@HiveField(0) final String? id,
          @HiveField(1) final DateTime? createdAt,
          @HiveField(2) final List<CartItem>? deletedCartItems}) =
      _$SavedCartInfoImpl;

  @override
  @HiveField(0)
  String? get id;
  @override
  @HiveField(1)
  DateTime? get createdAt;
  @override
  @HiveField(2)
  List<CartItem>? get deletedCartItems;

  /// Create a copy of SavedCartInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedCartInfoImplCopyWith<_$SavedCartInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  @HiveField(0)
  UserModel? get user => throw _privateConstructorUsedError;
  @HiveField(1)
  CategoryModel? get categoryProduct => throw _privateConstructorUsedError;
  @HiveField(2)
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get orderFee => throw _privateConstructorUsedError;
  @HiveField(4)
  DiscountModel? get discount => throw _privateConstructorUsedError;
  @HiveField(5)
  CustomerModel? get customer => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get note => throw _privateConstructorUsedError;
  @HiveField(7)
  TableModel? get table => throw _privateConstructorUsedError;
  @HiveField(8)
  PaymentMethodModel? get paymentMethod => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get paymentMethodCode => throw _privateConstructorUsedError;
  @HiveField(10)
  double? get totalPaid => throw _privateConstructorUsedError;
  @HiveField(11)
  double? get tax => throw _privateConstructorUsedError;
  @HiveField(12)
  double? get priceTax => throw _privateConstructorUsedError;
  @HiveField(13)
  PaymentRequestModel? get paymentRequest => throw _privateConstructorUsedError;
  @HiveField(14)
  PaymentResponseData? get paymentResponse =>
      throw _privateConstructorUsedError;
  @HiveField(15)
  SavedCartInfo? get savedCartInfo => throw _privateConstructorUsedError;
  @HiveField(16)
  String get saleType => throw _privateConstructorUsedError;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {@HiveField(0) UserModel? user,
      @HiveField(1) CategoryModel? categoryProduct,
      @HiveField(2) List<CartItem> cartItems,
      @HiveField(3) int? orderFee,
      @HiveField(4) DiscountModel? discount,
      @HiveField(5) CustomerModel? customer,
      @HiveField(6) String? note,
      @HiveField(7) TableModel? table,
      @HiveField(8) PaymentMethodModel? paymentMethod,
      @HiveField(9) String? paymentMethodCode,
      @HiveField(10) double? totalPaid,
      @HiveField(11) double? tax,
      @HiveField(12) double? priceTax,
      @HiveField(13) PaymentRequestModel? paymentRequest,
      @HiveField(14) PaymentResponseData? paymentResponse,
      @HiveField(15) SavedCartInfo? savedCartInfo,
      @HiveField(16) String saleType});

  $UserModelCopyWith<$Res>? get user;
  $CategoryModelCopyWith<$Res>? get categoryProduct;
  $DiscountModelCopyWith<$Res>? get discount;
  $CustomerModelCopyWith<$Res>? get customer;
  $TableModelCopyWith<$Res>? get table;
  $PaymentMethodModelCopyWith<$Res>? get paymentMethod;
  $PaymentRequestModelCopyWith<$Res>? get paymentRequest;
  $PaymentResponseDataCopyWith<$Res>? get paymentResponse;
  $SavedCartInfoCopyWith<$Res>? get savedCartInfo;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? categoryProduct = freezed,
    Object? cartItems = null,
    Object? orderFee = freezed,
    Object? discount = freezed,
    Object? customer = freezed,
    Object? note = freezed,
    Object? table = freezed,
    Object? paymentMethod = freezed,
    Object? paymentMethodCode = freezed,
    Object? totalPaid = freezed,
    Object? tax = freezed,
    Object? priceTax = freezed,
    Object? paymentRequest = freezed,
    Object? paymentResponse = freezed,
    Object? savedCartInfo = freezed,
    Object? saleType = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      categoryProduct: freezed == categoryProduct
          ? _value.categoryProduct
          : categoryProduct // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      orderFee: freezed == orderFee
          ? _value.orderFee
          : orderFee // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as DiscountModel?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as TableModel?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodModel?,
      paymentMethodCode: freezed == paymentMethodCode
          ? _value.paymentMethodCode
          : paymentMethodCode // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPaid: freezed == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      priceTax: freezed == priceTax
          ? _value.priceTax
          : priceTax // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentRequest: freezed == paymentRequest
          ? _value.paymentRequest
          : paymentRequest // ignore: cast_nullable_to_non_nullable
              as PaymentRequestModel?,
      paymentResponse: freezed == paymentResponse
          ? _value.paymentResponse
          : paymentResponse // ignore: cast_nullable_to_non_nullable
              as PaymentResponseData?,
      savedCartInfo: freezed == savedCartInfo
          ? _value.savedCartInfo
          : savedCartInfo // ignore: cast_nullable_to_non_nullable
              as SavedCartInfo?,
      saleType: null == saleType
          ? _value.saleType
          : saleType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res>? get categoryProduct {
    if (_value.categoryProduct == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_value.categoryProduct!, (value) {
      return _then(_value.copyWith(categoryProduct: value) as $Val);
    });
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiscountModelCopyWith<$Res>? get discount {
    if (_value.discount == null) {
      return null;
    }

    return $DiscountModelCopyWith<$Res>(_value.discount!, (value) {
      return _then(_value.copyWith(discount: value) as $Val);
    });
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerModelCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerModelCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableModelCopyWith<$Res>? get table {
    if (_value.table == null) {
      return null;
    }

    return $TableModelCopyWith<$Res>(_value.table!, (value) {
      return _then(_value.copyWith(table: value) as $Val);
    });
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodModelCopyWith<$Res>? get paymentMethod {
    if (_value.paymentMethod == null) {
      return null;
    }

    return $PaymentMethodModelCopyWith<$Res>(_value.paymentMethod!, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentRequestModelCopyWith<$Res>? get paymentRequest {
    if (_value.paymentRequest == null) {
      return null;
    }

    return $PaymentRequestModelCopyWith<$Res>(_value.paymentRequest!, (value) {
      return _then(_value.copyWith(paymentRequest: value) as $Val);
    });
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentResponseDataCopyWith<$Res>? get paymentResponse {
    if (_value.paymentResponse == null) {
      return null;
    }

    return $PaymentResponseDataCopyWith<$Res>(_value.paymentResponse!, (value) {
      return _then(_value.copyWith(paymentResponse: value) as $Val);
    });
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SavedCartInfoCopyWith<$Res>? get savedCartInfo {
    if (_value.savedCartInfo == null) {
      return null;
    }

    return $SavedCartInfoCopyWith<$Res>(_value.savedCartInfo!, (value) {
      return _then(_value.copyWith(savedCartInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) UserModel? user,
      @HiveField(1) CategoryModel? categoryProduct,
      @HiveField(2) List<CartItem> cartItems,
      @HiveField(3) int? orderFee,
      @HiveField(4) DiscountModel? discount,
      @HiveField(5) CustomerModel? customer,
      @HiveField(6) String? note,
      @HiveField(7) TableModel? table,
      @HiveField(8) PaymentMethodModel? paymentMethod,
      @HiveField(9) String? paymentMethodCode,
      @HiveField(10) double? totalPaid,
      @HiveField(11) double? tax,
      @HiveField(12) double? priceTax,
      @HiveField(13) PaymentRequestModel? paymentRequest,
      @HiveField(14) PaymentResponseData? paymentResponse,
      @HiveField(15) SavedCartInfo? savedCartInfo,
      @HiveField(16) String saleType});

  @override
  $UserModelCopyWith<$Res>? get user;
  @override
  $CategoryModelCopyWith<$Res>? get categoryProduct;
  @override
  $DiscountModelCopyWith<$Res>? get discount;
  @override
  $CustomerModelCopyWith<$Res>? get customer;
  @override
  $TableModelCopyWith<$Res>? get table;
  @override
  $PaymentMethodModelCopyWith<$Res>? get paymentMethod;
  @override
  $PaymentRequestModelCopyWith<$Res>? get paymentRequest;
  @override
  $PaymentResponseDataCopyWith<$Res>? get paymentResponse;
  @override
  $SavedCartInfoCopyWith<$Res>? get savedCartInfo;
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? categoryProduct = freezed,
    Object? cartItems = null,
    Object? orderFee = freezed,
    Object? discount = freezed,
    Object? customer = freezed,
    Object? note = freezed,
    Object? table = freezed,
    Object? paymentMethod = freezed,
    Object? paymentMethodCode = freezed,
    Object? totalPaid = freezed,
    Object? tax = freezed,
    Object? priceTax = freezed,
    Object? paymentRequest = freezed,
    Object? paymentResponse = freezed,
    Object? savedCartInfo = freezed,
    Object? saleType = null,
  }) {
    return _then(_$CartStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      categoryProduct: freezed == categoryProduct
          ? _value.categoryProduct
          : categoryProduct // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      orderFee: freezed == orderFee
          ? _value.orderFee
          : orderFee // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as DiscountModel?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as TableModel?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodModel?,
      paymentMethodCode: freezed == paymentMethodCode
          ? _value.paymentMethodCode
          : paymentMethodCode // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPaid: freezed == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      priceTax: freezed == priceTax
          ? _value.priceTax
          : priceTax // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentRequest: freezed == paymentRequest
          ? _value.paymentRequest
          : paymentRequest // ignore: cast_nullable_to_non_nullable
              as PaymentRequestModel?,
      paymentResponse: freezed == paymentResponse
          ? _value.paymentResponse
          : paymentResponse // ignore: cast_nullable_to_non_nullable
              as PaymentResponseData?,
      savedCartInfo: freezed == savedCartInfo
          ? _value.savedCartInfo
          : savedCartInfo // ignore: cast_nullable_to_non_nullable
              as SavedCartInfo?,
      saleType: null == saleType
          ? _value.saleType
          : saleType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 6, adapterName: 'CartStateAdapter')
class _$CartStateImpl extends _CartState {
  const _$CartStateImpl(
      {@HiveField(0) this.user,
      @HiveField(1) this.categoryProduct,
      @HiveField(2) final List<CartItem> cartItems = const [],
      @HiveField(3) this.orderFee,
      @HiveField(4) this.discount,
      @HiveField(5) this.customer,
      @HiveField(6) this.note,
      @HiveField(7) this.table,
      @HiveField(8) this.paymentMethod,
      @HiveField(9) this.paymentMethodCode,
      @HiveField(10) this.totalPaid,
      @HiveField(11) this.tax,
      @HiveField(12) this.priceTax,
      @HiveField(13) this.paymentRequest,
      @HiveField(14) this.paymentResponse,
      @HiveField(15) this.savedCartInfo,
      @HiveField(16) this.saleType = 'price'})
      : _cartItems = cartItems,
        super._();

  @override
  @HiveField(0)
  final UserModel? user;
  @override
  @HiveField(1)
  final CategoryModel? categoryProduct;
  final List<CartItem> _cartItems;
  @override
  @JsonKey()
  @HiveField(2)
  List<CartItem> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  @HiveField(3)
  final int? orderFee;
  @override
  @HiveField(4)
  final DiscountModel? discount;
  @override
  @HiveField(5)
  final CustomerModel? customer;
  @override
  @HiveField(6)
  final String? note;
  @override
  @HiveField(7)
  final TableModel? table;
  @override
  @HiveField(8)
  final PaymentMethodModel? paymentMethod;
  @override
  @HiveField(9)
  final String? paymentMethodCode;
  @override
  @HiveField(10)
  final double? totalPaid;
  @override
  @HiveField(11)
  final double? tax;
  @override
  @HiveField(12)
  final double? priceTax;
  @override
  @HiveField(13)
  final PaymentRequestModel? paymentRequest;
  @override
  @HiveField(14)
  final PaymentResponseData? paymentResponse;
  @override
  @HiveField(15)
  final SavedCartInfo? savedCartInfo;
  @override
  @JsonKey()
  @HiveField(16)
  final String saleType;

  @override
  String toString() {
    return 'CartState(user: $user, categoryProduct: $categoryProduct, cartItems: $cartItems, orderFee: $orderFee, discount: $discount, customer: $customer, note: $note, table: $table, paymentMethod: $paymentMethod, paymentMethodCode: $paymentMethodCode, totalPaid: $totalPaid, tax: $tax, priceTax: $priceTax, paymentRequest: $paymentRequest, paymentResponse: $paymentResponse, savedCartInfo: $savedCartInfo, saleType: $saleType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.categoryProduct, categoryProduct) ||
                other.categoryProduct == categoryProduct) &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            (identical(other.orderFee, orderFee) ||
                other.orderFee == orderFee) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentMethodCode, paymentMethodCode) ||
                other.paymentMethodCode == paymentMethodCode) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.priceTax, priceTax) ||
                other.priceTax == priceTax) &&
            (identical(other.paymentRequest, paymentRequest) ||
                other.paymentRequest == paymentRequest) &&
            (identical(other.paymentResponse, paymentResponse) ||
                other.paymentResponse == paymentResponse) &&
            (identical(other.savedCartInfo, savedCartInfo) ||
                other.savedCartInfo == savedCartInfo) &&
            (identical(other.saleType, saleType) ||
                other.saleType == saleType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      categoryProduct,
      const DeepCollectionEquality().hash(_cartItems),
      orderFee,
      discount,
      customer,
      note,
      table,
      paymentMethod,
      paymentMethodCode,
      totalPaid,
      tax,
      priceTax,
      paymentRequest,
      paymentResponse,
      savedCartInfo,
      saleType);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState extends CartState {
  const factory _CartState(
      {@HiveField(0) final UserModel? user,
      @HiveField(1) final CategoryModel? categoryProduct,
      @HiveField(2) final List<CartItem> cartItems,
      @HiveField(3) final int? orderFee,
      @HiveField(4) final DiscountModel? discount,
      @HiveField(5) final CustomerModel? customer,
      @HiveField(6) final String? note,
      @HiveField(7) final TableModel? table,
      @HiveField(8) final PaymentMethodModel? paymentMethod,
      @HiveField(9) final String? paymentMethodCode,
      @HiveField(10) final double? totalPaid,
      @HiveField(11) final double? tax,
      @HiveField(12) final double? priceTax,
      @HiveField(13) final PaymentRequestModel? paymentRequest,
      @HiveField(14) final PaymentResponseData? paymentResponse,
      @HiveField(15) final SavedCartInfo? savedCartInfo,
      @HiveField(16) final String saleType}) = _$CartStateImpl;
  const _CartState._() : super._();

  @override
  @HiveField(0)
  UserModel? get user;
  @override
  @HiveField(1)
  CategoryModel? get categoryProduct;
  @override
  @HiveField(2)
  List<CartItem> get cartItems;
  @override
  @HiveField(3)
  int? get orderFee;
  @override
  @HiveField(4)
  DiscountModel? get discount;
  @override
  @HiveField(5)
  CustomerModel? get customer;
  @override
  @HiveField(6)
  String? get note;
  @override
  @HiveField(7)
  TableModel? get table;
  @override
  @HiveField(8)
  PaymentMethodModel? get paymentMethod;
  @override
  @HiveField(9)
  String? get paymentMethodCode;
  @override
  @HiveField(10)
  double? get totalPaid;
  @override
  @HiveField(11)
  double? get tax;
  @override
  @HiveField(12)
  double? get priceTax;
  @override
  @HiveField(13)
  PaymentRequestModel? get paymentRequest;
  @override
  @HiveField(14)
  PaymentResponseData? get paymentResponse;
  @override
  @HiveField(15)
  SavedCartInfo? get savedCartInfo;
  @override
  @HiveField(16)
  String get saleType;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
