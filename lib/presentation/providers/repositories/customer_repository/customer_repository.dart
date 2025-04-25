import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/remote/api_customer_repository.dart';
import '../../../../data/repositories/i_customer_repository.dart';
import '../../cores/http_client/dio_provider.dart';

part 'customer_repository.g.dart';

@riverpod
ICustomerRepository iCustomerRepository(ICustomerRepositoryRef ref) {
  return ApiCustomerRepository(dio: ref.watch(dioProvider));
}
