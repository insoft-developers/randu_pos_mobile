import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/colors.dart';
import '../../providers/main/cart/get_payment_methods/get_payment_methods_provider.dart';
import '../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import 'widgets/payment_info_box.dart';
import 'widgets/tablet/payment_methods_list_tablet.dart';
import 'widgets/tablet/sub_payment_detail_tabet.dart';

class PaymentMethodsPageTablet extends ConsumerStatefulWidget {
  const PaymentMethodsPageTablet({super.key});

  @override
  ConsumerState createState() => _PaymentMethodsPageTabletState();
}

class _PaymentMethodsPageTabletState
    extends ConsumerState<PaymentMethodsPageTablet> {
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
    var paymentMethods = ref.watch(getPaymentMethodsProvider);
    var paymentMethodSelection = ref.watch(paymentMethodSelectionProvider);

    return SafeArea(
      child: paymentMethods is AsyncLoading
          ? const Center(child: CircularProgressIndicator())
          : paymentMethods is AsyncError
              ? const Center(child: Text('Error'))
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: PaymentInfoBox(
                                        title: 'Total Transaksi',
                                        nominal: paymentMethodSelection
                                            .totalPrice
                                            .toString(),
                                        colorStart:
                                            CustomColors.gradientOrangeStart,
                                        colorEnd:
                                            CustomColors.gradientOrangeEnd,
                                      )),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      flex: 1,
                                      child: PaymentInfoBox(
                                        title: 'Total Bayar',
                                        nominal: paymentMethodSelection
                                            .totalPaid
                                            .toString(),
                                        colorStart:
                                            CustomColors.gradientGreenStart,
                                        colorEnd: CustomColors.gradientGreenEnd,
                                      )),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    flex: 1,
                                    child: PaymentInfoBox(
                                      title: 'Uang Kembalian',
                                      nominal: ref.watch(
                                          paymentMethodSelectionProvider.select(
                                              (value) => value.changePrice
                                                  .toString())),
                                      colorStart: CustomColors.gradientRedStart,
                                      colorEnd: CustomColors.gradientRedEnd,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: PaymentMethodsListTablet(
                                          paymentMethods:
                                              paymentMethods.value ?? []),
                                    ),
                                    const SizedBox(width: 16),
                                    const Expanded(
                                      flex: 2,
                                      child: SubPaymentDetailTabet(),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
