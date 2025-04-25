import 'package:flutter/material.dart';

import 'expenditure_data_item_loading.dart';

class ExpenditureDataLoadingTablet extends StatelessWidget {
  const ExpenditureDataLoadingTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 4),
      itemBuilder: (context, index) => const ExpenditureDataItemLoading(),
    );
  }
}
