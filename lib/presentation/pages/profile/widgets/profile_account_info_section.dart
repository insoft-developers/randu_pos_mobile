import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/user_model.dart';
import '../../../widgets/core/text/custom_text.dart';
import 'profile_info_list_tile.dart';
import 'profile_premium_tile.dart';

class ProfileAccountInfoSection extends StatelessWidget {
  final UserModel? user;

  const ProfileAccountInfoSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection.insetGrouped(
      header: CustomText('Info Account', style: CustomTextStyle.body2),
      children: [
        InfoListTile(
          icon: Icons.mail,
          title: 'Email',
          trailing: user?.email ?? '',
        ),
        InfoListTile(
          icon: Icons.person,
          title: 'Username',
          trailing: user?.username ?? '',
        ),
        InfoListTile(
          icon: Icons.group_work,
          title: 'No Hp',
          trailing: user?.phone ?? '',
        ),
        ProfilePremiumTile(user: user),
      ],
    );
  }
}