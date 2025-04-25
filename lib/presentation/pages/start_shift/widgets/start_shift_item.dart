import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../widgets/core/text/custom_text.dart';

class StartShiftItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final Widget content;
  const StartShiftItem({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 8,
              ),
              CustomText(
                title,
                style: context.isMobile
                    ? CustomTextStyle.mobileDialogText
                    : CustomTextStyle.tabletDialogText,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          content,
        ],
      ),
    );
  }
}
