import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_status_model.freezed.dart';
part 'payment_status_model.g.dart';

PaymentStatusModel paymentStatusModelFromJson(String str) =>
    PaymentStatusModel.fromJson(json.decode(str));

String paymentStatusModelToJson(PaymentStatusModel data) =>
    json.encode(data.toJson());

@freezed
class PaymentStatusModel with _$PaymentStatusModel {
  const factory PaymentStatusModel({
    // TODO : Need to adjust if the respose is okay
    @JsonKey(name: 'payment_status') String? statusPayment,
  }) = _PaymentStatusModel;

  factory PaymentStatusModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentStatusModelFromJson(json);
}
