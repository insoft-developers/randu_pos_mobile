import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/result.dart';
import '../../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../../domain/usecases/master_data_offline/products/get_data_local_products_uc.dart';
import '../../../../../domain/usecases/master_data_offline/products/save_data_local_products_uc.dart';
import '../../../usecases/master_data_offline/products/get_data_local_products/get_data_local_products_uc_provider.dart';
import '../../../usecases/master_data_offline/products/save_data_local_products/save_data_local_products_uc_provider.dart';

part 'master_data_offline_products_provider.freezed.dart';
part 'master_data_offline_products_provider.g.dart';
part 'master_data_offline_products_state.dart';

@riverpod
class MasterDataOfflineProducts extends _$MasterDataOfflineProducts {
  @override
  MasterDataOfflineProductsState build() {
    return const MasterDataOfflineProductsState();
  }

  void getProducts() async {
    GetDataLocalProductsUC getDataLocalProductsUC =
        ref.read(getDataLocalProductsUCProvider);
    final result = await getDataLocalProductsUC(null);

    switch (result) {
      case Success(value: List<ProductModel> products):
        state = state.copyWith(values: products);
        break;
      case Failed(message: String _):
        state = state.copyWith(values: []);
        break;
    }
  }

  Future<void> saveProducts(List<ProductModel> products) async {
    SaveDataLocalProductsUC saveDataLocalProductsUC =
        ref.read(saveDataLocalProductsUCProvider);
    final result = await saveDataLocalProductsUC(products);

    switch (result) {
      case Success(value: String message):
        state = state.copyWith(message: message);
        break;
      case Failed(message: String message):
        state = state.copyWith(message: message);
        break;
    }
  }
}
