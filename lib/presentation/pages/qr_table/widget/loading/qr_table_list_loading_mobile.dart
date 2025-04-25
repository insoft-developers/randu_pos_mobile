import 'package:flutter/material.dart';

import 'qr_table_item_loading.dart';

class QrTableListLoadingMobile extends StatelessWidget {
  const QrTableListLoadingMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: 6,
      itemBuilder: (context, index) => const QrTableItemLoading(),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}
