import 'package:flutter/material.dart';

import '../../../widgets/core/text/custom_text.dart';

class PinHeaderTablet extends StatelessWidget {
  const PinHeaderTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/splash-logo.png',
              width: 60,
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang Kembali!',
                    style: CustomTextStyle.h5ExtraBold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'PIN default 123123. Jika lupa PIN, silahkan reset PIN melalui Dashboard Web.',
                    style: CustomTextStyle.lightComponentsChip
                        .copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
