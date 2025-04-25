import 'package:flutter/material.dart';

import '../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../core/const/colors.dart';
import '../../../widgets/core/text/custom_text.dart';

class ProductVariantList extends StatefulWidget {
  const ProductVariantList({
    super.key,
    required this.product,
    required this.onFilter,
    required this.variantList,
  });
  final ProductModel product;
  final Function(String) onFilter;
  final List<VariantModel> variantList;
  @override
  State<ProductVariantList> createState() => _ProductVariantListState();
}

class _ProductVariantListState extends State<ProductVariantList> {
  String? selectedVariantGroup;
  List<Map<String, dynamic>> productDummy = [
    {'name': 'Level Pedas', 'isActive': true},
    {'name': 'Lontong', 'isActive': false},
    {'name': 'Alat Makan', 'isActive': false},
    {'name': 'Alat Makan', 'isActive': false},
    {'name': 'Alat Makan', 'isActive': false},
    {'name': 'Alat Makan', 'isActive': false},
    {'name': 'Alat Makan', 'isActive': false},
    {'name': 'Alat Makan', 'isActive': false},
    {'name': 'Alat Makan', 'isActive': false},
    {'name': 'Alat Makan', 'isActive': false},
    {'name': 'Alat Makan', 'isActive': false},
    {'name': 'Alat Makan', 'isActive': false},
    {'name': 'Alat Makan', 'isActive': false},
  ];
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    bool isAllActive = product.variant!.length == widget.variantList.length;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: product.variantGroups == null
          ? CustomText('Tidak ada variant',
              style: CustomTextStyle.lightTypographyCaptionMinHeight
                  .copyWith(color: CustomColors.lightErrorMain))
          : Row(
              children: [
                GestureDetector(
                  onTap: () {
                    widget.onFilter('Semua');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: isAllActive
                              ? Colors.blue[200]!
                              : CustomColors.primaryColor),
                      borderRadius: BorderRadius.circular(8),
                      color: isAllActive ? Colors.blue[200] : Colors.white,
                    ),
                    child: CustomText(
                      'Semua',
                      style: CustomTextStyle.mobileDialogText
                          .copyWith(color: CustomColors.primaryColor),
                    ),
                  ),
                ),
                ...List.generate(product.variantGroups?.length ?? 0, (index) {
                  String? variant = product.variantGroups?[index];
                  String name = variant ?? '-';
                  bool isActive = !isAllActive &&
                      widget.variantList.first.varianGroup == variant;
                  return GestureDetector(
                    onTap: () {
                      widget.onFilter(variant ?? 'Semua');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isActive
                                  ? Colors.blue[200]!
                                  : CustomColors.primaryColor),
                          borderRadius: BorderRadius.circular(8),
                          color: isActive ? Colors.blue[200] : Colors.white),
                      child: CustomText(
                        name,
                        style: CustomTextStyle.mobileDialogText
                            .copyWith(color: CustomColors.primaryColor),
                      ),
                    ),
                  );
                })
              ],
            ),
    );
  }
}
