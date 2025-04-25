import 'package:flutter/material.dart';

import '../../../core/const/colors.dart';
import '../../widgets/core/container/custom_rounded_container.dart';
import '../../widgets/core/drawer/randu_drawer.dart';
import 'widgets.dart';
import 'widgets/dashboard_cart_ready.dart';
import 'widgets/mobile/dashboard_floating_action.dart';

class CartPageMobile extends StatelessWidget {
  const CartPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const RanduDrawer(),
        body: Stack(
          alignment: Alignment.center,
          children: [
            const Column(
              children: [
                DashboardHeaderMobile(
                  isCartPage: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Expanded(
                  child: Column(
                    children: [
                      // // const DashboardInfoTransaction(),
                      // SizedBox(
                      //   height: 6,
                      // ),
                      DashboardCartReady(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
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
        ),
      ),
    );
  }
}
