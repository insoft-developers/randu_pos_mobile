import '../../../../data/repositories/i_master_data_repository.dart';
import '../../../entities/general_response.dart';
import '../../../entities/master_data/request/create_product/create_product_request_model.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class SaveDataProductUC
    implements UseCase<Result<GeneralResponse>, CreateProductRequestModel> {
  final IMasterDataRepository _repository;

  SaveDataProductUC({required IMasterDataRepository repository})
      : _repository = repository;

  @override
  Future<Result<GeneralResponse>> call(
      CreateProductRequestModel request) async {
    var result = await _repository.saveProduct(request);
    return result;
  }
}
