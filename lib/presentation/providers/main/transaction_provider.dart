import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/general_response.dart';
import '../../../domain/entities/result.dart';
import '../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../usecases/transaction/close_cashier/close_cashier_uc_provider.dart';
import '../usecases/transaction/open_cashier/open_cashier_uc_provider.dart';
import 'cart/get_category_product/category_product_provider.dart';
import 'cart/get_payment_methods/get_payment_methods_provider.dart';
import 'cart/get_products/get_products_provider.dart';
import 'user_data/user_data_provider.dart';

// part 'transaction_provider.freezed.dart';
part 'transaction_provider.g.dart';
// part 'transaction_state.dart';

@riverpod
class TransactionData extends _$TransactionData {
  @override
  Future<GeneralResponse?> build() async {
    return null;
  }

  Future<void> openCashier({required int initialCashAmount}) async {
    state = const AsyncLoading();
    final openCashier = ref.read(openCashierUCProvider);
    var result = await openCashier(initialCashAmount);
    if (result is Success) {
      print('check status cashier');
      ref.read(userDataProvider.notifier).refreshUser();
      state = AsyncData(result.resultValue);
      // return result.resultValue;
    } else {
      state = AsyncError(
          result.resultValue?.message ?? 'Error', StackTrace.current);
      // state = const AsyncData(null);
      // return result.resultValue;
    }
  }

  Future<void> closeCashier() async {
    state = const AsyncLoading();
    print('loading close cashier');
    final closeCashier = ref.read(closeCashierUCProvider);
    var result = await closeCashier(null);
    if (result is Success) {
      print('check status cashier');
      ref.read(userDataProvider.notifier).refreshUser();
    }
    state = AsyncData(result.resultValue);
    return;
  }

  Future<void> syncData() async {
    state = const AsyncLoading();
    // FETCH USER
    await ref.read(userDataProvider.notifier).refreshUser();

    // FETCH PRODUCTS
    await ref
        .read(getProductsProvider.notifier)
        .fetchProducts(const ProductsRequestModel(), refresh: true);

    // FETCH CATEGORIES
    await ref
        .read(categoryProductProvider.notifier)
        .fetchCategories(refresh: true);

    await ref
        .read(getPaymentMethodsProvider.notifier)
        .fetchPaymentMethods(refresh: true);
    state = const AsyncData(
        GeneralResponse(status: true, message: 'Berhasil Sinkronisasi Data'));
  }
}
