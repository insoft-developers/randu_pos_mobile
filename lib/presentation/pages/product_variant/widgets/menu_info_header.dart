import 'package:flutter/material.dart';

import '../../../../core/utils/currency_utils.dart';
import '../../../widgets/core/text/custom_text.dart';

class MenuInfoHeader extends StatelessWidget {
  final String name;
  final int price;
  const MenuInfoHeader({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/food_menu.jpg',
            width: 60,
            filterQuality: FilterQuality.low,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                'Nama Produk',
                style: CustomTextStyle.mobileDialogText.copyWith(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ),
              CustomText(
                name,
                style: CustomTextStyle.mobileDialogTitle
                    .copyWith(color: Colors.white),
                ellipsis: true,
              ),
              CustomText(
                formatStringIDRToCurrency(text: '$price', symbol: 'Rp '),
                style: CustomTextStyle.mobileDialogTitle
                    .copyWith(color: Colors.orange[200]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
