import '../../../../data/repositories/i_cart_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/product_model.dart';
import '../../../entities/transaction/cart/request/producs/products_request_model.dart';
import '../../usecase.dart';

// TODO LATER CHANGE TO JUST GET PRODUCTS
class GetProductsUC
    implements
        UseCase<Result<(List<ProductModel>, int?)>, ProductsRequestModel> {
  final ICartRepository _cartRepository;

  GetProductsUC({required ICartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  Future<Result<(List<ProductModel>, int?)>> call(
      ProductsRequestModel request) async {
    return _cartRepository.getProducts(request: request);
  }
}
