import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/utils/animation_page_transition.dart';
import '../../../../../core/utils/currency_utils.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../widgets/core/buttons/primary_button.dart';
import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../../widgets/core/text/custom_text_style.dart';
import '../../cart_page_mobile.dart';
import '../category_product_list.dart';
import 'dashboard_list_cart_mobile.dart';

class ProductSectionMobile extends ConsumerWidget {
  const ProductSectionMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final totalQuantity = cart.totalQuantity;
    final subTotal = cart.subTotal;
    return CustomRoundedContainer(
      radius: 0,
      color: Colors.white,
      shadow: const [],
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: CategoryProductList(),
          ),
          const DashboardListCartMobile(),
          // Text('${customer.valueOrNull ?? customer.value!.name!}'),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Tooltip(
                    message: 'Jumlah',
                    child: CustomRoundedContainer(
                      height: 50,
                      radius: 8,
                      shadow: const [],
                      border: Border.all(color: CustomColors.primaryColor),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            totalQuantity.toString(),
                            style: CustomTextStyle.body2SemiBold.copyWith(
                              color: CustomColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    height: 50,
                    child: PrimaryButton(
                      disabled: totalQuantity == 0,
                      buttonPrimaryType: ButtonPrimaryType.solidOrange,
                      radius: 8,
                      expandableHeight: true,
                      label:
                          'Jumlah | Rp ${formatStringIDRToCurrency(text: subTotal.toString())}',
                      postFixWidget: const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Icon(Icons.send, color: Colors.white,),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          pageRouteAnimation(
                            destPage: const CartPageMobile(),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
