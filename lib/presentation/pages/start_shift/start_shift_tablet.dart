import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../core/const/colors.dart';
import '../../../domain/entities/user_model.dart';
import '../../widgets/core/text/custom_text.dart';
import 'widgets.dart';

class StartShiftTablet extends ConsumerWidget {
  const StartShiftTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(userDataProvider).value?.user;
    final user = Hive.box<UserModel>('userBox').get('userBox');
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 8,
              ),
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
                  style: CustomTextStyle.tabletDialogText,
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
            ],
          ),
        ),
      ),
    );
  }
}
