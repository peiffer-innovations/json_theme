import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_theme/json_theme.dart';
import 'package:logging/logging.dart';

void main() {
  test('issue 18', () {
    Logger.root.onRecord.listen((record) {
      // ignore: avoid_print
      print('${record.level.name}: ${record.time}: ${record.message}');
      if (record.error != null) {
        // ignore: avoid_print
        print('${record.error}');
      }
      if (record.stackTrace != null) {
        // ignore: avoid_print
        print('${record.stackTrace}');
      }
    });

    final encoded = ThemeEncoder.instance.encodeThemeData(ThemeData());
    ThemeDecoder.instance.decodeThemeData(encoded, validate: true);
  });
}
