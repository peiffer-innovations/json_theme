import 'package:json_theme/json_theme_schemas.dart';

class TileModeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/tile_mode';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TileMode',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'clamp',
      'mirror',
      'repeated',
    ]),
  };
}
