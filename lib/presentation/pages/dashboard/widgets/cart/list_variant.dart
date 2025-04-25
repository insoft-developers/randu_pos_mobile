import 'package:flutter/material.dart';

import '../../../../../core/utils/currency_utils.dart';
import '../../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../widgets/core/text/custom_text.dart';

class ListVariant extends StatelessWidget {
  final List<Map<VariantModel, int>> variants;

  const ListVariant({super.key, required this.variants});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: variants.length,
      itemBuilder: (context, index) {
        final variantMap = variants[index];
        return Column(
            children: variantMap.entries.map((entry) {
          final variant = entry.key;
          final quantity = entry.value;

          return ListTile(
            dense: true,
            contentPadding: const EdgeInsets.all(0),
            minVerticalPadding: 0,
            minTileHeight: 0,
            horizontalTitleGap: 8,
            titleAlignment: ListTileTitleAlignment.top,
            leading: CustomText(
              '$quantity x', // Updated to display the quantity
              style: CustomTextStyle.productName,
            ),
            trailing: CustomText(
              formatStringIDRToCurrency(
                  text: variant.varianPrice.toString(), symbol: 'Rp '),
              ellipsis: true,
              style: CustomTextStyle.productName.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.w400,
              ),
            ),
            title: CustomText(
              variant.varianName ?? '-',
              ellipsis: true,
              style: CustomTextStyle.productName.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle: variant.note != null && variant.note!.isNotEmpty
                ? CustomText(
                    'Catatan: ${variant.note ?? ''}',
                    ellipsis: true,
                    style: CustomTextStyle.productName.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                : null,
          );
        }).toList());
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 4);
      },
    );
  }
}
