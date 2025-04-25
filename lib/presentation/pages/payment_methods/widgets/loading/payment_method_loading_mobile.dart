import 'package:flutter/material.dart';

import '../../../../widgets/core/loading/skeleton.dart';

class PaymentMethodLoadingMobile extends StatelessWidget {
  const PaymentMethodLoadingMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Skeleton(height: 60, radius: 16),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(flex: 1, child: Skeleton(height: 60, radius: 16)),
              SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Skeleton(height: 60, radius: 16),
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SelectableChipsSkeleton(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Row(
                  children: [
                    Skeleton(
                      width: 200,
                      radius: 8,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Skeleton(
                      width: 100,
                      radius: 8,
                      height: 40,
                    ),
                    SizedBox(width: 16),
                    Skeleton(
                      width: 100,
                      radius: 8,
                      height: 40,
                    )
                  ],
                ),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Skeleton(
                      width: 200,
                      radius: 8,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) => const Skeleton(radius: 12),
                ),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Skeleton(
                      width: 200,
                      radius: 8,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) => const Skeleton(radius: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SelectableChipsSkeleton extends StatelessWidget {
  const SelectableChipsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            4,
            (index) => const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Skeleton(
                width: 100,
                height: 36,
                radius: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
