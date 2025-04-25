// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_management_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionManagementModel _$TransactionManagementModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionManagementModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionManagementModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference')
  String? get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cust_name')
  String? get custName => throw _privateConstructorUsedError;
  @JsonKey(name: 'cust_phone')
  String? get custPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'cust_email')
  String? get custEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'cust_kecamatan')
  String? get custKecamatan => throw _privateConstructorUsedError;
  @JsonKey(name: 'cust_kelurahan')
  String? get custKelurahan => throw _privateConstructorUsedError;
  @JsonKey(name: 'cust_alamat')
  String? get custAlamat => throw _privateConstructorUsedError;
  @JsonKey(name: 'detail')
  String? get detail => throw _privateConstructorUsedError;
  @JsonKey(name: 'products')
  List<ProductModel>? get products => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid')
  int? get paid => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  int? get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_at')
  DateTime? get paymentAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_return_url')
  String? get paymentReturnUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_codes_id')
  int? get qrCodesId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff_id')
  int? get staffId => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff_name')
  String? get staffName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sync_status')
  int? get syncStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'created')
  DateTime? get created => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'diskon')
  int? get diskon => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping')
  int? get shipping => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_total')
  int? get orderTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax')
  double? get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'flip_ref')
  String? get flipRef => throw _privateConstructorUsedError;
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'table')
  String? get table => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_type')
  String? get priceType => throw _privateConstructorUsedError;

  /// Serializes this TransactionManagementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionManagementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionManagementModelCopyWith<TransactionManagementModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionManagementModelCopyWith<$Res> {
  factory $TransactionManagementModelCopyWith(TransactionManagementModel value,
          $Res Function(TransactionManagementModel) then) =
      _$TransactionManagementModelCopyWithImpl<$Res,
          TransactionManagementModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'reference') String? reference,
      @JsonKey(name: 'date') DateTime? date,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'cust_name') String? custName,
      @JsonKey(name: 'cust_phone') String? custPhone,
      @JsonKey(name: 'cust_email') String? custEmail,
      @JsonKey(name: 'cust_kecamatan') String? custKecamatan,
      @JsonKey(name: 'cust_kelurahan') String? custKelurahan,
      @JsonKey(name: 'cust_alamat') String? custAlamat,
      @JsonKey(name: 'detail') String? detail,
      @JsonKey(name: 'products') List<ProductModel>? products,
      @JsonKey(name: 'paid') int? paid,
      @JsonKey(name: 'status') int? status,
      @JsonKey(name: 'payment_status') int? paymentStatus,
      @JsonKey(name: 'payment_at') DateTime? paymentAt,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'payment_return_url') String? paymentReturnUrl,
      @JsonKey(name: 'qr_codes_id') int? qrCodesId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'staff_id') int? staffId,
      @JsonKey(name: 'staff_name') String? staffName,
      @JsonKey(name: 'sync_status') int? syncStatus,
      @JsonKey(name: 'created') DateTime? created,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'diskon') int? diskon,
      @JsonKey(name: 'shipping') int? shipping,
      @JsonKey(name: 'order_total') int? orderTotal,
      @JsonKey(name: 'tax') double? tax,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'flip_ref') String? flipRef,
      @JsonKey(name: 'note') String? note,
      @JsonKey(name: 'table') String? table,
      @JsonKey(name: 'price_type') String? priceType});
}

/// @nodoc
class _$TransactionManagementModelCopyWithImpl<$Res,
        $Val extends TransactionManagementModel>
    implements $TransactionManagementModelCopyWith<$Res> {
  _$TransactionManagementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionManagementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? reference = freezed,
    Object? date = freezed,
    Object? customerId = freezed,
    Object? custName = freezed,
    Object? custPhone = freezed,
    Object? custEmail = freezed,
    Object? custKecamatan = freezed,
    Object? custKelurahan = freezed,
    Object? custAlamat = freezed,
    Object? detail = freezed,
    Object? products = freezed,
    Object? paid = freezed,
    Object? status = freezed,
    Object? paymentStatus = freezed,
    Object? paymentAt = freezed,
    Object? paymentMethod = freezed,
    Object? paymentReturnUrl = freezed,
    Object? qrCodesId = freezed,
    Object? branchId = freezed,
    Object? staffId = freezed,
    Object? staffName = freezed,
    Object? syncStatus = freezed,
    Object? created = freezed,
    Object? userId = freezed,
    Object? diskon = freezed,
    Object? shipping = freezed,
    Object? orderTotal = freezed,
    Object? tax = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? flipRef = freezed,
    Object? note = freezed,
    Object? table = freezed,
    Object? priceType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      custName: freezed == custName
          ? _value.custName
          : custName // ignore: cast_nullable_to_non_nullable
              as String?,
      custPhone: freezed == custPhone
          ? _value.custPhone
          : custPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      custEmail: freezed == custEmail
          ? _value.custEmail
          : custEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      custKecamatan: freezed == custKecamatan
          ? _value.custKecamatan
          : custKecamatan // ignore: cast_nullable_to_non_nullable
              as String?,
      custKelurahan: freezed == custKelurahan
          ? _value.custKelurahan
          : custKelurahan // ignore: cast_nullable_to_non_nullable
              as String?,
      custAlamat: freezed == custAlamat
          ? _value.custAlamat
          : custAlamat // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentAt: freezed == paymentAt
          ? _value.paymentAt
          : paymentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReturnUrl: freezed == paymentReturnUrl
          ? _value.paymentReturnUrl
          : paymentReturnUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodesId: freezed == qrCodesId
          ? _value.qrCodesId
          : qrCodesId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      staffId: freezed == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as int?,
      staffName: freezed == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String?,
      syncStatus: freezed == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      flipRef: freezed == flipRef
          ? _value.flipRef
          : flipRef // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String?,
      priceType: freezed == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionManagementModelImplCopyWith<$Res>
    implements $TransactionManagementModelCopyWith<$Res> {
  factory _$$TransactionManagementModelImplCopyWith(
          _$TransactionManagementModelImpl value,
          $Res Function(_$TransactionManagementModelImpl) then) =
      __$$TransactionManagementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'reference') String? reference,
      @JsonKey(name: 'date') DateTime? date,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'cust_name') String? custName,
      @JsonKey(name: 'cust_phone') String? custPhone,
      @JsonKey(name: 'cust_email') String? custEmail,
      @JsonKey(name: 'cust_kecamatan') String? custKecamatan,
      @JsonKey(name: 'cust_kelurahan') String? custKelurahan,
      @JsonKey(name: 'cust_alamat') String? custAlamat,
      @JsonKey(name: 'detail') String? detail,
      @JsonKey(name: 'products') List<ProductModel>? products,
      @JsonKey(name: 'paid') int? paid,
      @JsonKey(name: 'status') int? status,
      @JsonKey(name: 'payment_status') int? paymentStatus,
      @JsonKey(name: 'payment_at') DateTime? paymentAt,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'payment_return_url') String? paymentReturnUrl,
      @JsonKey(name: 'qr_codes_id') int? qrCodesId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'staff_id') int? staffId,
      @JsonKey(name: 'staff_name') String? staffName,
      @JsonKey(name: 'sync_status') int? syncStatus,
      @JsonKey(name: 'created') DateTime? created,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'diskon') int? diskon,
      @JsonKey(name: 'shipping') int? shipping,
      @JsonKey(name: 'order_total') int? orderTotal,
      @JsonKey(name: 'tax') double? tax,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'flip_ref') String? flipRef,
      @JsonKey(name: 'note') String? note,
      @JsonKey(name: 'table') String? table,
      @JsonKey(name: 'price_type') String? priceType});
}

/// @nodoc
class __$$TransactionManagementModelImplCopyWithImpl<$Res>
    extends _$TransactionManagementModelCopyWithImpl<$Res,
        _$TransactionManagementModelImpl>
    implements _$$TransactionManagementModelImplCopyWith<$Res> {
  __$$TransactionManagementModelImplCopyWithImpl(
      _$TransactionManagementModelImpl _value,
      $Res Function(_$TransactionManagementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionManagementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? reference = freezed,
    Object? date = freezed,
    Object? customerId = freezed,
    Object? custName = freezed,
    Object? custPhone = freezed,
    Object? custEmail = freezed,
    Object? custKecamatan = freezed,
    Object? custKelurahan = freezed,
    Object? custAlamat = freezed,
    Object? detail = freezed,
    Object? products = freezed,
    Object? paid = freezed,
    Object? status = freezed,
    Object? paymentStatus = freezed,
    Object? paymentAt = freezed,
    Object? paymentMethod = freezed,
    Object? paymentReturnUrl = freezed,
    Object? qrCodesId = freezed,
    Object? branchId = freezed,
    Object? staffId = freezed,
    Object? staffName = freezed,
    Object? syncStatus = freezed,
    Object? created = freezed,
    Object? userId = freezed,
    Object? diskon = freezed,
    Object? shipping = freezed,
    Object? orderTotal = freezed,
    Object? tax = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? flipRef = freezed,
    Object? note = freezed,
    Object? table = freezed,
    Object? priceType = freezed,
  }) {
    return _then(_$TransactionManagementModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      custName: freezed == custName
          ? _value.custName
          : custName // ignore: cast_nullable_to_non_nullable
              as String?,
      custPhone: freezed == custPhone
          ? _value.custPhone
          : custPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      custEmail: freezed == custEmail
          ? _value.custEmail
          : custEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      custKecamatan: freezed == custKecamatan
          ? _value.custKecamatan
          : custKecamatan // ignore: cast_nullable_to_non_nullable
              as String?,
      custKelurahan: freezed == custKelurahan
          ? _value.custKelurahan
          : custKelurahan // ignore: cast_nullable_to_non_nullable
              as String?,
      custAlamat: freezed == custAlamat
          ? _value.custAlamat
          : custAlamat // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentAt: freezed == paymentAt
          ? _value.paymentAt
          : paymentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReturnUrl: freezed == paymentReturnUrl
          ? _value.paymentReturnUrl
          : paymentReturnUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodesId: freezed == qrCodesId
          ? _value.qrCodesId
          : qrCodesId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      staffId: freezed == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as int?,
      staffName: freezed == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String?,
      syncStatus: freezed == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      flipRef: freezed == flipRef
          ? _value.flipRef
          : flipRef // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String?,
      priceType: freezed == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionManagementModelImpl extends _TransactionManagementModel {
  _$TransactionManagementModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'reference') this.reference,
      @JsonKey(name: 'date') this.date,
      @JsonKey(name: 'customer_id') this.customerId,
      @JsonKey(name: 'cust_name') this.custName,
      @JsonKey(name: 'cust_phone') this.custPhone,
      @JsonKey(name: 'cust_email') this.custEmail,
      @JsonKey(name: 'cust_kecamatan') this.custKecamatan,
      @JsonKey(name: 'cust_kelurahan') this.custKelurahan,
      @JsonKey(name: 'cust_alamat') this.custAlamat,
      @JsonKey(name: 'detail') this.detail,
      @JsonKey(name: 'products') final List<ProductModel>? products,
      @JsonKey(name: 'paid') this.paid,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'payment_status') this.paymentStatus,
      @JsonKey(name: 'payment_at') this.paymentAt,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      @JsonKey(name: 'payment_return_url') this.paymentReturnUrl,
      @JsonKey(name: 'qr_codes_id') this.qrCodesId,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'staff_id') this.staffId,
      @JsonKey(name: 'staff_name') this.staffName,
      @JsonKey(name: 'sync_status') this.syncStatus,
      @JsonKey(name: 'created') this.created,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'diskon') this.diskon,
      @JsonKey(name: 'shipping') this.shipping,
      @JsonKey(name: 'order_total') this.orderTotal,
      @JsonKey(name: 'tax') this.tax,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'flip_ref') this.flipRef,
      @JsonKey(name: 'note') this.note,
      @JsonKey(name: 'table') this.table,
      @JsonKey(name: 'price_type') this.priceType})
      : _products = products,
        super._();

  factory _$TransactionManagementModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TransactionManagementModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'reference')
  final String? reference;
  @override
  @JsonKey(name: 'date')
  final DateTime? date;
  @override
  @JsonKey(name: 'customer_id')
  final int? customerId;
  @override
  @JsonKey(name: 'cust_name')
  final String? custName;
  @override
  @JsonKey(name: 'cust_phone')
  final String? custPhone;
  @override
  @JsonKey(name: 'cust_email')
  final String? custEmail;
  @override
  @JsonKey(name: 'cust_kecamatan')
  final String? custKecamatan;
  @override
  @JsonKey(name: 'cust_kelurahan')
  final String? custKelurahan;
  @override
  @JsonKey(name: 'cust_alamat')
  final String? custAlamat;
  @override
  @JsonKey(name: 'detail')
  final String? detail;
  final List<ProductModel>? _products;
  @override
  @JsonKey(name: 'products')
  List<ProductModel>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'paid')
  final int? paid;
  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'payment_status')
  final int? paymentStatus;
  @override
  @JsonKey(name: 'payment_at')
  final DateTime? paymentAt;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  @JsonKey(name: 'payment_return_url')
  final String? paymentReturnUrl;
  @override
  @JsonKey(name: 'qr_codes_id')
  final int? qrCodesId;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'staff_id')
  final int? staffId;
  @override
  @JsonKey(name: 'staff_name')
  final String? staffName;
  @override
  @JsonKey(name: 'sync_status')
  final int? syncStatus;
  @override
  @JsonKey(name: 'created')
  final DateTime? created;
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
  final double? tax;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'flip_ref')
  final String? flipRef;
  @override
  @JsonKey(name: 'note')
  final String? note;
  @override
  @JsonKey(name: 'table')
  final String? table;
  @override
  @JsonKey(name: 'price_type')
  final String? priceType;

  @override
  String toString() {
    return 'TransactionManagementModel(id: $id, reference: $reference, date: $date, customerId: $customerId, custName: $custName, custPhone: $custPhone, custEmail: $custEmail, custKecamatan: $custKecamatan, custKelurahan: $custKelurahan, custAlamat: $custAlamat, detail: $detail, products: $products, paid: $paid, status: $status, paymentStatus: $paymentStatus, paymentAt: $paymentAt, paymentMethod: $paymentMethod, paymentReturnUrl: $paymentReturnUrl, qrCodesId: $qrCodesId, branchId: $branchId, staffId: $staffId, staffName: $staffName, syncStatus: $syncStatus, created: $created, userId: $userId, diskon: $diskon, shipping: $shipping, orderTotal: $orderTotal, tax: $tax, createdAt: $createdAt, updatedAt: $updatedAt, flipRef: $flipRef, note: $note, table: $table, priceType: $priceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionManagementModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.custName, custName) ||
                other.custName == custName) &&
            (identical(other.custPhone, custPhone) ||
                other.custPhone == custPhone) &&
            (identical(other.custEmail, custEmail) ||
                other.custEmail == custEmail) &&
            (identical(other.custKecamatan, custKecamatan) ||
                other.custKecamatan == custKecamatan) &&
            (identical(other.custKelurahan, custKelurahan) ||
                other.custKelurahan == custKelurahan) &&
            (identical(other.custAlamat, custAlamat) ||
                other.custAlamat == custAlamat) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentAt, paymentAt) ||
                other.paymentAt == paymentAt) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentReturnUrl, paymentReturnUrl) ||
                other.paymentReturnUrl == paymentReturnUrl) &&
            (identical(other.qrCodesId, qrCodesId) ||
                other.qrCodesId == qrCodesId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.staffName, staffName) ||
                other.staffName == staffName) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.diskon, diskon) || other.diskon == diskon) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.orderTotal, orderTotal) ||
                other.orderTotal == orderTotal) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.flipRef, flipRef) || other.flipRef == flipRef) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        reference,
        date,
        customerId,
        custName,
        custPhone,
        custEmail,
        custKecamatan,
        custKelurahan,
        custAlamat,
        detail,
        const DeepCollectionEquality().hash(_products),
        paid,
        status,
        paymentStatus,
        paymentAt,
        paymentMethod,
        paymentReturnUrl,
        qrCodesId,
        branchId,
        staffId,
        staffName,
        syncStatus,
        created,
        userId,
        diskon,
        shipping,
        orderTotal,
        tax,
        createdAt,
        updatedAt,
        flipRef,
        note,
        table,
        priceType
      ]);

  /// Create a copy of TransactionManagementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionManagementModelImplCopyWith<_$TransactionManagementModelImpl>
      get copyWith => __$$TransactionManagementModelImplCopyWithImpl<
          _$TransactionManagementModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionManagementModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionManagementModel extends TransactionManagementModel {
  factory _TransactionManagementModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'reference') final String? reference,
          @JsonKey(name: 'date') final DateTime? date,
          @JsonKey(name: 'customer_id') final int? customerId,
          @JsonKey(name: 'cust_name') final String? custName,
          @JsonKey(name: 'cust_phone') final String? custPhone,
          @JsonKey(name: 'cust_email') final String? custEmail,
          @JsonKey(name: 'cust_kecamatan') final String? custKecamatan,
          @JsonKey(name: 'cust_kelurahan') final String? custKelurahan,
          @JsonKey(name: 'cust_alamat') final String? custAlamat,
          @JsonKey(name: 'detail') final String? detail,
          @JsonKey(name: 'products') final List<ProductModel>? products,
          @JsonKey(name: 'paid') final int? paid,
          @JsonKey(name: 'status') final int? status,
          @JsonKey(name: 'payment_status') final int? paymentStatus,
          @JsonKey(name: 'payment_at') final DateTime? paymentAt,
          @JsonKey(name: 'payment_method') final String? paymentMethod,
          @JsonKey(name: 'payment_return_url') final String? paymentReturnUrl,
          @JsonKey(name: 'qr_codes_id') final int? qrCodesId,
          @JsonKey(name: 'branch_id') final int? branchId,
          @JsonKey(name: 'staff_id') final int? staffId,
          @JsonKey(name: 'staff_name') final String? staffName,
          @JsonKey(name: 'sync_status') final int? syncStatus,
          @JsonKey(name: 'created') final DateTime? created,
          @JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'diskon') final int? diskon,
          @JsonKey(name: 'shipping') final int? shipping,
          @JsonKey(name: 'order_total') final int? orderTotal,
          @JsonKey(name: 'tax') final double? tax,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt,
          @JsonKey(name: 'flip_ref') final String? flipRef,
          @JsonKey(name: 'note') final String? note,
          @JsonKey(name: 'table') final String? table,
          @JsonKey(name: 'price_type') final String? priceType}) =
      _$TransactionManagementModelImpl;
  _TransactionManagementModel._() : super._();

  factory _TransactionManagementModel.fromJson(Map<String, dynamic> json) =
      _$TransactionManagementModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'reference')
  String? get reference;
  @override
  @JsonKey(name: 'date')
  DateTime? get date;
  @override
  @JsonKey(name: 'customer_id')
  int? get customerId;
  @override
  @JsonKey(name: 'cust_name')
  String? get custName;
  @override
  @JsonKey(name: 'cust_phone')
  String? get custPhone;
  @override
  @JsonKey(name: 'cust_email')
  String? get custEmail;
  @override
  @JsonKey(name: 'cust_kecamatan')
  String? get custKecamatan;
  @override
  @JsonKey(name: 'cust_kelurahan')
  String? get custKelurahan;
  @override
  @JsonKey(name: 'cust_alamat')
  String? get custAlamat;
  @override
  @JsonKey(name: 'detail')
  String? get detail;
  @override
  @JsonKey(name: 'products')
  List<ProductModel>? get products;
  @override
  @JsonKey(name: 'paid')
  int? get paid;
  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'payment_status')
  int? get paymentStatus;
  @override
  @JsonKey(name: 'payment_at')
  DateTime? get paymentAt;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @override
  @JsonKey(name: 'payment_return_url')
  String? get paymentReturnUrl;
  @override
  @JsonKey(name: 'qr_codes_id')
  int? get qrCodesId;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'staff_id')
  int? get staffId;
  @override
  @JsonKey(name: 'staff_name')
  String? get staffName;
  @override
  @JsonKey(name: 'sync_status')
  int? get syncStatus;
  @override
  @JsonKey(name: 'created')
  DateTime? get created;
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
  double? get tax;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'flip_ref')
  String? get flipRef;
  @override
  @JsonKey(name: 'note')
  String? get note;
  @override
  @JsonKey(name: 'table')
  String? get table;
  @override
  @JsonKey(name: 'price_type')
  String? get priceType;

  /// Create a copy of TransactionManagementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionManagementModelImplCopyWith<_$TransactionManagementModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
