import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/main/cart/get_discounts/get_discounts_provider.dart';
import 'discount_list.dart';

class DiscountTabletDialog extends ConsumerStatefulWidget {
  const DiscountTabletDialog({super.key});

  @override
  ConsumerState<DiscountTabletDialog> createState() =>
      _DiscountTabletDialogState();
}

class _DiscountTabletDialogState extends ConsumerState<DiscountTabletDialog> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getDiscountsProvider.notifier).fetchDiscounts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var discounts = ref.watch(getDiscountsProvider);
    print(discounts);
    return SizedBox(
      width: 700,
      height: MediaQuery.of(context).size.height * 0.7,
      child: discounts is AsyncLoading
          ? const Center(child: CircularProgressIndicator())
          : discounts is AsyncError
              ? const Center(child: Text('Error'))
              : DiscountList(
                  discounts: discounts.value!,
                ),
    );
  }
}
