import 'package:flutter/material.dart';
import '../loading/custom_circular_loading.dart';

import '../../../../core/const/colors.dart';
import '../text/auto_sized_text_widget.dart';
import '../text/custom_text.dart';

enum ButtonPrimaryType {
  solidPrimary,
  solidWhite,
  solidLightGray,
  solidWarning,
  solidError,
  solidSuccess,
  solidOrange,
  outlinedLightblue,
  outlinedDarkWhite,
  outlinedWhitePrimary,
  outlinedTransparentWhite,
  outlinedSuccess,
  outlinedWarning,
  outlinedError,
  outlinedOrange,
  outlinedSmallBorder,
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final Widget? postFixWidget;
  final Widget? preFixWidget;
  final bool disabled;
  final ButtonPrimaryType buttonPrimaryType;
  final FontStyle fontStyle;
  final VoidCallback onTap;
  final bool expandableHeight;
  final double radius;
  final bool useAutoSizedLabel;
  final Size? minimumSize;
  final Color? shadowColor;
  final double elevation;
  final bool isLoading;
  final int maxLines;
  final bool ellipsis;

  const PrimaryButton(
      {required this.label,
      this.buttonPrimaryType = ButtonPrimaryType.solidPrimary,
      this.disabled = false,
      required this.onTap,
      this.fontStyle = FontStyle.normal,
      this.expandableHeight = false,
      this.postFixWidget,
      this.preFixWidget,
      this.radius = 16,
      this.useAutoSizedLabel = false,
      this.minimumSize,
      this.shadowColor = CustomColors.lightGreyGrey,
      this.elevation = 0,
      this.isLoading = false,
      this.maxLines = 2,
      this.ellipsis = false,
      super.key});

  static final ButtonStyle _defaultButtonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(50, 100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ));

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: SizedBox(
        height: expandableHeight ? null : 50,
        child: isLoading
            ? const SizedBox(
                height: 24, width: 24, child: CustomLoadingCircular())
            : ElevatedButton(
                style: _getDefaultButtonStyle.$1,
                onPressed: () {
                  if (!disabled) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    onTap();
                  }
                },
                child: postFixWidget != null || preFixWidget != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (preFixWidget != null) preFixWidget!,
                          Flexible(child: _label),
                          if (postFixWidget != null) postFixWidget!,
                        ],
                      )
                    : _label),
      ),
    );
  }

  Widget get _label => useAutoSizedLabel
      ? AutoSizedTextWidget(
          label,
          style: CustomTextStyle.lightComponentsButtonLarge.copyWith(
            color: _getDefaultButtonStyle.$2,
            fontStyle: fontStyle,
          ),
          textAlign: TextAlign.center,
          maxLines: maxLines,
          ellipsis: ellipsis,
        )
      : CustomText(
          label,
          style: CustomTextStyle.lightComponentsButtonLarge.copyWith(
            color: _getDefaultButtonStyle.$2,
            fontStyle: fontStyle,
          ),
          textAlign: TextAlign.center,
        );

  (ButtonStyle, Color) get _getDefaultButtonStyle {
    switch (buttonPrimaryType) {
      case ButtonPrimaryType.solidPrimary:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled
                      ? CustomColors.darkGray.withValues(alpha: .6)
                      : CustomColors.primaryColor,
                  CustomColors.lightPrimaryMain.withValues(alpha: 0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  CustomColors.white.withValues(alpha: 0.9)),
              shape: _getBorder(
                Colors.transparent,
                Colors.transparent,
              )),
          CustomColors.white
        );
      case ButtonPrimaryType.solidWhite:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled
                      ? CustomColors.darkGray.withValues(alpha: .6)
                      : CustomColors.white,
                  CustomColors.gray.withValues(alpha: 0.2)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.darkMode1,
                  CustomColors.darkMode1.withValues(alpha: 0.9)),
              shape: _getBorder(
                Colors.transparent,
                Colors.transparent,
              )),
          CustomColors.darkMode1
        );
      case ButtonPrimaryType.solidLightGray:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled
                      ? CustomColors.darkGray.withValues(alpha: .6)
                      : CustomColors.lightGreyGrey,
                  CustomColors.lightPrimaryMain.withValues(alpha: 0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.darkMode1,
                  CustomColors.darkMode1.withValues(alpha: 0.9)),
              shape: _getBorder(
                Colors.transparent,
                Colors.transparent,
              )),
          CustomColors.darkMode1
        );
      case ButtonPrimaryType.solidWarning:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled
                      ? CustomColors.darkGray.withValues(alpha: .6)
                      : CustomColors.lightWarningMain,
                  CustomColors.lightWarningMain.withValues(alpha: 0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  CustomColors.white.withValues(alpha: 0.9)),
              shape: _getBorder(
                Colors.transparent,
                Colors.transparent,
              )),
          CustomColors.white
        );
      case ButtonPrimaryType.solidError:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled
                      ? CustomColors.darkGray.withValues(alpha: .6)
                      : CustomColors.lightErrorMain,
                  CustomColors.lightErrorMain.withValues(alpha: 0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  CustomColors.white.withValues(alpha: 0.9)),
              shape: _getBorder(
                Colors.transparent,
                Colors.transparent,
              )),
          CustomColors.white
        );
      case ButtonPrimaryType.solidSuccess:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled
                      ? CustomColors.darkGray.withValues(alpha: .6)
                      : CustomColors.lightFgSuccess,
                  CustomColors.lightFgSuccess.withValues(alpha: 0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  CustomColors.white.withValues(alpha: 0.9)),
              shape: _getBorder(
                Colors.transparent,
                Colors.transparent,
              )),
          CustomColors.white
        );
      case ButtonPrimaryType.solidOrange:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled
                      ? CustomColors.darkGray.withValues(alpha: .6)
                      : CustomColors.strongOrange,
                  CustomColors.strongOrange.withValues(alpha: 0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  CustomColors.white.withValues(alpha: 0.9)),
              shape: _getBorder(
                Colors.transparent,
                Colors.transparent,
              )),
          CustomColors.white
        );
      case ButtonPrimaryType.outlinedLightblue:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled
                      ? CustomColors.darkGray.withValues(alpha: .6)
                      : Colors.lightBlue.shade100,
                  Colors.lightBlue.shade100.withValues(alpha: 0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  CustomColors.white.withValues(alpha: 0.9)),
              shape: _getBorder(
                CustomColors.primaryColor,
                CustomColors.primaryColor,
                width: 1,
              )),
          CustomColors.primaryColor
        );
      case ButtonPrimaryType.outlinedDarkWhite:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.darkMode1,
                  Colors.transparent),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.darkMode1,
                  Colors.transparent),
              shape: _getBorder(
                CustomColors.white,
                CustomColors.white.withValues(alpha: 0.9),
              )),
          CustomColors.white
        );
      case ButtonPrimaryType.outlinedWhitePrimary:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.white,
                  Colors.transparent),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  Colors.transparent),
              shape: _getBorder(
                disabled ? Colors.transparent : CustomColors.lightPrimaryMain,
                CustomColors.lightPrimaryMain.withValues(alpha: 0.9),
              )),
          CustomColors.lightPrimaryMain
        );
      case ButtonPrimaryType.outlinedSuccess:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.white,
                  Colors.transparent),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  Colors.transparent),
              shape: _getBorder(
                disabled ? Colors.transparent : CustomColors.lightFgSuccess,
                CustomColors.lightFgSuccess.withValues(alpha: 0.9),
              )),
          CustomColors.lightFgSuccess
        );
      case ButtonPrimaryType.outlinedWarning:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.white,
                  Colors.transparent),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  Colors.transparent),
              shape: _getBorder(
                disabled ? Colors.transparent : CustomColors.lightWarningMain,
                CustomColors.lightWarningMain.withValues(alpha: 0.9),
              )),
          CustomColors.lightWarningMain
        );
      case ButtonPrimaryType.outlinedError:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.white,
                  Colors.transparent),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  Colors.transparent),
              shape: _getBorder(
                disabled ? Colors.transparent : CustomColors.lightErrorMain,
                CustomColors.lightErrorMain.withValues(alpha: 0.9),
              )),
          CustomColors.lightErrorMain
        );
      case ButtonPrimaryType.outlinedOrange:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.white,
                  Colors.transparent),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  Colors.transparent),
              shape: _getBorder(
                disabled ? Colors.transparent : CustomColors.strongOrange,
                CustomColors.strongOrange.withValues(alpha: 0.9),
              )),
          disabled ? CustomColors.darkGray : CustomColors.strongOrange
        );
      case ButtonPrimaryType.outlinedSmallBorder:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.white,
                  Colors.transparent),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  Colors.transparent),
              shape: _getBorder(
                disabled ? Colors.transparent : CustomColors.primaryColor,
                CustomColors.primaryColor.withValues(alpha: 0.9),
                width: 1,
              )),
          CustomColors.primaryColor
        );
      case ButtonPrimaryType.outlinedTransparentWhite:
        return (
          _defaultButtonStyle.copyWith(
              elevation: _getElevation,
              shadowColor: _getShadowColor,
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(Colors.transparent, Colors.white),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  Colors.transparent),
              shape: _getBorder(
                disabled ? Colors.grey : Colors.white,
                Colors.white,
                width: 1,
              )),
          Colors.white
        );
    }
  }

  WidgetStateProperty<Color> _getColor(Color color, Color colorPressed) {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    });
  }

  WidgetStateProperty<OutlinedBorder> _getBorder(
      Color color, Color colorPressed,
      {double width = 1.5}) {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          side: BorderSide(
              width: width,
              color:
                  states.contains(WidgetState.pressed) ? colorPressed : color));
    });
  }

  WidgetStateProperty<double> get _getElevation {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      return elevation;
    });
  }

  WidgetStateProperty<Size?> get _getButtonMinimumSize {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      return minimumSize ?? const Size.fromWidth(double.infinity);
    });
  }

  WidgetStateProperty<Color?> get _getShadowColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      return shadowColor;
    });
  }
}
