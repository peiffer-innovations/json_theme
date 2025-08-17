import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_theme/json_theme.dart';

void main() {
  test('issue 18', () {
    final encoded = ThemeEncoder.instance.encodeThemeData(ThemeData());
    ThemeDecoder.instance.decodeThemeData(encoded, validate: true);
  });
}
