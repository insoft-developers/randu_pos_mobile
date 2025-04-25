import 'package:flutter/material.dart';

import '../../../../../core/const/colors.dart';
import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../../../../widgets/core/loading/skeleton.dart';

class PaymentMethodLoadingTablet extends StatelessWidget {
  const PaymentMethodLoadingTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Skeleton(
                      height: 100,
                      radius: 16,
                    )),
                SizedBox(width: 16),
                Expanded(
                    flex: 1,
                    child: Skeleton(
                      height: 100,
                      radius: 16,
                    )),
                SizedBox(width: 16),
                Expanded(
                    flex: 1,
                    child: Skeleton(
                      height: 100,
                      radius: 16,
                    ))
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Skeleton(
                      radius: 16,
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ...List.generate(
                            4,
                            (index) => const Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Skeleton(
                                  radius: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: CustomRoundedContainer(
                      padding: const EdgeInsets.all(24),
                      shadow: const [
                        BoxShadow(
                          color: CustomColors.gray,
                          blurRadius: 4,
                        )
                      ],
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Row(
                            children: [
                              Skeleton(
                                width: 350,
                                height: 24,
                                radius: 8,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          const Row(
                            children: [
                              Skeleton(
                                width: 120,
                                radius: 8,
                                height: 40,
                              ),
                              SizedBox(width: 16),
                              Skeleton(
                                width: 120,
                                radius: 8,
                                height: 40,
                              )
                            ],
                          ),
                          const SizedBox(height: 32),
                          const Row(
                            children: [
                              Skeleton(
                                width: 350,
                                height: 24,
                                radius: 8,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 3,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                            ),
                            itemBuilder: (context, index) =>
                                const Skeleton(radius: 12),
                          ),
                          const SizedBox(height: 32),
                          const Row(
                            children: [
                              Skeleton(
                                width: 350,
                                height: 24,
                                radius: 8,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 3,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                            ),
                            itemBuilder: (context, index) =>
                                const Skeleton(radius: 12),
                          ),
                          const Spacer(),
                          const Row(
                            children: [
                              Skeleton(
                                width: 60,
                                height: 50,
                                radius: 12,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Skeleton(
                                  radius: 16,
                                  height: 50,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Skeleton(
                                  radius: 16,
                                  height: 50,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
