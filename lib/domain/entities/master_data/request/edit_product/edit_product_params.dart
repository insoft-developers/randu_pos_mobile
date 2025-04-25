import 'package:freezed_annotation/freezed_annotation.dart';

import '../create_product/create_product_request_model.dart';

part 'edit_product_params.freezed.dart';

@freezed
class EditProductParams with _$EditProductParams {
  const factory EditProductParams({
    required int idProduct,
    required CreateProductRequestModel request,
  }) = _EditProductParams;
}
