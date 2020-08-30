import 'package:json_theme/json_theme_schemas.dart';

class MaterialTypeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/material_type';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'MaterialType',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'button',
      'canvas',
      'card',
      'circle',
      'transparency',
    ]),
  };
}
