import 'package:json_theme/json_theme_schemas.dart';

class TabBarThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/tab_bar_theme';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TabBarTheme',
    'type': 'object',
    'properties': {
      'indicatorSize': SchemaHelper.objectSchema(TabBarIndicatorSizeSchema.id),
      'labelPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'labelColor': SchemaHelper.objectSchema(ColorSchema.id),
      'labelStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'unselectedLabelColor': SchemaHelper.objectSchema(ColorSchema.id),
      'unselectedLabelStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
