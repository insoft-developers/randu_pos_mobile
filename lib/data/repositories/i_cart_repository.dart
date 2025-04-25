import '../../domain/entities/result.dart';
import '../../domain/entities/transaction/cart/category_model.dart';
import '../../domain/entities/transaction/cart/discount_model.dart';
import '../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../domain/entities/transaction/cart/product_model.dart';
import '../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../domain/entities/transaction/cart/table_model.dart';

abstract interface class ICartRepository {
  // GET PRODUCT
  Future<Result<(List<ProductModel>, int?)>> getProducts({
    required ProductsRequestModel request,
  });

  // GET CATEGORY
  Future<Result<List<CategoryModel>>> getCategory();

  // GET TABLES
  Future<Result<List<TableModel>>> getTables(String? query);

  // GET DISCOUNT
  Future<Result<List<DiscountModel>>> getDiscounts();

  //GET PAYMENT METHOD
  Future<Result<List<PaymentMethodModel>>> getPaymentMethod();
}
