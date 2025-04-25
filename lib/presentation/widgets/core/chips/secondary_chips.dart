import 'package:flutter/material.dart';
import '../container/custom_rounded_container.dart';
import '../text/custom_text.dart';

class SecondaryChips extends CustomRoundedContainer {
  SecondaryChips({
    required String label,
    TextStyle? labelStyle,
    Widget? prefixWidget,
    Widget? postfixWidget,
    EdgeInsets postfixWidgetPadding = const EdgeInsets.only(left: 6),
    EdgeInsets prefixWidgetPadding = const EdgeInsets.only(right: 6),
    Color? labelColor,
    EdgeInsets textPadding = const EdgeInsets.only(bottom: 3, top: 1),
    super.padding = const EdgeInsets.symmetric(horizontal: 8),
    super.key,
    super.height = 20,
    super.color,
  }) : super(
          child: prefixWidget != null || postfixWidget != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (prefixWidget != null)
                      Padding(
                        padding: prefixWidgetPadding,
                        child: prefixWidget,
                      ),
                    Flexible(
                      child: Padding(
                        padding: textPadding,
                        child: CustomText(
                          label,
                          style: (labelStyle ??
                                  CustomTextStyle
                                      .lightTypographyCaptionMinHeight)
                              .copyWith(color: labelColor),
                          maxLines: 1,
                          ellipsis: true,
                        ),
                      ),
                    ),
                    if (postfixWidget != null)
                      Padding(
                        padding: postfixWidgetPadding,
                        child: postfixWidget,
                      ),
                  ],
                )
              : Padding(
                  padding: textPadding,
                  child: CustomText(
                    label,
                    style: (labelStyle ??
                            CustomTextStyle.lightTypographyCaptionMinHeight)
                        .copyWith(color: labelColor),
                    maxLines: 1,
                    ellipsis: true,
                    textAlign: TextAlign.center,
                  ),
                ),
        );
}
