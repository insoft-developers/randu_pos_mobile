// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentRequestModelAdapter
    extends TypeAdapter<_$PaymentRequestModelImpl> {
  @override
  final int typeId = 2;

  @override
  _$PaymentRequestModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PaymentRequestModelImpl(
      customer: fields[0] as String?,
      paid: (fields[1] as num).toDouble(),
      orderTotal: (fields[2] as num).toDouble(),
      tax: (fields[3] as num).toDouble(),
      paymentMethod: fields[4] as String,
      qrCodeId: fields[5] as String?,
      branchId: fields[6] as String?,
      staffId: fields[7] as String?,
      shipping: (fields[8] as num).toDouble(),
      discount: (fields[9] as num).toDouble(),
      discountId: fields[10] as String?,
      returnUrl: fields[11] == null ? 'pos' : fields[11] as String,
      products: fields[12] == null
          ? const []
          : (fields[12] as List).cast<ProductModel>(),
      from: fields[13] == null ? 'M' : fields[13] as String,
      saleType: fields[14] == null ? 'price' : fields[14] as String,
      instantQris: fields[15] == null ? false : fields[15] as bool,
      isRounded: fields[16] == null ? false : fields[16] as bool,
      flag: fields[17] as String?,
      paymentAmount: (fields[18] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, _$PaymentRequestModelImpl obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.customer)
      ..writeByte(1)
      ..write(obj.paid)
      ..writeByte(2)
      ..write(obj.orderTotal)
      ..writeByte(3)
      ..write(obj.tax)
      ..writeByte(4)
      ..write(obj.paymentMethod)
      ..writeByte(5)
      ..write(obj.qrCodeId)
      ..writeByte(6)
      ..write(obj.branchId)
      ..writeByte(7)
      ..write(obj.staffId)
      ..writeByte(8)
      ..write(obj.shipping)
      ..writeByte(9)
      ..write(obj.discount)
      ..writeByte(10)
      ..write(obj.discountId)
      ..writeByte(11)
      ..write(obj.returnUrl)
      ..writeByte(12)
      ..write(obj.products)
      ..writeByte(13)
      ..write(obj.from)
      ..writeByte(14)
      ..write(obj.saleType)
      ..writeByte(15)
      ..write(obj.instantQris)
      ..writeByte(16)
      ..write(obj.isRounded)
      ..writeByte(17)
      ..write(obj.flag)
      ..writeByte(18)
      ..write(obj.paymentAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentRequestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentRequestModelImpl _$$PaymentRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentRequestModelImpl(
      customer: json['customer'] as String?,
      paid: (json['paid'] as num).toDouble(),
      orderTotal: (json['order_total'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      paymentMethod: json['payment_method'] as String,
      qrCodeId: json['qr_codes_id'] as String?,
      branchId: json['branch_id'] as String?,
      staffId: json['staff_id'] as String?,
      shipping: (json['shipping'] as num).toDouble(),
      discount: (json['diskon'] as num).toDouble(),
      discountId: json['discount_id'] as String?,
      returnUrl: json['return_url'] as String? ?? 'pos',
      products: (json['product'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      from: json['from'] as String? ?? 'M',
      saleType: json['price_type'] as String? ?? 'price',
      instantQris: json['instant_qris'] as bool? ?? false,
      isRounded: json['is_rounded'] as bool? ?? false,
      flag: json['flag'] as String?,
      paymentAmount: (json['payment_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$PaymentRequestModelImplToJson(
        _$PaymentRequestModelImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'paid': instance.paid,
      'order_total': instance.orderTotal,
      'tax': instance.tax,
      'payment_method': instance.paymentMethod,
      'qr_codes_id': instance.qrCodeId,
      'branch_id': instance.branchId,
      'staff_id': instance.staffId,
      'shipping': instance.shipping,
      'diskon': instance.discount,
      'discount_id': instance.discountId,
      'return_url': instance.returnUrl,
      'product': instance.products,
      'from': instance.from,
      'price_type': instance.saleType,
      'instant_qris': instance.instantQris,
      'is_rounded': instance.isRounded,
      'flag': instance.flag,
      'payment_amount': instance.paymentAmount,
    };

_$PaymentReceiptModelImpl _$$PaymentReceiptModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentReceiptModelImpl(
      receiptFrom: $enumDecode(_$ReceiptFromEnumEnumMap, json['receiptFrom']),
      referenceId: json['referenceId'] as String?,
      bussinessName: json['bussinessName'] as String?,
      bussinessAddress: json['bussinessAddress'] as String?,
      branchName: json['branchName'] as String?,
      printerConnection: json['printerConnection'] as String?,
      printerCustomFooter: json['printerCustomFooter'] as String?,
      customer: json['customer'] as String?,
      paid: (json['paid'] as num).toDouble(),
      orderTotal: (json['order_total'] as num).toDouble(),
      subTotal: (json['sub_total'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      paymentMethod: json['payment_method'] as String,
      qrCodeId: json['qr_code_id'] as String?,
      branchId: json['branch_id'] as String?,
      staffId: json['staff_id'] as String?,
      staffName: json['staff_name'] as String?,
      shipping: (json['shipping'] as num).toDouble(),
      discount: (json['diskon'] as num).toDouble(),
      discountId: json['discount_id'] as String?,
      returnUrl: json['return_url'] as String? ?? 'pos',
      products: (json['product'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      table: json['table'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isFromCart: json['isFromCart'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      transactionId: (json['transactionId'] as num?)?.toInt(),
      statusPayment: (json['statusPayment'] as num?)?.toInt(),
      paymentReturnUrl: json['paymentReturnUrl'] as String?,
      priceType: json['priceType'] as String?,
      roundedTotal: json['roundedTotal'] as String?,
      isRounded: json['isRounded'] as bool?,
      flag: json['flag'] as String?,
      paymentAmount: (json['payment_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$PaymentReceiptModelImplToJson(
        _$PaymentReceiptModelImpl instance) =>
    <String, dynamic>{
      'receiptFrom': _$ReceiptFromEnumEnumMap[instance.receiptFrom]!,
      'referenceId': instance.referenceId,
      'bussinessName': instance.bussinessName,
      'bussinessAddress': instance.bussinessAddress,
      'branchName': instance.branchName,
      'printerConnection': instance.printerConnection,
      'printerCustomFooter': instance.printerCustomFooter,
      'customer': instance.customer,
      'paid': instance.paid,
      'order_total': instance.orderTotal,
      'sub_total': instance.subTotal,
      'tax': instance.tax,
      'payment_method': instance.paymentMethod,
      'qr_code_id': instance.qrCodeId,
      'branch_id': instance.branchId,
      'staff_id': instance.staffId,
      'staff_name': instance.staffName,
      'shipping': instance.shipping,
      'diskon': instance.discount,
      'discount_id': instance.discountId,
      'return_url': instance.returnUrl,
      'product': instance.products,
      'table': instance.table,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isFromCart': instance.isFromCart,
      'status': instance.status,
      'transactionId': instance.transactionId,
      'statusPayment': instance.statusPayment,
      'paymentReturnUrl': instance.paymentReturnUrl,
      'priceType': instance.priceType,
      'roundedTotal': instance.roundedTotal,
      'isRounded': instance.isRounded,
      'flag': instance.flag,
      'payment_amount': instance.paymentAmount,
    };

const _$ReceiptFromEnumEnumMap = {
  ReceiptFromEnum.pos: 'pos',
  ReceiptFromEnum.report: 'report',
  ReceiptFromEnum.saved: 'saved',
};
