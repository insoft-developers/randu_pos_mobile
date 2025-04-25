import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/cart/get_payment_methods/get_payment_methods_uc.dart';
import '../../../repositories/cart_repository/cart_repository.dart';

part 'get_payment_methods_uc_provider.g.dart';


@riverpod
GetPaymentMethodsUC getPaymentMethodsUC (GetPaymentMethodsUCRef ref) {
  return GetPaymentMethodsUC(cartRepository: ref.watch(iCartRepositoryProvider));
}