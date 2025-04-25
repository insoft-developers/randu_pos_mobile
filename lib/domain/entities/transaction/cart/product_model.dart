import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import '../../../../core/utils/freezed_util.dart';
import '../sale_type/sale_type_enum.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();

  @HiveType(typeId: 3, adapterName: 'ProductModelAdapter')
  const factory ProductModel({
    @HiveField(0) required int id,
    @HiveField(1) @JsonKey(name: 'category_id') int? categoryId,
    @HiveField(2) String? code,
    @HiveField(3) String? sku,
    @HiveField(4) String? name,
    @HiveField(5) int? price,
    @HiveField(6) int? cost,
    @HiveField(7) String? unit,
    @HiveField(8) int? quantity,
    @HiveField(9) @JsonKey(name: 'stock_alert') int? stockAlert,
    @HiveField(10) int? sell,
    @HiveField(11) String? created,
    @HiveField(12) @JsonKey(name: 'user_id') int? userId,
    @HiveField(13) @JsonKey(name: 'is_variant') int? isVariant,
    @HiveField(14) @JsonKey(name: 'is_manufactured') int? isManufactured,
    @HiveField(15) @JsonKey(name: 'buffered_stock') int? bufferedStock,
    @HiveField(16) @JsonKey(name: 'category_name') String? categoryName,
    @HiveField(17) @JsonKey(name: 'variant_groups') List<String>? variantGroups,
    @HiveField(18) List<VariantModel>? variant,
    @HiveField(19) String? note,
    @HiveField(20) @JsonKey(name: 'price_ta') int? priceTakeAway,
    @HiveField(21) @JsonKey(name: 'price_mp') int? priceMarketPlace,
    @HiveField(22) @JsonKey(name: 'price_cus') int? priceCustom,
    @HiveField(23) @JsonKey(name: 'price_type') String? priceType,
    @HiveField(24)
    @JsonKey(name: 'barcode', includeIfNull: false)
    String? barcode,
    @HiveField(25) @JsonKey(name: 'is_editable') int? isEditable,
    @HiveField(26) int? priceEdit,
    @HiveField(27) bool? isPrinted,
    @HiveField(28) @Default([]) List<ProductModel> productForChecker,
  }) = _ProductModel;

  SaleTypeEnum get saleType => SaleTypeEnum.findByString(priceType ?? 'price');

  int get quantityProduct => quantity ?? 100;

  bool get isHavingVariant => isVariant == 2;

  bool get isPrintedValue => isPrinted ?? false;

  bool get isBufferedStock {
    if (bufferedStock == null) return false;
    return bufferedStock == 1;
  }

  int get shadowStock {
    if (quantity == null) return 0;
    final stock = quantity! - (stockAlert ?? 0);
    if (stock < 0) return 0;
    return stock;
  }

  bool get isProductEditable => isEditable == 1;

  // priceEdit getter: return price if priceEdit is null
  int? get priceEditOrDefault => priceEdit ?? price;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class VariantModel with _$VariantModel {
  const VariantModel._();

  @HiveType(typeId: 4, adapterName: 'VariantModelAdapter')
  const factory VariantModel({
    @HiveField(0) int? id,
    @HiveField(1) @JsonKey(name: 'product_id') int? productId,
    @HiveField(2) @JsonKey(name: 'varian_group') String? varianGroup,
    @HiveField(3) @JsonKey(name: 'varian_name') String? varianName,
    @HiveField(4) String? sku,
    @HiveField(5)
    @JsonKey(name: 'varian_price')
    @IntOrStringConverter()
    int? varianPrice,
    @HiveField(6) @JsonKey(name: 'single_pick') int? singlePick,
    @HiveField(7) @JsonKey(name: 'max_quantity') int? maxQuantity,
    @HiveField(8) @JsonKey(name: 'quantity') int? quantity,
    @HiveField(9) @JsonKey(name: 'note') String? note,
    @HiveField(10) @JsonKey(name: 'price_ta') int? priceTakeAway,
    @HiveField(11) @JsonKey(name: 'price_mp') int? priceMarketPlace,
    @HiveField(12) @JsonKey(name: 'price_cus') int? priceCustom,
  }) = _VariantModel;

  bool get isSinglePick => singlePick == 1;

  factory VariantModel.fromJson(Map<String, dynamic> json) =>
      _$VariantModelFromJson(json);
}
