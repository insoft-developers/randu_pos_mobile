import 'package:flutter/material.dart';

import 'Line.dart';
import 'line_painter.dart';

class AdvancedLine extends StatelessWidget {
  final Axis direction;
  final Line line;
  final Paint paintDef;

  const AdvancedLine({
    super.key,
    required this.direction,
    required this.line,
    required this.paintDef,
  });

  @override
  Widget build(BuildContext context) {
    // line painter, always rendering horizontal line
    // if requested axis is vertical
    // send horizontal line with 90 degree rotated

    Paint paint = paintDef;

    Row lineWrapper = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: paint.strokeWidth,
            child: CustomPaint(
              painter: LinePainter(line: line, paintDef: paint),
            ),
          ),
        ),
      ],
    );

    if (direction == Axis.horizontal) {
      return lineWrapper;
    } else {
      return RotatedBox(
        quarterTurns: 1,
        child: lineWrapper,
      );
    }
  }
}
