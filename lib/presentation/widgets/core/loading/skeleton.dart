import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';

class Skeleton extends StatefulWidget {
  final double height;
  final double width;
  final bool circle;
  final double radius;
  final Color color;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  const Skeleton({
    super.key,
    this.height = 20,
    this.width = 20,
    this.circle = false,
    this.radius = 0,
    this.color = CustomColors.pastelBlue,
    this.child,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 12,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.child != null ? null : widget.width,
      height: widget.child != null
          ? null
          : widget.circle
              ? widget.width
              : widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: widget.circle
            ? BorderRadius.circular(100)
            : BorderRadius.circular(widget.radius),
        gradient: LinearGradient(
          begin: Alignment(gradientPosition.value, 0),
          end: const Alignment(-1, 0),
          colors: [
            widget.color.withValues(alpha: .8),
            widget.color.withValues(alpha: .5),
            widget.color.withValues(alpha: .5),
            widget.color.withValues(alpha: .8)
          ],
        ),
      ),
      child: widget.child,
    );
  }
}
