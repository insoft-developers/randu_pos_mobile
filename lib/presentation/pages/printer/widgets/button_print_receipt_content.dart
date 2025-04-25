import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/core/text/custom_text.dart';

class ButtonPrintReceiptContent extends ConsumerWidget {
  const ButtonPrintReceiptContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 8,
          ),
          CustomText('Print'),
          SizedBox(
            height: 8,
          ),
          CustomText('Printer'),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
