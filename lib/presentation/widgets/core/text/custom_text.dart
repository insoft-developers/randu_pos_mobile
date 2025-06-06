import 'package:flutter/material.dart';

export 'custom_text_style.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool ellipsis;
  final TextAlign textAlign;
  final int? maxLines;
  final bool applyHeightToFirstAscent;

  const CustomText(
    this.text, {
    super.key,
    this.ellipsis = false,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.style,
    this.applyHeightToFirstAscent = false,
  });

  @override
  Widget build(BuildContext context) => Text(text,
      style: style,
      textAlign: textAlign,
      overflow: ellipsis ? TextOverflow.ellipsis : null,
      maxLines: maxLines,
      textHeightBehavior: TextHeightBehavior(
          applyHeightToFirstAscent: applyHeightToFirstAscent));
}
