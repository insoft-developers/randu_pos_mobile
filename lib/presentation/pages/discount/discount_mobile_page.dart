import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/main/cart/get_discounts/get_discounts_provider.dart';
import 'discount_list.dart';

class DiscountMobilePage extends ConsumerStatefulWidget {
  const DiscountMobilePage({super.key});

  @override
  ConsumerState<DiscountMobilePage> createState() => _DiscountMobilePageState();
}

class _DiscountMobilePageState extends ConsumerState<DiscountMobilePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voucher', textAlign: TextAlign.center),
      ),
      body: discounts is AsyncLoading
          ? const Center(child: CircularProgressIndicator())
          : discounts is AsyncError
              ? const Center(child: Text('Error'))
              : DiscountList(
                  discounts: discounts.value!,
                ),
    );
  }
}
