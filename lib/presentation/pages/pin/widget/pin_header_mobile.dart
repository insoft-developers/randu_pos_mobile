import 'package:flutter/material.dart';

import '../../../widgets/core/text/custom_text.dart';

class PinHeaderMobile extends StatelessWidget {
  const PinHeaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 32,
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
          height: 24,
        ),
        const Text(
          'PIN default 123123. Jika lupa PIN, silahkan reset PIN melalui Dashboard Web.',
          style: TextStyle(
            // color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
