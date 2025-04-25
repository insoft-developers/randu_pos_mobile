import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/cart/variant_selection/variant_selection_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';

class BottomButtonGroup extends ConsumerWidget {
  const BottomButtonGroup({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
            child: PrimaryButton(
          label: 'Batal',
          onTap: () {
            Navigator.pop(context);
          },
          buttonPrimaryType: ButtonPrimaryType.outlinedError,
        )),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: PrimaryButton(
          label: 'Proses',
          onTap: () {
            onProsesButtonClicked(context, ref, product);
          },
        ))
      ],
    );
  }

  void onProsesButtonClicked(
      BuildContext context, WidgetRef ref, ProductModel product) {
    final variantSelectionState = ref.watch(variantSelectionProvider);
    final cart = ref.read(cartProvider.notifier);
    product = product.copyWith(note: variantSelectionState.note);
    // // For single-pick variant
    // if (variantSelectionState.selectedSinglePickVariants.isNotEmpty) {
    List<Map<VariantModel, int>> newVariants = [];

    // Add selected single-pick variants with quantity 1 and comments
    for (var variant in variantSelectionState.selectedSinglePickVariants) {
      final comment =
          variantSelectionState.getCommentForVariant(variant.id ?? 0);
      final updatedVariant = variant.copyWith(note: comment);
      newVariants.add({updatedVariant: 1});
    }

    // Add multi-pick variants with their respective quantities and comments
    variantSelectionState.multiPickQuantities.forEach((variant, quantity) {
      final comment =
          variantSelectionState.getCommentForVariant(variant.id ?? 0);
      final updatedVariant = variant.copyWith(note: comment);
      newVariants.add({updatedVariant: quantity});
    });

    cart.addProduct(
      product,
      newVariants,
      product.note ?? '', // Add product note if required
      isNewItem: true,
    );
    // } else {
    //   cart.addProduct(
    //     product,
    //     [],
    //     '', // Add product note if required
    //   );
    // }
    //
    // // For multi-pick variants
    //
    // // Close the dialog or navigate back
    Navigator.of(context).pop();
  }
}
