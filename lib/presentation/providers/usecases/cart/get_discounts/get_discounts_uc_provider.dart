import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/cart/get_discounts/get_discounts_uc.dart';
import '../../../repositories/cart_repository/cart_repository.dart';

part 'get_discounts_uc_provider.g.dart';

@riverpod
GetDiscountsUC getDiscountsUC(GetDiscountsUCRef ref) {
  return GetDiscountsUC(cartRepository: ref.watch(iCartRepositoryProvider));
}
