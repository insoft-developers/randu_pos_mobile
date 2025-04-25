import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/entities/result.dart';
import '../../../../../domain/usecases/saved_transaction/get_saved_transactions/get_saved_transactions_uc.dart';
import '../../../usecases/saved/get_saved_transaction/get_saved_transactions_uc_provider.dart';
import '../../cart/cart_provider.dart';

part 'get_saved_transactions_provider.freezed.dart';
part 'get_saved_transactions_provider.g.dart';
part 'get_saved_transactions_state.dart';

@riverpod
class GetSavedTransactions extends _$GetSavedTransactions {
  @override
  GetSavedTransactionsState build() => const GetSavedTransactionsState();

  void fetchSavedTransactions() async {
    GetSavedTransactionsUC getSavedTransactionsUC =
        ref.read(getSavedTransactionsUCProvider);
    var result = await getSavedTransactionsUC(null);

    switch (result) {
      case Success(value: final response):
        state = state.copyWith(value: response);
      case Failed(message: _):
        state = const GetSavedTransactionsState();
    }
  }
}
