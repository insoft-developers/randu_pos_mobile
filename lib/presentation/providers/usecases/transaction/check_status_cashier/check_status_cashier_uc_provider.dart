import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/transactions/check_status_cashier/check_status_cashier_uc.dart';
import '../../../repositories/transaction_repository/transaction_repository.dart';

part 'check_status_cashier_uc_provider.g.dart';

@riverpod
CheckStatusCashierUC checkStatusCashierUC(CheckStatusCashierUCRef ref) {
  return CheckStatusCashierUC(
      transactionRepository: ref.watch(iTransactionRepositoryProvider));
}
