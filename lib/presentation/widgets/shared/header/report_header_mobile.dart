import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../core/const/constant.dart';
import '../../../../domain/entities/user_model.dart';
import '../../../providers/main/page_provider.dart';
import '../../core/buttons/primary_button.dart';
import '../../core/text/auto_sized_text_widget.dart';
import '../../core/text/custom_text.dart';
import 'date_info.dart';
import 'refresh_button.dart';

class ReportHeaderMobile extends ConsumerWidget {
  const ReportHeaderMobile({super.key, this.useRefresh = true});

  final bool useRefresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = Hive.box<UserModel>('userBox').get('userBox');
    final isCashierOpen =
        Hive.box<bool>(isCashierOpenData).get(isCashierOpenData) ?? false;

    // final isCashierOpen = userData.value?.isCashierOpen ?? false;
    return Row(
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
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizedTextWidget(
                          user?.fullname ?? 'User',
                          ellipsis: true,
                          style: CustomTextStyle.lightComponentInputLabel
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                width: 155,
                height: 35,
                padding: const EdgeInsets.only(left: 34),
                child: PrimaryButton(
                  radius: 8,
                  buttonPrimaryType: ButtonPrimaryType.outlinedTransparentWhite,
                  preFixWidget: const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(Icons.point_of_sale, color: Colors.white,),
                  ),
                  label: 'POS',
                  onTap: () {
                    ref.read(pageProvider.notifier).setPage(0);
                  },
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const DateInfo(),
              const SizedBox(height: 5),
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
              useRefresh ? const RefreshButton() : const SizedBox.shrink(),
            ],
          ),
        )
      ],
    );
  }
}
