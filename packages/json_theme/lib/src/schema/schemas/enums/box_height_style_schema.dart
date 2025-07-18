import 'package:json_theme/json_theme_schemas.dart';

class BoxHeightStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/box_height_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'type': 'string',
    'title': 'BoxHeightStyle',
    'oneOf': SchemaHelper.enumSchema([
      'includeLineSpacingBottom',
      'includeLineSpacingMiddle',
      'includeLineSpacingTop',
      'max',
      'strut',
      'tight',
    ]),
  };
}
