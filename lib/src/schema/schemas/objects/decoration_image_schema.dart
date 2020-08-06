import 'package:json_theme/json_theme_schemas.dart';

class DecorationImageSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/decoration_image';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'DecorationImage',
    'type': 'object',
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'centerSlice': SchemaHelper.objectSchema(RectSchema.id),
      'fit': SchemaHelper.objectSchema(BoxFitSchema.id),
      'image': SchemaHelper.objectSchema(ImageProviderSchema.id),
      'matchTextDirection': SchemaHelper.boolSchema,
      'repeat': SchemaHelper.objectSchema(ImageRepeatSchema.id),
      'scale': SchemaHelper.numberSchema,
    },
  };
}
