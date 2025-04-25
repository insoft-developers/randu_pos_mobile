import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import 'dashboard_header_action_mobile.dart';
import 'dashboard_header_info_mobile.dart';

class DashboardHeaderMobile extends ConsumerWidget {
  final bool isCartPage;

  const DashboardHeaderMobile({
    super.key,
    this.isCartPage = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height / 5.2,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: CustomColors.primaryColor,
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          DashboardHeaderInfoMobile(isCartPage: isCartPage),
          const SizedBox(
            height: 16,
          ),
          DashboardHeaderActionMobile(isCartPage: isCartPage),
        ],
      ),
    );
  }
}
