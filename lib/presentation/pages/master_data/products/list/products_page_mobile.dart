import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/utils/debouncer.dart';
import '../../../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../../../providers/main/master_data/products/list/get_master_products_provider.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../../widgets/core/text_fields/custom_text_field.dart';
import '../../../../widgets/shared/header/report_header_mobile.dart';
import '../widgets/product_add_fab.dart';
import '../widgets/product_item.dart';
import '../widgets/warning_info_product.dart';

class ProductsPageMobile extends ConsumerStatefulWidget {
  const ProductsPageMobile({super.key});

  @override
  ConsumerState createState() => _ProductsPageMobileState();
}

class _ProductsPageMobileState extends ConsumerState<ProductsPageMobile> {
  final ScrollController _scrollController = ScrollController();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _debouncer.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final productsState = ref.read(getMasterProductsProvider);
      if (productsState.value?.isLastPageReached ?? false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Semua data telah ditampilkan'),
            duration: Durations.long1,
          ),
        );
      } else {
        ref.read(getMasterProductsProvider.notifier).fetchNextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(getMasterProductsProvider);
    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
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
                      ReportHeaderMobile(), // Your header widget
                    ],
                  ),
                ),
              ),
              floating: false,
              // Prevents it from floating
              pinned: false, // Disappears on scroll
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        maxLine: 1,
                        onFieldSubmitted: (value) {
                          _debouncer.run(() {
                            ref
                                .read(getMasterProductsProvider.notifier)
                                .fetchProducts(ProductsRequestModel(
                                  search: value,
                                ));
                          });
                        },
                        onSaved: (value) {
                          _debouncer.run(() {
                            ref
                                .read(getMasterProductsProvider.notifier)
                                .fetchProducts(ProductsRequestModel(
                                  search: value,
                                ));
                          });
                        },
                        textInputAction: TextInputAction.search,
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
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            productState is AsyncLoading && (productState.value?.totalData == 0)
                ? const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : productState is AsyncError
                    ? const SliverFillRemaining(
                        child: Center(child: Text('Error')),
                      )
                    : (productState.value?.value ?? []).isEmpty
                        ? const SliverFillRemaining(
                            child:
                                Center(child: Text('Produk tidak ditemukan')),
                          )
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, left: 12, right: 12),
                                  child: ProductItem(
                                    data: productState.value!.value![index],
                                  ),
                                );
                              },
                              childCount:
                                  productState.value?.value?.length ?? 0,
                            ),
                          ),
            if (productState is AsyncLoading &&
                (productState.value?.totalData ?? 0) > 0)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
          ],
        ),
        const ProductAddFab()
      ],
    );
  }
}
