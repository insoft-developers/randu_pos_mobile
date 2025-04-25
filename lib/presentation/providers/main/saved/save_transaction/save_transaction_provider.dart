import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/entities/result.dart';
import '../../../../../domain/usecases/saved_transaction/save_transaction/save_transaction_uc.dart';
import '../../../usecases/saved/save_transaction/save_transaction_uc_provider.dart';
import '../../cart/cart_provider.dart';
import '../get_saved_transactions/get_saved_transactions_provider.dart';

part 'save_transaction_provider.g.dart';

@riverpod
class SaveTransaction extends _$SaveTransaction {
  @override
  String? build() => null;

  void saveTransaction(CartState model) async {
    SaveTransactionUC saveTransactionUC = ref.read(saveTransactionUcProvider);
    final result = await saveTransactionUC(model);

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
