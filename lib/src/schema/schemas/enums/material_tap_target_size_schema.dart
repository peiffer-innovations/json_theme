import 'package:json_theme/json_theme_schemas.dart';

class MaterialTapTargetSizeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/material_tap_target_size.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'MaterialTapTargetSize',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'padded',
      'shrinkWrap',
    ]),
  };
}
