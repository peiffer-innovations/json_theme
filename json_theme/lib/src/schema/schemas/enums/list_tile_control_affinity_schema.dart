import 'package:json_theme/json_theme_schemas.dart';

class ListTileControlAffinitySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/list_tile_control_affinity.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'ListTileControlAffinity',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema(['leading', 'platform', 'trailing']),
  };
}
