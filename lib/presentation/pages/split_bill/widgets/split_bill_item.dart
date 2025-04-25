import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/split_bill/split_bill_transaction/split_bill_transaction_provider.dart';
import '../../../widgets/core/text/custom_text.dart';

class SplitBillItem extends ConsumerWidget {
  const SplitBillItem(
      {super.key,
      required this.item,
      this.originalItem,
      required this.isOriginal});
  final CartItem item;
  final CartItem? originalItem;
  final bool isOriginal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(bottom: isOriginal ? 16 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isOriginal
              ? CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                  child: Text(
                    item.quantity.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                )
              : Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ref
                              .read(splitBillTransactionProvider.notifier)
                              .updateItemSplit(item.product, item.variants,
                                  QuantityProcess.decrement);
                        },
                        icon: Icon(
                            color: item.quantity == 0
                                ? CustomColors.darkGray
                                : CustomColors.primaryColor,
                            Icons.remove_circle)),
                    Text(
                      item.quantity.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    IconButton(
                        onPressed: () {
                          ref
                              .read(splitBillTransactionProvider.notifier)
                              .updateItemSplit(item.product, item.variants,
                                  QuantityProcess.increment);
                        },
                        icon: Icon(
                            color: originalItem!.quantity == 0
                                ? CustomColors.darkGray
                                : CustomColors.primaryColor,
                            Icons.add_circle)),
                  ],
                ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  item.product.name ?? '-',
                  maxLines: 2,
                ),
                if (item.variants.isNotEmpty)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        item.variants.length,
                        (index) {
                          var variant = item.variants[index];
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...variant.entries.map((entry) {
                                final variant = entry.key;
                                final quantity = entry.value;
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    '$quantity x  ${variant.varianName}', // Updated to display the quantity
                                    style: CustomTextStyle.body3.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                      color: Colors.blue.shade600,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                );
                              }),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                if (item.product.note != null && item.product.note!.isNotEmpty)
                  CustomText(
                    'Note : ${item.product.note ?? '-'}',
                    style: CustomTextStyle.body3.copyWith(
                      fontSize: 11,
                      color: CustomColors.darkGray,
                    ),
                    maxLines: 2,
                  ),
              ],
            ),
          ),
          Text(formatStringIDRToCurrency(
              text: item.product.price.toString(),
              symbol: 'Rp ',
              isDouble: true)),
        ],
      ),
    );
  }
}
