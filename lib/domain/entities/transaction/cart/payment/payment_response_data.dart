// To parse this JSON data, do
//
//     final paymentResponseData = paymentResponseDataFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'payment_response_data.freezed.dart';
part 'payment_response_data.g.dart';

PaymentResponseData paymentResponseDataFromJson(String str) =>
    PaymentResponseData.fromJson(json.decode(str));

String paymentResponseDataToJson(PaymentResponseData data) =>
    json.encode(data.toJson());

@freezed
class PaymentResponseData with _$PaymentResponseData {
  @HiveType(typeId: 13, adapterName: 'PaymentResponseDataAdapter')
  const factory PaymentResponseData({
    @JsonKey(name: 'reference') String? reference,
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
    @JsonKey(name: 'qrString') String? qrString,
  }) = _PaymentResponseData;

  factory PaymentResponseData.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseDataFromJson(json);
}
