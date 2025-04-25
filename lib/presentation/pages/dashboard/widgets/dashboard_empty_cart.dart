import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../widgets/core/text/custom_text.dart';

class DashboardEmptyCart extends StatelessWidget {
  const DashboardEmptyCart({
    super.key,
    required this.height,
    this.isLanscapeAndSmallerThan1000 = false,
  });

  final double height;
  final bool isLanscapeAndSmallerThan1000;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // getSvgImage('empty_cart', height: height / 2, width: height / 2),
        Image.asset(
          'assets/images/foto-kosong.webp',
          // 'assets/images/login-hero.webp',
          height: MediaQuery.of(context).size.height/4.5,
          width: MediaQuery.of(context).size.width / 4.5,
        ),
        isLanscapeAndSmallerThan1000?const SizedBox.shrink():Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomText(
              'Keranjang kosong',
              textAlign: TextAlign.center,
              style: CustomTextStyle.lightTypographyCaption
                  .copyWith(color: CustomColors.black),
            ),
          ],
        )
      ],
    );
  }
}
