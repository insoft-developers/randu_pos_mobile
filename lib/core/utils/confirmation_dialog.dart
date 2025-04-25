import 'package:flutter/material.dart';

import '../../presentation/widgets/core/buttons/primary_button.dart';
import '../../presentation/widgets/core/text/custom_text.dart';
import '../misc/app_image.dart';
import '../const/colors.dart';

enum DialogType {
  primary,
  success,
  warning,
  error,
}

enum IconType {
  check('check-mark'),
  question('question-mark'),
  exclamation('exclamation-circle'),
  cross('cross-circle');

  final String name;
  const IconType(this.name);
}

extension CustomDialog on BuildContext {
  Future<bool?> confirmationPopUp({
    required BuildContext context,
    required String titleMessage,
    required String content,
    required DialogType type,
    bool isCancelable = true,
    IconType? iconType,
  }) {
    String svgName = 'question-mark';
    Color color = CustomColors.lightFgSuccess;
    ButtonPrimaryType solidButton = ButtonPrimaryType.solidSuccess;
    ButtonPrimaryType outlinedButton = ButtonPrimaryType.outlinedSuccess;

    switch (type) {
      case DialogType.primary:
        svgName = iconType != null ? iconType.name : IconType.check.name;
        color = CustomColors.primaryColor;
        solidButton = ButtonPrimaryType.solidPrimary;
        outlinedButton = ButtonPrimaryType.outlinedWhitePrimary;
      case DialogType.success:
        svgName = iconType != null ? iconType.name : IconType.question.name;
        color = CustomColors.lightFgSuccess;
        solidButton = ButtonPrimaryType.solidSuccess;
        outlinedButton = ButtonPrimaryType.outlinedSuccess;
      case DialogType.warning:
        svgName = iconType != null ? iconType.name : IconType.exclamation.name;
        color = CustomColors.lightWarningMain;
        solidButton = ButtonPrimaryType.solidWarning;
        outlinedButton = ButtonPrimaryType.outlinedWarning;
      case DialogType.error:
        svgName = iconType != null ? iconType.name : IconType.cross.name;
        color = CustomColors.lightErrorMain;
        solidButton = ButtonPrimaryType.solidError;
        outlinedButton = ButtonPrimaryType.outlinedError;
      default:
    }

    return showDialog<bool?>(
      context: context,
      barrierDismissible: isCancelable,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: getSvgImage(svgName, height: 80, width: 80, color: color),
          title: CustomText(
            titleMessage,
            style: CustomTextStyle.h6.copyWith(color: color),
            textAlign: TextAlign.center,
          ),
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  content,
                  style: CustomTextStyle.body1.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 45,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          expandableHeight: true,
                          label: 'Tidak',
                          buttonPrimaryType: outlinedButton,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: PrimaryButton(
                          expandableHeight: true,
                          buttonPrimaryType: solidButton,
                          label: 'Ya',
                          onTap: () {
                            Navigator.pop(context, true);
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
