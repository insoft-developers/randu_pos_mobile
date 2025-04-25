import 'package:freezed_annotation/freezed_annotation.dart';

import '../../transaction/cart/product_model.dart';
import '../../transaction/cart/receipt_from_enum.dart';
import '../../transaction/cart/request/payment/payment_request_model.dart';
import 'status_payment_enum.dart';
import 'status_transaction_enum.dart';

part 'transaction_management_model.freezed.dart';
part 'transaction_management_model.g.dart';

@freezed
class TransactionManagementModel with _$TransactionManagementModel {
  TransactionManagementModel._();
  factory TransactionManagementModel({
    @JsonKey(name: 'id') int? id,
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
    @JsonKey(name: 'price_type') String? priceType,
  }) = _TransactionManagementModel;

  // String get statusString {
  //   switch (status) {
  //     case 0:
  //       return 'Pending';
  //     case 1:
  //       return 'Process';
  //     case 2:
  //       return 'Cooking/Packing';
  //     case 3:
  //       return 'Shipped';
  //     case 4:
  //       return 'Completed';
  //     case 5:
  //       return 'Canceled';
  //     default:
  //       return 'Unknown';
  //   }
  // }

  StatusTransactionEnum get statusEnum {
    return StatusTransactionEnum.fromCode(status ?? 0);
  }

  StatusPaymentEnum get paymentStatusEnum {
    return StatusPaymentEnum.fromCode(paymentStatus ?? 0);
  }

  factory TransactionManagementModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionManagementModelFromJson(json);
}

extension TransactionManagementModelExtensions on TransactionManagementModel {
  List<ProductModel> toProductList() {
    return products ?? [];
  }

  PaymentReceiptModel toPaymentReceipt(
      {required ReceiptFromEnum receiptFrom,
      required String businessName,
      required String bussinessAddress,
      required String branchName,
      required String footer}) {
    return PaymentReceiptModel(
      receiptFrom: ReceiptFromEnum.report,
      referenceId: reference,
      customer: custName ?? '',
      paid: paid?.toDouble() ?? 0,
      orderTotal: orderTotal?.toDouble() ?? 0,
      tax: tax?.toDouble() ?? 0,
      qrCodeId: qrCodesId.toString(),
      branchId: branchId.toString(),
      staffId: staffId.toString(),
      staffName: staffName,
      paymentMethod: paymentMethod ?? '',
      shipping: shipping?.toDouble() ?? 0,
      discount: diskon?.toDouble() ?? 0,
      products: toProductList(),
      table: table ?? '',
      bussinessName: businessName,
      bussinessAddress: bussinessAddress,
      branchName: branchName,
      printerConnection: '',
      printerCustomFooter: footer,
      subTotal: orderTotal?.toDouble() ?? 0,
      createdAt: created,
      status: status,
      transactionId: id,
      statusPayment: paymentStatus,
      paymentReturnUrl: paymentReturnUrl,
      priceType: priceType,
    );
  }
}
