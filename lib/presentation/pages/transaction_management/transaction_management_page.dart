import 'package:flutter/material.dart';

import '../../widgets/core/responsive/responsive_layout.dart';
import 'transaction_management_page_mobile.dart';
import 'transaction_management_page_tablet.dart';

class TransactionManagementPage extends StatelessWidget {
  const TransactionManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileBody: TransactionManagementPageMobile(),
        tabletBody: TransactionManagementPageTablet());
  }
}
