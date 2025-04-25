import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:hive_ce/hive.dart';

part 'payment_method_model.freezed.dart';
part 'payment_method_model.g.dart';

PaymentMethodModel paymentMethodModelFromJson(String str) =>
    PaymentMethodModel.fromJson(json.decode(str));

String paymentMethodModelToJson(PaymentMethodModel data) =>
    json.encode(data.toJson());

@freezed
class PaymentMethodModel with _$PaymentMethodModel {
  @HiveType(typeId: 11, adapterName: 'PaymentMethodModelAdapter')
  const factory PaymentMethodModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'method') String? method,
    @JsonKey(name: 'selected') bool? selected,
    String? code,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'items') List<BankModel>? bankModel,
  }) = _PaymentMethodModel;

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodModelFromJson(json);
}

@freezed
class BankModel with _$BankModel {
  @HiveType(typeId: 12, adapterName: 'BankModelAdapter')
  const factory BankModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'flag') List<FlagModel>? flagModel,
    @JsonKey(name: 'method') String? method,
    @JsonKey(name: 'selected') bool? selected,
    @JsonKey(name: 'bankOwner') String? bankOwner,
    @JsonKey(name: 'bankAccountNumber') String? bankAccountNumber,
  }) = _BankModel;

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);
}

@freezed
class FlagModel with _$FlagModel {
  @HiveType(typeId: 13, adapterName: 'FlagModelAdapter')
  const factory FlagModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'group') String? group,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    @JsonKey(name: 'flag') String? flag,
  }) = _FlagModel;

  factory FlagModel.fromJson(Map<String, dynamic> json) =>
      _$FlagModelFromJson(json);
}
