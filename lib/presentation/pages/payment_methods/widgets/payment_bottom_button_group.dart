import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../domain/entities/general_response.dart';
import '../../../../core/const/colors.dart';
import '../../../../core/utils/url_launcher.dart';
import '../../../../insoft/controller/payment_method_controller.dart';
import '../../../providers/cores/router/go_router_provider.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/cart/get_payment_methods/get_payment_methods_provider.dart';
import '../../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import '../../../providers/main/transaction/send_payment/send_payment_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/buttons/randu_button.dart';
import '../../../widgets/core/extension_dialog/extension_dialog.dart';

class PaymentBottomButtonGroup extends ConsumerWidget {
  const PaymentBottomButtonGroup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentMethod = ref.watch(paymentMethodSelectionProvider);
    ref.listen(sendPaymentProvider, (previous, next) {
      print('previous: $previous');
      print('next: $next');
      if (previous is AsyncLoading && next is AsyncData) {
        final value = next.value;
        if (value != null) {
          if (value.status) {
            ref.read(cartProvider.notifier).setPaymentResponse(value.data!);
            context.pop();
            final methodPayment =
                ref.read(cartProvider.select((value) => value.paymentMethod));
            if (methodPayment?.id == 2) {
              launchUrlImpl('${value.data?.paymentUrl}');
            }
            ref.read(routerProvider).pushNamed('transaction_success');
          } else {
            context.pop();
            context.showResultDialog(
                baseResponse:
                    GeneralResponse(status: false, message: value.message));
          }
        }
      } else if (previous is AsyncLoading && next is AsyncError) {
        print('send payment error');
        context.pop();
        context.showResultDialog(
            baseResponse: next.value ??
                const GeneralResponse(
                    status: false, message: 'Error', data: null));
      } else if (next is AsyncLoading) {
        print('send payment loading');
        context.showLoadingDialog();
      }
    });
    return SizedBox(
      height: context.isMobile ? 40 : 60,
      child: Row(
        children: [
          !context.isMobile
              ? SizedBox(
                  width: 60,
                  height: 50,
                  child: RanduButton(
                    color: CustomColors.primaryColor,
                    borderWidth: 1.5,
                    icon: Icons.refresh,
                    radius: 12,
                    onPressed: () {
                      ref
                          .read(getPaymentMethodsProvider.notifier)
                          .fetchPaymentMethods();
                    },
                  ),
                )
              : const SizedBox.shrink(),
          !context.isMobile
              ? const SizedBox(width: 8)
              : const SizedBox.shrink(),
          Expanded(
              child: PrimaryButton(
                  // expandableHeight: true,
                  buttonPrimaryType: ButtonPrimaryType.outlinedWhitePrimary,
                  label: 'Kembali',
                  preFixWidget: Padding(
                    padding: EdgeInsets.only(
                      right: context.isMobile ? 4 : 16,
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      color: CustomColors.primaryColor,
                    ),
                  ),
                  onTap: () => ref.read(routerProvider).pop())),
          const SizedBox(width: 8),
          Expanded(
              child: PrimaryButton(
                  disabled: paymentMethod.selectedSubPaymentMethod == null &&
                      paymentMethod.paymentMethod?.id != 2,
                  buttonPrimaryType: ButtonPrimaryType.solidOrange,
                  useAutoSizedLabel: true,
                  // expandableHeight: true,
                  label: 'Proses',
                  postFixWidget: context.isMobile
                      ? const SizedBox.shrink()
                      : const Padding(
                          padding: EdgeInsets.only(
                            left: 16,
                          ),
                          child: Icon(Icons.send),
                        ),
                  onTap: () {
                    print('before request.');
                    var request = ref.watch(cartProvider
                        .select((value) => value.toPaymentRequest()));
                    PaymentMethodController pmc =
                        Get.put(PaymentMethodController());
                    String flagId = pmc.selectedFlagId.value;
                    request = request.copyWith(flag: flagId);
                    debugPrint('request ${request.toJson()} ', wrapWidth: 1024);

                    ref.read(sendPaymentProvider.notifier).sendPayment(request);
                  })),
        ],
      ),
    );
  }
}
