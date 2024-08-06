import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_theme/src/model/json_widget_state_property.dart';
import 'package:json_theme/src/model/map_widget_state_property.dart';

void main() => group('MapWidgetStateProperty', () {
      group('toString()', () {
        test(
          'should return null on resolve() call',
          () {
            final empty = MapWidgetStateProperty.resolveWith((_) => null);
            expect(empty.resolve(WidgetState.values.toSet()), isNull);
            expect(empty.toString(), null.toString());
          },
        );

        test(
          'should not-return null on resolve() call',
          () {
            const json = JsonWidgetStateProperty({
              WidgetState.focused: false,
              WidgetState.disabled: true,
            });
            final nonEmpty = MapWidgetStateProperty.resolveWith((s) {
              if (s.contains(json.map.keys.last)) return json.map.values.last;
              if (s.contains(json.map.keys.first)) return json.map.values.first;
              return null;
            });
            expect(nonEmpty.toString(), json.toString());
            expect(nonEmpty.resolve({WidgetState.values.first}), isNull);
            expect(
              nonEmpty.resolve(WidgetState.values.toSet()),
              json.map.values.last,
            );
          },
        );
      });
    });
