import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/cart/get_product_categories/get_product_categories_uc.dart';
import '../../../repositories/cart_repository/cart_repository.dart';

part 'get_product_categories_uc_provider.g.dart';

@riverpod
GetProductCategoriesUC getProductCategoriesUC(GetProductCategoriesUCRef ref) {
  return GetProductCategoriesUC(
      cartRepository: ref.watch(iCartRepositoryProvider));
}
