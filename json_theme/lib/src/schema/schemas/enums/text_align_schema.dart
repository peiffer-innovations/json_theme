import 'package:json_theme/json_theme_schemas.dart';

class TextAlignSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_align.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Text/textAlign.html',
    'title': 'TextAlign',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'center',
      'end',
      'justify',
      'left',
      'right',
      'start',
    ]),
  };
}
