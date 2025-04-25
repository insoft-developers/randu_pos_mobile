import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../providers/main/master_data/categories_product/list/get_master_categories_product_provider.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../../widgets/shared/header/report_header_mobile.dart';
import '../widgets/categories_product_add_fab.dart';
import '../widgets/category_product_item.dart';

class CategoriesProductPageMobile extends ConsumerStatefulWidget {
  const CategoriesProductPageMobile({super.key});

  @override
  ConsumerState createState() => _ProductsPageMobileState();
}

class _ProductsPageMobileState
    extends ConsumerState<CategoriesProductPageMobile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProductState =
        ref.watch(getMasterCategoriesProductProvider);
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: CustomColors.primaryColor,
              child: const Column(
                children: [
                  SizedBox(height: 12),
                  ReportHeaderMobile(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomText(
                      'Manajemen Kategori Produk',
                      style: CustomTextStyle.h6Bold
                          .copyWith(color: Colors.blue[900]),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: categoriesProductState is AsyncLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : categoriesProductState is AsyncError
                                    ? const Center(child: Text('Error'))
                                    : (categoriesProductState.value ?? [])
                                            .isEmpty
                                        ? const Center(
                                            child:
                                                Text('Produk tidak ditemukan'))
                                        : ListView.builder(
                                            itemCount:
                                                (categoriesProductState.value ??
                                                        [])
                                                    .length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8),
                                                child: CategoryProductItem(
                                                  data: categoriesProductState
                                                      .value![index],
                                                ),
                                              );
                                            },
                                          ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const CategoryProductAddFab()
      ],
    );
  }
}
