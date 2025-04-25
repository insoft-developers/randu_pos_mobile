import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/transactions/open_cashier/open_cashier_uc.dart';
import '../../../repositories/transaction_repository/transaction_repository.dart';

part 'open_cashier_uc_provider.g.dart';

@riverpod
OpenCashierUC openCashierUC(OpenCashierUCRef ref) {
  final openCashierUC = OpenCashierUC(
      transactionRepository: ref.watch(iTransactionRepositoryProvider));
  // ref.read(userDataProvider.notifier).getUser();
  return openCashierUC;
}
