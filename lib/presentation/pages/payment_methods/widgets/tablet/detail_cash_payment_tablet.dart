import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../domain/entities/general_response.dart';
import '../../../../../core/const/colors.dart';
import '../../../../../core/utils/currency_utils.dart';
import '../../../../../core/utils/url_launcher.dart';
import '../../../../providers/cores/router/go_router_provider.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import '../../../../providers/main/transaction/send_payment/send_payment_provider.dart';
import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../../../../widgets/core/extension_dialog/extension_dialog.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../../widgets/core/text_fields/custom_text_field.dart';
import '../payment_bottom_button_group.dart';
import '../sub_payment_method_card.dart';

class DetailCashPaymentTablet extends ConsumerWidget {
  const DetailCashPaymentTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var totalPrice =
        ref.watch(cartProvider.select((value) => value.totalPrice));
    var paymentMethodSelection = ref.watch(paymentMethodSelectionProvider);
    final subPaymentMethod = paymentMethodSelection.subPaymentMethod;
    final subSubPaymentMethod = paymentMethodSelection.subSubPaymentMethod;
    final isManualInput = paymentMethodSelection.isManualInput;
    final selectedSubPaymentMethod =
        paymentMethodSelection.selectedSubPaymentMethod;

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
    return CustomRoundedContainer(
      padding: const EdgeInsets.all(24),
      shadow: const [
        BoxShadow(
          color: CustomColors.gray,
          blurRadius: 4,
        )
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pembayaran Tunai',
            style: CustomTextStyle.tabletDialogTitle
                .copyWith(color: CustomColors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              selectedSubPaymentMethod != null &&
                      selectedSubPaymentMethod.method != null
                  ? CustomRoundedContainer(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 32),
                      radius: 8,
                      shadow: const [],
                      color: Colors.lightBlue.withValues(alpha: .2),
                      child: Text(
                        selectedSubPaymentMethod.method!,
                        style: CustomTextStyle.productName.copyWith(
                          color: CustomColors.primaryColor,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(width: 16),
              CustomRoundedContainer(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                radius: 8,
                shadow: const [],
                color: Colors.yellow.withValues(alpha: .4),
                child: Text(
                  formatStringIDRToCurrency(
                      text: '${paymentMethodSelection.totalPaid}',
                      symbol: 'Rp ',
                      isDouble: true),
                  style: CustomTextStyle.productName.copyWith(
                    color: CustomColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Jenis Pembayaran Tunai',
            style: CustomTextStyle.tabletDialogTitle
                .copyWith(color: CustomColors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              ...subPaymentMethod.map((e) => (Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    child: SubPaymentMethodCard(subMethod: e),
                  )))),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 8),
            ...subSubPaymentMethod.map((e) => Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SubPaymentMethodCard(
                    subMethod: e,
                    isSubSub: true,
                  ),
                ))),
            const SizedBox(height: 8),
            isManualInput
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          CustomTextField(
                            unfocusTapOutside: true,
                            hintText: 'Masukan Jumlah Bayar',
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                ref
                                    .read(
                                        paymentMethodSelectionProvider.notifier)
                                    .setTotalPaid(double.parse(value));
                              } else {
                                ref
                                    .read(
                                        paymentMethodSelectionProvider.notifier)
                                    .setTotalPaid(totalPrice);
                              }
                            },
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(height: 8),
          ]),
          const Spacer(),
          const PaymentBottomButtonGroup(),
        ],
      ),
    );
  }
}
