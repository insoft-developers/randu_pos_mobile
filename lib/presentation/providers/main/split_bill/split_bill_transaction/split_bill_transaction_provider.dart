import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../../domain/usecases/split_bill/split_bill_transaction/split_bill_transaction_uc.dart';
import '../../../usecases/split_bill/split_bill_transaction/split_bill_transaction_uc_provider.dart';
import '../../cart/cart_provider.dart';
import '../../saved/get_saved_transactions/get_saved_transactions_provider.dart';

part 'split_bill_transaction_provider.freezed.dart';
part 'split_bill_transaction_provider.g.dart';
part 'split_bill_transaction_state.dart';

enum QuantityProcess { increment, decrement }

@riverpod
class SplitBillTransaction extends _$SplitBillTransaction {
  @override
  SplitBillTransactionState build() {
    return const SplitBillTransactionState();
  }

  void initItem(CartState cart) {
    CartState copyOriginalCart = cart;

    copyOriginalCart = copyOriginalCart.copyWith(
        cartItems: copyOriginalCart.cartItems.map((item) {
      return item.copyWith(quantity: 0);
    }).toList());
    state = state.copyWith(originalCart: cart, splitCart: copyOriginalCart);
  }

  void initItemSplit(CartState cart) {
    state = state.copyWith(splitCart: cart);
  }

  void updateItemSplit(ProductModel product,
      List<Map<VariantModel, int>> variants, QuantityProcess process) {
    state = state.copyWith(
      splitCart: state.splitCart!.copyWith(
        cartItems: state.splitCart!.cartItems.map((item) {
          // Check if the product ID and variants match
          if (item.product.id == product.id &&
              _areVariantsEqual(item.variants, variants)) {
            if (process == QuantityProcess.increment) {
              if (state.originalCart!.cartItems.any((element) =>
                  element.product.id == product.id &&
                  _areVariantsEqual(element.variants, variants) &&
                  element.quantity == 0)) {
                return item;
              }
              return item.copyWith(quantity: item.quantity + 1);
            } else {
              if (item.quantity == 0) return item;
              return item.copyWith(quantity: item.quantity - 1);
            }
          }
          return item;
        }).toList(),
      ),
      originalCart: state.originalCart!.copyWith(
        cartItems: state.originalCart!.cartItems.map((item) {
          if (item.product.id == product.id &&
              _areVariantsEqual(item.variants, variants)) {
            if (process == QuantityProcess.increment) {
              if (item.quantity == 0) return item;
              return item.copyWith(quantity: item.quantity - 1);
            } else {
              if (state.splitCart!.cartItems.any((element) =>
                  element.product.id == product.id &&
                  _areVariantsEqual(element.variants, variants) &&
                  element.quantity == 0)) {
                return item;
              }
              return item.copyWith(quantity: item.quantity + 1);
            }
          }
          return item;
        }).toList(),
      ),
    );
  }

// Helper method to compare two lists of variants
  bool _areVariantsEqual(List<Map<VariantModel, int>> variants1,
      List<Map<VariantModel, int>> variants2) {
    if (variants1.length != variants2.length) return false;

    for (int i = 0; i < variants1.length; i++) {
      final variantMap1 = variants1[i];
      final variantMap2 = variants2[i];

      if (variantMap1.length != variantMap2.length) return false;

      for (final variant1 in variantMap1.keys) {
        if (!variantMap2.containsKey(variant1) ||
            variantMap2[variant1] != variantMap1[variant1]) {
          return false;
        }
      }
    }

    return true;
  }

  void splitBillTransaction() async {
    SplitBillTransactionUC splitBillTransactionUC =
        ref.read(splitBillTransactionUcProvider);
    final result = await splitBillTransactionUC([
      state.originalCart!,
      state.splitCart!.copyWith(
          savedCartInfo: state.splitCart!.savedCartInfo!.copyWith(id: null)),
    ]);
    if (result.isSuccess) {
      ref.read(getSavedTransactionsProvider.notifier).fetchSavedTransactions();
      state = state.copyWith(status: true);
    } else {
      state = state.copyWith(status: false, errorMessage: result.errorMessage);
    }
  }

  // Future<void> splitBillTransaction(
  //     {required CartState originalCart, required CartState splitCart}) async {
  //   SplitBillTransactionUC splitBillTransactionUC =
  //       ref.read(splitBillTransactionUcProvider);
  //   final result = await splitBillTransactionUC([originalCart, splitCart]);
  //   if (result.isSuccess) {
  //     ref.read(getSavedTransactionsProvider.notifier).fetchSavedTransactions();
  //     state = result.resultValue;
  //   } else {
  //     state = result.errorMessage;
  //   }
  // }
}
