import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/utils/currency_utils.dart';
import '../../../../../core/utils/custom_alert_dialog.dart';
import '../../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../../domain/entities/transaction/sale_type/sale_type_enum.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../providers/main/cart/variant_selection/variant_selection_provider.dart';
import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../product_variant/choose_product_variant_tablet.dart';
import '../../utils/dashboard_utils.dart';

class ProductCardTablet extends ConsumerWidget {
  const ProductCardTablet({
    super.key,
    required this.product,
  });
  final ProductModel product;

  void _onTap(BuildContext context, WidgetRef ref, ProductModel product) async {
    if (product.isHavingVariant) {
      ref.read(variantSelectionProvider.notifier).setProduct(product);
      await showCustomAlertDialog(
        context: context,
        onClose: (value) {
          print(value);
        },
        builder: (context) => ChooseProductVariantTablet(
          product: product,
        ),
      );
    } else {
      print('product is not variant');
      ref.read(cartProvider.notifier).addProduct(product, [], '');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productStock = product.bufferedStock == 0
        ? '' // Infinite stock
        : (product.shadowStock.toString()); //

    final saleType = ref.watch(cartProvider.select((value) => value.saleType));
    return GestureDetector(
      onTap: () => _onTap(context, ref, product),
      child: CustomRoundedContainer(
        padding: const EdgeInsets.all(16),
        color: CustomColors.productBlue2,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(
              '${product.name} (${product.isVariant == 1 ? "Tanpa" : product.variant?.length ?? 0} Varian)',
              style: CustomTextStyle.body2SemiBold),
          const Spacer(),
          if (product.isBufferedStock) ...[
            CustomText('Stock: $productStock',
                style: CustomTextStyle.body2SemiBold.copyWith(
                    color: productStock == '0' ? Colors.red : Colors.black)),
          ],
          CustomText(
              formatStringIDRToCurrency(
                  text:
                      '${getProductPrice(product, SaleTypeEnum.findByString(saleType))}',
                  symbol: 'Rp '),
              style: CustomTextStyle.body2SemiBold),
        ]),
      ),
    );
  }
}
