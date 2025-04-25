// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentResponseDataAdapter
    extends TypeAdapter<_$PaymentResponseDataImpl> {
  @override
  final int typeId = 13;

  @override
  _$PaymentResponseDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PaymentResponseDataImpl();
  }

  @override
  void write(BinaryWriter writer, _$PaymentResponseDataImpl obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentResponseDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentResponseDataImpl _$$PaymentResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentResponseDataImpl(
      reference: json['reference'] as String?,
      customerId: json['customer_id'],
      paid: (json['paid'] as num?)?.toInt(),
      custName: json['cust_name'],
      status: (json['status'] as num?)?.toInt(),
      paymentStatus: (json['payment_status'] as num?)?.toInt(),
      paymentMethod: json['payment_method'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      diskon: (json['diskon'] as num?)?.toInt(),
      shipping: (json['shipping'] as num?)?.toInt(),
      orderTotal: (json['order_total'] as num?)?.toInt(),
      tax: (json['tax'] as num?)?.toInt(),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: (json['id'] as num?)?.toInt(),
      detail: json['detail'] as String?,
      paymentUrl: json['paymentUrl'] as String?,
      amount: json['amount'] as String?,
      qrString: json['qrString'] as String?,
    );

Map<String, dynamic> _$$PaymentResponseDataImplToJson(
        _$PaymentResponseDataImpl instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'customer_id': instance.customerId,
      'paid': instance.paid,
      'cust_name': instance.custName,
      'status': instance.status,
      'payment_status': instance.paymentStatus,
      'payment_method': instance.paymentMethod,
      'user_id': instance.userId,
      'diskon': instance.diskon,
      'shipping': instance.shipping,
      'order_total': instance.orderTotal,
      'tax': instance.tax,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'detail': instance.detail,
      'paymentUrl': instance.paymentUrl,
      'amount': instance.amount,
      'qrString': instance.qrString,
    };
