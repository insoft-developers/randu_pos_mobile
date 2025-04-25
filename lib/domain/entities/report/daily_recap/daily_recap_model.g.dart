// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_recap_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyRecapModelImpl _$$DailyRecapModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyRecapModelImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      brachId: (json['brach_id'] as num?)?.toInt(),
      mtKasKecilId: (json['mt_kas_kecil_id'] as num?)?.toInt(),
      initialCash: (json['initial_cash'] as num?)?.toInt(),
      cashSale: (json['cash_sale'] as num?)?.toInt(),
      transferSales: (json['transfer_sales'] as num?)?.toInt(),
      paymentGatewaySales: (json['payment_gateway_sales'] as num?)?.toInt(),
      piutangSales: (json['piutang_sales'] as num?)?.toInt(),
      outletOutput: (json['outlet_output'] as num?)?.toInt(),
      totalCash: (json['total_cash'] as num?)?.toInt(),
      totalSales: (json['total_sales'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      nameToko: json['nama_toko'] as String?,
      nameKasir: json['nama_kasir'] as String?,
      openCashierAt: json['open_cashier_at'] == null
          ? null
          : DateTime.parse(json['open_cashier_at'] as String),
      closeCashierAt: json['close_cashier_at'] == null
          ? null
          : DateTime.parse(json['close_cashier_at'] as String),
    );

Map<String, dynamic> _$$DailyRecapModelImplToJson(
        _$DailyRecapModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'brach_id': instance.brachId,
      'mt_kas_kecil_id': instance.mtKasKecilId,
      'initial_cash': instance.initialCash,
      'cash_sale': instance.cashSale,
      'transfer_sales': instance.transferSales,
      'payment_gateway_sales': instance.paymentGatewaySales,
      'piutang_sales': instance.piutangSales,
      'outlet_output': instance.outletOutput,
      'total_cash': instance.totalCash,
      'total_sales': instance.totalSales,
      'created_at': instance.createdAt?.toIso8601String(),
      'nama_toko': instance.nameToko,
      'nama_kasir': instance.nameKasir,
      'open_cashier_at': instance.openCashierAt?.toIso8601String(),
      'close_cashier_at': instance.closeCashierAt?.toIso8601String(),
    };
