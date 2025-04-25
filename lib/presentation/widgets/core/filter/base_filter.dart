import 'package:flutter/material.dart';
import '../text/custom_text.dart';

class BaseFilter extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const BaseFilter({required this.title, required this.children, super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(bottom: 24.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              title,
              style: CustomTextStyle.body2SemiBold,
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: children,
            )
          ],
        ),
      );
}
