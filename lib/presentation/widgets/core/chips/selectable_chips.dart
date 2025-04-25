import 'package:flutter/material.dart';
import '../../../../core/const/colors.dart';
import '../text/custom_text.dart';

class SelectableChips extends StatefulWidget {
  final String label;
  final bool isDisabled;
  final VoidCallback? onTap;
  final bool active;
  final Color? activeFillColor;
  final Color? pressedFillColor;
  final Color? fillColor;
  final Color? activeBorderColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? activeTextColor;
  final double horizontalPadding;
  final double verticalPadding;

  const SelectableChips(
      {required this.label,
      this.onTap,
      this.isDisabled = false,
      this.active = false,
      this.activeFillColor,
      this.pressedFillColor,
      this.fillColor,
      this.borderColor = CustomColors.gray,
      this.borderRadius,
      this.activeBorderColor,
      this.textStyle,
      this.textColor,
      this.activeTextColor,
      this.horizontalPadding = 8,
      this.verticalPadding = 8,
      super.key});

  @override
  State<SelectableChips> createState() => _SelectableChipsState();
}

class _SelectableChipsState extends State<SelectableChips> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.isDisabled,
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        onHighlightChanged: (value) => setState(() => _isPressed = value),
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: widget.horizontalPadding,
              vertical: widget.verticalPadding),
          decoration: BoxDecoration(
              border:
                  Border.all(color: widget.borderColor ?? Colors.transparent),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
              color: widget.active
                  ? widget.activeFillColor ?? CustomColors.primaryColor
                  : _isPressed
                      ? widget.pressedFillColor ??
                          CustomColors.lightPrimaryMain.withValues(alpha: 0.6)
                      : widget.fillColor ?? CustomColors.white),
          child: Center(
            child: CustomText(
              widget.label,
              style: (widget.textStyle ?? CustomTextStyle.lightComponentsChip)
                  .copyWith(
                      color: _isPressed || widget.active
                          ? widget.activeTextColor ?? CustomColors.white
                          : widget.textColor),
              maxLines: 1,
              ellipsis: true,
            ),
          ),
        ),
      ),
    );
  }
}
