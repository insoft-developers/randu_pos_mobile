import 'package:flutter/material.dart';

import 'transaction_success_mobile.dart';

class TransactionSuccessTablet extends StatelessWidget {
  const TransactionSuccessTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 550,
        child: TransactionSuccessMobile(),
      ),
    );
  }
}
