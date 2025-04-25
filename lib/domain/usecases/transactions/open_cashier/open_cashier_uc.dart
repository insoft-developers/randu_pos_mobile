import '../../../../data/repositories/i_transaction_repository.dart';
import '../../../entities/general_response.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class OpenCashierUC implements UseCase<Result<GeneralResponse>?, int> {
  final ITransactionRepository _transactionRepository;

  OpenCashierUC({required ITransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;
  @override
  Future<Result<GeneralResponse>> call(int params) async {
    var openCashier = await _transactionRepository.openCashier(
        initialCashAmount: params.toString());
    return openCashier;
  }
}
