// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_management_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionManagementModelImpl _$$TransactionManagementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionManagementModelImpl(
      id: (json['id'] as num?)?.toInt(),
      reference: json['reference'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      customerId: (json['customer_id'] as num?)?.toInt(),
      custName: json['cust_name'] as String?,
      custPhone: json['cust_phone'] as String?,
      custEmail: json['cust_email'] as String?,
      custKecamatan: json['cust_kecamatan'] as String?,
      custKelurahan: json['cust_kelurahan'] as String?,
      custAlamat: json['cust_alamat'] as String?,
      detail: json['detail'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      paid: (json['paid'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      paymentStatus: (json['payment_status'] as num?)?.toInt(),
      paymentAt: json['payment_at'] == null
          ? null
          : DateTime.parse(json['payment_at'] as String),
      paymentMethod: json['payment_method'] as String?,
      paymentReturnUrl: json['payment_return_url'] as String?,
      qrCodesId: (json['qr_codes_id'] as num?)?.toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      staffId: (json['staff_id'] as num?)?.toInt(),
      staffName: json['staff_name'] as String?,
      syncStatus: (json['sync_status'] as num?)?.toInt(),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      userId: (json['user_id'] as num?)?.toInt(),
      diskon: (json['diskon'] as num?)?.toInt(),
      shipping: (json['shipping'] as num?)?.toInt(),
      orderTotal: (json['order_total'] as num?)?.toInt(),
      tax: (json['tax'] as num?)?.toDouble(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      flipRef: json['flip_ref'] as String?,
      note: json['note'] as String?,
      table: json['table'] as String?,
      priceType: json['price_type'] as String?,
      paymentAmount: (json['payment_amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TransactionManagementModelImplToJson(
        _$TransactionManagementModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'date': instance.date?.toIso8601String(),
      'customer_id': instance.customerId,
      'cust_name': instance.custName,
      'cust_phone': instance.custPhone,
      'cust_email': instance.custEmail,
      'cust_kecamatan': instance.custKecamatan,
      'cust_kelurahan': instance.custKelurahan,
      'cust_alamat': instance.custAlamat,
      'detail': instance.detail,
      'products': instance.products,
      'paid': instance.paid,
      'status': instance.status,
      'payment_status': instance.paymentStatus,
      'payment_at': instance.paymentAt?.toIso8601String(),
      'payment_method': instance.paymentMethod,
      'payment_return_url': instance.paymentReturnUrl,
      'qr_codes_id': instance.qrCodesId,
      'branch_id': instance.branchId,
      'staff_id': instance.staffId,
      'staff_name': instance.staffName,
      'sync_status': instance.syncStatus,
      'created': instance.created?.toIso8601String(),
      'user_id': instance.userId,
      'diskon': instance.diskon,
      'shipping': instance.shipping,
      'order_total': instance.orderTotal,
      'tax': instance.tax,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'flip_ref': instance.flipRef,
      'note': instance.note,
      'table': instance.table,
      'price_type': instance.priceType,
      'payment_amount': instance.paymentAmount,
    };
