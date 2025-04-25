import '../../../../data/repositories/i_customer_repository.dart';
import '../../../entities/customer/customer_model.dart';
import '../../../entities/customer/get_customer_request_model.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class GetCustomersUC implements UseCase<Result<List<CustomerModel>>?, GetCustomerRequestModel> {
  final ICustomerRepository _customerRepository;

  GetCustomersUC({required ICustomerRepository customerRepository})
      : _customerRepository = customerRepository;
  @override
  Future<Result<List<CustomerModel>>> call(GetCustomerRequestModel params) async {
    var getCustomers = await _customerRepository.getCustomers(params);
    if (getCustomers is Success) {
      return Result.success(getCustomers.resultValue!);
    } else {
      return Result.failed(getCustomers.errorMessage ?? 'Error');
    }
  }
}