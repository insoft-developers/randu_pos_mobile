import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/misc/app_image.dart';
import '../../../core/const/colors.dart';
import '../../providers/cores/router/go_router_provider.dart';
import '../../providers/main/cart/get_payment_methods/get_payment_methods_provider.dart';
import '../../widgets/core/buttons/primary_button.dart';
import '../../widgets/core/text/custom_text.dart';

class PaymentMethodEmptyPage extends ConsumerWidget {
  const PaymentMethodEmptyPage({super.key});

  void _fetchPaymentMethod(WidgetRef ref) {
    ref.read(getPaymentMethodsProvider.notifier).fetchPaymentMethods();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getLottieImage(
              'not-available',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              repeate: true,
            ),
            const SizedBox(height: 32),
            CustomText(
              'Metode pembayaran tidak tersedia',
              style: CustomTextStyle.h7Bold,
            ),
            const SizedBox(height: 8),
            CustomText(
              'Silakan muat ulang halaman',
              style: CustomTextStyle.body1.copyWith(
                color: CustomColors.darkGray,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 350,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      buttonPrimaryType: ButtonPrimaryType.outlinedWhitePrimary,
                      radius: 8,
                      useAutoSizedLabel: true,
                      preFixWidget: const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Icon(
                          Icons.chevron_left,
                          color: CustomColors.primaryColor,
                        ),
                      ),
                      label: 'Kembali',
                      onTap: () {
                        ref.read(routerProvider).goNamed('dashboard');
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: PrimaryButton(
                      buttonPrimaryType: ButtonPrimaryType.solidPrimary,
                      radius: 8,
                      useAutoSizedLabel: true,
                      preFixWidget: const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Icon(Icons.refresh_sharp),
                      ),
                      label: 'Muat Ulang',
                      onTap: () => _fetchPaymentMethod(ref),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
