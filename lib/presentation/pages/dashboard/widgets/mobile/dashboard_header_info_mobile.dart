import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../../domain/entities/user_model.dart';
import '../../../../widgets/core/text/auto_sized_text_widget.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../date_info.dart';

class DashboardHeaderInfoMobile extends ConsumerWidget {
  const DashboardHeaderInfoMobile({super.key, this.isCartPage = false});

  final bool isCartPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = Hive.box<UserModel>('userBox').get('userBox');
    // final isCashierOpen =
    //     Hive.box<bool>(isCashierOpenData).get(isCashierOpenData) ?? false;
    return Row(
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
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizedTextWidget(
                      user?.fullname ?? 'User.',
                      ellipsis: true,
                      style: CustomTextStyle.lightComponentInputLabel
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DateInfo(),
              SizedBox(height: 5),
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
    );
  }
}
