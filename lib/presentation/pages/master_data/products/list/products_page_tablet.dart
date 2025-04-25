import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/utils/debouncer.dart';
import '../../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../../../providers/main/master_data/products/list/get_master_products_provider.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../../widgets/core/text_fields/custom_text_field.dart';
import '../../../../widgets/shared/header/report_header_tablet.dart';
import '../../../qr_table/widget/loading/qr_table_list_loading_tablet.dart';
import '../widgets/product_add_fab.dart';
import '../widgets/product_item.dart';
import '../widgets/warning_info_product.dart';

class ProductsPageTablet extends ConsumerStatefulWidget {
  const ProductsPageTablet({super.key});

  @override
  ConsumerState createState() => _ProductsPageTabletState();
}

class _ProductsPageTabletState extends ConsumerState<ProductsPageTablet> {
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // ref.read(qrTableProvider.notifier).fetchTables();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(getMasterProductsProvider);
    List<ProductModel> products =
        productState.value?.value?.reversed.toList() ?? [];

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            // Yellow header that disappears when scrolling
            const SliverAppBar(
              backgroundColor: CustomColors.primaryColor,
              // Yellow background
              expandedHeight: 120,
              iconTheme: IconThemeData(color: Colors.transparent),
              // Adjust height as needed
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12),
                      ReportHeaderTablet(), // Your tablet header widget
                    ],
                  ),
                ),
              ),
              floating: false,
              // Prevents it from floating
              pinned: false, // Disappears on scroll
            ),
            // Pinned title and warning info
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Manajemen Produk',
                      style: CustomTextStyle.h6Bold
                          .copyWith(color: Colors.blue[900]),
                    ),
                    const SizedBox(height: 16),
                    const WarningInfoMasterProduct(),
                    const SizedBox(height: 16),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomTextField(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Cari Produk',
                        onChanged: (value) {
                          _debouncer.run(() {
                            ref
                                .read(getMasterProductsProvider.notifier)
                                .fetchProducts(ProductsRequestModel(
                                  search: value,
                                ));
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Loading or Error state
            productState is AsyncLoading
                ? const SliverFillRemaining(
                    child: QrTableListLoadingTablet(),
                  )
                : productState is AsyncError
                    ? const SliverFillRemaining(
                        child: Center(child: Text('Error')),
                      )
                    // Display the grid of products
                    : SliverPadding(
                        padding: const EdgeInsets.all(16),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // 3 columns for tablet view
                            mainAxisSpacing:
                                16, // Vertical spacing between items
                            crossAxisSpacing:
                                16, // Horizontal spacing between items
                            childAspectRatio: 3, // Adjust aspect ratio
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => ProductItem(
                              data: productState.value!.value![index],
                            ),
                            childCount: productState.value?.value?.length ?? 0,
                          ),
                        ),
                      ),
          ],
        ),
        const ProductAddFab()
      ],
    );
  }
}
