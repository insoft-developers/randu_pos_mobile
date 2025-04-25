import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/utils/currency_utils.dart';
import '../../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../utils.dart';

class ProductItem extends ConsumerWidget {
  const ProductItem({super.key, required this.data});

  final ProductModel data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      // Adjust elevation as needed
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Add rounded corners
      ),
      color: Colors.white,
      // White background for the card
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding inside the card
        child: ListTile(
          onTap: () async {
            await onPressedFab(ref, data);
          },
          title: CustomText(
            data.name ?? '',
            maxLines: 1,
            ellipsis: true,
          ),
          subtitle: CustomText(
            formatStringIDRToCurrency(
              text: '${data.price}',
              symbol: 'Rp ',
            ),
            style: CustomTextStyle.body1SemiBold
                .copyWith(color: CustomColors.primaryColor),
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
