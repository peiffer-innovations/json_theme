part of 'theme_decoder.dart';

final _kCustomSchemas = {
  AlignmentSchema.id: AlignmentSchema.schema,
  AlignmentGeometrySchema.id: AlignmentGeometrySchema.schema,
  BorderRadiusGeometrySchema.id: BorderRadiusGeometrySchema.schema,
  BorderRadiusSchema.id: BorderRadiusSchema.schema,
  BoxBorderSchema.id: BoxBorderSchema.schema,
  ColorFilterSchema.id: ColorFilterSchema.schema,
  ColorSchema.id: ColorSchema.schema,
  EdgeInsetsDirectionalSchema.id: EdgeInsetsDirectionalSchema.schema,
  EdgeInsetsSchema.id: EdgeInsetsSchema.schema,
  EdgeInsetsGeometrySchema.id: EdgeInsetsGeometrySchema.schema,
  GradientSchema.id: GradientSchema.schema,
  IconSchema.id: IconSchema.schema,
  ImageProviderSchema.id: ImageProviderSchema.schema,
  ImageProviderObjectSchema.id: ImageProviderObjectSchema.schema,
  InlineSpanSchema.id: InlineSpanSchema.schema,
  InputBorderSchema.id: InputBorderSchema.schema,
  InteractiveInkFeatureFactorySchema.id:
      InteractiveInkFeatureFactorySchema.schema,
  MaterialColorSchema.id: MaterialColorSchema.schema,
  Matrix4Schema.id: Matrix4Schema.schema,
  MouseCursorSchema.id: MouseCursorSchema.schema,
  NoDefaultCupertinoThemeDataSchema.id:
      NoDefaultCupertinoThemeDataSchema.schema,
  NotchedShapeSchema.id: NotchedShapeSchema.schema,
  OutlinedBorderSchema.id: OutlinedBorderSchema.schema,
  PageTransitionsBuilderSchema.id: PageTransitionsBuilderSchema.schema,
  PageTransitionsThemeSchema.id: PageTransitionsThemeSchema.schema,
  RadiusSchema.id: RadiusSchema.schema,
  RangeSliderThumbShapeSchema.id: RangeSliderThumbShapeSchema.schema,
  RangeSliderTickMarkShapeSchema.id: RangeSliderTickMarkShapeSchema.schema,
  RangeSliderTrackShapeSchema.id: RangeSliderTrackShapeSchema.schema,
  RangeSliderValueIndicatorShapeSchema.id:
      RangeSliderValueIndicatorShapeSchema.schema,
  RectSchema.id: RectSchema.schema,
  ScrollBehaviorSchema.id: ScrollBehaviorSchema.schema,
  ShapeBorderSchema.id: ShapeBorderSchema.schema,
  SliderThemeDataSchema.id: SliderThemeDataSchema.schema,
  SystemUiOverlayStyleSchema.id: SystemUiOverlayStyleSchema.schema,
  TableColumnWidthSchema.id: TableColumnWidthSchema.schema,
  TextButtonThemeDataSchema.id: TextButtonThemeDataSchema.schema,
  WidgetSchema.id: WidgetSchema.schema,
  WidgetStateColorSchema.id: WidgetStateColorSchema.schema,
  WidgetStatePropertyBoolSchema.id: WidgetStatePropertyBoolSchema.schema,
  WidgetStatePropertyColorSchema.id: WidgetStatePropertyColorSchema.schema,
  WidgetStatePropertyDoubleSchema.id: WidgetStatePropertyDoubleSchema.schema,
  WidgetStatePropertyEdgeInsetsGeometrySchema.id:
      WidgetStatePropertyEdgeInsetsGeometrySchema.schema,
  WidgetStatePropertyIconSchema.id: WidgetStatePropertyIconSchema.schema,
  WidgetStatePropertyMouseCursorSchema.id:
      WidgetStatePropertyMouseCursorSchema.schema,
  WidgetStatePropertyOutlinedBorderSchema.id:
      WidgetStatePropertyOutlinedBorderSchema.schema,
  WidgetStatePropertySizeSchema.id: WidgetStatePropertySizeSchema.schema,
  WidgetStatePropertyTextStyleSchema.id:
      WidgetStatePropertyTextStyleSchema.schema,
  WidgetStatePropertyWidgetSchema.id: WidgetStatePropertyWidgetSchema.schema,
};

class AlignmentSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/alignment.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'Alignment',
    'oneOf': [
      {'type': 'string'},
      {
        'type': 'object',
        'required': ['x', 'y'],
        'properties': {
          'x': SchemaHelper.numberSchema,
          'y': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}

class AlignmentGeometrySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/alignment_geometry.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'AlignmentGeometry',
    'anyOf': [
      {
        r'$ref':
            'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/alignment.json',
      },
      {
        r'$ref':
            'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/alignment_directional.json',
      },
    ],
  };
}

class BorderRadiusGeometrySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/border_radius_geometry.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'BorderRadiusGeometry',
    'oneOf': [
      {'type': 'string'},
      {'type': 'number'},
      {
        'type': 'object',
        'oneOf': [
          {
            'required': ['radius', 'type'],
            'properties': {
              'radius': SchemaHelper.objectSchema(RadiusSchema.id),
              'type': {
                'type': 'string',
                'enum': ['all'],
              },
            },
          },
          {
            'required': ['radius', 'type'],
            'properties': {
              'radius': SchemaHelper.numberSchema,
              'type': {
                'type': 'string',
                'enum': ['circular'],
              },
            },
          },
          {
            'required': ['type'],
            'properties': {
              'left': SchemaHelper.objectSchema(RadiusSchema.id),
              'right': SchemaHelper.objectSchema(RadiusSchema.id),
              'type': {
                'type': 'string',
                'enum': ['horizontal'],
              },
            },
          },
          {
            'required': ['type'],
            'properties': {
              'bottomLeft': SchemaHelper.objectSchema(RadiusSchema.id),
              'bottomRight': SchemaHelper.objectSchema(RadiusSchema.id),
              'topLeft': SchemaHelper.objectSchema(RadiusSchema.id),
              'topRight': SchemaHelper.objectSchema(RadiusSchema.id),
              'type': {
                'type': 'string',
                'enum': ['only'],
              },
            },
          },
          {
            'required': ['type'],
            'properties': {
              'bottom': SchemaHelper.objectSchema(RadiusSchema.id),
              'top': SchemaHelper.objectSchema(RadiusSchema.id),
              'type': {
                'type': 'string',
                'enum': ['vertical'],
              },
            },
          },
        ],
      },
    ],
  };
}

class BorderRadiusSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/border_radius.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'BorderRadius',
    'oneOf': [
      {'type': 'string'},
      {'type': 'number'},
      {
        'type': 'object',
        'oneOf': [
          {
            'required': ['radius', 'type'],
            'properties': {
              'radius': SchemaHelper.objectSchema(RadiusSchema.id),
              'type': {
                'type': 'string',
                'enum': ['all'],
              },
            },
          },
          {
            'required': ['radius', 'type'],
            'properties': {
              'radius': SchemaHelper.numberSchema,
              'type': {
                'type': 'string',
                'enum': ['circular'],
              },
            },
          },
          {
            'required': ['type'],
            'properties': {
              'left': SchemaHelper.objectSchema(RadiusSchema.id),
              'right': SchemaHelper.objectSchema(RadiusSchema.id),
              'type': {
                'type': 'string',
                'enum': ['horizontal'],
              },
            },
          },
          {
            'required': ['type'],
            'properties': {
              'bottomLeft': SchemaHelper.objectSchema(RadiusSchema.id),
              'bottomRight': SchemaHelper.objectSchema(RadiusSchema.id),
              'topLeft': SchemaHelper.objectSchema(RadiusSchema.id),
              'topRight': SchemaHelper.objectSchema(RadiusSchema.id),
              'type': {
                'type': 'string',
                'enum': ['only'],
              },
            },
          },
          {
            'required': ['type'],
            'properties': {
              'bottom': SchemaHelper.objectSchema(RadiusSchema.id),
              'top': SchemaHelper.objectSchema(RadiusSchema.id),
              'type': {
                'type': 'string',
                'enum': ['vertical'],
              },
            },
          },
        ],
      },
    ],
  };
}

class BoxBorderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/box_border.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'oneOf': [
      SchemaHelper.objectSchema(BorderSideSchema.id),
      {
        'type': 'object',
        'title': 'BoxBorder',
        'additionalProperties': false,
        'properties': {
          'bottom': SchemaHelper.objectSchema(BorderSideSchema.id),
          'left': SchemaHelper.objectSchema(BorderSideSchema.id),
          'right': SchemaHelper.objectSchema(BorderSideSchema.id),
          'top': SchemaHelper.objectSchema(BorderSideSchema.id),
        },
      },
    ],
  };
}

class ColorFilterSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/color_filter.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'ColorFilter',
    'oneOf': [
      {'type': 'string'},
      {
        'type': 'object',
        'oneOf': [
          {
            'required': ['type'],
            'properties': {
              'type': {
                'type': 'string',
                'enum': ['linearToSrgbGamma', 'srgbToLinearGamma'],
              },
            },
          },
          {
            'required': ['matrix', 'type'],
            'properties': {
              'matrix': {
                'oneOf': [
                  {'type': 'string'},
                  {'type': 'array', 'items': SchemaHelper.numberSchema},
                ],
              },
              'mode': SchemaHelper.objectSchema(BlendModeSchema.id),
              'type': {
                'type': 'string',
                'enum': ['matrix'],
              },
            },
          },
          {
            'required': ['color', 'mode', 'type'],
            'properties': {
              'color': SchemaHelper.objectSchema(ColorSchema.id),
              'mode': SchemaHelper.objectSchema(BlendModeSchema.id),
              'type': {
                'type': 'string',
                'enum': ['mode'],
              },
            },
          },
        ],
      },
    ],
  };
}

class ColorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/color.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'type': 'string',
    'title': 'Color',
  };
}

class EdgeInsetsDirectionalSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/edge_insets_directional.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'EdgeInsetsDirectional',
    'oneOf': [
      {'type': 'string'},
      {'type': 'number'},
      {
        'type': 'array',
        'array': [
          {'type': 'number'},
        ],
      },
      {
        'type': 'object',
        'properties': {
          'bottom': SchemaHelper.numberSchema,
          'end': SchemaHelper.numberSchema,
          'start': SchemaHelper.numberSchema,
          'top': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}

class EdgeInsetsSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/edge_insets.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'EdgeInsets',
    'oneOf': [
      {'type': 'string'},
      {'type': 'number'},
      {
        'type': 'array',
        'array': [
          {'type': 'number'},
        ],
      },
      {
        'type': 'object',
        'properties': {
          'bottom': SchemaHelper.numberSchema,
          'left': SchemaHelper.numberSchema,
          'right': SchemaHelper.numberSchema,
          'top': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}

class EdgeInsetsGeometrySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/edge_insets_geometry.json';

  static final schema = EdgeInsetsSchema.schema;
}

class GradientSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/gradient.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'Gradient',
    'type': 'object',
    'oneOf': [
      {
        'required': ['type'],
        'properties': {
          'begin': SchemaHelper.objectSchema(AlignmentSchema.id),
          'colors': SchemaHelper.arraySchema(ColorSchema.id),
          'end': SchemaHelper.objectSchema(AlignmentSchema.id),
          'stops': {'type': 'array', 'items': SchemaHelper.numberSchema},
          'tileMode': SchemaHelper.objectSchema(TileModeSchema.id),
          'transform': SchemaHelper.objectSchema(GradientTransformSchema.id),
          'type': {
            'type': 'string',
            'enum': ['linear'],
          },
        },
      },
      {
        'required': ['type'],
        'properties': {
          'center': SchemaHelper.objectSchema(AlignmentSchema.id),
          'colors': SchemaHelper.arraySchema(ColorSchema.id),
          'focal': SchemaHelper.objectSchema(AlignmentSchema.id),
          'focalRadius': SchemaHelper.numberSchema,
          'radius': SchemaHelper.numberSchema,
          'stops': {'type': 'array', 'items': SchemaHelper.numberSchema},
          'tileMode': SchemaHelper.objectSchema(TileModeSchema.id),
          'transform': SchemaHelper.objectSchema(GradientTransformSchema.id),
          'type': {
            'type': 'string',
            'enum': ['radial'],
          },
        },
      },
      {
        'required': ['type'],
        'properties': {
          'center': SchemaHelper.objectSchema(AlignmentSchema.id),
          'colors': SchemaHelper.arraySchema(ColorSchema.id),
          'endAngle': SchemaHelper.numberSchema,
          'startAngle': SchemaHelper.numberSchema,
          'stops': {'type': 'array', 'items': SchemaHelper.numberSchema},
          'tileMode': SchemaHelper.objectSchema(TileModeSchema.id),
          'transform': SchemaHelper.objectSchema(GradientTransformSchema.id),
          'type': {
            'type': 'string',
            'enum': ['sweep'],
          },
        },
      },
    ],
  };
}

class IconSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/icon.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'type': 'object',
    'title': 'Icon',
    'additionalProperties': false,
    'required': ['icon'],
    'properties': {
      'applyTextScaling': SchemaHelper.boolSchema,
      'blendMode': SchemaHelper.objectSchema(BlendModeSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'fill': SchemaHelper.numberSchema,
      'grade': SchemaHelper.numberSchema,
      'icon': SchemaHelper.objectSchema(IconDataSchema.id),
      'opticalSize': SchemaHelper.numberSchema,
      'semanticLabel': SchemaHelper.stringSchema,
      'shadows': SchemaHelper.arraySchema(ShadowSchema.id),
      'size': SchemaHelper.numberSchema,
      'textDirection': SchemaHelper.objectSchema(TextDirectionSchema.id),
      'weight': SchemaHelper.numberSchema,
    },
  };
}

class ImageProviderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/image_provider.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/ImageProvider-class.html',
    'title': 'ImageProvider',
    'type': 'object',
    'additionalProperties': false,
    'required': ['type'],
    'properties': {
      'assetName': SchemaHelper.stringSchema,
      'bytes': SchemaHelper.stringSchema,
      'headers': SchemaHelper.anySchema,
      'package': SchemaHelper.stringSchema,
      'scale': SchemaHelper.numberSchema,
      'url': SchemaHelper.stringSchema,
      'type': {
        'type': 'string',
        'enum': ['asset', 'memory', 'network'],
      },
    },
  };
}

class ImageProviderObjectSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/image_provider_object.json';

  static final schema = ImageProviderSchema.schema;
}

class InlineSpanSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/inline_span.json';

  static final schema = TextSpanSchema.schema;
}

class InputBorderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/input_border.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/InputBorder-class.html',
    'title': 'InputBorder',
    'type': 'object',
    'required': ['type'],
    'properties': {
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'borderSide': SchemaHelper.objectSchema(BorderSideSchema.id),
      'gapPadding': SchemaHelper.numberSchema,
      'type': {
        'type': 'string',
        'enum': ['outline', 'underline'],
      },
    },
  };
}

class InteractiveInkFeatureFactorySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/interactive_ink_feature_factory.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/InteractiveInkFeatureFactory-class.html',
    'type': 'string',
    'title': 'InteractiveInkFeatureFactory',
    'oneOf': SchemaHelper.enumSchema(['splash', 'ripple', 'sparkle']),
  };
}

class MaterialColorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/material_color.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'MaterialColor',
    'type': 'object',
    'required': ['primary', 'swatches'],
    'properties': {
      'primary': SchemaHelper.objectSchema(ColorSchema.id),
      'swatches': {
        'type': 'object',
        'properties': {
          '50': SchemaHelper.objectSchema(ColorSchema.id),
          '100': SchemaHelper.objectSchema(ColorSchema.id),
          '200': SchemaHelper.objectSchema(ColorSchema.id),
          '300': SchemaHelper.objectSchema(ColorSchema.id),
          '400': SchemaHelper.objectSchema(ColorSchema.id),
          '500': SchemaHelper.objectSchema(ColorSchema.id),
          '600': SchemaHelper.objectSchema(ColorSchema.id),
          '700': SchemaHelper.objectSchema(ColorSchema.id),
          '800': SchemaHelper.objectSchema(ColorSchema.id),
          '900': SchemaHelper.objectSchema(ColorSchema.id),
        },
      },
      'leadingPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
    },
  };
}

class Matrix4Schema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/matrix4.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'Matrix4',
    'type': 'array',
    'items': SchemaHelper.numberSchema,
  };
}

class MouseCursorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/mouse_cursor.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'MouseCursor',
    'type': 'object',
    'required': ['type'],
    'properties': {
      'cursor': {
        'type': 'string',
        'enum': [
          'alias',
          'allScroll',
          'basic',
          'cell',
          'click',
          'clickable',
          'contextMenu',
          'copy',
          'disappearing',
          'forbidden',
          'grab',
          'grabbing',
          'help',
          'move',
          'noDrop',
          'none',
          'precise',
          'progress',
          'resizeColumn',
          'resizeDown',
          'resizeDownLeft',
          'resizeDownRight',
          'resizeLeft',
          'resizeLeftRight',
          'resizeRight',
          'resizeRow',
          'resizeUp',
          'resizeUpDown',
          'resizeUpLeft',
          'resizeUpLeftDownRight',
          'resizeUpRight',
          'resizeUpRightDownLeft',
          'textable',
          'text',
          'verticalText',
          'wait',
          'zoomIn',
          'zoomOut',
        ],
      },
      'type': {
        'type': 'string',
        'enum': ['defer', 'material', 'system', 'uncontrolled'],
      },
    },
  };
}

class NoDefaultCupertinoThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/no_default_cupertino_theme_data.json';

  static final schema = CupertinoThemeDataSchema.schema;
}

class NotchedShapeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/notched_shape.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/NotchedShape-class.html',
    'title': 'NotchedShape',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema(['circular']),
  };
}

class OutlinedBorderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/outlined_border.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/OutlinedBorder-class.html',
    'title': 'OutlinedBorder',
    'type': 'object',
    'properties': {
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'borderSide': SchemaHelper.objectSchema(BorderSideSchema.id),
      'type': {
        'type': 'string',
        'enum': ['beveled', 'circle', 'rectangle', 'rounded', 'stadium'],
      },
    },
  };
}

class PageTransitionsBuilderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/page_transitions_builder.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/PageTransitionsBuilder-class.html',
    'title': 'PageTransitionsBuilder',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'cupertino',
      'fadeUpwards',
      'openUpwards',
      'zoom',
    ]),
  };
}

class PageTransitionsThemeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/page_transitions_theme.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/PageTransitionsTheme-class.html',
    'title': 'PageTransitionsTheme',
    'type': 'object',
    'properties': {'builders': SchemaHelper.anySchema},
  };
}

class RadiusSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/radius.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'Radius',
    'oneOf': [
      SchemaHelper.numberSchema,
      {
        'type': 'object',
        'additionalProperties': false,
        'required': ['radius', 'type'],
        'properties': {
          'radius': SchemaHelper.numberSchema,
          'type': {
            'type': 'string',
            'enum': ['circular'],
          },
        },
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'required': ['x', 'y', 'type'],
        'properties': {
          'x': SchemaHelper.numberSchema,
          'y': SchemaHelper.numberSchema,
          'type': {
            'type': 'string',
            'enum': ['elliptical'],
          },
        },
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'required': ['type'],
        'properties': {
          'type': {
            'type': 'string',
            'enum': ['zero'],
          },
        },
      },
    ],
  };
}

class RangeSliderThumbShapeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/range_slider_thumb_shape.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/RangeSliderThumbShape-class.html',
    'title': 'RangeSliderThumbShape',
    'type': 'object',
    'properties': {
      'disabledThumbRadius': SchemaHelper.numberSchema,
      'elevation': SchemaHelper.numberSchema,
      'enabledThumbRadius': SchemaHelper.numberSchema,
      'pressedElevation': SchemaHelper.numberSchema,
      'type': {
        'type': 'string',
        'enum': ['round'],
      },
    },
  };
}

class RangeSliderTickMarkShapeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/range_slider_tick_mark_shape.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'RangeSliderTickMarkShape',
    'type': 'object',
    'properties': {
      'tickMarkRadius': SchemaHelper.numberSchema,
      'type': {
        'type': 'string',
        'enum': ['round'],
      },
    },
  };
}

class RangeSliderTrackShapeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/range_slider_track_shape.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'RangeSliderTrackShape',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema(['rectangular', 'rounded']),
  };
}

class RangeSliderValueIndicatorShapeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/range_slider_value_indicator_shape.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/RangeSliderValueIndicatorShape-class.html',
    'title': 'RangeSliderValueIndicatorShape',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema(['paddle', 'rectangular']),
  };
}

class RectSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/rect.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'Rect',
    'type': 'object',
    'oneOf': [
      {
        'required': ['center', 'height', 'width', 'type'],
        'properties': {
          'center': {
            'type': 'object',
            'required': ['dx', 'dy'],
            'additionaProperties': false,
            'properties': {
              'dx': SchemaHelper.numberSchema,
              'dy': SchemaHelper.numberSchema,
            },
          },
          'height': SchemaHelper.numberSchema,
          'width': SchemaHelper.numberSchema,
          'type': {
            'type': 'string',
            'enum': ['center'],
          },
        },
      },
      {
        'required': ['center', 'radius', 'type'],
        'properties': {
          'center': {
            'type': 'object',
            'additionalProperties': false,
            'required': ['dx', 'dy'],
            'properties': {
              'dx': SchemaHelper.numberSchema,
              'dy': SchemaHelper.numberSchema,
            },
          },
          'type': {
            'type': 'string',
            'enum': ['circle'],
          },
        },
      },
      {
        'required': ['type'],
        'properties': {
          'type': {
            'type': 'string',
            'enum': ['largest'],
          },
        },
      },
      {
        'required': ['bottom', 'left', 'right', 'top', 'type'],
        'properties': {
          'bottom': SchemaHelper.numberSchema,
          'left': SchemaHelper.numberSchema,
          'right': SchemaHelper.numberSchema,
          'top': SchemaHelper.numberSchema,
          'type': {
            'type': 'string',
            'enum': ['ltrb'],
          },
        },
      },
      {
        'required': ['height', 'left', 'top', 'width', 'type'],
        'properties': {
          'height': SchemaHelper.numberSchema,
          'left': SchemaHelper.numberSchema,
          'top': SchemaHelper.numberSchema,
          'width': SchemaHelper.numberSchema,
          'type': {
            'type': 'string',
            'enum': ['ltwh'],
          },
        },
      },
      {
        'required': ['a', 'b', 'type'],
        'properties': {
          'a': {
            'type': 'object',
            'additionalProperties': false,
            'required': ['dx', 'dy'],
            'properties': {
              'dx': SchemaHelper.numberSchema,
              'dy': SchemaHelper.numberSchema,
            },
          },
          'b': {
            'type': 'object',
            'additionalProperties': false,
            'required': ['dx', 'dy'],
            'properties': {
              'dx': SchemaHelper.numberSchema,
              'dy': SchemaHelper.numberSchema,
            },
          },
          'type': {
            'type': 'string',
            'enum': ['points'],
          },
        },
      },
      {
        'required': ['type'],
        'properties': {
          'type': {
            'type': 'string',
            'enum': ['zero'],
          },
        },
      },
    ],
  };
}

class ScrollBehaviorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/scroll_behavior.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'ScrollBehavior',
    'type': 'object',
    'properties': {},
  };
}

class ScrollPhysicsSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/scroll_physics.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'ScrollPhysics',
    'type': 'object',
    'properties': {
      'parent': SchemaHelper.objectSchema(id),
      'type': {
        'type': 'string',
        'enum': [
          'always',
          'bouncing',
          'clamping',
          'fixedExtent',
          'never',
          'page',
          'rangeMaintaining',
        ],
      },
    },
  };
}

class ShapeBorderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/shape_border.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'ShapeBorder',
    'type': 'object',
    'properties': {
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'borderSide': SchemaHelper.objectSchema(BorderSideSchema.id),
      'type': {
        'type': 'string',
        'enum': ['circle', 'rectangle', 'rounded', 'stadium'],
      },
    },
  };
}

class SliderTrackShapeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/slider_track_shape.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'SliderTrackShape',
    'type': 'object',
    'required': ['type'],
    'properties': {
      'type': {
        'type': 'string',
        'enum': ['rectangular', 'rounded'],
      },
    },
  };
}

class SystemUiOverlayStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/system_ui_overlay_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'SystemUiOverlayStyle',
    'oneOf': [
      ...SchemaHelper.enumSchema(['dark', 'light']),
      {
        'type': 'object',
        'properties': {
          'statusBarBrightness': SchemaHelper.objectSchema(BrightnessSchema.id),
          'statusBarColor': SchemaHelper.objectSchema(ColorSchema.id),
          'statusBarIconBrightness': SchemaHelper.objectSchema(
            BrightnessSchema.id,
          ),
          'systemNavigationBarColor': SchemaHelper.objectSchema(ColorSchema.id),
          'systemNavigationBarContrastEnforced': SchemaHelper.boolSchema,
          'systemNavigationBarDividerColor': SchemaHelper.objectSchema(
            ColorSchema.id,
          ),
          'systemNavigationBarIconBrightness': SchemaHelper.objectSchema(
            BrightnessSchema.id,
          ),
          'systemStatusBarContrastEnforced': SchemaHelper.boolSchema,
        },
      },
    ],
  };
}

class TableColumnWidthSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/table_column_width.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'type': 'object',
    'title': 'TableColumnWidth',
    'additionalProperties': false,
    'required': ['type'],
    'properties': {
      'a': SchemaHelper.objectSchema(TableColumnWidthSchema.id),
      'b': SchemaHelper.objectSchema(TableColumnWidthSchema.id),
      'type': {
        'type': 'string',
        'enum': ['fixed', 'flex', 'fraction', 'intrinsic', 'max', 'min'],
      },
      'value': SchemaHelper.numberSchema,
    },
  };
}

class TextButtonThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_button_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/TextButtonThemeData-class.html',
    'title': 'TextButtonThemeData',
    'additionalProperties': false,
    'properties': {'style': SchemaHelper.objectSchema(ButtonStyleSchema.id)},
  };
}

class WidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget.json';

  static final schema = IconSchema.schema;
}

class WidgetStateColorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_color.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStateColor',
    'anyOf': [
      {'type': 'string'},
      {
        'type': 'object',
        'properties': {
          'disabled': SchemaHelper.objectSchema(ColorSchema.id),
          'dragged': SchemaHelper.objectSchema(ColorSchema.id),
          'empty': SchemaHelper.objectSchema(ColorSchema.id),
          'error': SchemaHelper.objectSchema(ColorSchema.id),
          'focused': SchemaHelper.objectSchema(ColorSchema.id),
          'hovered': SchemaHelper.objectSchema(ColorSchema.id),
          'pressed': SchemaHelper.objectSchema(ColorSchema.id),
          'scrolledUnder': SchemaHelper.objectSchema(ColorSchema.id),
          'selected': SchemaHelper.objectSchema(ColorSchema.id),
        },
      },
    ],
  };
}

class WidgetStatePropertyBoolSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_bool.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.boolSchema,
      'dragged': SchemaHelper.boolSchema,
      'empty': SchemaHelper.boolSchema,
      'error': SchemaHelper.boolSchema,
      'focused': SchemaHelper.boolSchema,
      'hovered': SchemaHelper.boolSchema,
      'pressed': SchemaHelper.boolSchema,
      'scrolledUnder': SchemaHelper.boolSchema,
      'selected': SchemaHelper.boolSchema,
    },
  };
}

class WidgetStatePropertyBorderSideSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_border_side.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertyBorderSide',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(BorderSideSchema.id),
      'dragged': SchemaHelper.objectSchema(BorderSideSchema.id),
      'empty': SchemaHelper.objectSchema(BorderSideSchema.id),
      'error': SchemaHelper.objectSchema(BorderSideSchema.id),
      'focused': SchemaHelper.objectSchema(BorderSideSchema.id),
      'hovered': SchemaHelper.objectSchema(BorderSideSchema.id),
      'pressed': SchemaHelper.objectSchema(BorderSideSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(BorderSideSchema.id),
      'selected': SchemaHelper.objectSchema(BorderSideSchema.id),
    },
  };
}

class WidgetStatePropertyColorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_color.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertyColor',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(ColorSchema.id),
      'dragged': SchemaHelper.objectSchema(ColorSchema.id),
      'empty': SchemaHelper.objectSchema(ColorSchema.id),
      'error': SchemaHelper.objectSchema(ColorSchema.id),
      'focused': SchemaHelper.objectSchema(ColorSchema.id),
      'hovered': SchemaHelper.objectSchema(ColorSchema.id),
      'pressed': SchemaHelper.objectSchema(ColorSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(ColorSchema.id),
      'selected': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}

class WidgetStatePropertyDoubleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_double.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertyDouble',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.numberSchema,
      'dragged': SchemaHelper.numberSchema,
      'empty': SchemaHelper.numberSchema,
      'error': SchemaHelper.numberSchema,
      'focused': SchemaHelper.numberSchema,
      'hovered': SchemaHelper.numberSchema,
      'pressed': SchemaHelper.numberSchema,
      'scrolledUnder': SchemaHelper.numberSchema,
      'selected': SchemaHelper.numberSchema,
    },
  };
}

class WidgetStatePropertyEdgeInsetsGeometrySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_edge_insets_geometry.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertyEdgeInsetsGeometry',
    'oneOf': [
      {'type': 'string'},
      {'type': 'number'},
      {
        'type': 'array',
        'array': [
          {'type': 'number'},
        ],
      },
      {
        'type': 'object',
        'properties': {
          'disabled': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'dragged': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'empty': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'error': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'focused': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'hovered': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'pressed': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'scrolledUnder': SchemaHelper.objectSchema(
            EdgeInsetsGeometrySchema.id,
          ),
          'selected': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
        },
      },
    ],
  };
}

class WidgetStatePropertyIconSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_icon.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertyIcon',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(IconSchema.id),
      'dragged': SchemaHelper.objectSchema(IconSchema.id),
      'empty': SchemaHelper.objectSchema(IconSchema.id),
      'error': SchemaHelper.objectSchema(IconSchema.id),
      'focused': SchemaHelper.objectSchema(IconSchema.id),
      'hovered': SchemaHelper.objectSchema(IconSchema.id),
      'pressed': SchemaHelper.objectSchema(IconSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(IconSchema.id),
      'selected': SchemaHelper.objectSchema(IconSchema.id),
    },
  };
}

class WidgetStatePropertyIconThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_icon_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertyIconThemeData',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'dragged': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'empty': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'error': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'focused': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'hovered': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'pressed': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'selected': SchemaHelper.objectSchema(IconThemeDataSchema.id),
    },
  };
}

class WidgetStatePropertyMouseCursorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_mouse_cursor.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertyMouseCursorSchema',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'dragged': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'empty': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'error': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'focused': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'hovered': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'pressed': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'selected': SchemaHelper.objectSchema(MouseCursorSchema.id),
    },
  };
}

class WidgetStatePropertyOutlinedBorderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_outlined_border.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertyOutlinedBorder',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'dragged': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'empty': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'error': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'focused': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'hovered': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'pressed': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'selected': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
    },
  };
}

class WidgetStatePropertySizeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_size.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertySize',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(SizeSchema.id),
      'dragged': SchemaHelper.objectSchema(SizeSchema.id),
      'empty': SchemaHelper.objectSchema(SizeSchema.id),
      'error': SchemaHelper.objectSchema(SizeSchema.id),
      'focused': SchemaHelper.objectSchema(SizeSchema.id),
      'hovered': SchemaHelper.objectSchema(SizeSchema.id),
      'pressed': SchemaHelper.objectSchema(SizeSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(SizeSchema.id),
      'selected': SchemaHelper.objectSchema(SizeSchema.id),
    },
  };
}

class WidgetStatePropertyTextStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_text_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertyTextStyle',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(TextStyleSchema.id),
      'dragged': SchemaHelper.objectSchema(TextStyleSchema.id),
      'empty': SchemaHelper.objectSchema(TextStyleSchema.id),
      'error': SchemaHelper.objectSchema(TextStyleSchema.id),
      'focused': SchemaHelper.objectSchema(TextStyleSchema.id),
      'hovered': SchemaHelper.objectSchema(TextStyleSchema.id),
      'pressed': SchemaHelper.objectSchema(TextStyleSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(TextStyleSchema.id),
      'selected': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}

class WidgetStatePropertyWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_widget.json';

  static final schema = WidgetStatePropertyIconSchema.schema;
}
