import 'package:flutter/material.dart';

extension StringExtension on String {
  String toTitleCase() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Color darkenColor(Color color, double amount) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return hslDark.toColor();
}
