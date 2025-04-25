import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../text/custom_text.dart';

class PrimaryChips extends StatelessWidget {
  final String title;
  final String subTitle;
  final EdgeInsets? padding;
  final Decoration? outerDecoration;
  final Decoration? innerDecoration;
  final Color? titleColor;
  final Color? subTitleColor;

  const PrimaryChips(
      {required this.title,
      required this.subTitle,
      this.padding,
      this.outerDecoration,
      this.innerDecoration,
      this.titleColor,
      this.subTitleColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.25),
      decoration: outerDecoration,
      margin: const EdgeInsets.only(top: 3, left: 0),
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: innerDecoration,
        /* alignment: Alignment.center,*/
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              title,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w700, color: titleColor),
            ),
            const SizedBox(
              width: 3,
            ),
            CustomText(
              subTitle,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: CustomTextStyle.h5ExtraBold
                  .copyWith(fontSize: 11, color: subTitleColor),
            ),
          ],
        ),
      ),
    );
  }

  static gradientBorder(
          {required String title,
          required String subTitle,
          EdgeInsets? padding}) =>
      PrimaryChips(
        title: title,
        subTitle: subTitle,
        padding: padding,
        innerDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        outerDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red,
          gradient: const LinearGradient(
              colors: [CustomColors.primaryColor, CustomColors.primaryColor]),
        ),
        titleColor: CustomColors.black,
        subTitleColor: CustomColors.pastelOrange,
      );

  static gradientFill(
          {required String title,
          required String subTitle,
          EdgeInsets? padding}) =>
      PrimaryChips(
        title: title,
        subTitle: subTitle,
        padding: padding,
        outerDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        innerDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              colors: [CustomColors.primaryColor, CustomColors.primaryColor]),
        ),
        titleColor: CustomColors.white,
        subTitleColor: CustomColors.white,
      );
}
