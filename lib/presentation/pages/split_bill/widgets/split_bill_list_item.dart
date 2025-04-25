import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/main/split_bill/split_bill_transaction/split_bill_transaction_provider.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import 'split_bill_item.dart';

class SplitBillListItem extends ConsumerWidget {
  const SplitBillListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartSplit = ref
        .watch(splitBillTransactionProvider.select((value) => value.splitCart));
    final cartOriginal = ref.watch(
        splitBillTransactionProvider.select((value) => value.originalCart));
    if (cartSplit == null || cartOriginal == null) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Transaksi Baru'),
        const SizedBox(height: 16),
        CustomRoundedContainer(
          color: Colors.lightBlue.shade50,
          shadow: const [],
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          radius: 12,
          child: Column(
            children: [
              ...List.generate(cartSplit.cartItems.length, (index) {
                return SplitBillItem(
                  item: cartSplit.cartItems[index],
                  originalItem: cartOriginal.cartItems[index],
                  isOriginal: false,
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const Text('Transaksi Asli'),
        const SizedBox(height: 16),
        CustomRoundedContainer(
          color: Colors.lightBlue.shade50,
          shadow: const [],
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          radius: 12,
          child: Column(
            children: [
              ...List.generate(cartOriginal.cartItems.length, (index) {
                return SplitBillItem(
                  item: cartOriginal.cartItems[index],
                  isOriginal: true,
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
