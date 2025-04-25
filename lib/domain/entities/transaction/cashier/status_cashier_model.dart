// To parse this JSON data, do
//
//     final statusCashierModel = statusCashierModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_cashier_model.freezed.dart';
part 'status_cashier_model.g.dart';

StatusCashierModel statusCashierModelFromJson(String str) =>
    StatusCashierModel.fromJson(json.decode(str));

String statusCashierModelToJson(StatusCashierModel data) =>
    json.encode(data.toJson());

@freezed
class StatusCashierModel with _$StatusCashierModel {
  const factory StatusCashierModel({
    @JsonKey(name: 'status_cashier') String? statusCashier,
    @JsonKey(name: 'open_cashier_at') DateTime? openCashierAt,
  }) = _StatusCashierModel;

  factory StatusCashierModel.fromJson(Map<String, dynamic> json) =>
      _$StatusCashierModelFromJson(json);
}
