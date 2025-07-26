import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../insoft/controller/premium_controller.dart';
import '../../widgets/core/responsive/responsive_layout.dart';
import '../premium.dart';
import 'transaction_management_page_mobile.dart';
import 'transaction_management_page_tablet.dart';

class TransactionManagementPage extends StatefulWidget {
  const TransactionManagementPage({super.key});

  @override
  State<TransactionManagementPage> createState() =>
      _TransactionManagementPageState();
}

class _TransactionManagementPageState extends State<TransactionManagementPage> {
  final PremiumController _controller = Get.put(PremiumController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 5));

      _controller.cekPremium(
        onPremium: () {
          debugPrint('✅ User is premium. Lanjut.');
        },
        onNotPremium: () {
          if (!mounted) return;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Premium()),
          );
        },
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileBody: TransactionManagementPageMobile(),
        tabletBody: TransactionManagementPageTablet());
  }
}
