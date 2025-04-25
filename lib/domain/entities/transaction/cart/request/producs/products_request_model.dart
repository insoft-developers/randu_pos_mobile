import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_request_model.freezed.dart';
part 'products_request_model.g.dart';

@freezed
class ProductsRequestModel with _$ProductsRequestModel {
  const factory ProductsRequestModel({
    String? search,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'group_by') String? groupBy,
    bool? all,
    @JsonKey(name: 'category_id') int? categoryId,
  }) = _ProductsRequestModel;

  factory ProductsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsRequestModelFromJson(json);
}
