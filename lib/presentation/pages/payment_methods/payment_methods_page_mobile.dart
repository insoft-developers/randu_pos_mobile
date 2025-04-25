import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/colors.dart';
import '../../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../providers/main/cart/get_payment_methods/get_payment_methods_provider.dart';
import '../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import 'widgets/mobile/payment_methods_list_mobile.dart';
import 'widgets/mobile/sub_payment_detail_mobile.dart';
import 'widgets/payment_info_box.dart';

class PaymentMethodsPageMobile extends ConsumerStatefulWidget {
  const PaymentMethodsPageMobile({super.key});

  @override
  ConsumerState createState() => _PaymentMethodsPageMobileState();
}

class _PaymentMethodsPageMobileState
    extends ConsumerState<PaymentMethodsPageMobile> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var paymentMethodsState = ref.watch(getPaymentMethodsProvider);
      var paymentMethodSelection = ref.watch(paymentMethodSelectionProvider);
      if (paymentMethodsState.value != null &&
          paymentMethodsState.value!.isNotEmpty) {
        if (!paymentMethodsState.value!
            .contains(paymentMethodSelection.paymentMethod)) {
          ref
              .read(paymentMethodSelectionProvider.notifier)
              .setPaymentMethod(paymentMethodsState.value!.first);
          ref
              .read(paymentMethodSelectionProvider.notifier)
              .clearSelectedPaymentMethod();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var paymentMethodsState = ref.watch(getPaymentMethodsProvider);
    var paymentMethodSelection = ref.watch(paymentMethodSelectionProvider);
    List<PaymentMethodModel> paymentMethod = paymentMethodsState.value == null
        ? []
        : paymentMethodsState.value!
            .where((value) => value.selected == true)
            .toList();
    return SingleChildScrollView(
      child: SafeArea(
        child: paymentMethodsState is AsyncLoading
            ? const Center(child: CircularProgressIndicator())
            : paymentMethodsState is AsyncError
                ? const Center(child: Text('Error'))
                : Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PaymentInfoBox(
                            isTextRow: true,
                            title: 'Total Transaksi',
                            nominal:
                                paymentMethodSelection.totalPrice.toString(),
                            colorStart: CustomColors.gradientOrangeStart,
                            colorEnd: CustomColors.gradientOrangeEnd,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: PaymentInfoBox(
                                    title: 'Total Bayar',
                                    nominal: paymentMethodSelection.totalPaid
                                        .toString(),
                                    colorStart: CustomColors.gradientGreenStart,
                                    colorEnd: CustomColors.gradientGreenEnd,
                                  )),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: PaymentInfoBox(
                                  title: 'Uang Kembalian',
                                  nominal: ref.watch(
                                      paymentMethodSelectionProvider.select(
                                          (value) =>
                                              value.changePrice.toString())),
                                  colorStart: CustomColors.gradientRedStart,
                                  colorEnd: CustomColors.gradientRedEnd,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PaymentMethodsListMobile(
                              paymentMethods: paymentMethod),
                        ),
                        const SubPaymentDetailMobile(),
                      ],
                    ),
                  ),
      ),
    );
  }
}
