part of 'payment_method_selection_provider.dart';

@freezed
class PaymentMethodSelectionState with _$PaymentMethodSelectionState {
  const PaymentMethodSelectionState._();
  const factory PaymentMethodSelectionState(
      {PaymentMethodModel? paymentMethod,
      @Default(0) double totalPrice,
      @Default(0) double totalPaid,
      @Default([]) List<BankModel> subPaymentMethod,
      @Default([]) List<BankModel> subSubPaymentMethod,
      BankModel? selectedSubPaymentMethod,
      BankModel? selectedSubSubPaymentMethod,
      @Default(false) bool isManualInput}) = _PaymentMethodSelectionState;

  double get changePrice {
    return ((totalPaid) - (totalPrice) > 0) ? (totalPaid - (totalPrice)) : 0;
  }
}
