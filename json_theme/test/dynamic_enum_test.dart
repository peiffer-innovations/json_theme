import 'package:flutter_test/flutter_test.dart';
import 'package:json_theme/json_theme_schemas.dart';

void main() {
  for (var id in Enums.all) {
    test('enum: $id', () {
      expect(SchemaValidator.validate(schemaId: id, value: '{{foo}}'), true);
      expect(
        SchemaValidator.validate(schemaId: id, value: '##foo(bar)##'),
        true,
      );
      expect(SchemaValidator.validate(schemaId: id, value: '\${foo}'), true);
      expect(
        SchemaValidator.validate(schemaId: id, value: "\${foo('bar')}"),
        true,
      );
    });
  }
}
