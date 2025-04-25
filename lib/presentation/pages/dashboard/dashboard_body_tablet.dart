import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/main/user_data/user_data_provider.dart';
import 'not_allowed_page.dart';
import 'widgets.dart';
import 'widgets/dashboard_cart_ready.dart';
import 'widgets/tablet/product_section_tablet.dart';

class DashboardBodyTablet extends ConsumerWidget {
  const DashboardBodyTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPettyCashEnabled = ref.watch(userDataProvider
        .select((value) => value.value?.isPettyCashEnabled ?? false));
    final isCashierOpen = ref.watch(userDataProvider
        .select((value) => value.value?.isCashierOpen ?? false));
    final isPOSDisabled = !isCashierOpen && (isPettyCashEnabled);
    return SafeArea(
      child: Column(
        children: [
          const DashboardHeaderTablet(),
          const SizedBox(
            height: 6,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const DashboardInfoTransaction(),
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: isPOSDisabled
                        ? const NotAllowedPage()
                        : const Row(
                            children: [
                              ProductSectionTablet(),
                              SizedBox(
                                width: 4,
                              ),
                              DashboardCartReady(),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
