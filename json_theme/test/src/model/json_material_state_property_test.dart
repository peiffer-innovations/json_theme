import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_theme/src/model/json_material_state_property.dart';

void main() => group('JsonMaterialStateProperty', () {
      group('with empty map input', () {
        const emptyMap = JsonMaterialStateProperty<int>({});
        test(
          'should return null on resolve() call',
          () => expect(emptyMap.resolve(MaterialState.values.toSet()), isNull),
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
          MaterialState.disabled: true,
          MaterialState.error: false,
          null: true
        };
        const property = JsonMaterialStateProperty(map);
        test(
          'should return null on empty (null) key in map',
          () => expect(property.resolve({}), isTrue),
        );
        test(
          'should throw assertion error on resolve() call',
          () {
            expect(
              property.resolve(MaterialState.values.toSet()),
              isNull,
              reason: 'provides no value for ${MaterialState.values.first}',
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
          'should return full JsonMaterialStateProperty object on toString()',
          () => expect(
            property.toString(),
            '''JsonMaterialStateProperty({MaterialState.disabled: true, MaterialState.error: false, null: true,})''',
          ),
        );
      });
    });
