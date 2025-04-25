import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/cart/get_products/get_products_uc.dart';
import '../../../repositories/cart_repository/cart_repository.dart';

part 'get_products_uc_provider.g.dart';

@riverpod
GetProductsUC getProductsUC(GetProductsUCRef ref) {
  return GetProductsUC(cartRepository: ref.watch(iCartRepositoryProvider));
}
