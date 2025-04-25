import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../domain/entities/user_model.dart';
import '../../../core/const/colors.dart';
import '../../widgets/core/text/custom_text.dart';
import 'widgets.dart';

class StartShiftMobile extends StatelessWidget {
  const StartShiftMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Hive.box<UserModel>('userBox').get('userBox');
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const StartShiftTitle(),
              const SizedBox(
                height: 8,
              ),
              StartShiftItem(
                title: 'Kasir',
                icon: const Icon(
                  Icons.person,
                  color: CustomColors.primaryColor,
                ),
                content: CustomText(
                  user?.fullname ?? '',
                  style: CustomTextStyle.mobileDialogText,
                  ellipsis: true,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const StartShiftItem(
                title: 'Kas Awal',
                content: StartingCashField(),
                icon: Icon(
                  Icons.account_balance_wallet_rounded,
                  color: CustomColors.primaryColor,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ));
  }
}
