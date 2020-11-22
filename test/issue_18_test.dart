import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_theme/json_theme.dart';

void main() {
  test('issue 18', () {
    var encoded = ThemeEncoder.encodeThemeData(ThemeData());
    ThemeDecoder.decodeThemeData(encoded);
  });
}
