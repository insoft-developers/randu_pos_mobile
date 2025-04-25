import 'package:flutter/material.dart';
import '../text/custom_text.dart';

import '../../../../core/const/colors.dart';

class RanduButton extends StatelessWidget {
  final String? text;
  final IconData icon;
  final Widget? child;
  final VoidCallback onPressed;
  final Color color;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color? backgroundColor;

  const RanduButton({
    super.key,
    this.text,
    required this.icon,
    this.child,
    required this.onPressed,
    this.color = CustomColors.primaryColor,
    this.borderWidth = 1.0,
    this.padding = const EdgeInsets.all(8.0),
    this.radius = 8.0,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        splashColor: color.withValues(alpha: 0.3),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
              border: Border.all(color: color, width: borderWidth),
              borderRadius: BorderRadius.circular(radius),
              color: backgroundColor),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 24, // Adjust the width as needed
                height: 24, // Adjust the height as needed
                child: child ?? Icon(icon, color: color),
              ),
              if (text != null) ...[
                const SizedBox(width: 8),
                CustomText(
                  text!,
                  ellipsis: true,
                  style:
                      TextStyle(color: color, overflow: TextOverflow.ellipsis),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
