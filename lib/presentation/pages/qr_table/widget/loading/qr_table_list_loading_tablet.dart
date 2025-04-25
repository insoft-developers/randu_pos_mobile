import 'package:flutter/material.dart';

import 'qr_table_item_loading.dart';

class QrTableListLoadingTablet extends StatelessWidget {
  const QrTableListLoadingTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 15,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3,
      ),
      itemBuilder: (context, index) => const QrTableItemLoading(),
    );
  }
}
