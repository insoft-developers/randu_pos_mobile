import 'package:flutter/material.dart';

import 'daily_recap_item_loading.dart';

class DailyRecapLoadingMobile extends StatelessWidget {
  const DailyRecapLoadingMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: DailyRecapItemLoading(),
        );
      },
    );
  }
}
