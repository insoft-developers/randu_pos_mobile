import 'package:flutter/material.dart';

import '../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../domain/entities/transaction/sale_type/sale_type_enum.dart';
import '../../../widgets/core/text/custom_text.dart';

int getProductPrice(
  ProductModel product,
  SaleTypeEnum type,
) {
  if (product.priceEdit == null) {
    if (type == SaleTypeEnum.dineIn) {
      return product.price ?? 0;
    } else if (type == SaleTypeEnum.takeAway) {
      return product.priceTakeAway ?? 0;
    } else if (type == SaleTypeEnum.marketPlace) {
      return product.priceMarketPlace ?? 0;
    } else if (type == SaleTypeEnum.customPrice) {
      return product.priceCustom ?? 0;
    } else {
      return 0;
    }
  } else {
    return product.priceEdit ?? 0;
  }
}

int getVariantPrice(VariantModel variant, SaleTypeEnum type) {
  // if (type == SaleTypeEnum.dineIn) {
  //   return variant.varianPrice ?? 0;
  // } else if (type == SaleTypeEnum.takeAway) {
  //   return variant.priceTakeAway ?? 0;
  // } else if (type == SaleTypeEnum.marketPlace) {
  //   return variant.priceMarketPlace ?? 0;
  // } else if (type == SaleTypeEnum.customPrice) {
  //   return variant.priceCustom ?? 0;
  // } else {
  //   return 0;
  // }
  return variant.varianPrice ?? 0;
}

enum BrowseTypeEnum { browse, scan }

Future<BrowseTypeEnum?> searchProductDialog(
    BuildContext context, String title, String content) {
  return showDialog<BrowseTypeEnum?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: CustomText(
          title,
          style: CustomTextStyle.h6,
        ),
        content: CustomText(content),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const CustomText('Cari'),
                onPressed: () {
                  Navigator.pop(context, BrowseTypeEnum.browse);
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const CustomText('Scan'),
                onPressed: () {
                  Navigator.pop(context, BrowseTypeEnum.scan);
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const CustomText('Close'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ],
      );
    },
  );
}
