import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../providers/main/user_data/user_data_provider.dart';
import '../../../../widgets/core/text/auto_sized_text_widget.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../date_info.dart';

class DashboardHeaderTablet extends ConsumerWidget {
  const DashboardHeaderTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    // final user = Hive.box<UserModel>('userBox').get('userBox');
    final user = userData.value?.user;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: CustomColors.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                AutoSizedTextWidget(
                  user?.fullname ?? '',
                  ellipsis: true,
                  style: CustomTextStyle.lightComponentInputLabel
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DateInfo(),
                SizedBox(
                  height: 5,
                ),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AutoSizedTextWidget(
                      'Kasir ${isCashierOpen ? 'Buka' : 'Tutup'}',
                      ellipsis: true,
                      style: CustomTextStyle.lightComponentInputLabel.copyWith(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(width: 4),
                    CustomRoundedContainer(
                      shadow: const [],
                      color: isCashierOpen
                          ? Colors.green
                          : CustomColors.lightErrorMain,
                      child: Icon(
                        isCashierOpen
                            ? Icons.check
                            : Icons.error_outline_outlined,
                        color: Colors.white,
                        size: 14,
                        fill: 0.5,
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
          )
        ],
      ),
    );
  }
}
