import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/entities/result.dart';
import '../../../../../domain/usecases/saved_transaction/edit_saved_transaction/edit_transaction_uc.dart';
import '../../../usecases/saved/edit_transaction/edit_transaction_uc_provider.dart';
import '../../cart/cart_provider.dart';
import '../get_saved_transactions/get_saved_transactions_provider.dart';

part 'edit_transaction_provider.g.dart';

@riverpod
class EditTransaction extends _$EditTransaction {
  @override
  String? build() => null;

  void editTransaction(CartState model) async {
    EditTransactionUC editTransactionUC = ref.read(editTransactionUcProvider);
    final result = await editTransactionUC(model);

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