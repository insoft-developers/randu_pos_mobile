import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../container/custom_rounded_container.dart';
import '../text/custom_text.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonLabel;
  final Color bgColor;
  final IconData? icon;
  final Color foregroundColor;
  const SecondaryButton({
    required this.onTap,
    required this.buttonLabel,
    super.key,
    required this.bgColor,
    this.icon,
    this.foregroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: UnconstrainedBox(
        child: CustomRoundedContainer(
          radius: 8,
          shadow: const [],
          color: bgColor,
          padding: const EdgeInsets.fromLTRB(12, 3, 12, 4),
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _label,
                    const SizedBox(
                      width: 4,
                    ),
                    Icon(icon, size: 16, color: foregroundColor),
                  ],
                )
              : _label,
        ),
      ),
    );
  }

  Widget get _label => CustomText(
        buttonLabel,
        style: CustomTextStyle.lightTypographyCaptionMinHeight
            .copyWith(color: foregroundColor),
      );

  static SecondaryButton cancel(
      {required VoidCallback onTap, String label = 'Cancel'}) {
    return SecondaryButton(
      onTap: onTap,
      buttonLabel: label,
      bgColor: CustomColors.pastelRed,
      icon: Icons.cancel,
      foregroundColor: CustomColors.white,
    );
  }

  static SecondaryButton save(
      {required VoidCallback onTap,
      String label = 'Save',
      Color bgColor = CustomColors.pastelGreen}) {
    return SecondaryButton(
      onTap: onTap,
      buttonLabel: 'Save',
      bgColor: bgColor,
      icon: Icons.check_circle,
      foregroundColor: CustomColors.white,
    );
  }

  static SecondaryButton edit(
      {required VoidCallback onTap, String label = 'Edit', Color? bgColor}) {
    return SecondaryButton(
      onTap: onTap,
      buttonLabel: label,
      bgColor: bgColor ?? CustomColors.pastelGold,
      icon: Icons.edit_note,
    );
  }
}
