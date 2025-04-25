import 'package:flutter/material.dart';

import '../../../../widgets/core/loading/skeleton.dart';

class QrTableItemLoading extends StatelessWidget {
  const QrTableItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      padding: const EdgeInsets.all(16),
      color: Colors.blueGrey.shade100,
      radius: 8,
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Skeleton(
                width: 120,
                radius: 8,
              ),
              Skeleton(
                width: 80,
                radius: 8,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Skeleton(
                  radius: 50,
                  height: 35,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Skeleton(
                  radius: 50,
                  height: 35,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
