import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../widgets/core/text/custom_text_style.dart';
class ListOtText extends StatelessWidget {
  const ListOtText({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(6),
                  child: Icon(
                    Icons.circle_rounded,
                    color: CustomColors.darkGray,
                    size: 6,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item,
                    style: CustomTextStyle.body2.copyWith(
                      color: CustomColors.black.withValues(alpha: .8),
                    ),
                  ),
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}