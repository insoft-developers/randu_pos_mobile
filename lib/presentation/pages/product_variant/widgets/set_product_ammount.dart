import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../providers/main/cart/variant_selection/variant_selection_provider.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/text/custom_text.dart';

class SetProductAmmount extends ConsumerWidget {
  const SetProductAmmount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productQuantity = ref.watch(
        variantSelectionProvider.select((value) => value.productQuantity));
    return CustomRoundedContainer(
        padding: context.isTablet
            ? const EdgeInsets.all(16)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: context.isTablet ? 70 : 50,
        shadow: const [BoxShadow(color: CustomColors.darkGray, blurRadius: 1)],
        radius: context.isTablet ? 8 : 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            context.isTablet
                ? CustomText('Jumlah ', style: CustomTextStyle.h6)
                : const SizedBox(),
            SizedBox(width: context.isTablet ? 16 : 0),
            GestureDetector(
              onTap: () {
                ref
                    .read(variantSelectionProvider.notifier)
                    .decrementProductQuantity();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: productQuantity > 0
                        ? CustomColors.primaryColor
                        : Colors.grey),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomText('$productQuantity', style: CustomTextStyle.h6),
            ),
            GestureDetector(
              onTap: () {
                ref
                    .read(variantSelectionProvider.notifier)
                    .incrementProductQuantity();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColors.primaryColor),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            )
          ],
        ));
  }
}
