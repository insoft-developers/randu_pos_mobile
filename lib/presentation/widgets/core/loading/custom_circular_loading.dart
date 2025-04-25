import 'package:flutter/material.dart';
import '../text/auto_sized_text_widget.dart';

import '../text/custom_text_style.dart';

class CustomLoadingCircular extends StatelessWidget {
  final TextAlign textAlign;
  final String? loadingText;

  const CustomLoadingCircular(
      {this.loadingText, this.textAlign = TextAlign.start, super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            strokeWidth: 8,
          ),
          if (loadingText != null)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: AutoSizedTextWidget(
                loadingText!,
                style: CustomTextStyle.h6,
                textAlign: textAlign,
              ),
            )
        ],
      );
}
