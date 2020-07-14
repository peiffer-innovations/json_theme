import 'package:json_theme/json_theme_schemas.dart';

class SchemaHelper {
  static Map<String, List<Map<String, dynamic>>> get anySchema => {
        'oneOf': [
          {
            'type': 'string',
          },
          {
            'type': 'number',
          },
          {
            'type': 'boolean',
          },
          {
            'type': 'object',
            'additionalProperties': true,
          },
          {
            'type': 'array',
            'items': {
              'type': 'string',
            },
          },
          {
            'type': 'array',
            'items': {
              'type': 'number',
            },
          },
          {
            'type': 'array',
            'items': {
              'type': 'boolean',
            },
          },
          {
            'type': 'array',
            'items': {
              'type': 'object',
              'additionalProperties': true,
            },
          },
        ],
      };

  static Map<String, List<Map<String, dynamic>>> get boolSchema => {
        'oneOf': [
          {
            'type': 'string',
          },
          {
            'type': 'number',
          },
          {
            'type': 'boolean',
          },
        ],
      };

  static Map<String, List<Map<String, dynamic>>> get numberSchema => {
        'oneOf': [
          {
            'type': 'string',
          },
          {
            'type': 'number',
          },
        ],
      };

  static Map<String, dynamic> get stringSchema => {
        'type': 'string',
      };

  static dynamic arraySchema(String id) {
    dynamic result;

    if (Enums.all.contains(id) || ColorSchema.id == id) {
      result = {
        'type': 'array',
        'items': {
          r'$ref': id,
        },
      };
    } else {
      result = {
        'oneOf': [
          {
            'type': 'string',
          },
          {
            'type': 'array',
            'items': {
              r'$ref': id,
            },
          },
        ],
      };
    }

    return result;
  }

  static dynamic objectSchema(String id) {
    dynamic result;

    if (Enums.all.contains(id) || ColorSchema.id == id) {
      result = {
        r'$ref': id,
      };
    } else {
      result = {
        'oneOf': [
          {
            'type': 'string',
          },
          {
            r'$ref': id,
          },
        ],
      };
    }

    return result;
  }
}
