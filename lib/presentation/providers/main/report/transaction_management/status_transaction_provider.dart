import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/report/transaction_management/status_transaction_enum.dart';
import '../../../../../domain/usecases/report/transaction_management/set_status_transaction/set_status_transaction_param.dart';
import '../../../../../domain/usecases/report/transaction_management/set_status_transaction/set_transaction_status_uc.dart';
import '../../../usecases/report/transaction_management/set_transaction_status_uc_provider.dart';

part 'status_transaction_provider.g.dart';

@riverpod
class StatusTransaction extends _$StatusTransaction {
  @override
  FutureOr<StatusTransactionEnum> build(StatusTransactionEnum initialStatus) {
    // Set the initial value dynamically from the passed parameter
    return initialStatus;
  }

  Future<void> setStatusTransaction(
      int transactionId, StatusTransactionEnum statusTransaction) async {
    state = const AsyncLoading();
    SetTransactionStatusUC setTransactionStatusUC =
        ref.read(setStatusTransactionUCProvider);
    await setTransactionStatusUC(SetStatusTransactionParam(
        transactionId: transactionId, status: statusTransaction));
    state = AsyncValue.data(statusTransaction);
  }
}
