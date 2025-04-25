import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../widgets/core/text/custom_text.dart';

class StartShiftTitle extends StatelessWidget {
  const StartShiftTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.isMobile ? 12 : 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: CustomColors.primaryColor,
      ),
      child: Center(
        child: CustomText(
          'Mulai ',
          style: context.isMobile
              ? CustomTextStyle.mobileDialogTitle
              : CustomTextStyle.tabletDialogTitle,
        ),
      ),
    );
  }
}
