import 'package:flutter/material.dart';

import 'transaction_management_item_loading.dart';

class TransactionManagementLoadingMobile extends StatelessWidget {
  const TransactionManagementLoadingMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: TransactionManagementItemLoading(),
        );
      },
    );
  }
}
