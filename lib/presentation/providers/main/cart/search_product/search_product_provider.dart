import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../get_products/get_products_provider.dart';

part 'search_product_provider.g.dart';

@riverpod
class SearchProduct extends _$SearchProduct {
  @override
  String build() => '';

  void setSearchParam({required String param}) {
    state = param;
    ProductsRequestModel request = ProductsRequestModel(search: param);
    ref.read(getProductsProvider.notifier).fetchProducts(request);
  }
}

@riverpod
class ActivateSearchProduct extends _$ActivateSearchProduct {
  @override
  bool build() => false;

  void toggleSearch() {
    state = !state;
  }
}
