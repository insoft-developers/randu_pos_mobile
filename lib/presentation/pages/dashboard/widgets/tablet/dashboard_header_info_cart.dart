import 'package:flutter/material.dart';

import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../../widgets.dart';
import 'discount_button.dart';

class DashboardHeaderInfoCart extends StatelessWidget {
  const DashboardHeaderInfoCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomRoundedContainer(
      color: Colors.white,
      radius: 8,
      height: 60,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(flex: 3, child: SavedTransactionButton()),
          SizedBox(
            width: 5,
          ),
          Expanded(flex: 3, child: OrderFeeButton()),
          SizedBox(
            width: 5,
          ),
          Expanded(flex: 1, child: DiscountButton())
        ],
      ),
    );
  }
}
