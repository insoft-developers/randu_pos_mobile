import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../domain/entities/transaction/cart/category_model.dart';
import '../../../../providers/main/master_data/categories_product/list/get_master_categories_product_provider.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../../widgets/shared/header/report_header_tablet.dart';
import '../../../qr_table/widget/loading/qr_table_list_loading_tablet.dart';
import '../widgets/categories_product_add_fab.dart';
import '../widgets/category_product_item.dart';

class CategoriesProductPageTablet extends ConsumerStatefulWidget {
  const CategoriesProductPageTablet({super.key});

  @override
  ConsumerState createState() => _CategoriesProductPageTablet();
}

class _CategoriesProductPageTablet
    extends ConsumerState<CategoriesProductPageTablet> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // ref.read(qrTableProvider.notifier).fetchTables();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(getMasterCategoriesProductProvider);
    List<CategoryModel> categoriesProduct = provider.value ?? [];

    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: CustomColors.primaryColor,
              child: const Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  ReportHeaderTablet(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Manajemen Kategori Produk',
                      style: CustomTextStyle.h6Bold
                          .copyWith(color: Colors.blue[900]),
                    ),
                    const SizedBox(height: 16),
                    provider is AsyncLoading
                        ? const Expanded(child: QrTableListLoadingTablet())
                        : provider is AsyncError
                            ? const Center(child: Text('Error'))
                            : Expanded(
                                child: GridView.builder(
                                  itemCount: categoriesProduct.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                    childAspectRatio: 3,
                                  ),
                                  itemBuilder: (context, index) =>
                                      CategoryProductItem(
                                          data: categoriesProduct[index]),
                                ),
                              )
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
