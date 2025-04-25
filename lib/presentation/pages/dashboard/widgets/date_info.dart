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
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.calendar_month_rounded,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(
          width: 4,
        ),
        AutoSizedTextWidget(
          getCurrentDate(),
          textAlign: TextAlign.end,
          style: context.isMobile
              ? CustomTextStyle.lightComponentInputLabel
                  .copyWith(color: Colors.white)
              : CustomTextStyle.lightTypographyBody2
                  .copyWith(color: Colors.white),
          ellipsis: true,
        ),
      ],
    );
  }
}
