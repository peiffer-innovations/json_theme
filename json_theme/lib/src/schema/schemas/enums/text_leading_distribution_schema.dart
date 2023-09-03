import 'package:json_theme/json_theme_schemas.dart';

class TextLeadingDistributionSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_leading_distribution.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/TextLeadingDistribution-class.html',
    'type': 'string',
    'title': 'TextLeadingDistribution',
    'oneOf': SchemaHelper.enumSchema([
      'even',
      'proportional',
    ]),
  };
}
