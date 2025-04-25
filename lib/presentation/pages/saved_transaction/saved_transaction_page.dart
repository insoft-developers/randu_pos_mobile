import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/colors.dart';
import '../../widgets/core/responsive/responsive_layout.dart';
import '../../widgets/core/text/custom_text.dart';
import 'saved_transaction_page_mobile.dart';
import 'saved_transaction_page_tablet.dart';

class SavedTransactionPage extends ConsumerWidget {
  const SavedTransactionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Transaksi Tersimpan'),
        backgroundColor: CustomColors.primaryColor,
        titleTextStyle: CustomTextStyle.h6,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: const ResponsiveLayout(
        mobileBody: SavedTransactionPageMobile(),
        tabletBody: SavedTransactionPageTablet(),
      ),
    );
  }
}
