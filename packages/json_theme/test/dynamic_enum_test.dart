import 'package:flutter_test/flutter_test.dart';
import 'package:json_theme/json_theme.dart';

void main() {
  for (var id in Schemas.enums) {
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
