import 'package:flutter/material.dart';

import '../../../domain/entities/transaction/cart/product_model.dart';
import '../../widgets/core/line/Line.dart';
import '../../widgets/core/line/advanced_line.dart';
import 'widgets/bottom_button_group.dart';
import 'widgets/product_variant_card_mobile.dart';
import 'widgets/product_variant_list.dart';
import 'widgets/widgets.dart';

class ChooseProductVariantMobile extends StatefulWidget {
  const ChooseProductVariantMobile({super.key, required this.product});
  final ProductModel product;

  @override
  State<ChooseProductVariantMobile> createState() =>
      _ChooseProductVariantMobileState();
}

class _ChooseProductVariantMobileState
    extends State<ChooseProductVariantMobile> {
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
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blueGrey[800],
              ),
              child: Column(
                children: [
                  MenuInfoHeader(
                    name: widget.product.name ?? '',
                    price: widget.product.price ?? 0,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AdvancedLine(
                    direction: Axis.horizontal,
                    line: DashedLine(dashSize: 6),
                    paintDef: Paint()
                      ..strokeWidth = 1
                      ..strokeCap = StrokeCap.round
                      ..color = Colors.white,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // const InputDiscount(),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  const Row(
                    children: [
                      Expanded(
                        child: AddProductNote(),
                      ),
                      // SizedBox(
                      //   width: 8,
                      // ),
                      // Expanded(
                      //   child: SetProductAmmount(),
                      // )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            //TODO add search bar
            // const SearchVariantBar(),
            const SizedBox(
              height: 16,
            ),
            ProductVariantList(
              product: widget.product,
              onFilter: _filterVariant,
              variantList: variantModels,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...widget.product.variant == null
                        ? []
                        : widget.product.variant!
                            .where((value) =>
                                value.isSinglePick &&
                                variantModels.contains(value))
                            .map((variant) =>
                                ProductVariantCardMobile(variant: variant)),
                    AdvancedLine(
                      direction: Axis.horizontal,
                      line: DashedLine(dashSize: 6),
                      paintDef: Paint()
                        ..strokeWidth = 1
                        ..strokeCap = StrokeCap.round
                        ..color = Colors.white,
                    ),
                    const SizedBox(height: 8),
                    ...widget.product.variant == null
                        ? []
                        : widget.product.variant!
                            .where((value) =>
                                !value.isSinglePick &&
                                variantModels.contains(value))
                            .map((variant) =>
                                ProductVariantCardMobile(variant: variant)),
                    // ...List.generate(
                    //   3,
                    //   (index) => const ProductVariantCardTablet(
                    //     variant: VariantModel(id: 1, productId: 1, varianGroup: '1', varianName: 'Pedas', sku: '123456', varianPrice: 10000, singlePick: 1, maxQuantity: 10, quantity: 0, note: 'Note'),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // Spacer(),
            BottomButtonGroup(product: widget.product),
            const SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}
