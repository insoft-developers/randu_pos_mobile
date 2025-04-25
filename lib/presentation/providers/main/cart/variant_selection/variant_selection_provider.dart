import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/transaction/cart/product_model.dart';

part 'variant_selection_provider.freezed.dart';
part 'variant_selection_provider.g.dart';
part 'variant_selection_state.dart';

@riverpod
class VariantSelection extends _$VariantSelection {
  @override
  VariantSelectionState build() {
    return const VariantSelectionState(
      selectedSinglePickVariants: [],
      multiPickQuantities: {},
      product: ProductModel(id: 1, name: '', price: 0, categoryId: 1),
    );
  }

  void toggleSinglePickVariant(VariantModel variant) {
    final isSelected = state.selectedSinglePickVariants.contains(variant);
    state = state.copyWith(
      selectedSinglePickVariants: isSelected ? [] : [variant],
    );
  }

  void incrementVariantQuantity(VariantModel variant) {
    if (variant.maxQuantity == null ||
        (state.multiPickQuantities[variant] ?? 0) < variant.maxQuantity! ||
        variant.maxQuantity == 0) {
      state = state.copyWith(
        multiPickQuantities: {
          ...state.multiPickQuantities,
          variant: (state.multiPickQuantities[variant] ?? 0) + 1,
        },
      );
    } else {
      // Optionally, handle the case where the max quantity is reached
      print('Maximum quantity reached for ${variant.varianName}');
    }
  }

  void decrementVariantQuantity(VariantModel variant) {
    final currentQuantity = state.multiPickQuantities[variant] ?? 0;
    if (currentQuantity > 1) {
      state = state.copyWith(
        multiPickQuantities: {
          ...state.multiPickQuantities,
          variant: currentQuantity - 1,
        },
      );
    } else if (currentQuantity == 1) {
      final updatedQuantities =
          Map<VariantModel, int>.from(state.multiPickQuantities)
            ..remove(variant);
      state = state.copyWith(multiPickQuantities: updatedQuantities);
    }
  }

  void setProduct(ProductModel product) {
    state = state.copyWith(product: product);
  }

  void incrementProductQuantity() {
    // print(state.product.quantity);
    if (state.product.quantityProduct < state.productQuantity) return;
    state = state.copyWith(productQuantity: state.productQuantity + 1);
  }

  void decrementProductQuantity() {
    if (state.productQuantity == 0) return;
    state = state.copyWith(productQuantity: state.productQuantity - 1);
  }

  void setNote(String note) {
    state = state.copyWith(note: note);
  }

  void setCommentForVariant(int variantId, String comment) {
    state = state.copyWith(
      variantComments: {
        ...state.variantComments,
        variantId: comment,
      },
    );
  }

  String getCommentForVariant(int variantId) {
    return state.variantComments[variantId] ?? '';
  }
}
