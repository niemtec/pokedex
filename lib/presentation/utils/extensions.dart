import 'package:flutter/material.dart';

extension StringExtension on String {
  String toTitleCase() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Color darkenColour(Color color, double amount) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return hslDark.toColor();
}

Color brightenColour(Color color, double amount) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final hslBright = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return hslBright.toColor();
}
