import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_theme/src/model/json_material_state_property.dart';
import 'package:json_theme/src/model/map_material_state_property.dart';

void main() => group('MapMaterialStateProperty', () {
      group('toString()', () {
        test(
          'should return null on resolve() call',
          () {
            final empty = MapMaterialStateProperty.resolveWith((_) => null);
            expect(empty.resolve(MaterialState.values.toSet()), isNull);
            expect(empty.toString(), null.toString());
          },
        );

        test(
          'should not-return null on resolve() call',
          () {
            const json = JsonMaterialStateProperty({
              MaterialState.focused: false,
              MaterialState.disabled: true,
            });
            final nonEmpty = MapMaterialStateProperty.resolveWith((s) {
              if (s.contains(json.map.keys.last)) return json.map.values.last;
              if (s.contains(json.map.keys.first)) return json.map.values.first;
              return null;
            });
            expect(nonEmpty.toString(), json.toString());
            expect(nonEmpty.resolve({MaterialState.values.first}), isNull);
            expect(
              nonEmpty.resolve(MaterialState.values.toSet()),
              json.map.values.last,
            );
          },
        );
      });
    });
