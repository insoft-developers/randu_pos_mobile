import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/currency_utils.dart';
import '../../../../../core/utils/rounded_bottom_sheet.dart';
import '../../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../../domain/entities/transaction/sale_type/sale_type_enum.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../product_variant/choose_product_variant_mobile.dart';
import '../../utils/dashboard_utils.dart';

class ProductCardMobile extends ConsumerWidget {
  const ProductCardMobile({
    super.key,
    required this.product,
    required this.cartItems,
    required this.saleType,
  });

  final ProductModel product;
  final List<CartItem> cartItems;
  final SaleTypeEnum saleType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItem = cartItems.firstWhereOrNull(
      (cartItem) => cartItem.product.id == product.id,
    );
    final isSelected = cartItem != null;
    final productCount = cartItems
        .where((cartItem) => cartItem.product.id == product.id)
        .fold(0, (total, item) => total + item.quantity);

    // Calculate actual stock by subtracting cart quantity from shadow stock
    final productStock = !product.isBufferedStock
        ? '' // Infinite stock
        : (product.shadowStock).toString();

    return ListTile(
      selected: isSelected,
      selectedTileColor: Colors.yellow,
      horizontalTitleGap: 12,
      leading: CircleAvatar(
        radius: 14,
        backgroundColor: isSelected ? Colors.blue : Colors.blueGrey,
        child: Text(
          productCount.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
      trailing: productStock.isEmpty
          ? CustomText(
              formatStringIDRToCurrency(
                text: '${getProductPrice(product, saleType)}',
                symbol: 'Rp ',
              ),
              style: CustomTextStyle.productName,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  formatStringIDRToCurrency(
                    text: '${getProductPrice(product, saleType)}',
                    symbol: 'Rp ',
                  ),
                  textAlign: TextAlign.end,
                  style: CustomTextStyle.productName,
                ),
                CustomText(
                  'Stock: $productStock',
                  textAlign: TextAlign.end,
                  style: CustomTextStyle.productName.copyWith(
                      color: productStock == '0' ? Colors.red : Colors.black),
                ),
              ],
            ),
      title: CustomText(
        '${product.name}',
        style: CustomTextStyle.productName,
      ),
      onTap: () async {
        if (product.isHavingVariant) {
          await showRoundedBottomSheet(
            context: context,
            isDismissible: false,
            onClose: (value) {
              print(value);
            },
            builder: (context) => ChooseProductVariantMobile(
              product: product,
            ),
            enableDrag: false,
          );
          return;
        }
        ref.read(cartProvider.notifier).addProduct(product, [], '');
      },
    );
  }
}
