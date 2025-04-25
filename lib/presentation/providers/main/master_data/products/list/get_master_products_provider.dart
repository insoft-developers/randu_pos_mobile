import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/const/constant.dart';
import '../../../../../../domain/entities/result.dart';
import '../../../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../../../../../domain/usecases/cart/get_products/get_products_uc.dart';
import '../../../../usecases/cart/get_products/get_products_uc_provider.dart';
import '../../../master_data_offline/products/master_data_offline_products_provider.dart';

part 'get_master_products_provider.freezed.dart';
part 'get_master_products_provider.g.dart';
part 'get_master_products_state.dart';

@riverpod
class GetMasterProducts extends _$GetMasterProducts {
  @override
  FutureOr<GetMasterProductsState> build() => const GetMasterProductsState();

  Future<void> fetchProducts(ProductsRequestModel request,
      {bool refresh = false}) async {
    state = const AsyncLoading();
    final box = Hive.box<ProductModel>(productsBox);
    if ((box.isNotEmpty &&
        !refresh &&
        request.search == null &&
        request.page == null)) {
      state = AsyncData(GetMasterProductsState(value: box.values.toList()));
    } else {
      print('fetchProducts');
      if (refresh) {
        print('refresh');
        state = const AsyncLoading();
      }
      final page = request.page ?? 1;
      GetProductsUC getProductsUC = ref.read(getProductsUCProvider);
      var result = await getProductsUC(request);
      var prev = page == 1 ? [] : state.value?.value ?? [];
      switch (result) {
        case Success(value: final listProduct):
          final (data, lastPage) = listProduct;
          if (request.page == null) {
            // don't save if page is not null, for pagination
            ref
                .read(masterDataOfflineProductsProvider.notifier)
                .saveProducts(data);
            state = AsyncData(GetMasterProductsState(value: data));
          } else {
            state = AsyncData(state.value!
                .copyWith(value: [...prev, ...data], lastPage: lastPage));
          }

        case Failed(message: _):
          state = const AsyncData(GetMasterProductsState());
      }
    }
  }

  void incrementPage() {
    state = AsyncData(state.value!.copyWith(page: state.value!.page + 1));
  }

  void fetchNextPage() {
    incrementPage();

    fetchProducts(
      ProductsRequestModel(page: state.value?.page ?? 1),
    );
  }

  void resetState() {
    state = const AsyncData(GetMasterProductsState());
  }
}
