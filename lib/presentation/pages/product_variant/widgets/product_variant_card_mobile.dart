import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../../core/utils/rounded_bottom_sheet.dart';
import '../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../providers/main/cart/variant_selection/variant_selection_provider.dart';
import '../../../widgets/core/bottomsheet/comment_bottom_sheet.dart';
import '../../../widgets/core/text/custom_text.dart';

class ProductVariantCardMobile extends ConsumerWidget {
  final VariantModel variant;

  const ProductVariantCardMobile({
    super.key,
    required this.variant,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variantSelectionState = ref.watch(variantSelectionProvider);
    final isSelectedSinglePick =
        variantSelectionState.selectedSinglePickVariants.contains(variant);
    final currentQuantity =
        variantSelectionState.multiPickQuantities[variant] ?? 0;
    final maxQuantityReached = variant.maxQuantity != null &&
        currentQuantity <= variant.maxQuantity! &&
        variant.maxQuantity! > 0;
    final comment = variantSelectionState
        .getCommentForVariant(variant.id ?? 0); // Get the comment

    return GestureDetector(
      onTap: () {
        if (variant.singlePick == 1) {
          ref
              .read(variantSelectionProvider.notifier)
              .toggleSinglePickVariant(variant);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: isSelectedSinglePick
                  ? CustomColors.primaryColor.withValues(alpha: 0.1)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: .5),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      variant.varianName ?? '-',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      variant.varianPrice != null
                          ? '(+ ${formatStringIDRToCurrency(text: variant.varianPrice.toString())})'
                          : '',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer(builder: (context, ref, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () async {
                            await showRoundedBottomSheet(
                              context: context,
                              isDismissible: false,
                              onClose: (value) {
                                print(value);
                              },
                              builder: (context) => CommentBottomSheet(
                                title: 'Masukkan komentar',
                                initialComment:
                                    comment, // Pass the current comment
                                onSave: (newComment) {
                                  // Handle save action, update the comment in the state
                                  if (comment.isEmpty && currentQuantity == 0) {
                                    if (variant.singlePick == 1) {
                                      ref
                                          .read(
                                              variantSelectionProvider.notifier)
                                          .toggleSinglePickVariant(variant);
                                    } else {
                                      ref
                                          .read(
                                              variantSelectionProvider.notifier)
                                          .incrementVariantQuantity(variant);
                                    }
                                  }
                                  ref
                                      .read(variantSelectionProvider.notifier)
                                      .setCommentForVariant(
                                          variant.id ?? 0, newComment);
                                },
                                onCancel: () {
                                  // Handle cancel action
                                  print('Comment editing canceled');
                                },
                              ),
                              enableDrag: false,
                            );
                          },
                          child: CustomText(
                            comment.isEmpty ? '+ Catatan' : comment,
                            style: CustomTextStyle.mobileDialogText
                                .copyWith(color: Colors.orange[700]),
                          ),
                        ),
                      );
                    }),
                    (!((variant.singlePick ?? 0) == 1))
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (currentQuantity > 0) {
                                    ref
                                        .read(variantSelectionProvider.notifier)
                                        .decrementVariantQuantity(variant);
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: currentQuantity > 0
                                          ? CustomColors.primaryColor
                                          : Colors.grey),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              CustomText(
                                '$currentQuantity',
                                style: CustomTextStyle.h6Bold,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (variant.maxQuantity == null ||
                                      variant.maxQuantity! == 0) {
                                    ref
                                        .read(variantSelectionProvider.notifier)
                                        .incrementVariantQuantity(variant);
                                    return;
                                  }
                                  if (maxQuantityReached) {
                                    ref
                                        .read(variantSelectionProvider.notifier)
                                        .incrementVariantQuantity(variant);
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: variant.maxQuantity == null ||
                                            variant.maxQuantity! == 0
                                        ? CustomColors.primaryColor
                                        : maxQuantityReached &&
                                                currentQuantity ==
                                                    variant.maxQuantity!
                                            ? Colors.grey
                                            : CustomColors.primaryColor,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
