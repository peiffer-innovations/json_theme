import 'package:flutter/material.dart';

int? colorToInt(Color? color) {
  int? result;
  if (color != null) {
    final hex = (color.a * 255).toInt().toRadixString(16).padLeft(2, '0') +
        (color.r * 255).toInt().toRadixString(16).padLeft(2, '0') +
        (color.g * 255).toInt().toRadixString(16).padLeft(2, '0') +
        (color.b * 255).toInt().toRadixString(16).padLeft(2, '0');

    return int.parse(hex, radix: 16);
  }

  return result;
}
