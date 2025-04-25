// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentRequestModel _$PaymentRequestModelFromJson(Map<String, dynamic> json) {
  return _PaymentRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentRequestModel {
  @HiveField(0)
  @JsonKey(name: 'customer')
  String? get customer => throw _privateConstructorUsedError;
  @HiveField(1)
  double get paid => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'order_total')
  double get orderTotal => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'tax')
  double get tax => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'payment_method')
  String get paymentMethod => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'qr_codes_id')
  String? get qrCodeId => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'branch_id')
  String? get branchId => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'staff_id')
  String? get staffId => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'shipping')
  double get shipping => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'diskon')
  double get discount => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'discount_id')
  String? get discountId => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'return_url')
  String get returnUrl => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: 'product')
  List<ProductModel> get products => throw _privateConstructorUsedError;
  @HiveField(13)
  String get from => throw _privateConstructorUsedError; // M: mobile, W: web
  @HiveField(14)
  @JsonKey(name: 'price_type')
  String get saleType => throw _privateConstructorUsedError;
  @HiveField(15)
  @JsonKey(name: 'instant_qris')
  bool get instantQris => throw _privateConstructorUsedError;
  @HiveField(16)
  @JsonKey(name: 'is_rounded')
  bool get isRounded => throw _privateConstructorUsedError;
  @HiveField(17)
  @JsonKey(name: 'flag')
  String? get flag => throw _privateConstructorUsedError;

  /// Serializes this PaymentRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentRequestModelCopyWith<PaymentRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRequestModelCopyWith<$Res> {
  factory $PaymentRequestModelCopyWith(
          PaymentRequestModel value, $Res Function(PaymentRequestModel) then) =
      _$PaymentRequestModelCopyWithImpl<$Res, PaymentRequestModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'customer') String? customer,
      @HiveField(1) double paid,
      @HiveField(2) @JsonKey(name: 'order_total') double orderTotal,
      @HiveField(3) @JsonKey(name: 'tax') double tax,
      @HiveField(4) @JsonKey(name: 'payment_method') String paymentMethod,
      @HiveField(5) @JsonKey(name: 'qr_codes_id') String? qrCodeId,
      @HiveField(6) @JsonKey(name: 'branch_id') String? branchId,
      @HiveField(7) @JsonKey(name: 'staff_id') String? staffId,
      @HiveField(8) @JsonKey(name: 'shipping') double shipping,
      @HiveField(9) @JsonKey(name: 'diskon') double discount,
      @HiveField(10) @JsonKey(name: 'discount_id') String? discountId,
      @HiveField(11) @JsonKey(name: 'return_url') String returnUrl,
      @HiveField(12) @JsonKey(name: 'product') List<ProductModel> products,
      @HiveField(13) String from,
      @HiveField(14) @JsonKey(name: 'price_type') String saleType,
      @HiveField(15) @JsonKey(name: 'instant_qris') bool instantQris,
      @HiveField(16) @JsonKey(name: 'is_rounded') bool isRounded,
      @HiveField(17) @JsonKey(name: 'flag') String? flag});
}

/// @nodoc
class _$PaymentRequestModelCopyWithImpl<$Res, $Val extends PaymentRequestModel>
    implements $PaymentRequestModelCopyWith<$Res> {
  _$PaymentRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = freezed,
    Object? paid = null,
    Object? orderTotal = null,
    Object? tax = null,
    Object? paymentMethod = null,
    Object? qrCodeId = freezed,
    Object? branchId = freezed,
    Object? staffId = freezed,
    Object? shipping = null,
    Object? discount = null,
    Object? discountId = freezed,
    Object? returnUrl = null,
    Object? products = null,
    Object? from = null,
    Object? saleType = null,
    Object? instantQris = null,
    Object? isRounded = null,
    Object? flag = freezed,
  }) {
    return _then(_value.copyWith(
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as double,
      orderTotal: null == orderTotal
          ? _value.orderTotal
          : orderTotal // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      qrCodeId: freezed == qrCodeId
          ? _value.qrCodeId
          : qrCodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String?,
      staffId: freezed == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String?,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      discountId: freezed == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as String?,
      returnUrl: null == returnUrl
          ? _value.returnUrl
          : returnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      saleType: null == saleType
          ? _value.saleType
          : saleType // ignore: cast_nullable_to_non_nullable
              as String,
      instantQris: null == instantQris
          ? _value.instantQris
          : instantQris // ignore: cast_nullable_to_non_nullable
              as bool,
      isRounded: null == isRounded
          ? _value.isRounded
          : isRounded // ignore: cast_nullable_to_non_nullable
              as bool,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentRequestModelImplCopyWith<$Res>
    implements $PaymentRequestModelCopyWith<$Res> {
  factory _$$PaymentRequestModelImplCopyWith(_$PaymentRequestModelImpl value,
          $Res Function(_$PaymentRequestModelImpl) then) =
      __$$PaymentRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'customer') String? customer,
      @HiveField(1) double paid,
      @HiveField(2) @JsonKey(name: 'order_total') double orderTotal,
      @HiveField(3) @JsonKey(name: 'tax') double tax,
      @HiveField(4) @JsonKey(name: 'payment_method') String paymentMethod,
      @HiveField(5) @JsonKey(name: 'qr_codes_id') String? qrCodeId,
      @HiveField(6) @JsonKey(name: 'branch_id') String? branchId,
      @HiveField(7) @JsonKey(name: 'staff_id') String? staffId,
      @HiveField(8) @JsonKey(name: 'shipping') double shipping,
      @HiveField(9) @JsonKey(name: 'diskon') double discount,
      @HiveField(10) @JsonKey(name: 'discount_id') String? discountId,
      @HiveField(11) @JsonKey(name: 'return_url') String returnUrl,
      @HiveField(12) @JsonKey(name: 'product') List<ProductModel> products,
      @HiveField(13) String from,
      @HiveField(14) @JsonKey(name: 'price_type') String saleType,
      @HiveField(15) @JsonKey(name: 'instant_qris') bool instantQris,
      @HiveField(16) @JsonKey(name: 'is_rounded') bool isRounded,
      @HiveField(17) @JsonKey(name: 'flag') String? flag});
}

/// @nodoc
class __$$PaymentRequestModelImplCopyWithImpl<$Res>
    extends _$PaymentRequestModelCopyWithImpl<$Res, _$PaymentRequestModelImpl>
    implements _$$PaymentRequestModelImplCopyWith<$Res> {
  __$$PaymentRequestModelImplCopyWithImpl(_$PaymentRequestModelImpl _value,
      $Res Function(_$PaymentRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = freezed,
    Object? paid = null,
    Object? orderTotal = null,
    Object? tax = null,
    Object? paymentMethod = null,
    Object? qrCodeId = freezed,
    Object? branchId = freezed,
    Object? staffId = freezed,
    Object? shipping = null,
    Object? discount = null,
    Object? discountId = freezed,
    Object? returnUrl = null,
    Object? products = null,
    Object? from = null,
    Object? saleType = null,
    Object? instantQris = null,
    Object? isRounded = null,
    Object? flag = freezed,
  }) {
    return _then(_$PaymentRequestModelImpl(
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as double,
      orderTotal: null == orderTotal
          ? _value.orderTotal
          : orderTotal // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      qrCodeId: freezed == qrCodeId
          ? _value.qrCodeId
          : qrCodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String?,
      staffId: freezed == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String?,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      discountId: freezed == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as String?,
      returnUrl: null == returnUrl
          ? _value.returnUrl
          : returnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      saleType: null == saleType
          ? _value.saleType
          : saleType // ignore: cast_nullable_to_non_nullable
              as String,
      instantQris: null == instantQris
          ? _value.instantQris
          : instantQris // ignore: cast_nullable_to_non_nullable
              as bool,
      isRounded: null == isRounded
          ? _value.isRounded
          : isRounded // ignore: cast_nullable_to_non_nullable
              as bool,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'PaymentRequestModelAdapter')
class _$PaymentRequestModelImpl implements _PaymentRequestModel {
  const _$PaymentRequestModelImpl(
      {@HiveField(0) @JsonKey(name: 'customer') this.customer,
      @HiveField(1) required this.paid,
      @HiveField(2) @JsonKey(name: 'order_total') required this.orderTotal,
      @HiveField(3) @JsonKey(name: 'tax') required this.tax,
      @HiveField(4)
      @JsonKey(name: 'payment_method')
      required this.paymentMethod,
      @HiveField(5) @JsonKey(name: 'qr_codes_id') this.qrCodeId,
      @HiveField(6) @JsonKey(name: 'branch_id') this.branchId,
      @HiveField(7) @JsonKey(name: 'staff_id') this.staffId,
      @HiveField(8) @JsonKey(name: 'shipping') required this.shipping,
      @HiveField(9) @JsonKey(name: 'diskon') required this.discount,
      @HiveField(10) @JsonKey(name: 'discount_id') this.discountId,
      @HiveField(11) @JsonKey(name: 'return_url') this.returnUrl = 'pos',
      @HiveField(12)
      @JsonKey(name: 'product')
      final List<ProductModel> products = const [],
      @HiveField(13) this.from = 'M',
      @HiveField(14) @JsonKey(name: 'price_type') this.saleType = 'price',
      @HiveField(15) @JsonKey(name: 'instant_qris') this.instantQris = false,
      @HiveField(16) @JsonKey(name: 'is_rounded') this.isRounded = false,
      @HiveField(17) @JsonKey(name: 'flag') this.flag})
      : _products = products;

  factory _$PaymentRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentRequestModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'customer')
  final String? customer;
  @override
  @HiveField(1)
  final double paid;
  @override
  @HiveField(2)
  @JsonKey(name: 'order_total')
  final double orderTotal;
  @override
  @HiveField(3)
  @JsonKey(name: 'tax')
  final double tax;
  @override
  @HiveField(4)
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  @HiveField(5)
  @JsonKey(name: 'qr_codes_id')
  final String? qrCodeId;
  @override
  @HiveField(6)
  @JsonKey(name: 'branch_id')
  final String? branchId;
  @override
  @HiveField(7)
  @JsonKey(name: 'staff_id')
  final String? staffId;
  @override
  @HiveField(8)
  @JsonKey(name: 'shipping')
  final double shipping;
  @override
  @HiveField(9)
  @JsonKey(name: 'diskon')
  final double discount;
  @override
  @HiveField(10)
  @JsonKey(name: 'discount_id')
  final String? discountId;
  @override
  @HiveField(11)
  @JsonKey(name: 'return_url')
  final String returnUrl;
  final List<ProductModel> _products;
  @override
  @HiveField(12)
  @JsonKey(name: 'product')
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  @HiveField(13)
  final String from;
// M: mobile, W: web
  @override
  @HiveField(14)
  @JsonKey(name: 'price_type')
  final String saleType;
  @override
  @HiveField(15)
  @JsonKey(name: 'instant_qris')
  final bool instantQris;
  @override
  @HiveField(16)
  @JsonKey(name: 'is_rounded')
  final bool isRounded;
  @override
  @HiveField(17)
  @JsonKey(name: 'flag')
  final String? flag;

  @override
  String toString() {
    return 'PaymentRequestModel(customer: $customer, paid: $paid, orderTotal: $orderTotal, tax: $tax, paymentMethod: $paymentMethod, qrCodeId: $qrCodeId, branchId: $branchId, staffId: $staffId, shipping: $shipping, discount: $discount, discountId: $discountId, returnUrl: $returnUrl, products: $products, from: $from, saleType: $saleType, instantQris: $instantQris, isRounded: $isRounded, flag: $flag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentRequestModelImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.orderTotal, orderTotal) ||
                other.orderTotal == orderTotal) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.qrCodeId, qrCodeId) ||
                other.qrCodeId == qrCodeId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountId, discountId) ||
                other.discountId == discountId) &&
            (identical(other.returnUrl, returnUrl) ||
                other.returnUrl == returnUrl) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.saleType, saleType) ||
                other.saleType == saleType) &&
            (identical(other.instantQris, instantQris) ||
                other.instantQris == instantQris) &&
            (identical(other.isRounded, isRounded) ||
                other.isRounded == isRounded) &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customer,
      paid,
      orderTotal,
      tax,
      paymentMethod,
      qrCodeId,
      branchId,
      staffId,
      shipping,
      discount,
      discountId,
      returnUrl,
      const DeepCollectionEquality().hash(_products),
      from,
      saleType,
      instantQris,
      isRounded,
      flag);

  /// Create a copy of PaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentRequestModelImplCopyWith<_$PaymentRequestModelImpl> get copyWith =>
      __$$PaymentRequestModelImplCopyWithImpl<_$PaymentRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentRequestModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentRequestModel implements PaymentRequestModel {
  const factory _PaymentRequestModel(
      {@HiveField(0) @JsonKey(name: 'customer') final String? customer,
      @HiveField(1) required final double paid,
      @HiveField(2)
      @JsonKey(name: 'order_total')
      required final double orderTotal,
      @HiveField(3) @JsonKey(name: 'tax') required final double tax,
      @HiveField(4)
      @JsonKey(name: 'payment_method')
      required final String paymentMethod,
      @HiveField(5) @JsonKey(name: 'qr_codes_id') final String? qrCodeId,
      @HiveField(6) @JsonKey(name: 'branch_id') final String? branchId,
      @HiveField(7) @JsonKey(name: 'staff_id') final String? staffId,
      @HiveField(8) @JsonKey(name: 'shipping') required final double shipping,
      @HiveField(9) @JsonKey(name: 'diskon') required final double discount,
      @HiveField(10) @JsonKey(name: 'discount_id') final String? discountId,
      @HiveField(11) @JsonKey(name: 'return_url') final String returnUrl,
      @HiveField(12)
      @JsonKey(name: 'product')
      final List<ProductModel> products,
      @HiveField(13) final String from,
      @HiveField(14) @JsonKey(name: 'price_type') final String saleType,
      @HiveField(15) @JsonKey(name: 'instant_qris') final bool instantQris,
      @HiveField(16) @JsonKey(name: 'is_rounded') final bool isRounded,
      @HiveField(17)
      @JsonKey(name: 'flag')
      final String? flag}) = _$PaymentRequestModelImpl;

  factory _PaymentRequestModel.fromJson(Map<String, dynamic> json) =
      _$PaymentRequestModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'customer')
  String? get customer;
  @override
  @HiveField(1)
  double get paid;
  @override
  @HiveField(2)
  @JsonKey(name: 'order_total')
  double get orderTotal;
  @override
  @HiveField(3)
  @JsonKey(name: 'tax')
  double get tax;
  @override
  @HiveField(4)
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @override
  @HiveField(5)
  @JsonKey(name: 'qr_codes_id')
  String? get qrCodeId;
  @override
  @HiveField(6)
  @JsonKey(name: 'branch_id')
  String? get branchId;
  @override
  @HiveField(7)
  @JsonKey(name: 'staff_id')
  String? get staffId;
  @override
  @HiveField(8)
  @JsonKey(name: 'shipping')
  double get shipping;
  @override
  @HiveField(9)
  @JsonKey(name: 'diskon')
  double get discount;
  @override
  @HiveField(10)
  @JsonKey(name: 'discount_id')
  String? get discountId;
  @override
  @HiveField(11)
  @JsonKey(name: 'return_url')
  String get returnUrl;
  @override
  @HiveField(12)
  @JsonKey(name: 'product')
  List<ProductModel> get products;
  @override
  @HiveField(13)
  String get from; // M: mobile, W: web
  @override
  @HiveField(14)
  @JsonKey(name: 'price_type')
  String get saleType;
  @override
  @HiveField(15)
  @JsonKey(name: 'instant_qris')
  bool get instantQris;
  @override
  @HiveField(16)
  @JsonKey(name: 'is_rounded')
  bool get isRounded;
  @override
  @HiveField(17)
  @JsonKey(name: 'flag')
  String? get flag;

  /// Create a copy of PaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentRequestModelImplCopyWith<_$PaymentRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentReceiptModel _$PaymentReceiptModelFromJson(Map<String, dynamic> json) {
  return _PaymentReceiptModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentReceiptModel {
  ReceiptFromEnum get receiptFrom => throw _privateConstructorUsedError;
  String? get referenceId => throw _privateConstructorUsedError; // no nota
  String? get bussinessName => throw _privateConstructorUsedError;
  String? get bussinessAddress => throw _privateConstructorUsedError;
  String? get branchName => throw _privateConstructorUsedError;
  String? get printerConnection => throw _privateConstructorUsedError;
  String? get printerCustomFooter => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer')
  String? get customer => throw _privateConstructorUsedError;
  double get paid => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_total')
  double get orderTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_total')
  double get subTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax')
  double get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code_id')
  String? get qrCodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  String? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff_id')
  String? get staffId => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff_name')
  String? get staffName => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping')
  double get shipping => throw _privateConstructorUsedError;
  @JsonKey(name: 'diskon')
  double get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_id')
  String? get discountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_url')
  String get returnUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'product')
  List<ProductModel> get products => throw _privateConstructorUsedError;
  String? get table => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  bool? get isFromCart => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  int? get transactionId => throw _privateConstructorUsedError;
  int? get statusPayment => throw _privateConstructorUsedError;
  String? get paymentReturnUrl => throw _privateConstructorUsedError;
  String? get priceType => throw _privateConstructorUsedError;
  String? get roundedTotal => throw _privateConstructorUsedError;
  bool? get isRounded => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag')
  String? get flag => throw _privateConstructorUsedError;

  /// Serializes this PaymentReceiptModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentReceiptModelCopyWith<PaymentReceiptModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentReceiptModelCopyWith<$Res> {
  factory $PaymentReceiptModelCopyWith(
          PaymentReceiptModel value, $Res Function(PaymentReceiptModel) then) =
      _$PaymentReceiptModelCopyWithImpl<$Res, PaymentReceiptModel>;
  @useResult
  $Res call(
      {ReceiptFromEnum receiptFrom,
      String? referenceId,
      String? bussinessName,
      String? bussinessAddress,
      String? branchName,
      String? printerConnection,
      String? printerCustomFooter,
      @JsonKey(name: 'customer') String? customer,
      double paid,
      @JsonKey(name: 'order_total') double orderTotal,
      @JsonKey(name: 'sub_total') double subTotal,
      @JsonKey(name: 'tax') double tax,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'qr_code_id') String? qrCodeId,
      @JsonKey(name: 'branch_id') String? branchId,
      @JsonKey(name: 'staff_id') String? staffId,
      @JsonKey(name: 'staff_name') String? staffName,
      @JsonKey(name: 'shipping') double shipping,
      @JsonKey(name: 'diskon') double discount,
      @JsonKey(name: 'discount_id') String? discountId,
      @JsonKey(name: 'return_url') String returnUrl,
      @JsonKey(name: 'product') List<ProductModel> products,
      String? table,
      DateTime? createdAt,
      bool? isFromCart,
      int? status,
      int? transactionId,
      int? statusPayment,
      String? paymentReturnUrl,
      String? priceType,
      String? roundedTotal,
      bool? isRounded,
      @JsonKey(name: 'flag') String? flag});
}

/// @nodoc
class _$PaymentReceiptModelCopyWithImpl<$Res, $Val extends PaymentReceiptModel>
    implements $PaymentReceiptModelCopyWith<$Res> {
  _$PaymentReceiptModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiptFrom = null,
    Object? referenceId = freezed,
    Object? bussinessName = freezed,
    Object? bussinessAddress = freezed,
    Object? branchName = freezed,
    Object? printerConnection = freezed,
    Object? printerCustomFooter = freezed,
    Object? customer = freezed,
    Object? paid = null,
    Object? orderTotal = null,
    Object? subTotal = null,
    Object? tax = null,
    Object? paymentMethod = null,
    Object? qrCodeId = freezed,
    Object? branchId = freezed,
    Object? staffId = freezed,
    Object? staffName = freezed,
    Object? shipping = null,
    Object? discount = null,
    Object? discountId = freezed,
    Object? returnUrl = null,
    Object? products = null,
    Object? table = freezed,
    Object? createdAt = freezed,
    Object? isFromCart = freezed,
    Object? status = freezed,
    Object? transactionId = freezed,
    Object? statusPayment = freezed,
    Object? paymentReturnUrl = freezed,
    Object? priceType = freezed,
    Object? roundedTotal = freezed,
    Object? isRounded = freezed,
    Object? flag = freezed,
  }) {
    return _then(_value.copyWith(
      receiptFrom: null == receiptFrom
          ? _value.receiptFrom
          : receiptFrom // ignore: cast_nullable_to_non_nullable
              as ReceiptFromEnum,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      bussinessName: freezed == bussinessName
          ? _value.bussinessName
          : bussinessName // ignore: cast_nullable_to_non_nullable
              as String?,
      bussinessAddress: freezed == bussinessAddress
          ? _value.bussinessAddress
          : bussinessAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      printerConnection: freezed == printerConnection
          ? _value.printerConnection
          : printerConnection // ignore: cast_nullable_to_non_nullable
              as String?,
      printerCustomFooter: freezed == printerCustomFooter
          ? _value.printerCustomFooter
          : printerCustomFooter // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as double,
      orderTotal: null == orderTotal
          ? _value.orderTotal
          : orderTotal // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      qrCodeId: freezed == qrCodeId
          ? _value.qrCodeId
          : qrCodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String?,
      staffId: freezed == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String?,
      staffName: freezed == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String?,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      discountId: freezed == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as String?,
      returnUrl: null == returnUrl
          ? _value.returnUrl
          : returnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFromCart: freezed == isFromCart
          ? _value.isFromCart
          : isFromCart // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      statusPayment: freezed == statusPayment
          ? _value.statusPayment
          : statusPayment // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentReturnUrl: freezed == paymentReturnUrl
          ? _value.paymentReturnUrl
          : paymentReturnUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      priceType: freezed == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String?,
      roundedTotal: freezed == roundedTotal
          ? _value.roundedTotal
          : roundedTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      isRounded: freezed == isRounded
          ? _value.isRounded
          : isRounded // ignore: cast_nullable_to_non_nullable
              as bool?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentReceiptModelImplCopyWith<$Res>
    implements $PaymentReceiptModelCopyWith<$Res> {
  factory _$$PaymentReceiptModelImplCopyWith(_$PaymentReceiptModelImpl value,
          $Res Function(_$PaymentReceiptModelImpl) then) =
      __$$PaymentReceiptModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReceiptFromEnum receiptFrom,
      String? referenceId,
      String? bussinessName,
      String? bussinessAddress,
      String? branchName,
      String? printerConnection,
      String? printerCustomFooter,
      @JsonKey(name: 'customer') String? customer,
      double paid,
      @JsonKey(name: 'order_total') double orderTotal,
      @JsonKey(name: 'sub_total') double subTotal,
      @JsonKey(name: 'tax') double tax,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'qr_code_id') String? qrCodeId,
      @JsonKey(name: 'branch_id') String? branchId,
      @JsonKey(name: 'staff_id') String? staffId,
      @JsonKey(name: 'staff_name') String? staffName,
      @JsonKey(name: 'shipping') double shipping,
      @JsonKey(name: 'diskon') double discount,
      @JsonKey(name: 'discount_id') String? discountId,
      @JsonKey(name: 'return_url') String returnUrl,
      @JsonKey(name: 'product') List<ProductModel> products,
      String? table,
      DateTime? createdAt,
      bool? isFromCart,
      int? status,
      int? transactionId,
      int? statusPayment,
      String? paymentReturnUrl,
      String? priceType,
      String? roundedTotal,
      bool? isRounded,
      @JsonKey(name: 'flag') String? flag});
}

/// @nodoc
class __$$PaymentReceiptModelImplCopyWithImpl<$Res>
    extends _$PaymentReceiptModelCopyWithImpl<$Res, _$PaymentReceiptModelImpl>
    implements _$$PaymentReceiptModelImplCopyWith<$Res> {
  __$$PaymentReceiptModelImplCopyWithImpl(_$PaymentReceiptModelImpl _value,
      $Res Function(_$PaymentReceiptModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiptFrom = null,
    Object? referenceId = freezed,
    Object? bussinessName = freezed,
    Object? bussinessAddress = freezed,
    Object? branchName = freezed,
    Object? printerConnection = freezed,
    Object? printerCustomFooter = freezed,
    Object? customer = freezed,
    Object? paid = null,
    Object? orderTotal = null,
    Object? subTotal = null,
    Object? tax = null,
    Object? paymentMethod = null,
    Object? qrCodeId = freezed,
    Object? branchId = freezed,
    Object? staffId = freezed,
    Object? staffName = freezed,
    Object? shipping = null,
    Object? discount = null,
    Object? discountId = freezed,
    Object? returnUrl = null,
    Object? products = null,
    Object? table = freezed,
    Object? createdAt = freezed,
    Object? isFromCart = freezed,
    Object? status = freezed,
    Object? transactionId = freezed,
    Object? statusPayment = freezed,
    Object? paymentReturnUrl = freezed,
    Object? priceType = freezed,
    Object? roundedTotal = freezed,
    Object? isRounded = freezed,
    Object? flag = freezed,
  }) {
    return _then(_$PaymentReceiptModelImpl(
      receiptFrom: null == receiptFrom
          ? _value.receiptFrom
          : receiptFrom // ignore: cast_nullable_to_non_nullable
              as ReceiptFromEnum,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      bussinessName: freezed == bussinessName
          ? _value.bussinessName
          : bussinessName // ignore: cast_nullable_to_non_nullable
              as String?,
      bussinessAddress: freezed == bussinessAddress
          ? _value.bussinessAddress
          : bussinessAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      printerConnection: freezed == printerConnection
          ? _value.printerConnection
          : printerConnection // ignore: cast_nullable_to_non_nullable
              as String?,
      printerCustomFooter: freezed == printerCustomFooter
          ? _value.printerCustomFooter
          : printerCustomFooter // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as double,
      orderTotal: null == orderTotal
          ? _value.orderTotal
          : orderTotal // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      qrCodeId: freezed == qrCodeId
          ? _value.qrCodeId
          : qrCodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String?,
      staffId: freezed == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String?,
      staffName: freezed == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String?,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      discountId: freezed == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as String?,
      returnUrl: null == returnUrl
          ? _value.returnUrl
          : returnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFromCart: freezed == isFromCart
          ? _value.isFromCart
          : isFromCart // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      statusPayment: freezed == statusPayment
          ? _value.statusPayment
          : statusPayment // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentReturnUrl: freezed == paymentReturnUrl
          ? _value.paymentReturnUrl
          : paymentReturnUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      priceType: freezed == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String?,
      roundedTotal: freezed == roundedTotal
          ? _value.roundedTotal
          : roundedTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      isRounded: freezed == isRounded
          ? _value.isRounded
          : isRounded // ignore: cast_nullable_to_non_nullable
              as bool?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentReceiptModelImpl implements _PaymentReceiptModel {
  const _$PaymentReceiptModelImpl(
      {required this.receiptFrom,
      this.referenceId,
      this.bussinessName,
      this.bussinessAddress,
      this.branchName,
      this.printerConnection,
      this.printerCustomFooter,
      @JsonKey(name: 'customer') this.customer,
      required this.paid,
      @JsonKey(name: 'order_total') required this.orderTotal,
      @JsonKey(name: 'sub_total') required this.subTotal,
      @JsonKey(name: 'tax') required this.tax,
      @JsonKey(name: 'payment_method') required this.paymentMethod,
      @JsonKey(name: 'qr_code_id') this.qrCodeId,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'staff_id') this.staffId,
      @JsonKey(name: 'staff_name') this.staffName,
      @JsonKey(name: 'shipping') required this.shipping,
      @JsonKey(name: 'diskon') required this.discount,
      @JsonKey(name: 'discount_id') this.discountId,
      @JsonKey(name: 'return_url') this.returnUrl = 'pos',
      @JsonKey(name: 'product') final List<ProductModel> products = const [],
      this.table,
      this.createdAt,
      this.isFromCart,
      this.status,
      this.transactionId,
      this.statusPayment,
      this.paymentReturnUrl,
      this.priceType,
      this.roundedTotal,
      this.isRounded,
      @JsonKey(name: 'flag') this.flag})
      : _products = products;

  factory _$PaymentReceiptModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentReceiptModelImplFromJson(json);

  @override
  final ReceiptFromEnum receiptFrom;
  @override
  final String? referenceId;
// no nota
  @override
  final String? bussinessName;
  @override
  final String? bussinessAddress;
  @override
  final String? branchName;
  @override
  final String? printerConnection;
  @override
  final String? printerCustomFooter;
  @override
  @JsonKey(name: 'customer')
  final String? customer;
  @override
  final double paid;
  @override
  @JsonKey(name: 'order_total')
  final double orderTotal;
  @override
  @JsonKey(name: 'sub_total')
  final double subTotal;
  @override
  @JsonKey(name: 'tax')
  final double tax;
  @override
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  @JsonKey(name: 'qr_code_id')
  final String? qrCodeId;
  @override
  @JsonKey(name: 'branch_id')
  final String? branchId;
  @override
  @JsonKey(name: 'staff_id')
  final String? staffId;
  @override
  @JsonKey(name: 'staff_name')
  final String? staffName;
  @override
  @JsonKey(name: 'shipping')
  final double shipping;
  @override
  @JsonKey(name: 'diskon')
  final double discount;
  @override
  @JsonKey(name: 'discount_id')
  final String? discountId;
  @override
  @JsonKey(name: 'return_url')
  final String returnUrl;
  final List<ProductModel> _products;
  @override
  @JsonKey(name: 'product')
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final String? table;
  @override
  final DateTime? createdAt;
  @override
  final bool? isFromCart;
  @override
  final int? status;
  @override
  final int? transactionId;
  @override
  final int? statusPayment;
  @override
  final String? paymentReturnUrl;
  @override
  final String? priceType;
  @override
  final String? roundedTotal;
  @override
  final bool? isRounded;
  @override
  @JsonKey(name: 'flag')
  final String? flag;

  @override
  String toString() {
    return 'PaymentReceiptModel(receiptFrom: $receiptFrom, referenceId: $referenceId, bussinessName: $bussinessName, bussinessAddress: $bussinessAddress, branchName: $branchName, printerConnection: $printerConnection, printerCustomFooter: $printerCustomFooter, customer: $customer, paid: $paid, orderTotal: $orderTotal, subTotal: $subTotal, tax: $tax, paymentMethod: $paymentMethod, qrCodeId: $qrCodeId, branchId: $branchId, staffId: $staffId, staffName: $staffName, shipping: $shipping, discount: $discount, discountId: $discountId, returnUrl: $returnUrl, products: $products, table: $table, createdAt: $createdAt, isFromCart: $isFromCart, status: $status, transactionId: $transactionId, statusPayment: $statusPayment, paymentReturnUrl: $paymentReturnUrl, priceType: $priceType, roundedTotal: $roundedTotal, isRounded: $isRounded, flag: $flag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentReceiptModelImpl &&
            (identical(other.receiptFrom, receiptFrom) ||
                other.receiptFrom == receiptFrom) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.bussinessName, bussinessName) ||
                other.bussinessName == bussinessName) &&
            (identical(other.bussinessAddress, bussinessAddress) ||
                other.bussinessAddress == bussinessAddress) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.printerConnection, printerConnection) ||
                other.printerConnection == printerConnection) &&
            (identical(other.printerCustomFooter, printerCustomFooter) ||
                other.printerCustomFooter == printerCustomFooter) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.orderTotal, orderTotal) ||
                other.orderTotal == orderTotal) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.qrCodeId, qrCodeId) ||
                other.qrCodeId == qrCodeId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.staffName, staffName) ||
                other.staffName == staffName) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountId, discountId) ||
                other.discountId == discountId) &&
            (identical(other.returnUrl, returnUrl) ||
                other.returnUrl == returnUrl) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isFromCart, isFromCart) ||
                other.isFromCart == isFromCart) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.statusPayment, statusPayment) ||
                other.statusPayment == statusPayment) &&
            (identical(other.paymentReturnUrl, paymentReturnUrl) ||
                other.paymentReturnUrl == paymentReturnUrl) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.roundedTotal, roundedTotal) ||
                other.roundedTotal == roundedTotal) &&
            (identical(other.isRounded, isRounded) ||
                other.isRounded == isRounded) &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        receiptFrom,
        referenceId,
        bussinessName,
        bussinessAddress,
        branchName,
        printerConnection,
        printerCustomFooter,
        customer,
        paid,
        orderTotal,
        subTotal,
        tax,
        paymentMethod,
        qrCodeId,
        branchId,
        staffId,
        staffName,
        shipping,
        discount,
        discountId,
        returnUrl,
        const DeepCollectionEquality().hash(_products),
        table,
        createdAt,
        isFromCart,
        status,
        transactionId,
        statusPayment,
        paymentReturnUrl,
        priceType,
        roundedTotal,
        isRounded,
        flag
      ]);

  /// Create a copy of PaymentReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentReceiptModelImplCopyWith<_$PaymentReceiptModelImpl> get copyWith =>
      __$$PaymentReceiptModelImplCopyWithImpl<_$PaymentReceiptModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentReceiptModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentReceiptModel implements PaymentReceiptModel {
  const factory _PaymentReceiptModel(
      {required final ReceiptFromEnum receiptFrom,
      final String? referenceId,
      final String? bussinessName,
      final String? bussinessAddress,
      final String? branchName,
      final String? printerConnection,
      final String? printerCustomFooter,
      @JsonKey(name: 'customer') final String? customer,
      required final double paid,
      @JsonKey(name: 'order_total') required final double orderTotal,
      @JsonKey(name: 'sub_total') required final double subTotal,
      @JsonKey(name: 'tax') required final double tax,
      @JsonKey(name: 'payment_method') required final String paymentMethod,
      @JsonKey(name: 'qr_code_id') final String? qrCodeId,
      @JsonKey(name: 'branch_id') final String? branchId,
      @JsonKey(name: 'staff_id') final String? staffId,
      @JsonKey(name: 'staff_name') final String? staffName,
      @JsonKey(name: 'shipping') required final double shipping,
      @JsonKey(name: 'diskon') required final double discount,
      @JsonKey(name: 'discount_id') final String? discountId,
      @JsonKey(name: 'return_url') final String returnUrl,
      @JsonKey(name: 'product') final List<ProductModel> products,
      final String? table,
      final DateTime? createdAt,
      final bool? isFromCart,
      final int? status,
      final int? transactionId,
      final int? statusPayment,
      final String? paymentReturnUrl,
      final String? priceType,
      final String? roundedTotal,
      final bool? isRounded,
      @JsonKey(name: 'flag') final String? flag}) = _$PaymentReceiptModelImpl;

  factory _PaymentReceiptModel.fromJson(Map<String, dynamic> json) =
      _$PaymentReceiptModelImpl.fromJson;

  @override
  ReceiptFromEnum get receiptFrom;
  @override
  String? get referenceId; // no nota
  @override
  String? get bussinessName;
  @override
  String? get bussinessAddress;
  @override
  String? get branchName;
  @override
  String? get printerConnection;
  @override
  String? get printerCustomFooter;
  @override
  @JsonKey(name: 'customer')
  String? get customer;
  @override
  double get paid;
  @override
  @JsonKey(name: 'order_total')
  double get orderTotal;
  @override
  @JsonKey(name: 'sub_total')
  double get subTotal;
  @override
  @JsonKey(name: 'tax')
  double get tax;
  @override
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @override
  @JsonKey(name: 'qr_code_id')
  String? get qrCodeId;
  @override
  @JsonKey(name: 'branch_id')
  String? get branchId;
  @override
  @JsonKey(name: 'staff_id')
  String? get staffId;
  @override
  @JsonKey(name: 'staff_name')
  String? get staffName;
  @override
  @JsonKey(name: 'shipping')
  double get shipping;
  @override
  @JsonKey(name: 'diskon')
  double get discount;
  @override
  @JsonKey(name: 'discount_id')
  String? get discountId;
  @override
  @JsonKey(name: 'return_url')
  String get returnUrl;
  @override
  @JsonKey(name: 'product')
  List<ProductModel> get products;
  @override
  String? get table;
  @override
  DateTime? get createdAt;
  @override
  bool? get isFromCart;
  @override
  int? get status;
  @override
  int? get transactionId;
  @override
  int? get statusPayment;
  @override
  String? get paymentReturnUrl;
  @override
  String? get priceType;
  @override
  String? get roundedTotal;
  @override
  bool? get isRounded;
  @override
  @JsonKey(name: 'flag')
  String? get flag;

  /// Create a copy of PaymentReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentReceiptModelImplCopyWith<_$PaymentReceiptModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
