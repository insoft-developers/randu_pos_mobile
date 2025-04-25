import '../../domain/entities/result.dart';
import '../../domain/entities/transaction/cart/category_model.dart';
import '../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../domain/entities/transaction/cart/product_model.dart';

abstract class IMasterDataOfflineRepository {
  //PRODUCT
  Future<Result<String>> saveProducts(List<ProductModel> products);
  Future<Result<List<ProductModel>>> getProducts();

  //CATEGORY
  Future<Result<String>> saveCategories(List<CategoryModel> categories);
  Future<Result<List<CategoryModel>>> getCategories();

  //PAYMENT_METHOD
  Future<Result<String>> savePaymentMethods(
      List<PaymentMethodModel> paymentMethods);
  Future<Result<List<PaymentMethodModel>>> getPaymentMethods();
}
