import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/core/responsive/responsive_layout.dart';
import 'products_page_mobile.dart';
import 'products_page_tablet.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ResponsiveLayout(
      mobileBody: ProductsPageMobile(),
      tabletBody: ProductsPageTablet(),
    );
  }
}
