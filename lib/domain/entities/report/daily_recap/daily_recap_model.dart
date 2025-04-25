// To parse this JSON data, do
//
//     final dailyRecapModel = dailyRecapModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_recap_model.freezed.dart';
part 'daily_recap_model.g.dart';

DailyRecapModel dailyRecapModelFromJson(String str) =>
    DailyRecapModel.fromJson(json.decode(str));

String dailyRecapModelToJson(DailyRecapModel data) =>
    json.encode(data.toJson());

@freezed
class DailyRecapModel with _$DailyRecapModel {
  const factory DailyRecapModel({
    @JsonKey(name: 'id') int? id,
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
    @JsonKey(name: 'close_cashier_at') DateTime? closeCashierAt,
  }) = _DailyRecapModel;

  factory DailyRecapModel.fromJson(Map<String, dynamic> json) =>
      _$DailyRecapModelFromJson(json);
}
