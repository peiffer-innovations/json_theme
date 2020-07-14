class TileModeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/tile_mode';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TileMode',
    'type': 'string',
    'enum': [
      'clamp',
      'mirror',
      'repeated',
    ],
  };
}
