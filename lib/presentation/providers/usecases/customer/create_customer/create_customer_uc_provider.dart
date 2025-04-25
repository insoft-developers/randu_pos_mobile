import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/customer/create_customer/create_customer_uc.dart';
import '../../../repositories/customer_repository/customer_repository.dart';

part 'create_customer_uc_provider.g.dart';

@riverpod
CreateCustomerUC createCustomerUC(CreateCustomerUCRef ref) {
  return CreateCustomerUC(
      customerRepository: ref.watch(iCustomerRepositoryProvider));
}
