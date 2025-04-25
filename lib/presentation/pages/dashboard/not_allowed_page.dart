import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/misc/app_image.dart';
import '../../../core/utils/open_cashier_util.dart';
import '../../widgets/core/buttons/primary_button.dart';
import '../../widgets/core/text/custom_text.dart';

class NotAllowedPage extends StatelessWidget {
  const NotAllowedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getSvgImage('not_allowed',
                height: MediaQuery.of(context).size.height * 0.3),
            const SizedBox(
              height: 16,
            ),
            CustomText(
              'Pengaturan Petty Cash / Kembalian = ON',
              style: CustomTextStyle.lightTypographyBody1SemiBold,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text('Silahkan buka kasir terlebih dahulu'),
            const SizedBox(
              height: 16,
            ),
            Consumer(builder: (context, ref, child) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: PrimaryButton(
                  label: 'Buka Kasir',
                  onTap: () {
                    showStartShiftDialog(context, ref);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
