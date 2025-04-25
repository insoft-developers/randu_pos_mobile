import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/transaction/cart/product_model.dart';
import '../../../core/const/colors.dart';
import '../../providers/main/cart/variant_selection/variant_selection_provider.dart';
import '../../widgets/core/line/Line.dart';
import '../../widgets/core/line/advanced_line.dart';
import 'widgets/bottom_button_group.dart';
import 'widgets/product_variant_list.dart';
import 'widgets/widgets.dart';

class ChooseProductVariantTablet extends ConsumerStatefulWidget {
  const ChooseProductVariantTablet({super.key, required this.product});
  final ProductModel product;

  @override
  ConsumerState<ChooseProductVariantTablet> createState() =>
      _ChooseProductVariantTabletState();
}

class _ChooseProductVariantTabletState
    extends ConsumerState<ChooseProductVariantTablet> {
  late List<VariantModel> variantModels;

  @override
  void initState() {
    _filterVariant('Semua');
    super.initState();
  }

  void _filterVariant(String filter) {
    setState(() {
      variantModels = widget.product.variant
              ?.where(
                  (value) => value.varianGroup == filter || filter == 'Semua')
              .toList() ??
          [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final singlePickVariant = widget.product.variant == null
        ? []
        : widget.product.variant!
            .where((element) =>
                element.singlePick == 1 && variantModels.contains(element))
            .toList();
    final multiPickVariant = widget.product.variant == null
        ? []
        : widget.product.variant!
            .where((element) =>
                element.singlePick == 0 && variantModels.contains(element))
            .toList();
    final variantSelectionState = ref.watch(variantSelectionProvider);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7,
        padding:
            const EdgeInsets.only(bottom: 16, top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blueGrey[800],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: MenuInfoHeader(
                            name: widget.product.name ?? '-',
                            price: widget.product.price ?? 0,
                          ),
                        ),
                        // const Expanded(child: InputDiscount()),
                        const SizedBox(width: 16),
                        const AddProductNote(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: ProductVariantList(
                        product: widget.product,
                        onFilter: _filterVariant,
                        variantList: variantModels,
                      )),
                      const SizedBox(width: 16),
                      //TODO SEARCH VARIANT BAR TABLET
                      // const SizedBox(width: 250, child: SearchVariantBar()),
                      const SizedBox(height: 16),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16.0,
                    runSpacing: 8.0,
                    children: singlePickVariant.map((variant) {
                      final isSelected = variantSelectionState
                          .selectedSinglePickVariants
                          .contains(variant);
                      return GestureDetector(
                        onTap: () {
                          print(variant.varianName);
                          ref
                              .read(variantSelectionProvider.notifier)
                              .toggleSinglePickVariant(variant);
                        },
                        child: ProductVariantCardTablet(
                          variant: variant,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 8),
                  AdvancedLine(
                    direction: Axis.horizontal,
                    line: DashedLine(dashSize: 8),
                    paintDef: Paint()
                      ..color = CustomColors.darkGray
                      ..strokeWidth = 1,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16.0,
                    runSpacing: 8.0,
                    children: multiPickVariant.map((variant) {
                      return GestureDetector(
                        onTap: () {
                          if (variant.singlePick == 1) {
                            ref
                                .read(variantSelectionProvider.notifier)
                                .toggleSinglePickVariant(variant);
                          }
                        },
                        child: SizedBox(
                          child: ProductVariantCardTablet(
                            variant: variant,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // const SetProductAmmount(),
                  // const Spacer(),
                  SizedBox(
                      width: 500,
                      child: BottomButtonGroup(product: widget.product)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
