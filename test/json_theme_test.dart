import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_theme/json_theme.dart';

void main() {
  test('appBarTheme', () {
    var appBarTheme = AppBarTheme(
      brightness: Brightness.dark,
      color: Color(0x00123456),
      elevation: 6.0,
    );

    var encoded = ThemeEncoder.encodeAppBarTheme(appBarTheme);
    var decoded = ThemeDecoder.decodeAppBarTheme(encoded);

    expect(
      json.encode(encoded),
      json.encode(
        {
          'brightness': 'dark',
          'color': '#00123456',
          'elevation': 6.0,
        },
      ),
    );

    expect(
      appBarTheme,
      decoded,
    );
  });

  test('brightness', () {});
}
