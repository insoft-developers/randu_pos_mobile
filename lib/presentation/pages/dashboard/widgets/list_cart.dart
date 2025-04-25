import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../widgets.dart';
import 'cart/cart_item_tile.dart';

class ListCart extends ConsumerWidget {
  const ListCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems =
        ref.watch(cartProvider.select((value) => value.cartItems));
    // log(cartItems.toString());
    if (kDebugMode) {}
    final height =
        context.screenHeight / (context.isLanscapeAndSmallerThan1000 ? 6 : 4);
    return Expanded(
      child: cartItems.isEmpty
          ? DashboardEmptyCart(
              height: height,
              isLanscapeAndSmallerThan1000:
                  context.isLanscapeAndSmallerThan1000)
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return CartItemTile(cartItem: cartItem);
              },
              itemCount: cartItems.length),
    );
  }
}
