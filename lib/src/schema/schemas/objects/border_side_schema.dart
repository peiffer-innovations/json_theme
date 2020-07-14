import 'package:json_theme/json_theme_schemas.dart';

class BorderSideSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/border_side';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'BorderSideSchema',
    'additionalProperties': false,
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'style': SchemaHelper.objectSchema(BorderStyleSchema.id),
      'width': SchemaHelper.numberSchema,
    },
  };
}
