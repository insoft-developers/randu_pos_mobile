part of 'get_saved_transactions_provider.dart';

@freezed
class GetSavedTransactionsState with _$GetSavedTransactionsState {
  const factory GetSavedTransactionsState({
    List<CartState>? value,
  }) = _GetSavedTransactionsState;
}
