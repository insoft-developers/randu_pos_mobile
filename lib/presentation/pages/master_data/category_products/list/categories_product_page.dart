import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/core/responsive/responsive_layout.dart';
import 'categories_product_page_mobile.dart';
import 'categories_product_page_tablet.dart';

class CategoriesProductPage extends ConsumerWidget {
  const CategoriesProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ResponsiveLayout(
      mobileBody: CategoriesProductPageMobile(),
      tabletBody: CategoriesProductPageTablet(),
    );
  }
}
