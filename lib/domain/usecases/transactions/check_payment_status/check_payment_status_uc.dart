import '../../../../../data/repositories/i_transaction_repository.dart';
import '../../../entities/general_response.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/payment/payment_response_data.dart';
import '../../usecase.dart';

class CheckPaymentStatusUC
    implements UseCase<Result<GeneralResponse<PaymentResponseData>>?, String> {
  final ITransactionRepository _transactionRepository;

  CheckPaymentStatusUC({required ITransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;
  @override
  Future<Result<GeneralResponse<PaymentResponseData>>> call(
      String request) async {
    var checkPaymentStatus =
        await _transactionRepository.checkPaymentStatus(request);
    return checkPaymentStatus;
  }
}
