import 'package:flutter/material.dart';

import 'transaction_management_item_loading.dart';

class TransactionManagementLoadingTablet extends StatelessWidget {
  const TransactionManagementLoadingTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 3.1),
      itemBuilder: (context, index) => const TransactionManagementItemLoading(),
    );
  }
}
