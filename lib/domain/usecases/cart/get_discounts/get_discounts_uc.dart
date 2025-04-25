import '../../../../data/repositories/i_cart_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/discount_model.dart';
import '../../usecase.dart';

class GetDiscountsUC implements UseCase<Result<List<DiscountModel>>, void> {
  final ICartRepository _cartRepository;

  GetDiscountsUC({required ICartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  Future<Result<List<DiscountModel>>> call(void _) async {
    var discounts = await _cartRepository.getDiscounts();
    return discounts;
  }
}
