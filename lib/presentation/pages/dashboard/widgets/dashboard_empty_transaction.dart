import 'package:flutter/material.dart';

import '../../../../core/misc/app_image.dart';
import '../../../../core/const/colors.dart';
import '../../../widgets/core/text/custom_text.dart';

class DashboardEmptyTransaction extends StatelessWidget {
  const DashboardEmptyTransaction({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getSvgImage('eating', height: height, width: height),
        const SizedBox(
          height: 10,
        ),
        CustomText(
          'Pilih Mode Transaksi\nuntuk memulai penjualan',
          textAlign: TextAlign.center,
          style: CustomTextStyle.lightTypographyCaption
              .copyWith(color: CustomColors.gray, fontSize: 16),
        ),
      ],
    );
  }
}
