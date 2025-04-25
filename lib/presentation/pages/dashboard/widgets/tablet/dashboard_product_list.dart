import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/extensions/context_extension.dart';
import '../../../../providers/main/cart/get_products/get_products_provider.dart';
import '../../../../widgets/core/loading/skeleton.dart';
import 'product_card_tablet.dart';

class DashboardProductList2 extends ConsumerWidget {
  const DashboardProductList2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsProvider = ref.watch(getProductsProvider);
    final crossAxisCount = context.isPotraitOrSmallerThan1000 ? 3 : 4;
    return productsProvider.when(
        data: (stateProducts) {
          var renderedProducts = stateProducts.value ?? [];
          return Expanded(
            child: GridView.count(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              crossAxisCount: crossAxisCount,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(8),
              children: [
                ...renderedProducts.map(
                  (product) => ProductCardTablet(product: product),
                ),
              ],
            ),
          );
        },
        loading: () => Expanded(
              child: GridView.count(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 4,
                childAspectRatio: 1,
                padding: const EdgeInsets.all(8),
                children: [
                  ...List.generate(
                    16,
                    (index) => const Skeleton(
                      radius: 16,
                    ),
                  )
                ],
              ),
            ),
        error: (error, stackTrace) => const Center(child: Text('Error')));
  }
}

class DashboardProductList extends ConsumerStatefulWidget {
  const DashboardProductList({super.key});

  @override
  ConsumerState createState() => _DashboardProductListState();
}

class _DashboardProductListState extends ConsumerState<DashboardProductList> {
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
    final crossAxisCount = context.isPotraitOrSmallerThan1000 ? 3 : 2;
    // return productsProvider.when(
    //     data: (stateProducts) {
    //       var renderedProducts = stateProducts.value ?? [];
    //       return Expanded(
    //         child: Column(
    //           children: [
    //             Expanded(
    //               child: GridView.count(
    //                 controller: _scrollController,
    //                 mainAxisSpacing: 8,
    //                 crossAxisSpacing: 8,
    //                 crossAxisCount: crossAxisCount,
    //                 childAspectRatio: 1,
    //                 padding: const EdgeInsets.all(8),
    //                 children: [
    //                   ...renderedProducts.map(
    //                     (product) => ProductCardTablet(product: product),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //     loading: () => Expanded(
    //           child: GridView.count(
    //             mainAxisSpacing: 16,
    //             crossAxisSpacing: 16,
    //             crossAxisCount: 4,
    //             childAspectRatio: 1,
    //             padding: const EdgeInsets.all(8),
    //             children: [
    //               ...List.generate(
    //                 16,
    //                 (index) => const Skeleton(
    //                   radius: 16,
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //     error: (error, stackTrace) => const Center(child: Text('Error')));
    return Expanded(
        child: Column(
      children: [
        (productsProvider is AsyncLoading &&
                productsProvider.value?.totalData == 0)
            ? const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : productsProvider is AsyncError
                ? const Center(child: Text('Error'))
                : Expanded(
                    child: GridView.builder(
                      itemCount: productsProvider.value?.value?.length ?? 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            context.isPotraitOrSmallerThan1000 ? 3 : 4,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1,
                      ),
                      controller: _scrollController,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        if (productsProvider.value?.value == null) {
                          return const SizedBox.shrink();
                        }
                        return ProductCardTablet(
                            product: productsProvider.value!.value![index]);
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
    ));
  }
}
