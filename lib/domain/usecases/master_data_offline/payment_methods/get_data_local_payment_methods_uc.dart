import '../../../../data/repositories/i_master_data_offline_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../usecase.dart';

class GetDataLocalPaymentMethodsUC
    implements UseCase<Result<List<PaymentMethodModel>>, void> {
  final IMasterDataOfflineRepository _repository;

  GetDataLocalPaymentMethodsUC(
      {required IMasterDataOfflineRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<PaymentMethodModel>>> call(void _) async {
    final result = await _repository.getPaymentMethods();
    return result;
  }
}
