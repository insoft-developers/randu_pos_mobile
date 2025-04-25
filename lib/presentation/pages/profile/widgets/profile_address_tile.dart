
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../../../../core/const/colors.dart';
import '../../../../domain/entities/user_model.dart';
import '../../../widgets/core/text/custom_text.dart';
import 'widgets.dart';

class ProfileAddressTile extends StatelessWidget {
  final UserModel? user;

  const ProfileAddressTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InfoListTile(
      icon: Icons.place,
      title: 'Alamat',
      trailing: Expanded(
        child: CustomText(
          user?.bussinessAddress ?? '',
          ellipsis: true,
          style: const TextStyle(color: CustomColors.primaryColor),
        ),
      ),
      onTap: () {
        showToast(user?.bussinessAddress ?? '');
      },
    );
  }
}