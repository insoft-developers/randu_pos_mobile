// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentResponseData _$PaymentResponseDataFromJson(Map<String, dynamic> json) {
  return _PaymentResponseData.fromJson(json);
}

/// @nodoc
mixin _$PaymentResponseData {
  @JsonKey(name: 'reference')
  String? get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  dynamic get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid')
  int? get paid => throw _privateConstructorUsedError;
  @JsonKey(name: 'cust_name')
  dynamic get custName => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  int? get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'diskon')
  int? get diskon => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping')
  int? get shipping => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_total')
  int? get orderTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax')
  int? get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'detail')
  String? get detail => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentUrl')
  String? get paymentUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  String? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'qrString')
  String? get qrString => throw _privateConstructorUsedError;

  /// Serializes this PaymentResponseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentResponseDataCopyWith<PaymentResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentResponseDataCopyWith<$Res> {
  factory $PaymentResponseDataCopyWith(
          PaymentResponseData value, $Res Function(PaymentResponseData) then) =
      _$PaymentResponseDataCopyWithImpl<$Res, PaymentResponseData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reference') String? reference,
      @JsonKey(name: 'customer_id') dynamic customerId,
      @JsonKey(name: 'paid') int? paid,
      @JsonKey(name: 'cust_name') dynamic custName,
      @JsonKey(name: 'status') int? status,
      @JsonKey(name: 'payment_status') int? paymentStatus,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'diskon') int? diskon,
      @JsonKey(name: 'shipping') int? shipping,
      @JsonKey(name: 'order_total') int? orderTotal,
      @JsonKey(name: 'tax') int? tax,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'detail') String? detail,
      @JsonKey(name: 'paymentUrl') String? paymentUrl,
      @JsonKey(name: 'amount') String? amount,
      @JsonKey(name: 'qrString') String? qrString});
}

/// @nodoc
class _$PaymentResponseDataCopyWithImpl<$Res, $Val extends PaymentResponseData>
    implements $PaymentResponseDataCopyWith<$Res> {
  _$PaymentResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = freezed,
    Object? customerId = freezed,
    Object? paid = freezed,
    Object? custName = freezed,
    Object? status = freezed,
    Object? paymentStatus = freezed,
    Object? paymentMethod = freezed,
    Object? userId = freezed,
    Object? diskon = freezed,
    Object? shipping = freezed,
    Object? orderTotal = freezed,
    Object? tax = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? detail = freezed,
    Object? paymentUrl = freezed,
    Object? amount = freezed,
    Object? qrString = freezed,
  }) {
    return _then(_value.copyWith(
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as int?,
      custName: freezed == custName
          ? _value.custName
          : custName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      diskon: freezed == diskon
          ? _value.diskon
          : diskon // ignore: cast_nullable_to_non_nullable
              as int?,
      shipping: freezed == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as int?,
      orderTotal: freezed == orderTotal
          ? _value.orderTotal
          : orderTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentUrl: freezed == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      qrString: freezed == qrString
          ? _value.qrString
          : qrString // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentResponseDataImplCopyWith<$Res>
    implements $PaymentResponseDataCopyWith<$Res> {
  factory _$$PaymentResponseDataImplCopyWith(_$PaymentResponseDataImpl value,
          $Res Function(_$PaymentResponseDataImpl) then) =
      __$$PaymentResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reference') String? reference,
      @JsonKey(name: 'customer_id') dynamic customerId,
      @JsonKey(name: 'paid') int? paid,
      @JsonKey(name: 'cust_name') dynamic custName,
      @JsonKey(name: 'status') int? status,
      @JsonKey(name: 'payment_status') int? paymentStatus,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'diskon') int? diskon,
      @JsonKey(name: 'shipping') int? shipping,
      @JsonKey(name: 'order_total') int? orderTotal,
      @JsonKey(name: 'tax') int? tax,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'detail') String? detail,
      @JsonKey(name: 'paymentUrl') String? paymentUrl,
      @JsonKey(name: 'amount') String? amount,
      @JsonKey(name: 'qrString') String? qrString});
}

/// @nodoc
class __$$PaymentResponseDataImplCopyWithImpl<$Res>
    extends _$PaymentResponseDataCopyWithImpl<$Res, _$PaymentResponseDataImpl>
    implements _$$PaymentResponseDataImplCopyWith<$Res> {
  __$$PaymentResponseDataImplCopyWithImpl(_$PaymentResponseDataImpl _value,
      $Res Function(_$PaymentResponseDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = freezed,
    Object? customerId = freezed,
    Object? paid = freezed,
    Object? custName = freezed,
    Object? status = freezed,
    Object? paymentStatus = freezed,
    Object? paymentMethod = freezed,
    Object? userId = freezed,
    Object? diskon = freezed,
    Object? shipping = freezed,
    Object? orderTotal = freezed,
    Object? tax = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? detail = freezed,
    Object? paymentUrl = freezed,
    Object? amount = freezed,
    Object? qrString = freezed,
  }) {
    return _then(_$PaymentResponseDataImpl(
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as int?,
      custName: freezed == custName
          ? _value.custName
          : custName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      diskon: freezed == diskon
          ? _value.diskon
          : diskon // ignore: cast_nullable_to_non_nullable
              as int?,
      shipping: freezed == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as int?,
      orderTotal: freezed == orderTotal
          ? _value.orderTotal
          : orderTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentUrl: freezed == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      qrString: freezed == qrString
          ? _value.qrString
          : qrString // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 13, adapterName: 'PaymentResponseDataAdapter')
class _$PaymentResponseDataImpl implements _PaymentResponseData {
  const _$PaymentResponseDataImpl(
      {@JsonKey(name: 'reference') this.reference,
      @JsonKey(name: 'customer_id') this.customerId,
      @JsonKey(name: 'paid') this.paid,
      @JsonKey(name: 'cust_name') this.custName,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'payment_status') this.paymentStatus,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'diskon') this.diskon,
      @JsonKey(name: 'shipping') this.shipping,
      @JsonKey(name: 'order_total') this.orderTotal,
      @JsonKey(name: 'tax') this.tax,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'detail') this.detail,
      @JsonKey(name: 'paymentUrl') this.paymentUrl,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'qrString') this.qrString});

  factory _$PaymentResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentResponseDataImplFromJson(json);

  @override
  @JsonKey(name: 'reference')
  final String? reference;
  @override
  @JsonKey(name: 'customer_id')
  final dynamic customerId;
  @override
  @JsonKey(name: 'paid')
  final int? paid;
  @override
  @JsonKey(name: 'cust_name')
  final dynamic custName;
  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'payment_status')
  final int? paymentStatus;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'diskon')
  final int? diskon;
  @override
  @JsonKey(name: 'shipping')
  final int? shipping;
  @override
  @JsonKey(name: 'order_total')
  final int? orderTotal;
  @override
  @JsonKey(name: 'tax')
  final int? tax;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'detail')
  final String? detail;
  @override
  @JsonKey(name: 'paymentUrl')
  final String? paymentUrl;
  @override
  @JsonKey(name: 'amount')
  final String? amount;
  @override
  @JsonKey(name: 'qrString')
  final String? qrString;

  @override
  String toString() {
    return 'PaymentResponseData(reference: $reference, customerId: $customerId, paid: $paid, custName: $custName, status: $status, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, userId: $userId, diskon: $diskon, shipping: $shipping, orderTotal: $orderTotal, tax: $tax, updatedAt: $updatedAt, createdAt: $createdAt, id: $id, detail: $detail, paymentUrl: $paymentUrl, amount: $amount, qrString: $qrString)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentResponseDataImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            const DeepCollectionEquality()
                .equals(other.customerId, customerId) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            const DeepCollectionEquality().equals(other.custName, custName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.diskon, diskon) || other.diskon == diskon) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.orderTotal, orderTotal) ||
                other.orderTotal == orderTotal) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.qrString, qrString) ||
                other.qrString == qrString));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        reference,
        const DeepCollectionEquality().hash(customerId),
        paid,
        const DeepCollectionEquality().hash(custName),
        status,
        paymentStatus,
        paymentMethod,
        userId,
        diskon,
        shipping,
        orderTotal,
        tax,
        updatedAt,
        createdAt,
        id,
        detail,
        paymentUrl,
        amount,
        qrString
      ]);

  /// Create a copy of PaymentResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentResponseDataImplCopyWith<_$PaymentResponseDataImpl> get copyWith =>
      __$$PaymentResponseDataImplCopyWithImpl<_$PaymentResponseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentResponseDataImplToJson(
      this,
    );
  }
}

abstract class _PaymentResponseData implements PaymentResponseData {
  const factory _PaymentResponseData(
          {@JsonKey(name: 'reference') final String? reference,
          @JsonKey(name: 'customer_id') final dynamic customerId,
          @JsonKey(name: 'paid') final int? paid,
          @JsonKey(name: 'cust_name') final dynamic custName,
          @JsonKey(name: 'status') final int? status,
          @JsonKey(name: 'payment_status') final int? paymentStatus,
          @JsonKey(name: 'payment_method') final String? paymentMethod,
          @JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'diskon') final int? diskon,
          @JsonKey(name: 'shipping') final int? shipping,
          @JsonKey(name: 'order_total') final int? orderTotal,
          @JsonKey(name: 'tax') final int? tax,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'detail') final String? detail,
          @JsonKey(name: 'paymentUrl') final String? paymentUrl,
          @JsonKey(name: 'amount') final String? amount,
          @JsonKey(name: 'qrString') final String? qrString}) =
      _$PaymentResponseDataImpl;

  factory _PaymentResponseData.fromJson(Map<String, dynamic> json) =
      _$PaymentResponseDataImpl.fromJson;

  @override
  @JsonKey(name: 'reference')
  String? get reference;
  @override
  @JsonKey(name: 'customer_id')
  dynamic get customerId;
  @override
  @JsonKey(name: 'paid')
  int? get paid;
  @override
  @JsonKey(name: 'cust_name')
  dynamic get custName;
  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'payment_status')
  int? get paymentStatus;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'diskon')
  int? get diskon;
  @override
  @JsonKey(name: 'shipping')
  int? get shipping;
  @override
  @JsonKey(name: 'order_total')
  int? get orderTotal;
  @override
  @JsonKey(name: 'tax')
  int? get tax;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'detail')
  String? get detail;
  @override
  @JsonKey(name: 'paymentUrl')
  String? get paymentUrl;
  @override
  @JsonKey(name: 'amount')
  String? get amount;
  @override
  @JsonKey(name: 'qrString')
  String? get qrString;

  /// Create a copy of PaymentResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentResponseDataImplCopyWith<_$PaymentResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
