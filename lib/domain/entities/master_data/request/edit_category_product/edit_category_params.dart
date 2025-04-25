import 'package:freezed_annotation/freezed_annotation.dart';

import '../create_category_product/create_category_product_request_model.dart';

part 'edit_category_params.freezed.dart';
part 'edit_category_params.g.dart';

@freezed
class EditCategoryParams with _$EditCategoryParams {
  const factory EditCategoryParams({
    required int id,
    required CreateCategoryProductRequestModel request,
  }) = _EditCategoryParams;

  factory EditCategoryParams.fromJson(Map<String, dynamic> json) =>
      _$EditCategoryParamsFromJson(json);
}
