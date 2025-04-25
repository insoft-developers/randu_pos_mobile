import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/result.dart';
import '../../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../../../../domain/usecases/cart/get_products/get_products_uc.dart';
import '../../../usecases/cart/get_products/get_products_uc_provider.dart';

part 'products_barcode_provider.freezed.dart';
part 'products_barcode_provider.g.dart';
part 'products_barcode_state.dart';

@riverpod
class GetProductForBarcode extends _$GetProductForBarcode {
  @override
  FutureOr<List<ProductModel>?> build() => null;

  Future<void> fetchProducts() async {
    state = const AsyncLoading();
    GetProductsUC getProductsUC = ref.read(getProductsUCProvider);
    ProductsRequestModel request = const ProductsRequestModel(
      // all: true,
      perPage: 100,
      page: 1,
    );
    var result = await getProductsUC(request);
    switch (result) {
      case Success(value: final listProduct):
        final (data, _) = listProduct;
        state = AsyncData(data);

      case Failed(message: final message):
        state = AsyncError(message, StackTrace.current);
    }
  }
}
