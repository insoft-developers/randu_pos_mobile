import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/result.dart';
import '../../../../../domain/usecases/saved_transaction/delete_saved_transaction/delete_saved_transaction_uc.dart';
import '../../../usecases/saved/delete_saved_transaction/delete_saved_transaction_uc_provider.dart';
import '../get_saved_transactions/get_saved_transactions_provider.dart';

part 'delete_saved_transaction_provider.g.dart';

@riverpod
class DeleteSavedTransaction extends _$DeleteSavedTransaction {
  @override
  String? build() => null;

  void deleteSavedTransaction({required String savedId}) async {
    DeleteSavedTransactionUC deleteSavedTransactionUC =
        ref.read(deleteSavedTransactionUCProvider);
    final result = await deleteSavedTransactionUC(savedId);

    switch (result) {
      case Success():
        ref
            .read(getSavedTransactionsProvider.notifier)
            .fetchSavedTransactions();
        state = result.resultValue;
        break;
      case Failed(message: String message):
        state = message;
        break;
    }
  }
}
