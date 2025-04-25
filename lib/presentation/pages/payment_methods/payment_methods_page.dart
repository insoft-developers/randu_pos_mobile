import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/colors.dart';
import '../../../core/extensions/context_extension.dart';
import '../../providers/main/cart/get_payment_methods/get_payment_methods_provider.dart';
import '../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import '../../widgets/core/responsive/responsive_layout.dart';
import '../../widgets/core/text/custom_text_style.dart';
import 'payment_method_empty_page.dart';
import 'payment_methods_page_mobile.dart';
import 'payment_methods_page_tablet.dart';
import 'widgets/loading/payment_method_loading_mobile.dart';
import 'widgets/loading/payment_method_loading_tablet.dart';
import 'widgets/payment_bottom_button_group.dart';

class PaymentMethodsPage extends ConsumerStatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  ConsumerState<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends ConsumerState<PaymentMethodsPage> {
  @override
  Widget build(BuildContext context) {
    var paymentMethods = ref.watch(getPaymentMethodsProvider);
    var paymentMethodSelection = ref.watch(paymentMethodSelectionProvider);

    if (paymentMethodSelection.paymentMethod == null) {
      Future.microtask(() {
        if (paymentMethods.value != null && paymentMethods.value!.isNotEmpty) {
          var paymentMethod = paymentMethods.value!;
          ref
              .read(paymentMethodSelectionProvider.notifier)
              .setPaymentMethod(paymentMethod.first);

          ref
              .read(paymentMethodSelectionProvider.notifier)
              .clearSelectedPaymentMethod();
        }
      });
    }
    return Scaffold(
      appBar: context.isMobile
          ? AppBar(
              title:
                  const Text('Metode Pembayaran', textAlign: TextAlign.center),
              centerTitle: true,
              backgroundColor: CustomColors.primaryColor,
              titleTextStyle: CustomTextStyle.h6,
              iconTheme: const IconThemeData(color: Colors.white),
              actions: [
                paymentMethods is AsyncLoading
                    ? const SizedBox.shrink()
                    : IconButton(
                        onPressed: () {
                          ref
                              .read(getPaymentMethodsProvider.notifier)
                              .fetchPaymentMethods(refresh: true);
                        },
                        icon: const Icon(Icons.refresh),
                      )
              ],
            )
          : null,
      bottomNavigationBar: context.isMobile &&
              paymentMethods.value != null &&
              paymentMethods.value!.isNotEmpty
          ? const BottomAppBar(
              color: Colors.white,
              child: PaymentBottomButtonGroup(),
            )
          : null,
      body: paymentMethods.map(
        data: (data) {
          if (data.value.isEmpty) {
            return const PaymentMethodEmptyPage();
          }

          return const PaymentMethodsExist();
        },
        error: (error) {
          return const PaymentMethodEmptyPage();
        },
        loading: (loading) {
          return MediaQuery.of(context).size.width < 700
              ? const PaymentMethodLoadingMobile()
              : const PaymentMethodLoadingTablet();
        },
      ),
    );
  }
}

class PaymentMethodsExist extends StatelessWidget {
  const PaymentMethodsExist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: PaymentMethodsPageMobile(),
      tabletBody: PaymentMethodsPageTablet(),
    );
  }
}
