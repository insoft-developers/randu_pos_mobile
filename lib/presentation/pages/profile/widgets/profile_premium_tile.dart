import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../../../../domain/entities/user_model.dart';
import 'widgets.dart';

class ProfilePremiumTile extends StatelessWidget {
  final UserModel? user;

  const ProfilePremiumTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InfoListTile(
      icon: Icons.workspace_premium_rounded,
      title: 'Premium',
      trailing: (user?.isPremium ?? false)
          ? const Icon(Icons.workspace_premium_rounded, color: Colors.amber)
          : const Icon(Icons.face_2_outlined, color: Colors.grey),
      onTap: () {
        showToast((user?.isPremium ?? false)
            ? 'Anda adalah user premium'
            : 'Anda bukan user premium');
      },
    );
  }
}