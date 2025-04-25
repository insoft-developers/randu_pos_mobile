import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../providers/main/page_provider.dart';
import '../../../providers/main/user_data/user_data_provider.dart';
import '../../core/buttons/primary_button.dart';
import '../../core/text/auto_sized_text_widget.dart';
import '../../core/text/custom_text.dart';
import 'date_info.dart';
import 'refresh_button.dart';

class ReportHeaderTablet extends ConsumerWidget {
  const ReportHeaderTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    final user = userData.value?.user;
    final isCashierOpen = userData.value?.isCashierOpen ?? false;

    return Container(
      color: CustomColors.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                const SizedBox(height: 8),
                Container(
                  width: 160,
                  height: 35,
                  padding: const EdgeInsets.only(left: 40),
                  child: PrimaryButton(
                    radius: 8,
                    buttonPrimaryType:
                        ButtonPrimaryType.outlinedTransparentWhite,
                    preFixWidget: const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(Icons.point_of_sale),
                    ),
                    useAutoSizedLabel: true,
                    ellipsis: true,
                    label: 'POS',
                    onTap: () {
                      ref.read(pageProvider.notifier).setPage(0);
                    },
                  ),
                )
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
                RefreshButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
