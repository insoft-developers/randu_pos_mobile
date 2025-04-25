import 'package:flutter/material.dart';

import 'expenditure_data_item_loading.dart';

class ExpenditureDataLoadingMobile extends StatelessWidget {
  const ExpenditureDataLoadingMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: ExpenditureDataItemLoading(),
        );
      },
    );
  }
}
