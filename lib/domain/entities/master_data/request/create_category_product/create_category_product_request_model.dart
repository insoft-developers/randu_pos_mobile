import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_category_product_request_model.freezed.dart';
part 'create_category_product_request_model.g.dart';

@freezed
class CreateCategoryProductRequestModel
    with _$CreateCategoryProductRequestModel {
  const factory CreateCategoryProductRequestModel({
    required String name,
    required String code,
  }) = _CreateCategoryProductRequestModel;

  factory CreateCategoryProductRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$CreateCategoryProductRequestModelFromJson(json);
}
