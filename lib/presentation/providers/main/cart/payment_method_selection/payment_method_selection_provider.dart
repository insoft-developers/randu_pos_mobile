import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../../../../core/utils/currency_utils.dart';
import '../cart_provider.dart';
import '../get_payment_methods/get_payment_methods_provider.dart';

part 'payment_method_selection_provider.freezed.dart';
part 'payment_method_selection_provider.g.dart';
part 'payment_method_selection_state.dart';

@riverpod
class PaymentMethodSelection extends _$PaymentMethodSelection {
  final _subCash = [
    const BankModel(method: 'Uang Pas', code: '1'),
    const BankModel(method: 'Jumlah Lain', code: '2'),
    const BankModel(method: 'Input Manual', code: '3')
  ];
  @override
  PaymentMethodSelectionState build() {
    final totalPrice =
        ref.watch(cartProvider.select((value) => value.totalPrice));
    return PaymentMethodSelectionState(
        totalPrice: totalPrice, totalPaid: totalPrice);
  }

  /// method of the id
  /// id 1 : Cash
  /// is 2 : Payment Gateway
  /// id 3 : Bank Transfer
  /// id 4 : Kasbon /  (Marketplace, COD, etc)
  /// id 5 : Instant QRIS
  void setPaymentMethod(PaymentMethodModel paymentMethod) {
    final paymentMethods = ref.read(getPaymentMethodsProvider).value ?? [];
    List<BankModel> listSubPayment = [];

    ref.read(cartProvider.notifier).setPaymentMethod(paymentMethod);
    if (paymentMethod.code != null) {
      ref.read(cartProvider.notifier).setPaymentMethodCode(paymentMethod.code!);
    }
    switch (paymentMethod.id) {
      case 1:
        listSubPayment = _subCash;
      case 2:
        setTotalPaid(state.totalPrice);
      case 3:
        setTotalPaid(state.totalPrice);
        final listBank =
            paymentMethods.firstWhereOrNull((e) => e.id == 3)?.bankModel ?? [];
        listSubPayment = listBank;
      case 4:
        final listReceivables =
            paymentMethods.firstWhereOrNull((e) => e.id == 4)?.bankModel ?? [];
        // print('PIUTANG : $listReceivables');
        listSubPayment = listReceivables;
      case 5:
        setTotalPaid(state.totalPrice);
      default:
        setTotalPaid(state.totalPrice);
    }

    state = state.copyWith(
        paymentMethod: paymentMethod,
        subPaymentMethod: listSubPayment,
        isManualInput: paymentMethod.id == 1,
        subSubPaymentMethod: []);
  }

  void setTotalPrice(double totalPrice) {
    state = state.copyWith(totalPrice: totalPrice);
  }

  void setTotalPaid(double totalPaid) {
    state = state.copyWith(totalPaid: totalPaid);
    ref.read(cartProvider.notifier).setTotalPaid(totalPaid);
    print(totalPaid);
  }

  void setSelectedSubPaymentMethod(BankModel selectedSubPaymentMethod) {
    state = state.copyWith(selectedSubPaymentMethod: selectedSubPaymentMethod);
    if (state.paymentMethod != null && state.paymentMethod!.id != 1) {
      ref
          .read(cartProvider.notifier)
          .setPaymentMethodCode(selectedSubPaymentMethod.code ?? 'other');
    }
    List<BankModel> listSubSubPayment = [];
    var subPaymentCode = state.selectedSubPaymentMethod?.code;
    if (subPaymentCode == '2') {
      final denominations =
          getDenominationsAboveAmount(state.totalPrice.toInt());
      listSubSubPayment = denominations
          .map((e) => BankModel(
              method:
                  formatStringIDRToCurrency(text: e.toString(), symbol: 'Rp '),
              code: e.toString()))
          .toList();
      state = state.copyWith(
          subSubPaymentMethod: listSubSubPayment,
          isManualInput: subPaymentCode == '3');
    } else {
      state = state.copyWith(
          subSubPaymentMethod: [],
          isManualInput: subPaymentCode == '3',
          totalPaid: state.totalPrice);
    }
  }

  void setSelectedSubSubPaymentMethod(BankModel selectedSubSubPaymentMethod) {
    setTotalPaid(double.parse(selectedSubSubPaymentMethod.code ?? '0'));
    state = state.copyWith(
        selectedSubSubPaymentMethod: selectedSubSubPaymentMethod);
  }

  void clearSelectedPaymentMethod() {
    state = state.copyWith(
        subSubPaymentMethod: [],
        selectedSubSubPaymentMethod: null,
        isManualInput: false,
        totalPaid: state.totalPrice);
  }
}
