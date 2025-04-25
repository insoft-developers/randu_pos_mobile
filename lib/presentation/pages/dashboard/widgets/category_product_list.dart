import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/cart/get_category_product/category_product_provider.dart';
import '../../../widgets/core/chips/selectable_chips.dart';
import '../../../widgets/core/loading/skeleton.dart';
import '../../../widgets/core/text/custom_text.dart';

class CategoryProductList extends ConsumerWidget {
  const CategoryProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProductList = ref.watch(categoryProductProvider);
    final categorySelected =
        ref.watch(cartProvider.select((value) => value.categoryProduct));
    switch (categoryProductList) {
      case AsyncLoading():
        return const SelectableChipsSkeleton();
      case AsyncError():
        return const Center(child: Text('Error'));
      case AsyncValue(value: final value):
        return value != null && value.isNotEmpty
            ? SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 4,
                  ),
                  itemBuilder: (context, index) {
                    final e = value[index];
                    return SelectableChips(
                      onTap: () {
                        ref.read(cartProvider.notifier).setCategory(e);
                      },
                      label: e.name ?? '',
                      active: e.name == categorySelected?.name,
                    );
                  },
                ),
              )
            : value != null && value.isEmpty
                ? Center(
                    child: Column(
                      children: [
                        Text(
                          'Kategori produk tidak tersedia',
                          style: CustomTextStyle.lightComponentsBadgeLabel
                              .copyWith(
                                  color: CustomColors.darkGray,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        IconButton(
                            onPressed: () {
                              ref
                                  .read(categoryProductProvider.notifier)
                                  .fetchCategories(refresh: true);
                            },
                            icon: const Icon(Icons.refresh)),
                      ],
                    ),
                  )
                : const SizedBox.shrink();
    }
  }
}

class SelectableChipsSkeleton extends StatelessWidget {
  const SelectableChipsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            4,
            (index) => const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Skeleton(
                width: 75,
                height: 28,
                radius: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
