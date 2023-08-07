import 'package:json_theme/json_theme_schemas.dart';

class TileModeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/tile_mode.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/dart-ui/TileMode-class.html',
    'title': 'TileMode',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'clamp',
      'mirror',
      'repeated',
    ]),
  };
}
