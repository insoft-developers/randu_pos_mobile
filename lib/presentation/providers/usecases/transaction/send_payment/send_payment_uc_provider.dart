import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/transactions/send_payment/send_payment_uc.dart';
import '../../../repositories/transaction_repository/transaction_repository.dart';

part 'send_payment_uc_provider.g.dart';

@riverpod
SendPaymentUC sendPaymentUC(SendPaymentUCRef ref) {
  return SendPaymentUC(repository: ref.watch(iTransactionRepositoryProvider));
}
