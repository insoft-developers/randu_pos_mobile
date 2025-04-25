import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../providers/cores/router/go_router_provider.dart';
import '../../../../providers/main/cart/get_category_product/category_product_provider.dart';
import '../../../../providers/main/master_data/categories_product/list/get_master_categories_product_provider.dart';

class CategoryProductAddFab extends ConsumerWidget {
  const CategoryProductAddFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          heroTag: 'category_product_add_fab',
          foregroundColor: CustomColors.white,
          backgroundColor: CustomColors.primaryColor,
          onPressed: () async {
            final result = await ref
                .read(routerProvider)
                .pushNamed('category_product_add');
            if (result != null) {
              final bool isSuccess = result as bool;
              if (isSuccess) {
                await ref
                    .read(getMasterCategoriesProductProvider.notifier)
                    .fetchCategories(refresh: true);
                await ref
                    .read(categoryProductProvider.notifier)
                    .fetchCategories(refresh: true);
              }
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
