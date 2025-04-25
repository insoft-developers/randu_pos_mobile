import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../widgets/core/text/custom_text.dart';

// widgets/info_list_tile.dart
class InfoListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final dynamic trailing;
  final VoidCallback? onTap;

  const InfoListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      leading: Icon(icon, size: 20, color: Colors.black),
      title: CustomText(
        title,
        style: CustomTextStyle.body2.copyWith(color: Colors.black),
      ),
      trailing: trailing is String
          ? CustomText(
        trailing,
        style: const TextStyle(color: CustomColors.primaryColor),
      )
          : trailing,
      onTap: onTap,
    );
  }
}