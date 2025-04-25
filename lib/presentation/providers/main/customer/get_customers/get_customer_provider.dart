import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/customer/customer_model.dart';
import '../../../../../domain/entities/customer/get_customer_request_model.dart';
import '../../../../../domain/usecases/customer/get_customers/get_customers_uc.dart';
import '../../../usecases/customer/get_customers/get_customers_uc_provider.dart';

part 'get_customer_provider.g.dart';

@riverpod
Future<List<CustomerModel>> getCustomers(GetCustomersRef ref,
    {required GetCustomerRequestModel request}) async {
  GetCustomersUC getCustomersUC = ref.read(getCustomersUCProvider);
  var result = await getCustomersUC(request);
  return result.resultValue ?? [];
}
