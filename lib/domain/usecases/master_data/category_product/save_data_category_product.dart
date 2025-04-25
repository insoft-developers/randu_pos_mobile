import '../../../../data/repositories/i_master_data_repository.dart';
import '../../../entities/general_response.dart';
import '../../../entities/master_data/request/create_category_product/create_category_product_request_model.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class SaveDataCategoriesProductUC
    implements
        UseCase<Result<GeneralResponse>, CreateCategoryProductRequestModel> {
  final IMasterDataRepository _repository;

  SaveDataCategoriesProductUC({required IMasterDataRepository repository})
      : _repository = repository;

  @override
  Future<Result<GeneralResponse>> call(
      CreateCategoryProductRequestModel request) async {
    var result = await _repository.saveCategories(request);
    return result;
  }
}
