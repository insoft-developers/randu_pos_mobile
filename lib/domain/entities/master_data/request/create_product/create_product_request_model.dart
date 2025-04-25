import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_request_model.freezed.dart';
part 'create_product_request_model.g.dart';

@freezed
class CreateProductRequestModel with _$CreateProductRequestModel {
  const factory CreateProductRequestModel({
    required String name,
    @JsonKey(name: 'category_id') required int categoryId,
    required String sku,
    required int price,
    @JsonKey(name: 'price_ta') required int priceTa,
    @JsonKey(name: 'price_mp') required int priceMp,
    @JsonKey(name: 'price_cus') required int priceCus,
    String? barcode,
  }) = _CreateProductRequestModel;

  factory CreateProductRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateProductRequestModelFromJson(json);
}
