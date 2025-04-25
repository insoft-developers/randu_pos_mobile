import '../../../../data/repositories/i_transaction_repository.dart';
import '../../../entities/general_response.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class CloseCashierUC implements UseCase<Result<GeneralResponse>?, void> {
  final ITransactionRepository _transactionRepository;

  CloseCashierUC({required ITransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;
  @override
  Future<Result<GeneralResponse>> call(void _) async {
    var closeCashier = await _transactionRepository.closeCashier();
    return closeCashier;
  }
}
