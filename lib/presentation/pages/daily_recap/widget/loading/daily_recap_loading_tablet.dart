import 'package:flutter/material.dart';

import '../../../../widgets/core/loading/skeleton.dart';
import 'daily_recap_item_loading.dart';

class DailyRecapLoadingTablet extends StatelessWidget {
  const DailyRecapLoadingTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.65,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) => Skeleton(
          color: Colors.blueGrey.shade50,
          radius: 16,
          padding: const EdgeInsets.all(32),
          child: const Column(
            children: [
              DailyRecapLoadingRow(),
              SizedBox(height: 8),
              DailyRecapLoadingRow(),
              SizedBox(height: 8),
              DailyRecapLoadingRow(),
              SizedBox(height: 8),
              DailyRecapLoadingRow(),
              SizedBox(height: 32),
              SizedBox(height: 32),
              RecapDataItemLoading(),
              SizedBox(height: 24),
              RecapDataItemLoading(),
              SizedBox(height: 24),
              RecapDataItemLoading(),
              SizedBox(height: 24),
              RecapDataItemLoading(),
              SizedBox(height: 24),
              RecapDataItemLoading(),
              SizedBox(height: 24),
              RecapDataItemLoading(),
              SizedBox(height: 24),
              RecapDataItemLoading(),
              SizedBox(height: 24),
              RecapDataItemLoading(),
            ],
          ),
        ),
      ),
    );
  }
}

class RecapDataItemLoading extends StatelessWidget {
  const RecapDataItemLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 4, child: Skeleton(width: 100, height: 24, radius: 16)),
        Spacer(flex: 1),
        Skeleton(width: 70, height: 24, radius: 16),
      ],
    );
  }
}
