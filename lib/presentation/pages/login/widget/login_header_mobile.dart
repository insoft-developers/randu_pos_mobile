import 'package:flutter/material.dart';

import '../../../widgets/core/text/custom_text.dart';

class LoginHeaderMobile extends StatelessWidget {
  const LoginHeaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        FractionallySizedBox(
          widthFactor: 1 / 3,
          child: Image.asset(
            'assets/images/splash-logo.png',
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        CustomText(
          'Selamat Datang Kembali!',
          textAlign: TextAlign.center,
          style: CustomTextStyle.h5ExtraBold,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomText(
          'Cegah bangkrut, tambah cuan dengan Randu',
          textAlign: TextAlign.center,
          style: CustomTextStyle.lightComponentsChip,
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
