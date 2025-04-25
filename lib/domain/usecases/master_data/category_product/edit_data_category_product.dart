import '../../../../data/repositories/i_master_data_repository.dart';
import '../../../entities/general_response.dart';
import '../../../entities/master_data/request/edit_category_product/edit_category_params.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class EditDataCategoryProductUC
    implements UseCase<Result<GeneralResponse>, EditCategoryParams> {
  final IMasterDataRepository _repository;

  EditDataCategoryProductUC({required IMasterDataRepository repository})
      : _repository = repository;

  @override
  Future<Result<GeneralResponse>> call(EditCategoryParams request) async {
    var result = await _repository.editCategory(request.id, request.request);
    return result;
  }
}
