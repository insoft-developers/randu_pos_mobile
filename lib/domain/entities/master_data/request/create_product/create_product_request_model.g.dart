// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateProductRequestModelImpl _$$CreateProductRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateProductRequestModelImpl(
      name: json['name'] as String,
      categoryId: (json['category_id'] as num).toInt(),
      sku: json['sku'] as String,
      price: (json['price'] as num).toInt(),
      priceTa: (json['price_ta'] as num).toInt(),
      priceMp: (json['price_mp'] as num).toInt(),
      priceCus: (json['price_cus'] as num).toInt(),
      barcode: json['barcode'] as String?,
    );

Map<String, dynamic> _$$CreateProductRequestModelImplToJson(
        _$CreateProductRequestModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category_id': instance.categoryId,
      'sku': instance.sku,
      'price': instance.price,
      'price_ta': instance.priceTa,
      'price_mp': instance.priceMp,
      'price_cus': instance.priceCus,
      'barcode': instance.barcode,
    };
