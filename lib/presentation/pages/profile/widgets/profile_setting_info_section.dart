import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/user_model.dart';
import '../../../widgets/core/photo/image_dialog.dart';
import '../../../widgets/core/text/custom_text.dart';
import 'widgets.dart';

class ProfileSettingsInfoSection extends StatelessWidget {
  final UserModel? user;

  const ProfileSettingsInfoSection({super.key, required this.user});

  void showLogoDialog(BuildContext context, String imageUrl, String description) {
    showDialog(
      context: context,
      builder: (context) => ImageDialogContent(
        imageUrl: imageUrl,
        description: description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection.insetGrouped(
      header: CustomText('Info Settings', style: CustomTextStyle.body2),
      children: [
        InfoListTile(
          icon: Icons.money_outlined,
          title: 'Tax',
          trailing: '${user?.tax.toString()}%',
        ),
        InfoListTile(
          icon: Icons.group_work,
          title: 'Pembulatan',
          trailing: user?.isRounded ?? false ? 'Aktif' : 'Tidak Aktif',
        ),
        InfoListTile(
          icon: Icons.storefront_outlined,
          title: 'Nama Cabang',
          trailing: user?.branchName ?? '',
        ),
        InfoListTile(
          icon: Icons.group_work,
          title: 'Nama Usaha',
          trailing: user?.bussinessName ?? '',
        ),
        ProfileAddressTile(user: user),
        ProfileLogoTile(user: user),
      ],
    );
  }
}