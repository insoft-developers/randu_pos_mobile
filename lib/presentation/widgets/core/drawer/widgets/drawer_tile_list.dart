import 'package:flutter/material.dart';

import '../../../../../core/const/colors.dart';

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;

  const DrawerListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = CustomColors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: Icon(icon, color: iconColor),
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      title: Text(title),
      onTap: onTap,
    );
  }
}
