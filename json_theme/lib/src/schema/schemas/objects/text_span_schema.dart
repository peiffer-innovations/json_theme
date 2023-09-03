import 'package:json_theme/json_theme_schemas.dart';

class TextSpanSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_span.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/painting/TextSpan-class.html',
    'type': 'object',
    'title': 'TextSpan',
    'additionalProperties': false,
    'properties': {
      'children': SchemaHelper.arraySchema(TextSpanSchema.id),
      'locale': SchemaHelper.objectSchema(LocaleSchema.id),
      'mouseCursor': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'onEnter': SchemaHelper.stringSchema,
      'onExit': SchemaHelper.stringSchema,
      'semanticsLabel': SchemaHelper.stringSchema,
      'spellOut': SchemaHelper.boolSchema,
      'style': SchemaHelper.objectSchema(TextStyleSchema.id),
      'text': SchemaHelper.stringSchema,
    },
  };
}
