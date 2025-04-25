import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/transactions/check_payment_status/check_payment_status_uc.dart';
import '../../../repositories/transaction_repository/transaction_repository.dart';

part 'check_payment_status_uc.g.dart';

@riverpod
CheckPaymentStatusUC checkPaymentStatusUC(CheckPaymentStatusUCRef ref) {
  return CheckPaymentStatusUC(
      transactionRepository: ref.watch(iTransactionRepositoryProvider));
}
