import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/result.dart';
import '../../../../../domain/entities/transaction/cart/category_model.dart';
import '../../../../../domain/usecases/master_data_offline/categories/get_data_local_categories_uc.dart';
import '../../../../../domain/usecases/master_data_offline/categories/save_data_local_categories_uc.dart';
import '../../../usecases/master_data_offline/categories/get_data_local_categories/get_data_local_categories_uc_provider.dart';
import '../../../usecases/master_data_offline/categories/save_date_local_categories/save_data_local_categories_uc_provider.dart';

part 'master_data_offline_categories_provider.freezed.dart';
part 'master_data_offline_categories_provider.g.dart';
part 'master_data_offline_categories_state.dart';

@riverpod
class MasterDataOfflineCategories extends _$MasterDataOfflineCategories {
  @override
  MasterDataOfflineCategoriesState build() =>
      const MasterDataOfflineCategoriesState();

  void getCategories() async {
    GetDataLocalCategoriesUC getDataLocalCategoriesUC =
        ref.read(getDataLocalCategoriesUCProvider);
    final result = await getDataLocalCategoriesUC(null);

    switch (result) {
      case Success(value: List<CategoryModel> categories):
        state = state.copyWith(values: categories);
        break;
      case Failed(message: String _):
        state = state.copyWith(values: []);
        break;
    }
  }

  Future<void> saveCategories(List<CategoryModel> categories) async {
    SaveDataLocalCategoriesUC saveDataLocalCategoriesUC =
        ref.read(saveDataLocalCategoriesUCProvider);
    final result = await saveDataLocalCategoriesUC(categories);

    switch (result) {
      case Success(value: String message):
        state = state.copyWith(saveMessage: message);
        break;
      case Failed(message: String message):
        state = state.copyWith(saveMessage: message);
        break;
    }
  }
}
