import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_theme/src/model/json_widget_state_property.dart';

void main() => group('JsonWidgetStateProperty', () {
      group('with empty map input', () {
        const emptyMap = JsonWidgetStateProperty<int>({});
        test(
          'should return null on resolve() call',
          () => expect(emptyMap.resolve(WidgetState.values.toSet()), isNull),
        );

        test(
          'should return null on empty (null) key in map',
          () => expect(emptyMap.resolve({}), isNull),
        );

        test(
          'should return null on toString() call',
          () => expect(emptyMap.toString(), null.toString()),
        );
      });

      group('with non-empty map input', () {
        const map = {
          WidgetState.disabled: true,
          WidgetState.error: false,
          null: true
        };
        const property = JsonWidgetStateProperty(map);
        test(
          'should return null on empty (null) key in map',
          () => expect(property.resolve({}), isTrue),
        );
        test(
          'should throw assertion error on resolve() call',
          () {
            expect(
              property.resolve(WidgetState.values.toSet()),
              isNull,
              reason: 'provides no value for ${WidgetState.values.first}',
            );
            expect(
              property.resolve({map.keys.first!}),
              isTrue,
              reason:
                  'provides ${map.values.first} value for ${map.keys.first}',
            );
          },
        );

        test(
          'should return full JsonWidgetStateProperty object on toString()',
          () => expect(
            property.toString(),
            '''JsonWidgetStateProperty({WidgetState.disabled: true, WidgetState.error: false, null: true,})''',
          ),
        );
      });
    });
