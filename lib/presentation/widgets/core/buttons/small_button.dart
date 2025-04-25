import 'package:flutter/material.dart';
import '../../../../core/const/colors.dart';

class SmallButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? gap;
  final String label;
  final double? labelSize;
  final Color? color;
  final bool? isOutlined;
  final Color? backgroundColor;
  final bool? disabled;
  final double? height;
  final double? radius;
  final double? borderWidth;
  final double? iconSize;
  final Widget? preFixWidget;

  const SmallButton({
    super.key,
    required this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.gap = 4,
    required this.label,
    this.labelSize = 12,
    this.color = CustomColors.primaryColor,
    this.isOutlined = false,
    this.backgroundColor = Colors.white,
    this.disabled = false,
    this.height,
    this.radius = 8,
    this.borderWidth = 0.8,
    this.iconSize = 16,
    this.preFixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined!
            ? backgroundColor
            : disabled!
                ? CustomColors.gray
                : color,
        padding: const EdgeInsets.all(8),
        visualDensity: VisualDensity.comfortable,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius!),
          side: BorderSide(
            color: disabled! ? CustomColors.gray : color!,
            width: borderWidth!,
          ),
        ),
      ),
      onPressed: disabled! ? null : onPressed,
      child: SizedBox(
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            preFixWidget != null
                ? Padding(
                    padding: EdgeInsets.only(right: gap!),
                    child: preFixWidget!,
                  )
                : prefixIcon != null
                    ? Padding(
                        padding: EdgeInsets.only(right: gap!),
                        child: Icon(
                          prefixIcon,
                          size: iconSize,
                          color: disabled!
                              ? CustomColors.darkGray
                              : isOutlined!
                                  ? color
                                  : Colors.white,
                        ),
                      )
                    : const SizedBox.shrink(),
            Text(
              label,
              style: TextStyle(
                color: disabled!
                    ? CustomColors.darkGray
                    : isOutlined!
                        ? color
                        : Colors.white,
                fontSize: labelSize,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
            suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(left: gap!),
                    child: Icon(
                      suffixIcon,
                      size: iconSize,
                      color: disabled!
                          ? CustomColors.darkGray
                          : isOutlined!
                              ? color
                              : Colors.white,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
