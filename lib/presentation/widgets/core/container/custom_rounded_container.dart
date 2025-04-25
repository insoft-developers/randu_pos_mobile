import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../text/custom_text.dart';

class CustomRoundedContainer extends StatelessWidget {
  final Color? color;
  final double radius;
  final Border? border;
  final List<BoxShadow>? shadow;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget? child;
  final double? height;
  final double? width;
  final Gradient? gradient;

  const CustomRoundedContainer({
    super.key,
    this.color,
    this.border,
    this.margin,
    this.radius = 16,
    this.padding,
    this.child,
    this.height,
    this.width,
    this.shadow,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) => Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: border,
          color: gradient == null ? color ?? Colors.white : null,
          boxShadow: shadow ??
              (context.isDarkMode && color == null
                  ? null
                  : [BoxShadow(blurRadius: 6, color: Colors.grey[300]!)]),
          borderRadius: BorderRadius.circular(radius),
          gradient: gradient),
      child: child);

  static info({required String label}) => CustomRoundedContainer(
        margin: const EdgeInsets.only(bottom: 1),
        color: CustomColors.secondaryColor,
        radius: 8,
        shadow: const [],
        padding: const EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
        child: CustomText(
          label,
          style: CustomTextStyle.lightTypographyCaptionMediumMinHeight
              .copyWith(color: CustomColors.black),
        ),
      );

  static success({required String label}) => CustomRoundedContainer(
        margin: const EdgeInsets.only(bottom: 1),
        color: CustomColors.lightSuccessMain,
        radius: 8,
        shadow: const [],
        padding: const EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
        child: CustomText(
          label,
          style: CustomTextStyle.lightTypographyCaptionMediumMinHeight
              .copyWith(color: CustomColors.black),
        ),
      );

  static onGoing({required String label}) => CustomRoundedContainer(
        margin: const EdgeInsets.only(bottom: 1),
        color: CustomColors.gray,
        radius: 8,
        shadow: const [],
        padding: const EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
        child: CustomText(
          label,
          style: CustomTextStyle.lightTypographyCaptionMediumMinHeight
              .copyWith(color: CustomColors.black),
        ),
      );

  static general({required String label, required Color color}) =>
      CustomRoundedContainer(
        margin: const EdgeInsets.only(bottom: 1),
        color: color,
        radius: 8,
        shadow: const [],
        padding: const EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
        child: CustomText(
          label,
          style: CustomTextStyle.lightTypographyCaptionMediumMinHeight,
        ),
      );
}
