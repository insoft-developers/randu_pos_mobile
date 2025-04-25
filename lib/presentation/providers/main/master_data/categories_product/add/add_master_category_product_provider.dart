import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/entities/general_response.dart';
import '../../../../../../domain/entities/master_data/request/create_category_product/create_category_product_request_model.dart';
import '../../../../../../domain/entities/master_data/request/edit_category_product/edit_category_params.dart';
import '../../../../../../domain/entities/result.dart';
import '../../../../../../domain/usecases/master_data/category_product/edit_data_category_product.dart';
import '../../../../../../domain/usecases/master_data/category_product/save_data_category_product.dart';
import '../../../../usecases/master_data/category_product/edit_data_category_product/edit_data_category_product_uc_provider.dart';
import '../../../../usecases/master_data/category_product/save_data_category_product/save_data_category_product_uc_provider.dart';

part 'add_master_category_product_provider.g.dart';

@riverpod
class AddMasterCategoryProduct extends _$AddMasterCategoryProduct {
  @override
  Future<GeneralResponse?> build() async {
    return null;
  }

  Future<void> saveCategoryProduct(CreateCategoryProductRequestModel request,
      {bool isEdit = false, int? id}) async {
    state = const AsyncLoading();
    late Result result;
    if (isEdit) {
      print('editing categoru ...');
      EditDataCategoryProductUC editDataCategoryProductUC =
          ref.read(editDataCategoryProductUCProvider);
      EditCategoryParams requestModel =
          EditCategoryParams(id: id!, request: request);
      result = await editDataCategoryProductUC(requestModel);
    } else {
      print('saving category...');
      SaveDataCategoriesProductUC saveDataCategoryProductUC =
          ref.read(saveDataCategoriesProductUCProvider);
      result = await saveDataCategoryProductUC(request);
    }

    if (result is Success) {
      state = AsyncData(result.resultValue);
    } else {
      state = AsyncError(result.errorMessage!, StackTrace.current);
    }
  }
}
