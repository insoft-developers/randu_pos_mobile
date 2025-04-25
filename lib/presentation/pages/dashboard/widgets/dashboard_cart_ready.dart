import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/page_provider.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/text/custom_text.dart';
import '../widgets.dart';
import 'list_cart.dart';

class DashboardCartReady extends ConsumerWidget {
  const DashboardCartReady({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompleteCartInfo = ref.watch(pageProvider.select((value)=> value.isCompleteCartInfo));
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: CustomRoundedContainer(
              shadow: const [],
              radius: 0,
              color: Colors.white,
              width: double.infinity,
              child: context.isLanscapeAndSmallerThan1000 && isCompleteCartInfo?const SizedBox.shrink():Column(children: [
                 Column(
                  children: [
                    context.isMobile
                        ? const SizedBox(height: 32)
                        : const SizedBox.shrink(),
                    const DashboardStatusTableActive(),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                const ListCart(),
              ]),
            ),
          ),
          const DashboardActionButton(),
        ],
      ),
    );
  }
}

class DashboardStatusTableActive extends ConsumerWidget {
  const DashboardStatusTableActive({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final table = ref.watch(cartProvider.select((value) => value.table));
    return table == null
        ? const SizedBox.shrink()
        : CustomRoundedContainer(
            margin: const EdgeInsets.all(8),
            radius: 8,
            padding: const EdgeInsets.all(8),
            color: CustomColors.lightGreyGrey,
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: CustomColors.darkSuccessMain,
                ),
                const SizedBox(
                  width: 8,
                ),
                CustomText('Meja ${table.noMeja}')
              ],
            ),
          );
  }
}
