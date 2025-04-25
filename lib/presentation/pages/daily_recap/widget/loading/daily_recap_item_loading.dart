import 'package:flutter/material.dart';

import '../../../../widgets/core/loading/skeleton.dart';

class DailyRecapItemLoading extends StatelessWidget {
  const DailyRecapItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      padding: const EdgeInsets.all(12),
      radius: 4,
      color: Colors.blueGrey.shade50,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DailyRecapLoadingRow(),
          SizedBox(height: 6),
          DailyRecapLoadingRow(),
          SizedBox(height: 6),
          DailyRecapLoadingRow(),
          SizedBox(height: 6),
          DailyRecapLoadingRow(),
        ],
      ),
    );
  }
}

class DailyRecapLoadingRow extends StatelessWidget {
  const DailyRecapLoadingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Skeleton(width: 100, height: 16, radius: 8),
        SizedBox(width: 12),
        Expanded(child: Skeleton(height: 16, radius: 8)),
      ],
    );
  }
}
