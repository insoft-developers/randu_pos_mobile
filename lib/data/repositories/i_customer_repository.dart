import '../../domain/entities/customer/customer_model.dart';
import '../../domain/entities/customer/get_customer_request_model.dart';
import '../../domain/entities/general_response.dart';
import '../../domain/entities/result.dart';

abstract interface class ICustomerRepository {
  Future<Result<List<CustomerModel>>> getCustomers(GetCustomerRequestModel request);

  Future<Result<GeneralResponse<CustomerModel>>> createCustomer({
    required String name,
    required String phone,
  });
}
