import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_card_mobile.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/misc/app_image.dart';
import '../../../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../../../../domain/entities/transaction/sale_type/sale_type_enum.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../providers/main/cart/get_products/get_products_provider.dart';
import '../../../../providers/main/master_data/products_barcode/products_barcode_provider.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../loading/product_loading.dart';


class DashboardListCartMobile extends ConsumerStatefulWidget {
  const DashboardListCartMobile({super.key});

  @override
  ConsumerState createState() => _DashboardListCartMobileState();
}

class _DashboardListCartMobileState
    extends ConsumerState<DashboardListCartMobile> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final products = ref.read(getProductsProvider);
      if (products.value?.isLastPageReached ?? false) {
        print('last page reached');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Semua data telah ditampilkan'),
            duration: Durations.long1,
          ),
        );
      } else {
        print('fetch next page');
        ref.read(getProductsProvider.notifier).fetchNextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = ref.watch(getProductsProvider);
    final saleTypeValue =
        ref.watch(cartProvider.select((value) => value.saleType));
    final saleType = SaleTypeEnum.findByString(saleTypeValue);
    final cartItems =
        ref.watch(cartProvider.select((value) => value.cartItems));
    return Expanded(
        child: Stack(
      children: [
        Column(
          children: [
            productsProvider is AsyncLoading &&
                    productsProvider.value?.totalData == 0
                ? const ProductLoading()
                : productsProvider is AsyncError
                    ? const Center(child: Text('Error'))
                    : Expanded(
                        child: (productsProvider.value?.value?.isEmpty ?? true)
                            ? productsProvider.value?.value == null
                                ? const ProductLoading(isExpanded: false)
                                : Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        getSvgImage('eating',
                                            height: 150, width: 150),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        CustomText(
                                          'Produk tidak tersedia',
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyle
                                              .lightTypographyCaption
                                              .copyWith(
                                            color: CustomColors.darkGray
                                                .withValues(alpha: .8),
                                            fontSize: 16,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              final categoryProduct = ref
                                                  .read(cartProvider)
                                                  .categoryProduct;
                                              final request =
                                                  ProductsRequestModel(
                                                categoryId: categoryProduct?.id,
                                              );
                                              ref
                                                  .read(getProductsProvider
                                                      .notifier)
                                                  .fetchProducts(request,
                                                      refresh: true);
                                            },
                                            icon: const Icon(Icons.refresh)),
                                      ],
                                    ),
                                  )
                            : ListView.builder(
                                controller: _scrollController,
                                itemCount:
                                    productsProvider.value?.totalData ?? 0,
                                itemBuilder: (context, index) {
                                  if (productsProvider.value == null ||
                                      productsProvider.value!.value == null) {
                                    return const SizedBox.shrink();
                                  }
                                  return ProductCardMobile(
                                      product:
                                          productsProvider.value!.value![index],
                                      cartItems: cartItems,
                                      saleType: saleType);
                                },
                              ),
                      ),
            if (productsProvider is AsyncLoading &&
                (productsProvider.value?.totalData ?? 0) > 0)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
        const ScanButton()
      ],
    ));
  }
}

class ScanButton extends ConsumerWidget {
  const ScanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding:
            EdgeInsets.only(right: 16.0, bottom: context.isMobile ? 0 : 16),
        child: FloatingActionButton(
          backgroundColor: CustomColors.primaryColor,
          heroTag: 'scan-product-dashboard',
          onPressed: () {
            ref.read(getProductForBarcodeProvider.notifier).fetchProducts();
          },
          child: const Icon(
            Icons.document_scanner_outlined,
            color: CustomColors.white,
          ),
        ),
      ),
    );
  }
}
