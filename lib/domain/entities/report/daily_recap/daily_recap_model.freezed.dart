// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_recap_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyRecapModel _$DailyRecapModelFromJson(Map<String, dynamic> json) {
  return _DailyRecapModel.fromJson(json);
}

/// @nodoc
mixin _$DailyRecapModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brach_id')
  int? get brachId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mt_kas_kecil_id')
  int? get mtKasKecilId => throw _privateConstructorUsedError;
  @JsonKey(name: 'initial_cash')
  int? get initialCash => throw _privateConstructorUsedError;
  @JsonKey(name: 'cash_sale')
  int? get cashSale => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_sales')
  int? get transferSales => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_gateway_sales')
  int? get paymentGatewaySales => throw _privateConstructorUsedError;
  @JsonKey(name: 'piutang_sales')
  int? get piutangSales => throw _privateConstructorUsedError;
  @JsonKey(name: 'outlet_output')
  int? get outletOutput => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_cash')
  int? get totalCash => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_sales')
  int? get totalSales => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_toko')
  String? get nameToko => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_kasir')
  String? get nameKasir => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_cashier_at')
  DateTime? get openCashierAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'close_cashier_at')
  DateTime? get closeCashierAt => throw _privateConstructorUsedError;

  /// Serializes this DailyRecapModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyRecapModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyRecapModelCopyWith<DailyRecapModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyRecapModelCopyWith<$Res> {
  factory $DailyRecapModelCopyWith(
          DailyRecapModel value, $Res Function(DailyRecapModel) then) =
      _$DailyRecapModelCopyWithImpl<$Res, DailyRecapModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'brach_id') int? brachId,
      @JsonKey(name: 'mt_kas_kecil_id') int? mtKasKecilId,
      @JsonKey(name: 'initial_cash') int? initialCash,
      @JsonKey(name: 'cash_sale') int? cashSale,
      @JsonKey(name: 'transfer_sales') int? transferSales,
      @JsonKey(name: 'payment_gateway_sales') int? paymentGatewaySales,
      @JsonKey(name: 'piutang_sales') int? piutangSales,
      @JsonKey(name: 'outlet_output') int? outletOutput,
      @JsonKey(name: 'total_cash') int? totalCash,
      @JsonKey(name: 'total_sales') int? totalSales,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'nama_toko') String? nameToko,
      @JsonKey(name: 'nama_kasir') String? nameKasir,
      @JsonKey(name: 'open_cashier_at') DateTime? openCashierAt,
      @JsonKey(name: 'close_cashier_at') DateTime? closeCashierAt});
}

/// @nodoc
class _$DailyRecapModelCopyWithImpl<$Res, $Val extends DailyRecapModel>
    implements $DailyRecapModelCopyWith<$Res> {
  _$DailyRecapModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyRecapModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? brachId = freezed,
    Object? mtKasKecilId = freezed,
    Object? initialCash = freezed,
    Object? cashSale = freezed,
    Object? transferSales = freezed,
    Object? paymentGatewaySales = freezed,
    Object? piutangSales = freezed,
    Object? outletOutput = freezed,
    Object? totalCash = freezed,
    Object? totalSales = freezed,
    Object? createdAt = freezed,
    Object? nameToko = freezed,
    Object? nameKasir = freezed,
    Object? openCashierAt = freezed,
    Object? closeCashierAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      brachId: freezed == brachId
          ? _value.brachId
          : brachId // ignore: cast_nullable_to_non_nullable
              as int?,
      mtKasKecilId: freezed == mtKasKecilId
          ? _value.mtKasKecilId
          : mtKasKecilId // ignore: cast_nullable_to_non_nullable
              as int?,
      initialCash: freezed == initialCash
          ? _value.initialCash
          : initialCash // ignore: cast_nullable_to_non_nullable
              as int?,
      cashSale: freezed == cashSale
          ? _value.cashSale
          : cashSale // ignore: cast_nullable_to_non_nullable
              as int?,
      transferSales: freezed == transferSales
          ? _value.transferSales
          : transferSales // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentGatewaySales: freezed == paymentGatewaySales
          ? _value.paymentGatewaySales
          : paymentGatewaySales // ignore: cast_nullable_to_non_nullable
              as int?,
      piutangSales: freezed == piutangSales
          ? _value.piutangSales
          : piutangSales // ignore: cast_nullable_to_non_nullable
              as int?,
      outletOutput: freezed == outletOutput
          ? _value.outletOutput
          : outletOutput // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCash: freezed == totalCash
          ? _value.totalCash
          : totalCash // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSales: freezed == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nameToko: freezed == nameToko
          ? _value.nameToko
          : nameToko // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKasir: freezed == nameKasir
          ? _value.nameKasir
          : nameKasir // ignore: cast_nullable_to_non_nullable
              as String?,
      openCashierAt: freezed == openCashierAt
          ? _value.openCashierAt
          : openCashierAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeCashierAt: freezed == closeCashierAt
          ? _value.closeCashierAt
          : closeCashierAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyRecapModelImplCopyWith<$Res>
    implements $DailyRecapModelCopyWith<$Res> {
  factory _$$DailyRecapModelImplCopyWith(_$DailyRecapModelImpl value,
          $Res Function(_$DailyRecapModelImpl) then) =
      __$$DailyRecapModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'brach_id') int? brachId,
      @JsonKey(name: 'mt_kas_kecil_id') int? mtKasKecilId,
      @JsonKey(name: 'initial_cash') int? initialCash,
      @JsonKey(name: 'cash_sale') int? cashSale,
      @JsonKey(name: 'transfer_sales') int? transferSales,
      @JsonKey(name: 'payment_gateway_sales') int? paymentGatewaySales,
      @JsonKey(name: 'piutang_sales') int? piutangSales,
      @JsonKey(name: 'outlet_output') int? outletOutput,
      @JsonKey(name: 'total_cash') int? totalCash,
      @JsonKey(name: 'total_sales') int? totalSales,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'nama_toko') String? nameToko,
      @JsonKey(name: 'nama_kasir') String? nameKasir,
      @JsonKey(name: 'open_cashier_at') DateTime? openCashierAt,
      @JsonKey(name: 'close_cashier_at') DateTime? closeCashierAt});
}

/// @nodoc
class __$$DailyRecapModelImplCopyWithImpl<$Res>
    extends _$DailyRecapModelCopyWithImpl<$Res, _$DailyRecapModelImpl>
    implements _$$DailyRecapModelImplCopyWith<$Res> {
  __$$DailyRecapModelImplCopyWithImpl(
      _$DailyRecapModelImpl _value, $Res Function(_$DailyRecapModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyRecapModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? brachId = freezed,
    Object? mtKasKecilId = freezed,
    Object? initialCash = freezed,
    Object? cashSale = freezed,
    Object? transferSales = freezed,
    Object? paymentGatewaySales = freezed,
    Object? piutangSales = freezed,
    Object? outletOutput = freezed,
    Object? totalCash = freezed,
    Object? totalSales = freezed,
    Object? createdAt = freezed,
    Object? nameToko = freezed,
    Object? nameKasir = freezed,
    Object? openCashierAt = freezed,
    Object? closeCashierAt = freezed,
  }) {
    return _then(_$DailyRecapModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      brachId: freezed == brachId
          ? _value.brachId
          : brachId // ignore: cast_nullable_to_non_nullable
              as int?,
      mtKasKecilId: freezed == mtKasKecilId
          ? _value.mtKasKecilId
          : mtKasKecilId // ignore: cast_nullable_to_non_nullable
              as int?,
      initialCash: freezed == initialCash
          ? _value.initialCash
          : initialCash // ignore: cast_nullable_to_non_nullable
              as int?,
      cashSale: freezed == cashSale
          ? _value.cashSale
          : cashSale // ignore: cast_nullable_to_non_nullable
              as int?,
      transferSales: freezed == transferSales
          ? _value.transferSales
          : transferSales // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentGatewaySales: freezed == paymentGatewaySales
          ? _value.paymentGatewaySales
          : paymentGatewaySales // ignore: cast_nullable_to_non_nullable
              as int?,
      piutangSales: freezed == piutangSales
          ? _value.piutangSales
          : piutangSales // ignore: cast_nullable_to_non_nullable
              as int?,
      outletOutput: freezed == outletOutput
          ? _value.outletOutput
          : outletOutput // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCash: freezed == totalCash
          ? _value.totalCash
          : totalCash // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSales: freezed == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nameToko: freezed == nameToko
          ? _value.nameToko
          : nameToko // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKasir: freezed == nameKasir
          ? _value.nameKasir
          : nameKasir // ignore: cast_nullable_to_non_nullable
              as String?,
      openCashierAt: freezed == openCashierAt
          ? _value.openCashierAt
          : openCashierAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeCashierAt: freezed == closeCashierAt
          ? _value.closeCashierAt
          : closeCashierAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyRecapModelImpl implements _DailyRecapModel {
  const _$DailyRecapModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'brach_id') this.brachId,
      @JsonKey(name: 'mt_kas_kecil_id') this.mtKasKecilId,
      @JsonKey(name: 'initial_cash') this.initialCash,
      @JsonKey(name: 'cash_sale') this.cashSale,
      @JsonKey(name: 'transfer_sales') this.transferSales,
      @JsonKey(name: 'payment_gateway_sales') this.paymentGatewaySales,
      @JsonKey(name: 'piutang_sales') this.piutangSales,
      @JsonKey(name: 'outlet_output') this.outletOutput,
      @JsonKey(name: 'total_cash') this.totalCash,
      @JsonKey(name: 'total_sales') this.totalSales,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'nama_toko') this.nameToko,
      @JsonKey(name: 'nama_kasir') this.nameKasir,
      @JsonKey(name: 'open_cashier_at') this.openCashierAt,
      @JsonKey(name: 'close_cashier_at') this.closeCashierAt});

  factory _$DailyRecapModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyRecapModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'brach_id')
  final int? brachId;
  @override
  @JsonKey(name: 'mt_kas_kecil_id')
  final int? mtKasKecilId;
  @override
  @JsonKey(name: 'initial_cash')
  final int? initialCash;
  @override
  @JsonKey(name: 'cash_sale')
  final int? cashSale;
  @override
  @JsonKey(name: 'transfer_sales')
  final int? transferSales;
  @override
  @JsonKey(name: 'payment_gateway_sales')
  final int? paymentGatewaySales;
  @override
  @JsonKey(name: 'piutang_sales')
  final int? piutangSales;
  @override
  @JsonKey(name: 'outlet_output')
  final int? outletOutput;
  @override
  @JsonKey(name: 'total_cash')
  final int? totalCash;
  @override
  @JsonKey(name: 'total_sales')
  final int? totalSales;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'nama_toko')
  final String? nameToko;
  @override
  @JsonKey(name: 'nama_kasir')
  final String? nameKasir;
  @override
  @JsonKey(name: 'open_cashier_at')
  final DateTime? openCashierAt;
  @override
  @JsonKey(name: 'close_cashier_at')
  final DateTime? closeCashierAt;

  @override
  String toString() {
    return 'DailyRecapModel(id: $id, userId: $userId, brachId: $brachId, mtKasKecilId: $mtKasKecilId, initialCash: $initialCash, cashSale: $cashSale, transferSales: $transferSales, paymentGatewaySales: $paymentGatewaySales, piutangSales: $piutangSales, outletOutput: $outletOutput, totalCash: $totalCash, totalSales: $totalSales, createdAt: $createdAt, nameToko: $nameToko, nameKasir: $nameKasir, openCashierAt: $openCashierAt, closeCashierAt: $closeCashierAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyRecapModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.brachId, brachId) || other.brachId == brachId) &&
            (identical(other.mtKasKecilId, mtKasKecilId) ||
                other.mtKasKecilId == mtKasKecilId) &&
            (identical(other.initialCash, initialCash) ||
                other.initialCash == initialCash) &&
            (identical(other.cashSale, cashSale) ||
                other.cashSale == cashSale) &&
            (identical(other.transferSales, transferSales) ||
                other.transferSales == transferSales) &&
            (identical(other.paymentGatewaySales, paymentGatewaySales) ||
                other.paymentGatewaySales == paymentGatewaySales) &&
            (identical(other.piutangSales, piutangSales) ||
                other.piutangSales == piutangSales) &&
            (identical(other.outletOutput, outletOutput) ||
                other.outletOutput == outletOutput) &&
            (identical(other.totalCash, totalCash) ||
                other.totalCash == totalCash) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.nameToko, nameToko) ||
                other.nameToko == nameToko) &&
            (identical(other.nameKasir, nameKasir) ||
                other.nameKasir == nameKasir) &&
            (identical(other.openCashierAt, openCashierAt) ||
                other.openCashierAt == openCashierAt) &&
            (identical(other.closeCashierAt, closeCashierAt) ||
                other.closeCashierAt == closeCashierAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      brachId,
      mtKasKecilId,
      initialCash,
      cashSale,
      transferSales,
      paymentGatewaySales,
      piutangSales,
      outletOutput,
      totalCash,
      totalSales,
      createdAt,
      nameToko,
      nameKasir,
      openCashierAt,
      closeCashierAt);

  /// Create a copy of DailyRecapModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyRecapModelImplCopyWith<_$DailyRecapModelImpl> get copyWith =>
      __$$DailyRecapModelImplCopyWithImpl<_$DailyRecapModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyRecapModelImplToJson(
      this,
    );
  }
}

abstract class _DailyRecapModel implements DailyRecapModel {
  const factory _DailyRecapModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'brach_id') final int? brachId,
      @JsonKey(name: 'mt_kas_kecil_id') final int? mtKasKecilId,
      @JsonKey(name: 'initial_cash') final int? initialCash,
      @JsonKey(name: 'cash_sale') final int? cashSale,
      @JsonKey(name: 'transfer_sales') final int? transferSales,
      @JsonKey(name: 'payment_gateway_sales') final int? paymentGatewaySales,
      @JsonKey(name: 'piutang_sales') final int? piutangSales,
      @JsonKey(name: 'outlet_output') final int? outletOutput,
      @JsonKey(name: 'total_cash') final int? totalCash,
      @JsonKey(name: 'total_sales') final int? totalSales,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'nama_toko') final String? nameToko,
      @JsonKey(name: 'nama_kasir') final String? nameKasir,
      @JsonKey(name: 'open_cashier_at') final DateTime? openCashierAt,
      @JsonKey(name: 'close_cashier_at')
      final DateTime? closeCashierAt}) = _$DailyRecapModelImpl;

  factory _DailyRecapModel.fromJson(Map<String, dynamic> json) =
      _$DailyRecapModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'brach_id')
  int? get brachId;
  @override
  @JsonKey(name: 'mt_kas_kecil_id')
  int? get mtKasKecilId;
  @override
  @JsonKey(name: 'initial_cash')
  int? get initialCash;
  @override
  @JsonKey(name: 'cash_sale')
  int? get cashSale;
  @override
  @JsonKey(name: 'transfer_sales')
  int? get transferSales;
  @override
  @JsonKey(name: 'payment_gateway_sales')
  int? get paymentGatewaySales;
  @override
  @JsonKey(name: 'piutang_sales')
  int? get piutangSales;
  @override
  @JsonKey(name: 'outlet_output')
  int? get outletOutput;
  @override
  @JsonKey(name: 'total_cash')
  int? get totalCash;
  @override
  @JsonKey(name: 'total_sales')
  int? get totalSales;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'nama_toko')
  String? get nameToko;
  @override
  @JsonKey(name: 'nama_kasir')
  String? get nameKasir;
  @override
  @JsonKey(name: 'open_cashier_at')
  DateTime? get openCashierAt;
  @override
  @JsonKey(name: 'close_cashier_at')
  DateTime? get closeCashierAt;

  /// Create a copy of DailyRecapModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyRecapModelImplCopyWith<_$DailyRecapModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
