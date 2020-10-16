import 'package:json_theme/json_theme_schemas.dart';

class TextSelectionThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_selection_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'id': '$id',
    'title': 'TextSelectionThemeData',
    'additionalProperties': false,
    'properties': {
      'cursorColor': SchemaHelper.objectSchema(ColorSchema.id),
      'selectionColor': SchemaHelper.objectSchema(ColorSchema.id),
      'selectionHandleColor': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
