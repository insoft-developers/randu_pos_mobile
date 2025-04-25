import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/customer/get_customers/get_customers_uc.dart';
import '../../../repositories/customer_repository/customer_repository.dart';
part 'get_customers_uc_provider.g.dart';

@riverpod
GetCustomersUC getCustomersUC(GetCustomersUCRef ref) {
  return GetCustomersUC(
      customerRepository: ref.watch(iCustomerRepositoryProvider));
}
