import 'package:json_theme/json_theme_schemas.dart';

class SliderInteractionSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/slider_interaction.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/SliderInteraction.html',
    'type': 'string',
    'title': 'SliderInteraction',
    'oneOf': SchemaHelper.enumSchema([
      'slideOnly',
      'slideThumb',
      'tapAndSlide',
      'tapOnly',
    ]),
  };
}
