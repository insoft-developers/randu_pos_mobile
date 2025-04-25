import 'package:flutter/material.dart';

import '../../widgets/core/responsive/responsive_layout.dart';
import 'widget/transaction_success_mobile.dart';
import 'widget/transaction_success_tablet.dart';

class TransactionSuccessPage extends StatelessWidget {
  const TransactionSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          mobileBody: TransactionSuccessMobile(),
          tabletBody: TransactionSuccessTablet(),
        ),
      ),
    );
  }
}
