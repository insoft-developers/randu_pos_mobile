import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/const/constant.dart';
import '../../../../../domain/entities/general_request_model.dart';
import '../../../../../domain/entities/result.dart';
import '../../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../../../../domain/usecases/cart/get_products/get_products_uc.dart';
import '../../../usecases/cart/get_products/get_products_uc_provider.dart';
import '../../master_data_offline/products/master_data_offline_products_provider.dart';
import '../cart_provider.dart';

part 'get_products_provider.freezed.dart';
part 'get_products_provider.g.dart';
part 'get_products_state.dart';

@Riverpod(keepAlive: true)
class GetProducts extends _$GetProducts {
  @override
  FutureOr<GetProductsState> build() => const GetProductsState();

  Future<void> fetchProducts(ProductsRequestModel request,
      {bool refresh = false}) async {
    state = const AsyncLoading();
    final box = Hive.box<ProductModel>(productsBox);

    // Get cart items to adjust stock
    final cartItems = ref.read(cartProvider).cartItems;

    if ((box.isNotEmpty &&
        !refresh &&
        request.search == null &&
        request.page == null)) {
      // Adjust stock for cached products
      final adjustedProducts = box.values.map((product) {
        if (!product.isBufferedStock) return product;

        final cartQuantity = cartItems
            .where((item) => item.product.id == product.id)
            .fold(0, (total, item) => total + item.quantity);

        return product.copyWith(
          quantity: product.shadowStock - cartQuantity,
        );
      }).toList();

      state = AsyncData(GetProductsState(value: adjustedProducts));
    } else {
      final page = request.page ?? 1;
      GetProductsUC getProductsUC = ref.read(getProductsUCProvider);
      print('request $request');
      var result = await getProductsUC(request);
      var prev = page == 1 ? [] : state.value?.value ?? [];

      switch (result) {
        case Success(value: final listProduct):
          final (data, lastPage) = listProduct;

          // Adjust stock for new products
          final adjustedData = data.map((product) {
            if (!product.isBufferedStock) return product;

            final cartQuantity = cartItems
                .where((item) => item.product.id == product.id)
                .fold(0, (total, item) => total + item.quantity);

            return product.copyWith(
              quantity: product.shadowStock - cartQuantity,
            );
          }).toList();

          if (request.page == null) {
            ref
                .read(masterDataOfflineProductsProvider.notifier)
                .saveProducts(adjustedData);
            state = AsyncData(GetProductsState(value: adjustedData));
          } else {
            state = AsyncData(state.value!.copyWith(
                value: [...prev, ...adjustedData], lastPage: lastPage));
          }

        case Failed(message: _):
          state = const AsyncData(GetProductsState());
      }
    }
  }

  void updateProductQuantity(int productId, int quantityChange) {
    state = state.whenData((products) {
      return GetProductsState(
          value: products.value!.map((product) {
        if (product.id == productId) {
          return product.copyWith(
              quantity: (product.quantity ?? 0) + quantityChange);
        }
        return product;
      }).toList());
    });
  }

  int getProductQuantity(int productId) {
    return state.value?.value
            ?.firstWhere((element) => element.id == productId)
            .quantity ??
        0;
  }

  void incrementPage() {
    state = AsyncData(state.value!.copyWith(page: state.value!.page + 1));
  }

  void fetchNextPage() {
    incrementPage();
    final categoryId = ref.read(cartProvider).categoryProduct?.id;
    fetchProducts(
      ProductsRequestModel(
          page: state.value?.page ?? 1, categoryId: categoryId),
      refresh: true,
    );
  }

  void resetState() {
    state = const AsyncData(GetProductsState());
  }
}
