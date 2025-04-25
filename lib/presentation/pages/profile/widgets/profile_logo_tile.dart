import 'package:flutter/material.dart';

import '../../../../domain/entities/user_model.dart';
import '../../../widgets/core/photo/image_dialog.dart';
import '../../../widgets/core/text/custom_text.dart';
import 'widgets.dart';

class ProfileLogoTile extends StatelessWidget {
  final UserModel? user;

  const ProfileLogoTile({super.key, required this.user});

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
    return InfoListTile(
      icon: Icons.image,
      title: 'Logo Perusahaan',
      trailing: user == null
          ? const SizedBox.shrink()
          : user!.photoLogo.isNotEmpty
          ? TextButton(
        onPressed: () {
          showLogoDialog(context, user!.photoLogo, 'Logo Perusahaan');
        },
        child: CustomText('Lihat', style: CustomTextStyle.body1SemiBold),
      )
          : CustomText('Logo Perusahaan belum ditambahkan',
          style: CustomTextStyle.body1SemiBold),
    );
  }
}