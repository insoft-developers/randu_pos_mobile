import '../../../../data/repositories/i_transaction_repository.dart';
import '../../../entities/general_response.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class CheckStatusCashierUC implements UseCase<Result<GeneralResponse>?, void> {
  final ITransactionRepository _transactionRepository;

  CheckStatusCashierUC({required ITransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;
  @override
  Future<Result<GeneralResponse>> call(void _) async {
    var checkStatusCashier = await _transactionRepository.checkStatusCashier();
    return checkStatusCashier;
  }
}
