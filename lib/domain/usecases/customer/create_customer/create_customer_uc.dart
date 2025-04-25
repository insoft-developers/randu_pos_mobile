import '../../../../data/repositories/i_customer_repository.dart';
import '../../../entities/customer/customer_model.dart';
import '../../../entities/general_response.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

part 'create_customer_param.dart';

class CreateCustomerUC
    implements UseCase<Result<GeneralResponse>?, CreateCustomerParams> {
  final ICustomerRepository _customerRepository;

  CreateCustomerUC({required ICustomerRepository customerRepository})
      : _customerRepository = customerRepository;
  @override
  Future<Result<GeneralResponse<CustomerModel>>> call(
      CreateCustomerParams params) async {
    var createCustomer = await _customerRepository.createCustomer(
        name: params.name, phone: params.phone);
    if (createCustomer is Success) {
      return Result.success(createCustomer.resultValue!);
    } else {
      return Result.failed(createCustomer.errorMessage ?? 'Error');
    }
  }
}
