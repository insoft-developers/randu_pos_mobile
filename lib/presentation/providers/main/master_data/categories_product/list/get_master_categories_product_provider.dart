import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/entities/result.dart';
import '../../../../../../domain/entities/transaction/cart/category_model.dart';
import '../../../../../../domain/usecases/cart/get_product_categories/get_product_categories_uc.dart';
import '../../../../usecases/cart/get_product_categories/get_product_categories_uc_provider.dart';
import '../../../master_data_offline/categories/master_data_offline_categories_provider.dart';

part 'get_master_categories_product_provider.g.dart';

@riverpod
class GetMasterCategoriesProduct extends _$GetMasterCategoriesProduct {
  @override
  FutureOr<List<CategoryModel>> build() => const [];

  Future<void> fetchCategories({bool refresh = false}) async {
    state = const AsyncLoading();
    GetProductCategoriesUC getProductCategoriesUC =
        ref.read(getProductCategoriesUCProvider);
    final Result<List<CategoryModel>> result =
        await getProductCategoriesUC(refresh);
    switch (result) {
      case Success(value: final categories):
        await ref
            .read(masterDataOfflineCategoriesProvider.notifier)
            .saveCategories(categories);
        state = AsyncData(categories);
        break;
      case Failed(message: final messageError):
        state = AsyncError(messageError, StackTrace.current);
        break;
    }
  }
}
