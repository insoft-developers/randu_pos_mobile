// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<_$ProductModelImpl> {
  @override
  final int typeId = 3;

  @override
  _$ProductModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ProductModelImpl(
      id: (fields[0] as num).toInt(),
      categoryId: (fields[1] as num?)?.toInt(),
      code: fields[2] as String?,
      sku: fields[3] as String?,
      name: fields[4] as String?,
      price: (fields[5] as num?)?.toInt(),
      cost: (fields[6] as num?)?.toInt(),
      unit: fields[7] as String?,
      quantity: (fields[8] as num?)?.toInt(),
      stockAlert: (fields[9] as num?)?.toInt(),
      sell: (fields[10] as num?)?.toInt(),
      created: fields[11] as String?,
      userId: (fields[12] as num?)?.toInt(),
      isVariant: (fields[13] as num?)?.toInt(),
      isManufactured: (fields[14] as num?)?.toInt(),
      bufferedStock: (fields[15] as num?)?.toInt(),
      categoryName: fields[16] as String?,
      variantGroups: (fields[17] as List?)?.cast<String>(),
      variant: (fields[18] as List?)?.cast<VariantModel>(),
      note: fields[19] as String?,
      priceTakeAway: (fields[20] as num?)?.toInt(),
      priceMarketPlace: (fields[21] as num?)?.toInt(),
      priceCustom: (fields[22] as num?)?.toInt(),
      priceType: fields[23] as String?,
      barcode: fields[24] as String?,
      isEditable: (fields[25] as num?)?.toInt(),
      priceEdit: (fields[26] as num?)?.toInt(),
      isPrinted: fields[27] as bool?,
      productForChecker: fields[28] == null
          ? const []
          : (fields[28] as List).cast<ProductModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$ProductModelImpl obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.sku)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.cost)
      ..writeByte(7)
      ..write(obj.unit)
      ..writeByte(8)
      ..write(obj.quantity)
      ..writeByte(9)
      ..write(obj.stockAlert)
      ..writeByte(10)
      ..write(obj.sell)
      ..writeByte(11)
      ..write(obj.created)
      ..writeByte(12)
      ..write(obj.userId)
      ..writeByte(13)
      ..write(obj.isVariant)
      ..writeByte(14)
      ..write(obj.isManufactured)
      ..writeByte(15)
      ..write(obj.bufferedStock)
      ..writeByte(16)
      ..write(obj.categoryName)
      ..writeByte(17)
      ..write(obj.variantGroups)
      ..writeByte(18)
      ..write(obj.variant)
      ..writeByte(19)
      ..write(obj.note)
      ..writeByte(20)
      ..write(obj.priceTakeAway)
      ..writeByte(21)
      ..write(obj.priceMarketPlace)
      ..writeByte(22)
      ..write(obj.priceCustom)
      ..writeByte(23)
      ..write(obj.priceType)
      ..writeByte(24)
      ..write(obj.barcode)
      ..writeByte(25)
      ..write(obj.isEditable)
      ..writeByte(26)
      ..write(obj.priceEdit)
      ..writeByte(27)
      ..write(obj.isPrinted)
      ..writeByte(28)
      ..write(obj.productForChecker);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VariantModelAdapter extends TypeAdapter<_$VariantModelImpl> {
  @override
  final int typeId = 4;

  @override
  _$VariantModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$VariantModelImpl(
      id: (fields[0] as num?)?.toInt(),
      productId: (fields[1] as num?)?.toInt(),
      varianGroup: fields[2] as String?,
      varianName: fields[3] as String?,
      sku: fields[4] as String?,
      varianPrice: (fields[5] as num?)?.toInt(),
      singlePick: (fields[6] as num?)?.toInt(),
      maxQuantity: (fields[7] as num?)?.toInt(),
      quantity: (fields[8] as num?)?.toInt(),
      note: fields[9] as String?,
      priceTakeAway: (fields[10] as num?)?.toInt(),
      priceMarketPlace: (fields[11] as num?)?.toInt(),
      priceCustom: (fields[12] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, _$VariantModelImpl obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.varianGroup)
      ..writeByte(3)
      ..write(obj.varianName)
      ..writeByte(4)
      ..write(obj.sku)
      ..writeByte(5)
      ..write(obj.varianPrice)
      ..writeByte(6)
      ..write(obj.singlePick)
      ..writeByte(7)
      ..write(obj.maxQuantity)
      ..writeByte(8)
      ..write(obj.quantity)
      ..writeByte(9)
      ..write(obj.note)
      ..writeByte(10)
      ..write(obj.priceTakeAway)
      ..writeByte(11)
      ..write(obj.priceMarketPlace)
      ..writeByte(12)
      ..write(obj.priceCustom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: (json['id'] as num).toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      code: json['code'] as String?,
      sku: json['sku'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      cost: (json['cost'] as num?)?.toInt(),
      unit: json['unit'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      stockAlert: (json['stock_alert'] as num?)?.toInt(),
      sell: (json['sell'] as num?)?.toInt(),
      created: json['created'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      isVariant: (json['is_variant'] as num?)?.toInt(),
      isManufactured: (json['is_manufactured'] as num?)?.toInt(),
      bufferedStock: (json['buffered_stock'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      variantGroups: (json['variant_groups'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      variant: (json['variant'] as List<dynamic>?)
          ?.map((e) => VariantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      note: json['note'] as String?,
      priceTakeAway: (json['price_ta'] as num?)?.toInt(),
      priceMarketPlace: (json['price_mp'] as num?)?.toInt(),
      priceCustom: (json['price_cus'] as num?)?.toInt(),
      priceType: json['price_type'] as String?,
      barcode: json['barcode'] as String?,
      isEditable: (json['is_editable'] as num?)?.toInt(),
      priceEdit: (json['priceEdit'] as num?)?.toInt(),
      isPrinted: json['isPrinted'] as bool?,
      productForChecker: (json['productForChecker'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'code': instance.code,
      'sku': instance.sku,
      'name': instance.name,
      'price': instance.price,
      'cost': instance.cost,
      'unit': instance.unit,
      'quantity': instance.quantity,
      'stock_alert': instance.stockAlert,
      'sell': instance.sell,
      'created': instance.created,
      'user_id': instance.userId,
      'is_variant': instance.isVariant,
      'is_manufactured': instance.isManufactured,
      'buffered_stock': instance.bufferedStock,
      'category_name': instance.categoryName,
      'variant_groups': instance.variantGroups,
      'variant': instance.variant,
      'note': instance.note,
      'price_ta': instance.priceTakeAway,
      'price_mp': instance.priceMarketPlace,
      'price_cus': instance.priceCustom,
      'price_type': instance.priceType,
      if (instance.barcode case final value?) 'barcode': value,
      'is_editable': instance.isEditable,
      'priceEdit': instance.priceEdit,
      'isPrinted': instance.isPrinted,
      'productForChecker': instance.productForChecker,
    };

_$VariantModelImpl _$$VariantModelImplFromJson(Map<String, dynamic> json) =>
    _$VariantModelImpl(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      varianGroup: json['varian_group'] as String?,
      varianName: json['varian_name'] as String?,
      sku: json['sku'] as String?,
      varianPrice: const IntOrStringConverter().fromJson(json['varian_price']),
      singlePick: (json['single_pick'] as num?)?.toInt(),
      maxQuantity: (json['max_quantity'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      note: json['note'] as String?,
      priceTakeAway: (json['price_ta'] as num?)?.toInt(),
      priceMarketPlace: (json['price_mp'] as num?)?.toInt(),
      priceCustom: (json['price_cus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VariantModelImplToJson(_$VariantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'varian_group': instance.varianGroup,
      'varian_name': instance.varianName,
      'sku': instance.sku,
      'varian_price': const IntOrStringConverter().toJson(instance.varianPrice),
      'single_pick': instance.singlePick,
      'max_quantity': instance.maxQuantity,
      'quantity': instance.quantity,
      'note': instance.note,
      'price_ta': instance.priceTakeAway,
      'price_mp': instance.priceMarketPlace,
      'price_cus': instance.priceCustom,
    };
