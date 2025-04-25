import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/colors.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../domain/entities/transaction/cart/discount_model.dart';
import '../../providers/cores/router/go_router_provider.dart';
import '../../providers/main/cart/cart_provider.dart';
import '../../widgets/core/buttons/primary_button.dart';
import '../../widgets/core/container/custom_rounded_container.dart';
import '../../widgets/core/text/custom_text.dart';

class DiscountItemCard extends ConsumerWidget {
  final DiscountModel discount;

  const DiscountItemCard({super.key, required this.discount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final totalPrice = cart.totalPrice;

    String discountValue = discount.value.toString();
    switch (discount.type!.toLowerCase()) {
      case 'nominal':
        discountValue = formatStringIDRToCurrency(
          text: discount.value.toString(),
          symbol: 'Rp',
        );
      case 'persen':
        discountValue = '${discount.value}%';
      default:
        discountValue = discount.value.toString();
    }
    bool isEligibleForDiscount() {
      final now = DateTime.now();
      final expirationDate = DateTime.parse(discount.expiredAt!);
      final currentDate = DateTime(now.year, now.month, now.day);
      final expDate = DateTime(
          expirationDate.year, expirationDate.month, expirationDate.day);
      return totalPrice >= (discount.minOrder ?? 0) &&
          (currentDate.isBefore(expDate) ||
              currentDate.isAtSameMomentAs(expDate)) &&
          discount.maxUse != 0 &&
          discount.discountAllowedUse != 0;
    }

    final isEligible = isEligibleForDiscount();

    return CustomRoundedContainer(
      padding: const EdgeInsets.all(16),
      shadow: const [
        BoxShadow(
          color: CustomColors.gray,
          blurRadius: 4,
        )
      ],
      radius: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discount.name!,
                    style: CustomTextStyle.body1SemiBold,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Diskon ${discount.type!}'.capitalizeEachWord,
                    style: CustomTextStyle.productName
                        .copyWith(color: CustomColors.primaryColor),
                  ),
                  Text(
                    'Batas waktu: ${discount.expiredAt!}',
                    style: CustomTextStyle.productName.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.darkGray,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              SizedBox(
                width: 95,
                height: 45,
                child: PrimaryButton(
                  disabled: !isEligible,
                  buttonPrimaryType: ButtonPrimaryType.outlinedSmallBorder,
                  label: 'Gunakan',
                  maxLines: 1,
                  useAutoSizedLabel: true,
                  radius: 8,
                  onTap: () {
                    ref.read(cartProvider.notifier).setDiscount(discount);
                    ref.read(routerProvider).pop();
                  },
                ),
              )
            ],
          ),
          CustomRoundedContainer(
            shadow: const [],
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: CustomColors.gray.withValues(alpha: .4),
            radius: 8,
            child: Text(
              'Min. transaksi  ${formatStringIDRToCurrency(text: discount.minOrder.toString(), symbol: "Rp ")}',
              style: CustomTextStyle.productName
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 12),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CustomRoundedContainer(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    shadow: const [],
                    color: Colors.lightBlue[100],
                    child: Text(
                      'Diskon',
                      style: CustomTextStyle.lightComponentsBadgeLabel.copyWith(
                          color: CustomColors.primaryColor, fontSize: 10),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(discountValue)
                ],
              ),
              Row(
                children: [
                  Icon(
                    isEligible ? Icons.check_circle : Icons.cancel,
                    color: isEligible
                        ? CustomColors.lightSuccessMain
                        : CustomColors.lightErrorMain,
                    size: 12,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    isEligible ? 'Memenuhi syarat' : 'Tidak memenuhi syarat',
                    style: CustomTextStyle.lightComponentsBadgeLabel.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: isEligible
                          ? CustomColors.lightSuccessMain
                          : CustomColors.lightErrorMain,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
