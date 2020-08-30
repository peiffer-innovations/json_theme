import 'package:json_theme/json_theme_schemas.dart';

class MaterialTapTargetSizeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/material_tap_target_size';

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
