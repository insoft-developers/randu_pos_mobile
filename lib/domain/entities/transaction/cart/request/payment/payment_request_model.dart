// import 'package:esc_pos_utils_updated/esc_pos_utils_updated.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import '../../product_model.dart';
import '../../receipt_from_enum.dart';

part 'payment_request_model.freezed.dart';
part 'payment_request_model.g.dart';

@freezed
class PaymentRequestModel with _$PaymentRequestModel {
  @HiveType(typeId: 2, adapterName: 'PaymentRequestModelAdapter')
  const factory PaymentRequestModel({
    @HiveField(0) @JsonKey(name: 'customer') String? customer,
    @HiveField(1) required double paid,
    @HiveField(2) @JsonKey(name: 'order_total') required double orderTotal,
    @HiveField(3) @JsonKey(name: 'tax') required double tax,
    @HiveField(4)
    @JsonKey(name: 'payment_method')
    required String paymentMethod,
    @HiveField(5) @JsonKey(name: 'qr_codes_id') String? qrCodeId,
    @HiveField(6) @JsonKey(name: 'branch_id') String? branchId,
    @HiveField(7) @JsonKey(name: 'staff_id') String? staffId,
    @HiveField(8) @JsonKey(name: 'shipping') required double shipping,
    @HiveField(9) @JsonKey(name: 'diskon') required double discount,
    @HiveField(10) @JsonKey(name: 'discount_id') String? discountId,
    @HiveField(11)
    @JsonKey(name: 'return_url')
    @Default('pos')
    String returnUrl,
    @HiveField(12)
    @JsonKey(name: 'product')
    @Default([])
    List<ProductModel> products,
    @HiveField(13) @Default('M') String from, // M: mobile, W: web
    @HiveField(14)
    @JsonKey(name: 'price_type')
    @Default('price')
    String saleType,
    @HiveField(15)
    @JsonKey(name: 'instant_qris')
    @Default(false)
    bool instantQris,
    @HiveField(16) @JsonKey(name: 'is_rounded') @Default(false) bool isRounded,
    @HiveField(17) @JsonKey(name: 'flag') String? flag,
  }) = _PaymentRequestModel;

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestModelFromJson(json);
}

@freezed
class PaymentReceiptModel with _$PaymentReceiptModel {
  const factory PaymentReceiptModel({
    required ReceiptFromEnum receiptFrom,
    String? referenceId, // no nota
    String? bussinessName,
    String? bussinessAddress,
    String? branchName,
    String? printerConnection,
    String? printerCustomFooter,
    @JsonKey(name: 'customer') String? customer,
    required double paid,
    @JsonKey(name: 'order_total') required double orderTotal,
    @JsonKey(name: 'sub_total') required double subTotal,
    @JsonKey(name: 'tax') required double tax,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'qr_code_id') String? qrCodeId,
    @JsonKey(name: 'branch_id') String? branchId,
    @JsonKey(name: 'staff_id') String? staffId,
    @JsonKey(name: 'staff_name') String? staffName,
    @JsonKey(name: 'shipping') required double shipping,
    @JsonKey(name: 'diskon') required double discount,
    @JsonKey(name: 'discount_id') String? discountId,
    @JsonKey(name: 'return_url') @Default('pos') String returnUrl,
    @JsonKey(name: 'product') @Default([]) List<ProductModel> products,
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
    @JsonKey(name: 'flag') String? flag,
  }) = _PaymentReceiptModel;

  factory PaymentReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentReceiptModelFromJson(json);
}
