import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../category_product_list.dart';
import '../mobile/dashboard_list_cart_mobile.dart';
import 'dashboard_product_list.dart';

class ProductSectionTablet extends ConsumerWidget {
  const ProductSectionTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Expanded(
      flex: 3,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CustomRoundedContainer(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryProductList(),
                      SizedBox(height: 16),
                      DashboardProductList()
                    ],
                  ),
                ),
                ScanButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
