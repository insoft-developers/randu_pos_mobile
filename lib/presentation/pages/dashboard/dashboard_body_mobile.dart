import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'widgets/mobile/product_section_mobile.dart';

import '../../../core/const/colors.dart';
import '../../../core/const/constant.dart';
import '../../providers/main/user_data/user_data_provider.dart';
import '../../widgets/core/container/custom_rounded_container.dart';
import 'not_allowed_page.dart';
import 'widgets.dart';
import 'widgets/mobile/dashboard_floating_action.dart';

class DashboardBodyMobile extends ConsumerWidget {
  const DashboardBodyMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPettyCashEnabled =
        Hive.box<bool>(isPettyCashEnabledData).get(isPettyCashEnabledData) ??
            false;
    final isCashierOpen =
        Hive.box<bool>(isCashierOpenData).get(isCashierOpenData) ?? false;
    final isPosDisabled = !isCashierOpen && (isPettyCashEnabled);
    final userData = ref.watch(userDataProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            const DashboardHeaderMobile(),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              child: Column(
                children: [
                  // const DashboardInfoTransaction(),
                  const SizedBox(
                    height: 6,
                  ),
                  userData.isLoading
                      ? const Center(child: SizedBox.shrink())
                      : Expanded(
                          child: isPosDisabled
                              ? const NotAllowedPage()
                              : const CustomRoundedContainer(
                                  padding: EdgeInsets.all(0),
                                  color: CustomColors
                                      .lightBackgroundBodyBackground,
                                  width: double.infinity,
                                  child: ProductSectionMobile(),
                                ),
                        ),
                ],
              ),
            ),
          ],
        ),
        isPosDisabled
            ? const SizedBox()
            : Positioned(
                top: (MediaQuery.of(context).size.height / 5.5) - 20,
                child: CustomRoundedContainer(
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: 60,
                  radius: 12,
                  shadow: const [
                    BoxShadow(color: CustomColors.darkGray, blurRadius: 1)
                  ],
                  child: const DashboardFloatingAction(),
                ),
              ),
      ],
    );
  }
}
