part of 'split_bill_transaction_provider.dart';

@Freezed(
  fromJson: false,
)
class SplitBillTransactionState with _$SplitBillTransactionState {
  const factory SplitBillTransactionState({
    bool? status,
    CartState? originalCart,
    CartState? splitCart,
    String? errorMessage,
  }) = _SplitBillTransactionState;
}
