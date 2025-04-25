import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../domain/entities/transaction/cart/category_model.dart';
import '../../../../providers/cores/router/go_router_provider.dart';
import '../../../../providers/main/master_data/categories_product/list/get_master_categories_product_provider.dart';
import '../../../../widgets/core/text/custom_text.dart';

class CategoryProductItem extends ConsumerWidget {
  const CategoryProductItem({super.key, required this.data});

  final CategoryModel data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      // Adjust elevation as needed
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Add rounded corners
      ),
      color: Colors.white,
      // White background for the card
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding inside the card
        child: ListTile(
          onTap: () async {
            final result = await ref
                .read(routerProvider)
                .pushNamed('category_product_add', extra: data);
            if (result != null) {
              final bool isSuccess = result as bool;
              if (isSuccess) {
                await ref
                    .read(getMasterCategoriesProductProvider.notifier)
                    .fetchCategories(refresh: true);
                // await ref
                //     .read(categoryProductProvider.notifier)
                //     .fetchCategories(refresh: true);
              }
            }
          },
          title: CustomText(data.name ?? ''),
          subtitle: CustomText(
            data.code ?? '',
            style: const TextStyle(color: CustomColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
