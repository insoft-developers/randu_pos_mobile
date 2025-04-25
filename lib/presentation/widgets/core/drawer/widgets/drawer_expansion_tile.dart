import 'package:flutter/material.dart';

import '../../../../../core/const/colors.dart';

class DrawerExpansionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;

  const DrawerExpansionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: Icon(icon, color: CustomColors.blue),
      title: Text(title),
      children: children,
    );
  }
}
