import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/transactions/close_cashier/close_cashier_uc.dart';
import '../../../repositories/transaction_repository/transaction_repository.dart';

part 'close_cashier_uc_provider.g.dart';

@riverpod
CloseCashierUC closeCashierUC(CloseCashierUCRef ref) {
  final closeCashierUC = CloseCashierUC(
      transactionRepository: ref.watch(iTransactionRepositoryProvider));
  return closeCashierUC;
}
