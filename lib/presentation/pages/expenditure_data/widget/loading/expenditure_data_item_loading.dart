import 'package:flutter/material.dart';

import '../../../../widgets/core/loading/skeleton.dart';

class ExpenditureDataItemLoading extends StatelessWidget {
  const ExpenditureDataItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      padding: const EdgeInsets.all(12),
      radius: 4,
      color: Colors.blueGrey.shade50,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton(
            width: 200,
            radius: 8,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Skeleton(
                width: 100,
                radius: 8,
              ),
              Skeleton(
                width: 75,
                radius: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
