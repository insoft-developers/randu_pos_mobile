import '../../../../data/repositories/i_cart_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../usecase.dart';

class GetPaymentMethodsUC implements UseCase<Result<List<PaymentMethodModel>>, void> {
  final ICartRepository _cartRepository;

  GetPaymentMethodsUC({required ICartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  Future<Result<List<PaymentMethodModel>>> call(void _) async {
      final result = await _cartRepository.getPaymentMethod();
      return result;
  }
}