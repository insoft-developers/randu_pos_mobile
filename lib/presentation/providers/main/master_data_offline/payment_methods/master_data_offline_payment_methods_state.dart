part of 'master_data_offline_payment_methods_provider.dart';

@freezed
class MasterDataOfflinePaymentMethodsState
    with _$MasterDataOfflinePaymentMethodsState {
  const factory MasterDataOfflinePaymentMethodsState({
    List<PaymentMethodModel>? paymentMethods,
    String? saveMessage,
  }) = _MasterDataOfflinePaymentMethodsState;
}
