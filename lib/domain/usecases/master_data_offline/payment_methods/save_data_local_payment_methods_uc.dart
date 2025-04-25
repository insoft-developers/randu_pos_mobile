import '../../../../data/repositories/i_master_data_offline_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../usecase.dart';

class SaveDataLocalPaymentMethodsUC
    implements UseCase<Result<String>, List<PaymentMethodModel>> {
  final IMasterDataOfflineRepository _repository;

  SaveDataLocalPaymentMethodsUC(
      {required IMasterDataOfflineRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(List<PaymentMethodModel> paymentMethods) async {
    return _repository.savePaymentMethods(paymentMethods);
  }
}
