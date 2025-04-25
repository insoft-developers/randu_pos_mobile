import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../widgets/core/text/auto_sized_text_widget.dart';
import '../../../widgets/core/text/custom_text.dart';

class DateInfo extends StatelessWidget {
  const DateInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Icon(
          Icons.calendar_month_rounded,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        AutoSizedTextWidget(
          getCurrentDate(),
          textAlign: TextAlign.end,
          style: CustomTextStyle.lightTypographyBody2.copyWith(
            color: Colors.white,
            fontSize: context.isMobile ? 12 : 14,
          ),
          ellipsis: true,
        ),
      ],
    );
  }
}
