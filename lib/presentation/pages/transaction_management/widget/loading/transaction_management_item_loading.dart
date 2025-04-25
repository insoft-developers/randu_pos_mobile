import 'package:flutter/material.dart';

import '../../../../widgets/core/loading/skeleton.dart';

class TransactionManagementItemLoading extends StatelessWidget {
  const TransactionManagementItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      padding: const EdgeInsets.all(12),
      radius: 4,
      color: Colors.blueGrey.shade50,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(
                width: 200,
                radius: 8,
              ),
              SizedBox(height: 4),
              Skeleton(
                width: 100,
                height: 16,
                radius: 8,
              ),
              SizedBox(height: 8),
              Skeleton(
                width: 150,
                height: 18,
                radius: 8,
              ),
              SizedBox(height: 4),
              Skeleton(
                width: 150,
                height: 18,
                radius: 8,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Skeleton(
                width: 70,
                height: 24,
                radius: 50,
              ),
              SizedBox(height: 8),
              Skeleton(
                width: 100,
                radius: 8,
              ),
              SizedBox(height: 4),
              Skeleton(
                width: 45,
                radius: 8,
              ),
            ],
          )
        ],
      ),
    );
  }
}
