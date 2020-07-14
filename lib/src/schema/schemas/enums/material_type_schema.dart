class MaterialTypeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/material_type';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'MaterialType',
    'type': 'string',
    'enum': [
      'button',
      'canvas',
      'card',
      'circle',
      'transparency',
    ],
  };
}
