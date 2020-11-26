import 'package:json_theme/json_theme_schemas.dart';

class TileModeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/tile_mode.json';

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
