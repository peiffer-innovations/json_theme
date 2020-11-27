import 'package:json_theme/json_theme_schemas.dart';

class ClipSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/clip.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/ClipRect-class.html',
    'type': 'string',
    'title': 'Clip',
    'oneOf': SchemaHelper.enumSchema([
      'antiAlias',
      'antiAliasWithSaveLayer',
      'hardEdge',
      'none',
    ]),
  };
}
