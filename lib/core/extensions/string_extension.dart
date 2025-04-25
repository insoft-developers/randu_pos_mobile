import 'package:flutter/material.dart';
import 'dart:ui' as ui;

extension StringExtension on String {
  double textHeight(TextStyle style, double textWidth,
      {double maxWidth = double.infinity}) {
    final TextPainter textPainter = TextPainter(
      textScaler: const TextScaler.linear(1.1),
      text: TextSpan(text: this, style: style),
      textDirection: ui.TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: maxWidth);

    final countLines = (textPainter.size.width / textWidth).ceil();
    final height = countLines * textPainter.size.height;
    return height;
  }

  double textWidth(TextStyle style, {double maxWidth = double.infinity}) {
    TextPainter textPainter =
        TextPainter(textScaler: const TextScaler.linear(1.1))
          ..text = TextSpan(text: this, style: style)
          ..textDirection = ui.TextDirection.ltr
          ..layout(minWidth: 0, maxWidth: maxWidth);

    return textPainter.size.width;
  }

  String get capitalize =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String? get getFileExtension {
    try {
      return ".${split('.').last}";
    } catch (e) {
      return null;
    }
  }

  String get capitalizeEachWord {
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  String? get changeBrtoEnter {
    try {
      final regexBrTag = RegExp(r'<br>');

      // Replace <br> tags with newlines
      return replaceAll(regexBrTag, '\n');
    } catch (e) {
      return null;
    }
  }
}
