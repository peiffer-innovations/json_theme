import 'dart:convert';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:json_class/json_class.dart';
import 'package:json_theme_annotation/json_theme_annotation.dart';

import '../model/map_material_state_property.dart';
import '../schema/schema_validator.dart';

/// Decoder capable of converting JSON compatible values into Flutter Theme
/// related classes and enums.
///
/// All decoder functions, in addition the the type that can be decoded, will
/// accept a value of the returned type and return it unmodified.  However, when
/// mixing JSON compatible values and concrete values, you must disable the JSON
/// Schema validator as it will not be able to validate concrete instances.
///
/// Unless otherwise stated, each function will return `null` when given an
/// input of `null`.
@immutable
@JsonThemeCodec('decode')
class ThemeDecoder {
  const ThemeDecoder._();

  static const _baseSchemaUrl =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme';

  /// Decodes the given [value] to an [Alignment].  If the given value is a
  /// `Map` then this expects the following JSON structure:
  /// ```json
  /// {
  ///   "x": "<double>",
  ///   "y": "<double>"
  /// }
  /// ```
  ///
  /// If the value is a `String` then supported values are:
  ///  * `bottomCenter`
  ///  * `bottomLeft`
  ///  * `bottomRight`
  ///  * `center`
  ///  * `centerLeft`
  ///  * `centerRight`
  ///  * `topCenter`
  ///  * `topLeft`
  ///  * `topRight`
  static Alignment? decodeAlignment(
    dynamic value, {
    bool validate = true,
  }) {
    Alignment? result;

    if (value is Alignment) {
      result = value;
    } else if (value is Map) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/alignment',
        value: value,
        validate: validate,
      ));

      result = Alignment(
        JsonClass.maybeParseDouble(value['x']) ?? 0.0,
        JsonClass.maybeParseDouble(value['y']) ?? 0.0,
      );
    } else {
      _checkSupported(
        'Alignment',
        [
          'bottomCenter',
          'bottomLeft',
          'bottomRight',
          'center',
          'centerLeft',
          'centerRight',
          'topCenter',
          'topLeft',
          'topRight',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/alignment',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'bottomCenter':
            result = Alignment.bottomCenter;
            break;
          case 'bottomLeft':
            result = Alignment.bottomLeft;
            break;
          case 'bottomRight':
            result = Alignment.bottomRight;
            break;
          case 'center':
            result = Alignment.center;
            break;
          case 'centerLeft':
            result = Alignment.centerLeft;
            break;
          case 'centerRight':
            result = Alignment.centerRight;
            break;
          case 'topCenter':
            result = Alignment.topCenter;
            break;
          case 'topLeft':
            result = Alignment.topLeft;
            break;
          case 'topRight':
            result = Alignment.topRight;
            break;
        }
      }
    }
    return result;
  }

  /// Decodes the given [value] to an [AlignmentDirectional].  The supported
  /// values are:
  ///  * `bottomCenter`
  ///  * `bottomEnd`
  ///  * `bottomStart`
  ///  * `center`
  ///  * `centerEnd`
  ///  * `centerStart`
  ///  * `topCenter`
  ///  * `topEnd`
  ///  * `topStart`
  static AlignmentDirectional? decodeAlignmentDirectional(
    dynamic value, {
    bool validate = true,
  }) {
    AlignmentDirectional? result;

    if (value is AlignmentDirectional) {
      result = value;
    } else {
      _checkSupported(
        'AlignmentDirectional',
        [
          'bottomCenter',
          'bottomEnd',
          'bottomStart',
          'center',
          'centerEnd',
          'centerStart',
          'topCenter',
          'topEnd',
          'topStart',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/alignment_directional',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'bottomCenter':
            result = AlignmentDirectional.bottomCenter;
            break;
          case 'bottomEnd':
            result = AlignmentDirectional.bottomEnd;
            break;
          case 'bottomStart':
            result = AlignmentDirectional.bottomStart;
            break;
          case 'center':
            result = AlignmentDirectional.center;
            break;
          case 'centerEnd':
            result = AlignmentDirectional.centerEnd;
            break;
          case 'centerStart':
            result = AlignmentDirectional.centerStart;
            break;
          case 'topCenter':
            result = AlignmentDirectional.topCenter;
            break;
          case 'topEnd':
            result = AlignmentDirectional.topEnd;
            break;
          case 'topStart':
            result = AlignmentDirectional.topStart;
            break;
        }
      }
    }
    return result;
  }

  /// Decodes the given [value] to an [AlignmentGeometry].  The supported
  /// values are:
  ///  * `bottomCenter`
  ///  * `bottomEnd`
  ///  * `bottomLeft`
  ///  * `bottomRight`
  ///  * `bottomStart`
  ///  * `center`
  ///  * `centerEnd`
  ///  * `centerLeft`
  ///  * `centerRight`
  ///  * `centerStart`
  ///  * `topCenter`
  ///  * `topEnd`
  ///  * `topLeft`
  ///  * `topRight`
  ///  * `topStart`
  static AlignmentGeometry? decodeAlignmentGeometry(
    dynamic value, {
    bool validate = true,
  }) {
    AlignmentGeometry? result;

    if (value is AlignmentGeometry) {
      result = value;
    } else if (value is Map) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/alignment',
        value: value,
        validate: validate,
      ));

      result = Alignment(
        JsonClass.maybeParseDouble(value['x']) ?? 0.0,
        JsonClass.maybeParseDouble(value['y']) ?? 0.0,
      );
    } else if (value != null) {
      _checkSupported(
        'Alignment',
        [
          'bottomCenter',
          'bottomEnd',
          'bottomLeft',
          'bottomRight',
          'bottomStart',
          'center',
          'centerEnd',
          'centerLeft',
          'centerRight',
          'centerStart',
          'topCenter',
          'topEnd',
          'topLeft',
          'topRight',
          'topStart',
        ],
        value,
      );

      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/alignment_geometry',
        value: value,
        validate: validate,
      ));
      switch (value) {
        case 'bottomCenter':
          result = Alignment.bottomCenter;
          break;
        case 'bottomEnd':
          result = AlignmentDirectional.bottomEnd;
          break;
        case 'bottomLeft':
          result = Alignment.bottomLeft;
          break;
        case 'bottomRight':
          result = Alignment.bottomRight;
          break;
        case 'bottomStart':
          result = AlignmentDirectional.bottomStart;
          break;
        case 'center':
          result = AlignmentDirectional.center;
          break;
        case 'centerEnd':
          result = AlignmentDirectional.centerEnd;
          break;
        case 'centerLeft':
          result = Alignment.centerLeft;
          break;
        case 'centerRight':
          result = Alignment.centerRight;
          break;
        case 'centerStart':
          result = AlignmentDirectional.centerStart;
          break;
        case 'topCenter':
          result = AlignmentDirectional.topCenter;
          break;
        case 'topEnd':
          result = AlignmentDirectional.topEnd;
          break;
        case 'topLeft':
          result = Alignment.topLeft;
          break;
        case 'topRight':
          result = Alignment.topRight;
          break;
        case 'topStart':
          result = AlignmentDirectional.topStart;
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [AndroidOverscrollIndicator].  Supported
  /// values are:
  /// * `glow`
  /// * `stretch`
  static AndroidOverscrollIndicator? decodeAndroidOverscrollIndicator(
    dynamic value, {
    bool validate = true,
  }) {
    AndroidOverscrollIndicator? result;

    if (value is AndroidOverscrollIndicator) {
      result = value;
    } else if (value != null) {
      _checkSupported(
        'AndroidOverscrollIndicator',
        [
          'glow',
          'stretch',
        ],
        value,
      );

      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/android_overscroll_indicator',
        value: value,
        validate: validate,
      ));

      switch (value) {
        case 'glow':
          result = AndroidOverscrollIndicator.glow;
          break;

        case 'stretch':
          result = AndroidOverscrollIndicator.stretch;
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [AppBarTheme].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "actionsIconTheme": "<IconThemeData>",
  ///   "backgroundColor": "<Color>",
  ///   "centerTitle": "<bool>",
  ///   "elevation": "<double>",
  ///   "foregroundColor": "<Color>",
  ///   "iconTheme": "<IconThemeData>",
  ///   "scrolledUnderElevation": "<double>",
  ///   "shadowColor": "<Color>",
  ///   "surfaceTintColor": "<Color>",
  ///   "systemOverlayStyle": "<SystemUiOverlayStyle>",
  ///   "titleSpacing": "<double>",
  ///   "titleTextStyle": "<TextStyle>",
  ///   "toolbarHeight": "<double>",
  ///   "toolbarTextStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBrightness]
  ///  * [decodeColor]
  ///  * [decodeIconThemeData]
  ///  * [decodeSystemUiOverlayStyle]
  ///  * [decodeTextStyle]
  static AppBarTheme? decodeAppBarTheme(
    dynamic value, {
    bool validate = true,
  }) {
    AppBarTheme? result;

    if (value is AppBarTheme) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/app_bar_theme',
        value: value,
        validate: validate,
      ));
      result = AppBarTheme(
        actionsIconTheme: decodeIconThemeData(
          value['actionsIconTheme'],
          validate: false,
        ),
        backgroundColor: decodeColor(
          value['backgroundColor'] ?? value['color'],
          validate: false,
        ),
        centerTitle: JsonClass.maybeParseBool(value['centerTitle']),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        foregroundColor: decodeColor(
          value['foregroundColor'],
          validate: false,
        ),
        iconTheme: decodeIconThemeData(
          value['iconTheme'],
          validate: false,
        ),
        scrolledUnderElevation: JsonClass.maybeParseDouble(
          value['scrolledUnderElevation'],
        ),
        shape: ThemeDecoder.decodeShapeBorder(
          value['shape'],
          validate: false,
        ),
        shadowColor: decodeColor(
          value['shadowColor'],
          validate: false,
        ),
        systemOverlayStyle: decodeSystemUiOverlayStyle(
          value['systemOverlayStyle'],
          validate: false,
        ),
        surfaceTintColor: decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
        titleSpacing: JsonClass.maybeParseDouble(value['titleSpacing']),
        titleTextStyle: decodeTextStyle(
          value['titleTextStyle'],
          validate: false,
        ),
        toolbarHeight: JsonClass.maybeParseDouble(value['toolbarHeight']),
        toolbarTextStyle: decodeTextStyle(
          value['toolbarTextStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [AutovalidateMode].  Supported values are:
  /// * `always`
  /// * `disabled`
  /// * `onUserInteraction`
  static AutovalidateMode? decodeAutovalidateMode(
    dynamic value, {
    bool validate = true,
  }) {
    AutovalidateMode? result;

    if (value is AutovalidateMode) {
      result = value;
    } else {
      _checkSupported(
        'AutovalidateMode',
        [
          'always',
          'disabled',
          'onUserInteraction',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/autovalidate_mode',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'always':
            result = AutovalidateMode.always;
            break;
          case 'disabled':
            result = AutovalidateMode.disabled;
            break;
          case 'onUserInteraction':
            result = AutovalidateMode.onUserInteraction;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [Axis].  Supported values are:
  ///  * `horizontal`
  ///  * `vertical`
  static Axis? decodeAxis(
    dynamic value, {
    bool validate = true,
  }) {
    Axis? result;
    if (value is Axis) {
      result = value;
    } else {
      _checkSupported(
        'Axis',
        [
          'horizontal',
          'vertical',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/axis',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'horizontal':
            result = Axis.horizontal;
            break;
          case 'vertical':
            result = Axis.vertical;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [BadgeThemeData].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "alignment": "<AlignmentGeometry>",
  ///   "backgroundColor": "<Color>",
  ///   "largeSize": "<double>",
  ///   "offset": "<Offset>",
  ///   "padding": "<EdgeInsets>",
  ///   "smallSize": "<double>",
  ///   "textColor": "<Color>",
  ///   "textStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeAlignmentGeometry]
  ///  * [decodeColor]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeOffset]
  ///  * [decodeTextStyle]
  static BadgeThemeData? decodeBadgeThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    BadgeThemeData? result;

    if (value is BadgeThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/badge_theme_data',
        value: value,
        validate: validate,
      ));
      result = BadgeThemeData(
        alignment: decodeAlignmentGeometry(
          value['alignment'],
          validate: false,
        ),
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        largeSize: JsonClass.maybeParseDouble(value['largeSize']),
        offset: decodeOffset(
          value['offset'],
          validate: false,
        ),
        padding: decodeEdgeInsetsGeometry(
          value['padding'],
          validate: false,
        ),
        smallSize: JsonClass.maybeParseDouble(value['smallSize']),
        textColor: decodeColor(
          value['textColor'],
          validate: false,
        ),
        textStyle: decodeTextStyle(
          value['textStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [BlendMode].  Supported values are:
  /// * `clear`
  /// * `color`
  /// * `colorBurn`
  /// * `colorDodge`
  /// * `darken`
  /// * `difference`
  /// * `dst`
  /// * `dstATop`
  /// * `dstIn`
  /// * `dstOut`
  /// * `dstOver`
  /// * `exclusion`
  /// * `hardLight`
  /// * `hue`
  /// * `lighten`
  /// * `luminosity`
  /// * `modulate`
  /// * `multiply`
  /// * `overlay`
  /// * `plus`
  /// * `saturation`
  /// * `screen`
  /// * `softLight`
  /// * `src`
  /// * `srcATop`
  /// * `srcIn`
  /// * `srcOut`
  /// * `srcOver`
  /// * `xor`
  static BlendMode? decodeBlendMode(
    dynamic value, {
    bool validate = true,
  }) {
    BlendMode? result;

    if (value is BlendMode) {
      result = value;
    } else {
      _checkSupported(
        'BlendMode',
        [
          'clear',
          'color',
          'colorBurn',
          'colorDodge',
          'darken',
          'difference',
          'dst',
          'dstATop',
          'dstIn',
          'dstOut',
          'dstOver',
          'exclusion',
          'hardLight',
          'hue',
          'lighten',
          'luminosity',
          'modulate',
          'multiply',
          'overlay',
          'plus',
          'saturation',
          'screen',
          'softLight',
          'src',
          'srcATop',
          'srcIn',
          'srcOut',
          'srcOver',
          'xor',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/blend_mode',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'clear':
            result = BlendMode.clear;
            break;

          case 'color':
            result = BlendMode.color;
            break;

          case 'colorBurn':
            result = BlendMode.colorBurn;
            break;

          case 'colorDodge':
            result = BlendMode.colorDodge;
            break;

          case 'darken':
            result = BlendMode.darken;
            break;

          case 'difference':
            result = BlendMode.difference;
            break;

          case 'dst':
            result = BlendMode.dst;
            break;

          case 'dstATop':
            result = BlendMode.dstATop;
            break;

          case 'dstIn':
            result = BlendMode.dstIn;
            break;

          case 'dstOut':
            result = BlendMode.dstOut;
            break;

          case 'dstOver':
            result = BlendMode.dstOver;
            break;

          case 'exclusion':
            result = BlendMode.exclusion;
            break;

          case 'hardLight':
            result = BlendMode.hardLight;
            break;

          case 'hue':
            result = BlendMode.hue;
            break;

          case 'lighten':
            result = BlendMode.lighten;
            break;

          case 'luminosity':
            result = BlendMode.luminosity;
            break;

          case 'modulate':
            result = BlendMode.modulate;
            break;

          case 'multiply':
            result = BlendMode.multiply;
            break;

          case 'overlay':
            result = BlendMode.overlay;
            break;

          case 'plus':
            result = BlendMode.plus;
            break;

          case 'saturation':
            result = BlendMode.saturation;
            break;

          case 'screen':
            result = BlendMode.screen;
            break;

          case 'softLight':
            result = BlendMode.softLight;
            break;

          case 'src':
            result = BlendMode.src;
            break;

          case 'srcATop':
            result = BlendMode.srcATop;
            break;

          case 'srcIn':
            result = BlendMode.srcIn;
            break;

          case 'srcOut':
            result = BlendMode.srcOut;
            break;

          case 'srcOver':
            result = BlendMode.srcOver;
            break;

          case 'xor':
            result = BlendMode.xor;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [BlurStyle].  Supported values are:
  /// * `inner`
  /// * `normal`
  /// * `outer`
  /// * `solid`
  static BlurStyle? decodeBlurStyle(
    dynamic value, {
    bool validate = true,
  }) {
    BlurStyle? result;

    if (value is BlurStyle) {
      result = value;
    } else if (value != null) {
      _checkSupported(
        'BlendMode',
        [
          'inner',
          'normal',
          'outer',
          'solid',
        ],
        value,
      );

      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/blur_style',
        value: value,
        validate: validate,
      ));
      switch (value) {
        case 'inner':
          result = BlurStyle.inner;
          break;

        case 'normal':
          result = BlurStyle.normal;
          break;

        case 'outer':
          result = BlurStyle.outer;
          break;

        case 'solid':
          result = BlurStyle.solid;
          break;
      }
    }

    return result;
  }

  /// Decodes the given value to a [BorderRadius].  The [value] may be a
  /// [String], an [int], a [double], or a Map-like object.
  ///
  /// When the [value] is a [String], [int], or [double] then the value will be
  /// parsed via [JsonClass.maybeParseDouble] and the result will be passed to
  /// [BorderRadius.circular].
  ///
  /// If the [value] is a Map-like object then the expected structure depends on
  /// on the value passed in for the "type" attribute.  The expected "type"
  /// values must be one of:
  ///  * `all`
  ///  * `circular`
  ///  * `horizontal`
  ///  * `only`
  ///  * `vertical`
  ///
  /// Type: `all` expects a structure:
  /// ```json
  /// {
  ///   "radius": "<Radius>",
  ///   "type": "all"
  /// }
  /// ```
  ///
  /// Type: `circular` expects a structure:
  /// ```json
  /// {
  ///   "radius": "<double>",
  ///   "type": "circular"
  /// }
  /// ```
  ///
  /// Type: `horizontal` expects a structure:
  /// ```json
  /// {
  ///   "left": "<Radius>",
  ///   "right": "<Radius>",
  ///   "type": "horizontal"
  /// }
  /// ```
  ///
  /// Type: `only` expects a structure:
  /// ```json
  /// {
  ///   "bottomLeft": "<Radius>",
  ///   "bottomRight": "<Radius>",
  ///   "topLeft": "<Radius>",
  ///   "topRight": "<Radius>",
  ///   "type": "only"
  /// }
  /// ```
  ///
  /// Type: `vertical` expects a structure:
  /// ```json
  /// {
  ///   "bottom": "<Radius>",
  ///   "top": "<Radius>",
  ///   "type": "vertical"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeRadius]
  static BorderRadius? decodeBorderRadius(
    dynamic value, {
    bool validate = true,
  }) {
    BorderRadius? result;

    if (value is BorderRadius) {
      result = value;
    } else {
      final radius = JsonClass.maybeParseDouble(value);
      if (radius != null) {
        result = BorderRadius.circular(radius);
      } else {
        assert(value == null || value['type'] is String);
        _checkSupported(
          'BorderRadius',
          [
            'all',
            'circular',
            'horizontal',
            'only',
            'vertical',
          ],
          value == null ? null : value['type'],
        );

        if (value != null) {
          assert(SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/border_radius',
            value: value,
            validate: validate,
          ));
          final String? type = value['type'];

          switch (type) {
            case 'all':
              result = BorderRadius.all(decodeRadius(
                    value['radius'],
                    validate: false,
                  ) ??
                  Radius.zero);
              break;
            case 'circular':
              result = BorderRadius.circular(
                JsonClass.maybeParseDouble(value['radius'])!,
              );
              break;
            case 'horizontal':
              result = BorderRadius.horizontal(
                left: decodeRadius(
                      value['left'],
                      validate: false,
                    ) ??
                    Radius.zero,
                right: decodeRadius(
                      value['right'],
                      validate: false,
                    ) ??
                    Radius.zero,
              );
              break;
            case 'only':
              result = BorderRadius.only(
                bottomLeft: decodeRadius(
                      value['bottomLeft'],
                      validate: false,
                    ) ??
                    Radius.zero,
                bottomRight: decodeRadius(
                      value['bottomRight'],
                      validate: false,
                    ) ??
                    Radius.zero,
                topLeft: decodeRadius(
                      value['topLeft'],
                      validate: false,
                    ) ??
                    Radius.zero,
                topRight: decodeRadius(
                      value['topRight'],
                      validate: false,
                    ) ??
                    Radius.zero,
              );
              break;
            case 'vertical':
              result = BorderRadius.vertical(
                bottom: decodeRadius(
                      value['bottom'],
                      validate: false,
                    ) ??
                    Radius.zero,
                top: decodeRadius(
                      value['top'],
                      validate: false,
                    ) ??
                    Radius.zero,
              );
              break;
          }
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [BorderSide].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "strokeAlign": "<Double>",
  ///   "style": "<BorderStyle>",
  ///   "width": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderStyle]
  ///  * [decodeColor]
  static BorderSide? decodeBorderSide(
    dynamic value, {
    bool validate = true,
  }) {
    BorderSide? result;

    if (value is BorderSide) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/border_side',
        value: value,
        validate: validate,
      ));
      result = BorderSide(
        color: decodeColor(
              value['color'],
              validate: false,
            ) ??
            const Color(0xff000000),
        strokeAlign: JsonClass.maybeParseDouble(value['strokeAlign']) ??
            BorderSide.strokeAlignInside,
        style: decodeBorderStyle(
              value['style'],
              validate: false,
            ) ??
            BorderStyle.solid,
        width: JsonClass.maybeParseDouble(value['width'], 1.0)!,
      );
    }

    return result;
  }

  /// Decodes the [value] to a [BorderStyle].  Supported values are:
  ///  * `none`
  ///  * `solid`
  static BorderStyle? decodeBorderStyle(
    dynamic value, {
    bool validate = true,
  }) {
    BorderStyle? result;

    if (value is BorderStyle) {
      result = value;
    } else {
      _checkSupported(
        'BorderStyle',
        [
          'none',
          'solid',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/border_style',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'none':
            result = BorderStyle.none;
            break;

          case 'solid':
            result = BorderStyle.solid;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [BottomAppBarTheme].  This expects the
  /// given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "elevation": "<double>",
  ///   "height": "<double>",
  ///   "padding": "<EdgeInsets>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<NotchedShape>",
  ///   "surfaceTingColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeNotchedShape]
  static BottomAppBarTheme? decodeBottomAppBarTheme(
    dynamic value, {
    bool validate = true,
  }) {
    BottomAppBarTheme? result;

    if (value is BottomAppBarTheme) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/bottom_app_bar_theme',
        value: value,
        validate: validate,
      ));
      result = BottomAppBarTheme(
        color: decodeColor(
          value['color'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        height: JsonClass.maybeParseDouble(value['height']),
        padding: decodeEdgeInsetsGeometry(
          value['padding'],
          validate: false,
        ),
        shadowColor: decodeColor(
          value['shadowColor'],
          validate: false,
        ),
        shape: decodeNotchedShape(
          value['shape'],
          validate: false,
        ),
        surfaceTintColor: decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [BottomNavigationBarThemeData].  This
  /// expects the given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "enableFeedback": "<bool>",
  ///   "landscapeLayout": "<BottomNavigationBarLandscapeLayout>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "selectedIconTheme": "<IconThemeData>",
  ///   "selectedIconColor": "<Color>",
  ///   "selectedLabelStyle": "<TextStyle>",
  ///   "showSelectedLabels": "<bool>",
  ///   "showUnselectedLabels": "<bool>",
  ///   "type": "<BottomNavigationBarType>",
  ///   "unselectedIconTheme": "<IconThemeData>",
  ///   "unselectedItemColor": "<Color>",
  ///   "unselectedLabelStyle": "<TextStyle>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBottomNavigationBarLandscapeLayout]
  ///  * [decodeBottomNavigationBarType]
  ///  * [decodeColor]
  ///  * [decodeIconThemeData]
  ///  * [decodeMaterialStatePropertyMouseCursor]
  ///  * [decodeTextStyle]
  static BottomNavigationBarThemeData? decodeBottomNavigationBarThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    BottomNavigationBarThemeData? result;

    if (value is BottomNavigationBarThemeData) {
      result = value;
    } else if (value != null) {
      result = BottomNavigationBarThemeData(
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        enableFeedback: JsonClass.maybeParseBool(value['enableFeedback']),
        landscapeLayout: decodeBottomNavigationBarLandscapeLayout(
          value['landscapeLayout'],
          validate: false,
        ),
        mouseCursor: decodeMaterialStatePropertyMouseCursor(
          value['mouseCursor'],
          validate: false,
        ),
        selectedIconTheme: decodeIconThemeData(
          value['selectedIconTheme'],
          validate: false,
        ),
        selectedItemColor: decodeColor(
          value['selectedItemColor'],
          validate: false,
        ),
        selectedLabelStyle: decodeTextStyle(
          value['selectedLabelStyle'],
          validate: false,
        ),
        showSelectedLabels: JsonClass.maybeParseBool(
          value['showSelectedLabels'],
        ),
        showUnselectedLabels: JsonClass.maybeParseBool(
          value['showUnselectedLabels'],
        ),
        type: decodeBottomNavigationBarType(
          value['type'],
          validate: false,
        ),
        unselectedIconTheme: decodeIconThemeData(
          value['unselectedIconTheme'],
          validate: false,
        ),
        unselectedItemColor: decodeColor(
          value['unselectedItemColor'],
          validate: false,
        ),
        unselectedLabelStyle: decodeTextStyle(
          value['unselectedLabelStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [BottomNavigationBarLandscapeLayout].  Supported values are:
  ///  * `centered`
  ///  * `linear`
  ///  * `spread`
  static BottomNavigationBarLandscapeLayout?
      decodeBottomNavigationBarLandscapeLayout(
    dynamic value, {
    bool validate = true,
  }) {
    BottomNavigationBarLandscapeLayout? result;

    if (value is BottomNavigationBarLandscapeLayout) {
      result = value;
    } else {
      _checkSupported(
        'BottomNavigationBarLandscapeLayout',
        [
          'centered',
          'linear',
          'spread',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/bottom_navigation_bar_landscape_layout',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'centered':
            result = BottomNavigationBarLandscapeLayout.centered;
            break;
          case 'linear':
            result = BottomNavigationBarLandscapeLayout.linear;
            break;
          case 'spread':
            result = BottomNavigationBarLandscapeLayout.spread;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [BottomNavigationBarType].  Supported values are:
  ///  * `fixed`
  ///  * `shifting`
  static BottomNavigationBarType? decodeBottomNavigationBarType(
    dynamic value, {
    bool validate = true,
  }) {
    BottomNavigationBarType? result;

    if (value is BottomNavigationBarType) {
      result = value;
    } else {
      _checkSupported(
        'BottomNavigationBarType',
        [
          'fixed',
          'shifting',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/bottom_navigation_bar_type',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'fixed':
            result = BottomNavigationBarType.fixed;
            break;
          case 'shifting':
            result = BottomNavigationBarType.shifting;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [BottomSheetThemeData].  This expects the
  /// given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "clipBehavior": "<Clip>",
  ///   "constraints": "<BoxConstraints>",
  ///   "dragHandleColor": "<Color>",
  ///   "dragHandleSize": "<Size>",
  ///   "elevation": "<double>",
  ///   "modalBackgroundColor": "<Color>",
  ///   "modalBarrierColor": "<Color>",
  ///   "modalElevation": "<double>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "showDragHandle": "<bool>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBoxConstraints]
  ///  * [decodeClip]
  ///  * [decodeColor]
  ///  * [decodeSize]
  ///  * [decodeShapeBorder]
  static BottomSheetThemeData? decodeBottomSheetThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    BottomSheetThemeData? result;

    if (value is BottomSheetThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/bottom_sheet_theme_data',
        value: value,
        validate: validate,
      ));
      result = BottomSheetThemeData(
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        clipBehavior: decodeClip(
          value['clipBehavior'],
          validate: false,
        ),
        constraints: decodeBoxConstraints(
          value['constraints'],
          validate: false,
        ),
        dragHandleColor: decodeColor(value['dragHandleColor'], validate: false),
        dragHandleSize: decodeSize(value['dragHandleSize'], validate: false),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        modalBackgroundColor: decodeColor(
          value['modalBackgroundColor'],
          validate: false,
        ),
        modalBarrierColor: decodeColor(
          value['modalBarrierColor'],
          validate: false,
        ),
        modalElevation: JsonClass.maybeParseDouble(value['modalElevation']),
        shadowColor: decodeColor(value['shadowColor'], validate: false),
        shape: decodeShapeBorder(
          value['shape'],
          validate: false,
        ),
        showDragHandle: JsonClass.maybeParseBool(value['showDragHandle']),
        surfaceTintColor: ThemeDecoder.decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] into a [BoxBorder].  If the value is `null`
  /// then `null` will be returned.
  ///
  /// This accepts two separate types of JSON.  If the [value] has any of:
  /// "color", "style", "width", then this will apply the border to all sides
  /// using [Border.all] and passing in the results from [decodeBorderSide].
  ///
  /// If none of the above attributes are found, this expects a full object that
  /// defines all sides as follows:
  ///
  /// ```json
  /// {
  ///   "bottom": "<BorderSide>",
  ///   "left": "<BorderSide>",
  ///   "right": "<BorderSide>",
  ///   "top": "<BorderSide>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderSide]
  static BoxBorder? decodeBoxBorder(
    dynamic value, {
    bool validate = true,
  }) {
    BoxBorder? result;

    if (value is BoxBorder) {
      result = value;
    } else if (value != null) {
      if (value['color'] != null ||
          value['style'] != null ||
          value['width'] != null) {
        final side = decodeBorderSide(
          value,
          validate: false,
        )!;
        result = Border.all(
          color: side.color,
          style: side.style,
          width: side.width,
        );
      } else {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/box_border',
          value: value,
          validate: validate,
        ));
        result = Border(
          bottom: decodeBorderSide(
                value['bottom'],
                validate: false,
              ) ??
              BorderSide.none,
          left: decodeBorderSide(
                value['left'],
                validate: false,
              ) ??
              BorderSide.none,
          right: decodeBorderSide(
                value['right'],
                validate: false,
              ) ??
              BorderSide.none,
          top: decodeBorderSide(
                value['top'],
                validate: false,
              ) ??
              BorderSide.none,
        );
      }
    }

    return result;
  }

  /// Decodes the given [value] into a [BoxConstraints].  If the value is `null`
  /// then `null` will be returned.  Otherwise, this expects a Map like value
  /// that in JSON would look like:
  ///
  /// ```json
  /// {
  ///   "maxHeight": "<double>",
  ///   "maxWidth": "<double>",
  ///   "minHeight": "<double>",
  ///   "minWidth": "<double>"
  /// }
  /// ```
  static BoxConstraints? decodeBoxConstraints(
    dynamic value, {
    bool validate = true,
  }) {
    BoxConstraints? result;

    if (value is BoxConstraints) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/box_constraints',
        value: value,
        validate: validate,
      ));
      result = BoxConstraints(
        maxHeight:
            JsonClass.maybeParseDouble(value['maxHeight'], double.infinity)!,
        maxWidth:
            JsonClass.maybeParseDouble(value['maxWidth'], double.infinity)!,
        minHeight: JsonClass.maybeParseDouble(value['minHeight'], 0)!,
        minWidth: JsonClass.maybeParseDouble(value['minWidth'], 0)!,
      );
    }

    return result;
  }

  /// Decodes the given [value] into a [BoxDecoration].  If the value is `null`
  /// then `null` will be returned.  Otherwise, this expects a Map like value
  /// that in JSON would look like:
  ///
  /// ```json
  /// {
  ///   "backgroundBlendMode": "<BlendMode>",
  ///   "border": "<BoxBorder>",
  ///   "borderRadius": "<BorderRadius>",
  ///   "boxShadow": "<BoxShadow[]>"
  ///   "color": "<Color>",
  ///   "image": "<DecorationImage>",
  ///   "gradient": "<Gradient>",
  ///   "shape": "<BoxShape>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBlendMode]
  ///  * [decodeBorderRadius]
  ///  * [decodeBoxBorder]
  ///  * [decodeBoxShadow]
  ///  * [decodeBoxShape]
  ///  * [decodeColor]
  ///  * [decodeDecorationImage]
  ///  * [decodeGradient]
  static BoxDecoration? decodeBoxDecoration(
    dynamic value, {
    bool validate = true,
  }) {
    BoxDecoration? result;

    if (value is BoxDecoration) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/box_decoration',
        value: value,
        validate: validate,
      ));
      result = BoxDecoration(
        backgroundBlendMode: decodeBlendMode(
          value['backgroundBlendMode'],
          validate: false,
        ),
        border: decodeBoxBorder(
          value['border'],
          validate: false,
        ),
        borderRadius: decodeBorderRadius(
          value['borderRadius'],
          validate: false,
        ),
        boxShadow: _decodeDynamicList(
          value['boxShadow'],
          (value) => decodeBoxShadow(
            value,
            validate: false,
          )!,
        ),
        color: decodeColor(
          value['color'],
          validate: false,
        ),
        gradient: decodeGradient(
          value['gradient'],
          validate: false,
        ),
        image: decodeDecorationImage(
          value['image'],
          validate: false,
        ),
        shape: decodeBoxShape(
              value['shape'],
              validate: false,
            ) ??
            BoxShape.rectangle,
      );
    }

    return result;
  }

  /// Decodes the [value] to a [BoxFit].  Supported values are:
  ///  * `contain`
  ///  * `cover`
  ///  * `fill`
  ///  * `fitHeight`
  ///  * `fitWidth`
  ///  * `none`
  ///  * `scaleDown`
  static BoxFit? decodeBoxFit(
    dynamic value, {
    bool validate = true,
  }) {
    BoxFit? result;

    if (value is BoxFit) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/box_fit',
        value: value,
        validate: validate,
      ));
      switch (value) {
        case 'contain':
          result = BoxFit.contain;
          break;
        case 'cover':
          result = BoxFit.cover;
          break;
        case 'fill':
          result = BoxFit.fill;
          break;
        case 'fitHeight':
          result = BoxFit.fitHeight;
          break;
        case 'fitWidth':
          result = BoxFit.fitWidth;
          break;
        case 'none':
          result = BoxFit.none;
          break;
        case 'scaleDown':
          result = BoxFit.scaleDown;
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] into a [BoxDecoration].  If the value is `null`
  /// then `null` will be returned.  Otherwise, this expects a Map like value
  /// that in JSON would look like:
  ///
  /// ```json
  /// {
  ///   "blurRadius": "<double>",
  ///   "blurStyle": "<BlurStyle>",
  ///   "color": "<Color>",
  ///   "offset": "<Offset>",
  ///   "spreadRadius": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBlurStyle]
  ///  * [decodeColor]
  ///  * [decodeOffset]
  static BoxShadow? decodeBoxShadow(
    dynamic value, {
    bool validate = true,
  }) {
    BoxShadow? result;

    if (value is BoxShadow) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/box_shadow',
        value: value,
        validate: validate,
      ));
      result = BoxShadow(
        blurStyle: decodeBlurStyle(
              value['blurStyle'],
              validate: false,
            ) ??
            BlurStyle.normal,
        blurRadius: JsonClass.maybeParseDouble(value['blurRadius'], 0)!,
        color: decodeColor(
              value['color'],
              validate: false,
            ) ??
            const Color(0xFF000000),
        offset: decodeOffset(
              value['offset'],
              validate: false,
            ) ??
            Offset.zero,
        spreadRadius: JsonClass.maybeParseDouble(value['spreadRadius'], 0)!,
      );
    }

    return result;
  }

  /// Decodes the [value] to a [BoxShape].  Supported values are:
  ///  * `circle`
  ///  * `rectangle`
  static BoxShape? decodeBoxShape(
    dynamic value, {
    bool validate = true,
  }) {
    BoxShape? result;

    if (value is BoxShape) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/box_shape',
        value: value,
        validate: validate,
      ));
      switch (value) {
        case 'circle':
          result = BoxShape.circle;
          break;

        case 'rectangle':
          result = BoxShape.rectangle;
          break;
      }
    }

    return result;
  }

  /// Decodes the [value] to a [Brightness].  Supported values are:
  ///  * `light`
  ///  * `dark`
  static Brightness? decodeBrightness(
    dynamic value, {
    bool validate = true,
  }) {
    Brightness? result;

    if (value is Brightness) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/brightness',
        value: value,
        validate: validate,
      ));
      result = value == 'light'
          ? Brightness.light
          : value == 'dark'
              ? Brightness.dark
              : null;
    }

    return result;
  }

  /// Decodes the [value] to a [ButtonBarLayoutBehavior].  Supported values are:
  ///  * `constrained`
  ///  * `padded`
  static ButtonBarLayoutBehavior? decodeButtonBarLayoutBehavior(
    dynamic value, {
    bool validate = true,
  }) {
    ButtonBarLayoutBehavior? result;

    if (value is ButtonBarLayoutBehavior) {
      result = value;
    } else {
      _checkSupported(
        'ButtonBarLayoutBehavior',
        [
          'constrained',
          'padded',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/button_bar_layout_behavior',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'constrained':
            result = ButtonBarLayoutBehavior.constrained;
            break;
          case 'padded':
            result = ButtonBarLayoutBehavior.padded;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [ButtonBarThemeData].  This expects the
  /// given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "alignment": "<MainAxisAlignment>",
  ///   "buttonAlignedDropdown": "<bool>",
  ///   "buttonHeight": "<double>",
  ///   "buttonMinWidth": "<double>",
  ///   "buttonPadding": "<EdgeInsetsGeometry>",
  ///   "buttonTextTheme": "<ButtonTextTheme>",
  ///   "layoutBehavior": "<ButtonBarLayoutBehavior>",
  ///   "mainAxisSize": "<MainAxisSize>",
  ///   "overflowDirection": "<VerticalDirection>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeButtonBarLayoutBehavior]
  ///  * [decodeButtonTextTheme]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeMainAxisAlignment]
  ///  * [decodeMainAxisSize]
  ///  * [decodeVerticalDirection]
  static ButtonBarThemeData? decodeButtonBarThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    ButtonBarThemeData? result;

    if (value is ButtonBarThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/button_bar_theme_data',
        value: value,
        validate: validate,
      ));
      result = ButtonBarThemeData(
        alignment: decodeMainAxisAlignment(
          value['alignment'],
          validate: false,
        ),
        buttonAlignedDropdown: JsonClass.maybeParseBool(
          value['buttonAlignedDropdown'],
        ),
        buttonHeight: JsonClass.maybeParseDouble(value['buttonHeight']),
        buttonMinWidth: JsonClass.maybeParseDouble(value['buttonMinWidth']),
        buttonPadding: decodeEdgeInsetsGeometry(
          value['buttonPadding'],
          validate: false,
        ),
        buttonTextTheme: decodeButtonTextTheme(
          value['buttonTextTheme'],
          validate: false,
        ),
        layoutBehavior: decodeButtonBarLayoutBehavior(
          value['layoutBehavior'],
          validate: false,
        ),
        mainAxisSize: decodeMainAxisSize(
          value['mainAxisSize'],
          validate: false,
        ),
        overflowDirection: decodeVerticalDirection(
          value['overflowDirection'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [ButtonStyle].
  ///
  /// ```json
  /// {
  ///   "alignment": "<AlignmentGeometry>",
  ///   "animationDuration": "<MaterialStateProperty<double>>",
  ///   "backgroundColor": "<MaterialStateProperty<Color>>",
  ///   "elevation": "<MaterialStateProperty<double>>",
  ///   "enableFeedback": "<bool>",
  ///   "fixedSize": "<MaterialStateProperty<double>>",
  ///   "foregroundColor": "<MaterialStateProperty<Color>>",
  ///   "iconColor": "<MaterialStateProperty<Color>>",
  ///   "iconSize": "<MaterialStateProperty<double>>",
  ///   "maximumSize": "<MaterialStateProperty<double>>",
  ///   "minimumSize": "<MaterialStateProperty<Size>>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "overlayColor": "<MaterialStateProperty<Color>>",
  ///   "padding": "<MaterialStateProperty<EdgeInsetsGeometry>>",
  ///   "shadowColor": "<MaterialStateProperty<Color>>",
  ///   "shape": "<MaterialStateProperty<OutlinedBorder>>",
  ///   "side": "<MaterialStateProperty<BorderSide>>",
  ///   "splashFactory": "<InteractiveInkSplashFactory>",
  ///   "surfaceTintColor": "<MaterialStateProperty<Color>>",
  ///   "tapTargetSize": "<MaterialTapTargetSize>",
  ///   "textStyle": "<MaterialStateProperty<TextStyle>>",
  ///   "visualDensity": "<VisualDensity>"
  /// }
  /// ```
  ///
  /// This will use the properties passed through JSON to create the
  /// [MaterialStateProperty] of each corresponding property by using
  /// the [MaterialStateProperty.all] function with the value passed in.
  ///
  /// See also:
  ///  * [decodeBorderSide]
  ///  * [decodeColor]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeInteractiveInkFeatureFactory]
  ///  * [decodeMaterialStatePropertyBorderSide]
  ///  * [decodeMaterialStatePropertyColor]
  ///  * [decodeMaterialStatePropertyDouble]
  ///  * [decodeMaterialStatePropertyEdgeInsetsGeometry]
  ///  * [decodeMaterialStatePropertyMouseCursor]
  ///  * [decodeMaterialStatePropertyOutlinedBorder]
  ///  * [decodeMaterialStatePropertySize]
  ///  * [decodeMaterialStatePropertyTextStyle]
  ///  * [decodeMaterialTapTargetSize]
  ///  * [decodeMouseCursor]
  ///  * [decodeOutlinedBorder]
  ///  * [decodeSize]
  ///  * [decodeTextStyle]
  ///  * [decodeVisualDensity]
  static ButtonStyle? decodeButtonStyle(
    dynamic value, {
    bool validate = true,
  }) {
    ButtonStyle? result;

    if (value is ButtonStyle) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/button_style',
        value: value,
        validate: validate,
      ));

      result = ButtonStyle(
        alignment: decodeAlignment(
          value['alignment'],
          validate: false,
        ),
        animationDuration: JsonClass.maybeParseDurationFromMillis(
          value['animationDuration'],
        ),
        backgroundColor: decodeMaterialStatePropertyColor(
          value['backgroundColor'],
          validate: false,
        ),
        elevation: decodeMaterialStatePropertyDouble(
          value['elevation'],
          validate: false,
        ),
        enableFeedback: JsonClass.maybeParseBool(value['enableFeedback']),
        fixedSize: decodeMaterialStatePropertySize(
          value['fixedSize'],
          validate: false,
        ),
        foregroundColor: decodeMaterialStatePropertyColor(
          value['foregroundColor'],
          validate: false,
        ),
        iconColor: decodeMaterialStatePropertyColor(
          value['iconColor'],
          validate: false,
        ),
        iconSize: decodeMaterialStatePropertyDouble(
          value['iconSize'],
          validate: false,
        ),
        maximumSize: decodeMaterialStatePropertySize(
          value['maximumSize'],
          validate: false,
        ),
        minimumSize: decodeMaterialStatePropertySize(
          value['minimumSize'],
          validate: false,
        ),
        mouseCursor: decodeMaterialStatePropertyMouseCursor(
          value['mouseCursor'],
          validate: false,
        ),
        overlayColor: decodeMaterialStatePropertyColor(
          value['overlayColor'],
          validate: false,
        ),
        padding: decodeMaterialStatePropertyEdgeInsetsGeometry(
          value['padding'],
          validate: false,
        ),
        shadowColor: decodeMaterialStatePropertyColor(
          value['shadowColor'],
          validate: false,
        ),
        shape: decodeMaterialStatePropertyOutlinedBorder(
          value['shape'],
          validate: false,
        ),
        side: decodeMaterialStatePropertyBorderSide(
          value['side'],
          validate: false,
        ),
        splashFactory: decodeInteractiveInkFeatureFactory(
          value['splashFactory'],
          validate: false,
        ),
        surfaceTintColor: decodeMaterialStatePropertyColor(
          value['surfaceTintColor'],
          validate: false,
        ),
        tapTargetSize: decodeMaterialTapTargetSize(
          value['tapTargetSize'],
          validate: false,
        ),
        textStyle: decodeMaterialStatePropertyTextStyle(
          value['textStyle'],
          validate: false,
        ),
        visualDensity: decodeVisualDensity(
          value['visualDensity'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [ButtonTextTheme].  Supported values are:
  ///  * `accent`
  ///  * `normal`
  ///  * `primary`
  static ButtonTextTheme? decodeButtonTextTheme(
    dynamic value, {
    bool validate = true,
  }) {
    ButtonTextTheme? result;

    if (value is ButtonTextTheme) {
      result = value;
    } else {
      _checkSupported(
        'ButtonTextTheme',
        [
          'accent',
          'normal',
          'primary',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/button_text_theme',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'accent':
            result = ButtonTextTheme.accent;
            break;
          case 'normal':
            result = ButtonTextTheme.normal;
            break;
          case 'primary':
            result = ButtonTextTheme.primary;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [ButtonThemeData].  This expects the
  /// given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "alignedDropdown": "<bool>",
  ///   "buttonColor": "<Color>",
  ///   "colorScheme": "<ColorScheme>",
  ///   "disabledColor": "<Color>",
  ///   "focusColor": "<Color>",
  ///   "height": "<double>",
  ///   "highlightColor": "<Color>",
  ///   "hoverColor": "<Color>",
  ///   "layoutBehavior": "<ButtonBarLayoutBehavior>",
  ///   "materialTapTargetSize": "<MaterialTapTargetSize>",
  ///   "minWidth": "<double>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "shape": "<ShapeBorder>",
  ///   "splashColor": "<Color>",
  ///   "textTheme": "<ButtonTextTheme>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeButtonBarLayoutBehavior]
  ///  * [decodeButtonTextTheme]
  ///  * [decodeColor]
  ///  * [decodeColorScheme]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeMaterialTapTargetSize]
  ///  * [decodeShapeBorder]
  static ButtonThemeData? decodeButtonThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    ButtonThemeData? result;

    if (value is ButtonThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/button_theme_data',
        value: value,
        validate: validate,
      ));
      result = ButtonThemeData(
        alignedDropdown: JsonClass.parseBool(value['alignedDropdown']),
        buttonColor: decodeColor(
          value['buttonColor'],
          validate: false,
        ),
        colorScheme: decodeColorScheme(
          value['colorScheme'],
          validate: false,
        ),
        disabledColor: decodeColor(
          value['disabledColor'],
          validate: false,
        ),
        focusColor: decodeColor(
          value['focusColor'],
          validate: false,
        ),
        height: JsonClass.maybeParseDouble(value['height'], 36.0)!,
        highlightColor: decodeColor(
          value['highlightColor'],
          validate: false,
        ),
        hoverColor: decodeColor(
          value['hoverColor'],
          validate: false,
        ),
        layoutBehavior: decodeButtonBarLayoutBehavior(
              value['layoutBehavior'],
              validate: false,
            ) ??
            ButtonBarLayoutBehavior.padded,
        materialTapTargetSize: decodeMaterialTapTargetSize(
          value['materialTapTargetSize'],
          validate: false,
        ),
        minWidth: JsonClass.maybeParseDouble(value['minWidth'], 88.0)!,
        padding: decodeEdgeInsetsGeometry(
          value['padding'],
          validate: false,
        ),
        shape: decodeShapeBorder(
          value['shape'],
          validate: false,
        ),
        splashColor: decodeColor(
          value['splashColor'],
          validate: false,
        ),
        textTheme: decodeButtonTextTheme(
          value['textTheme'],
          validate: false,
        )!,
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [CardTheme].  This expects the
  /// given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "clipBehavior": "<Clip>",
  ///   "color": "<Color>",
  ///   "elevation": "<double>",
  ///   "margin": "<EdgeInsetsGeometry>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeClip]
  ///  * [decodeColor]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeShapeBorder]
  static CardTheme? decodeCardTheme(
    dynamic value, {
    bool validate = true,
  }) {
    CardTheme? result;

    if (value is CardTheme) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/card_theme',
        value: value,
        validate: validate,
      ));
      result = CardTheme(
        clipBehavior: decodeClip(
          value['clipBehavior'],
          validate: false,
        ),
        color: decodeColor(
          value['color'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        margin: decodeEdgeInsetsGeometry(
          value['margin'],
          validate: false,
        ),
        shadowColor: decodeColor(
          value['shadowColor'],
          validate: false,
        ),
        shape: decodeShapeBorder(
          value['shape'],
          validate: false,
        ),
        surfaceTintColor: decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [CheckboxThemeData].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "checkColor": "<Color>",
  ///   "fillColor": "<MaterialStateProperty<Color>>",
  ///   "materialTapTargetSize": "<MaterialTapTargetSize>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "overlayColor": "<MaterialStateProperty<Color>>",
  ///   "shape": "<OutlinedBorder>",
  ///   "side": "<BorderSide>",
  ///   "splashRadius": "<double>",
  ///   "visualDensity": "<VisualDensity>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderSide]
  ///  * [decodeColor]
  ///  * [decodeMaterialStatePropertyColor]
  ///  * [decodeMaterialStatePropertyMouseCursor]
  ///  * [decodeMaterialTapTargetSize]
  ///  * [decodeMouseCursor]
  ///  * [decodeOutlinedBorder]
  ///  * [decodeVisualDensity]
  static CheckboxThemeData? decodeCheckboxThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    CheckboxThemeData? result;

    if (value is CheckboxThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/checkbox_theme_data',
        value: value,
        validate: validate,
      ));
      result = CheckboxThemeData(
        checkColor: decodeMaterialStatePropertyColor(
          value['checkColor'],
          validate: false,
        ),
        fillColor: decodeMaterialStatePropertyColor(
          value['fillColor'],
          validate: false,
        ),
        materialTapTargetSize: decodeMaterialTapTargetSize(
          value['materialTapTargetSize'],
          validate: false,
        ),
        mouseCursor: decodeMaterialStatePropertyMouseCursor(
          value['mouseCursor'],
          validate: false,
        ),
        overlayColor: decodeMaterialStatePropertyColor(
          value['overlayColor'],
          validate: false,
        ),
        shape: decodeOutlinedBorder(
          value['outlinedBorder'],
          validate: false,
        ),
        side: decodeBorderSide(
          value['borderSide'],
          validate: false,
        ),
        splashRadius: JsonClass.maybeParseDouble(value['splashRadius']),
        visualDensity: decodeVisualDensity(
          value['visualDensity'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [CardTheme].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "brightness": "<Brightness>",
  ///   "checkmarkColor": "<Color>",
  ///   "deleteIconColor": "<Color>",
  ///   "disabledColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "iconTheme": "<IconThemeData>",
  ///   "labelPadding": "<EdgeInsetsGeometry>",
  ///   "labelStyle": "<TextStyle>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "pressElevation": "<double>",
  ///   "secondaryLabelStyle": "<TextStyle>",
  ///   "secondarySelectedColor": "<Color>",
  ///   "selectedColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "side": "<BorderSide>",
  ///   "selectedShadowColor": "<Color>",
  ///   "shadowColor": "<Color>",
  ///   "showCheckmark": "<bool>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderSide]
  ///  * [decodeBrightness]
  ///  * [decodeColor]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeIconThemeData]
  ///  * [decodeShapeBorder]
  ///  * [decodeTextStyle]
  static ChipThemeData? decodeChipThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    ChipThemeData? result;

    if (value is ChipThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/chip_theme_data',
        value: value,
        validate: validate,
      ));
      result = ChipThemeData(
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        )!,
        brightness: decodeBrightness(
          value['brightness'],
          validate: false,
        )!,
        checkmarkColor: decodeColor(
          value['checkmarkColor'],
          validate: false,
        ),
        deleteIconColor: decodeColor(
          value['deleteIconColor'],
          validate: false,
        ),
        disabledColor: decodeColor(
          value['disabledColor'],
          validate: false,
        )!,
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        iconTheme: decodeIconThemeData(
          value['iconTheme'],
          validate: false,
        ),
        labelPadding: decodeEdgeInsetsGeometry(
          value['labelPadding'],
          validate: false,
        ),
        labelStyle: decodeTextStyle(
          value['labelStyle'],
          validate: false,
        )!,
        padding: decodeEdgeInsetsGeometry(
          value['padding'],
          validate: false,
        )!,
        pressElevation: JsonClass.maybeParseDouble(value['pressElevation']),
        secondaryLabelStyle: decodeTextStyle(
          value['secondaryLabelStyle'],
          validate: false,
        )!,
        secondarySelectedColor: decodeColor(
          value['secondarySelectedColor'],
          validate: false,
        )!,
        selectedColor: decodeColor(
          value['selectedColor'],
          validate: false,
        )!,
        shape: decodeShapeBorder(
          value['shape'],
          validate: false,
        ) as OutlinedBorder?,
        side: decodeBorderSide(
          value['side'],
          validate: false,
        ),
        selectedShadowColor: decodeColor(
          value['selectedShadowColor'],
          validate: false,
        ),
        shadowColor: decodeColor(
          value['shadowColor'],
          validate: false,
        ),
        showCheckmark: JsonClass.maybeParseBool(value['showCheckmark']),
        surfaceTintColor: decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [Clip].  Supported values are:
  ///  * `antiAlias`
  ///  * `antiAliasWithSaveLayer`
  ///  * `hardEdge`
  ///  * `none`
  static Clip? decodeClip(
    dynamic value, {
    bool validate = true,
  }) {
    Clip? result;

    if (value is Clip) {
      result = value;
    } else {
      _checkSupported(
        'Clip',
        [
          'antiAlias',
          'antiAliasWithSaveLayer',
          'hardEdge',
          'none',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/clip',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'antiAlias':
            result = Clip.antiAlias;
            break;
          case 'antiAliasWithSaveLayer':
            result = Clip.antiAliasWithSaveLayer;
            break;
          case 'hardEdge':
            result = Clip.hardEdge;
            break;
          case 'none':
            result = Clip.none;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes a given [value] into a color.  A [value] of `null` will result in
  /// `null` being returned.
  ///
  /// This supports the following formats:
  ///  * `rgb`
  ///  * `rrggbb`
  ///  * `aarrggbb`
  ///  * `#rgb`
  ///  * `#rrggbb`
  ///  * `#aarrggbb`
  static Color? decodeColor(
    dynamic value, {
    bool validate = true,
  }) {
    Color? result;

    if (value is Color) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/color',
        value: value,
        validate: validate,
      ));
      var i = 0;

      if (value?.startsWith('#') == true) {
        value = value.substring(1);
      }

      if (value?.length == 3) {
        value = value.substring(0, 1) +
            value.substring(0, 1) +
            value.substring(1, 2) +
            value.substring(1, 2) +
            value.substring(2, 3) +
            value.substring(2, 3);
      }

      if (value?.length == 6 || value?.length == 8) {
        i = int.parse(value, radix: 16);

        if (value?.length != 8) {
          i = 0xff000000 + i;
        }

        result = Color(i);
      }
    }

    return result;
  }

  /// Decodes a dynamic value into a [ColorFilter].  The schema this requires
  /// depends on the type.
  ///
  /// Type: `matrix`
  /// ```json
  /// {
  ///   matrix: "<List<double>"
  /// }
  /// ```
  ///
  /// Type: `mode`
  /// ```json
  /// {
  ///   blendMode: "<BlendMode>",
  ///   color: "<Color>"
  /// }
  /// ```
  ///
  /// Neither type of `linearToSrgbGamma` or `srgbToLinearGamma` requires any
  /// additional properties.
  static ColorFilter? decodeColorFilter(
    dynamic value, {
    bool validate = true,
  }) {
    ColorFilter? result;

    if (value is ColorFilter) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/color_filter',
        value: value,
        validate: validate,
      ));

      final type = value['type']?.toString();

      switch (type) {
        case 'linearToSrgbGamma':
          result = const ColorFilter.linearToSrgbGamma();
          break;

        case 'matrix':
          result = ColorFilter.matrix(
            JsonClass.maybeParseDoubleList(value['matrix'])!,
          );
          break;

        case 'mode':
          result = ColorFilter.mode(
            decodeColor(value['color'])!,
            decodeBlendMode(value['blendMode']) ?? BlendMode.srcIn,
          );
          break;

        case 'srgbToLinearGamma':
          result = const ColorFilter.srgbToLinearGamma();
          break;

        default:
          throw Exception('Unknown ColorFilter type: [$type]');
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [CardTheme].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "background": "<Color>",
  ///   "brightness": "<Brightness>",
  ///   "error": "<Color>",
  ///   "errorContainer": "<Color>",
  ///   "inversePrimary": "<Color>",
  ///   "inverseSurface": "<Color>",
  ///   "onBackground": "<Color>",
  ///   "onError": "<Color>",
  ///   "onErrorContainer": "<Color>",
  ///   "onInverseSurface": "<Color>",
  ///   "onPrimary": "<Color>",
  ///   "onPrimaryContainer": "<Color>",
  ///   "onSecondary": "<Color>",
  ///   "onSecondaryContainer": "<Color>",
  ///   "onSurface": "<Color>",
  ///   "onSurfaceVariant": "<Color>",
  ///   "onTertiary": "<Color>",
  ///   "onTertiaryContainer": "<Color>",
  ///   "outline": "<Color>",
  ///   "outlineVariant": "<Color>",
  ///   "primary": "<Color>",
  ///   "primaryContainer": "<Color>",
  ///   "secondary": "<Color>",
  ///   "secondaryContainer": "<Color>",
  ///   "shadow": "<Color>",
  ///   "surface": "<Color>",
  ///   "surfaceVariant": "<Color>",
  ///   "tertiary": "<Color>",
  ///   "tertiaryContainer": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBrightness]
  ///  * [decodeColor]
  static ColorScheme? decodeColorScheme(
    dynamic value, {
    bool validate = true,
  }) {
    ColorScheme? result;

    if (value is ColorScheme) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/color_scheme',
        value: value,
        validate: validate,
      ));
      result = ColorScheme(
        background: decodeColor(
          value['background'],
          validate: false,
        )!,
        brightness: decodeBrightness(
          value['brightness'],
          validate: false,
        )!,
        error: decodeColor(
          value['error'],
          validate: false,
        )!,
        errorContainer: decodeColor(
          value['errorContainer'],
          validate: false,
        ),
        inversePrimary: decodeColor(
          value['inversePrimary'],
          validate: false,
        ),
        inverseSurface: decodeColor(
          value['inverseSurface'],
          validate: false,
        ),
        onBackground: decodeColor(
          value['onBackground'],
          validate: false,
        )!,
        onError: decodeColor(
          value['onError'],
          validate: false,
        )!,
        onErrorContainer: decodeColor(
          value['onErrorContainer'],
          validate: false,
        ),
        onInverseSurface: decodeColor(
          value['onInverseSurface'],
          validate: false,
        ),
        onPrimary: decodeColor(
          value['onPrimary'],
          validate: false,
        )!,
        onPrimaryContainer: decodeColor(
          value['onPrimaryContainer'],
          validate: false,
        ),
        onSecondary: decodeColor(
          value['onSecondary'],
          validate: false,
        )!,
        onSecondaryContainer: decodeColor(
          value['onSecondaryContainer'],
          validate: false,
        ),
        onSurface: decodeColor(
          value['onSurface'],
          validate: false,
        )!,
        onSurfaceVariant: decodeColor(
          value['onSurfaceVariant'],
          validate: false,
        ),
        onTertiary: decodeColor(
          value['onTertiary'],
          validate: false,
        ),
        onTertiaryContainer: decodeColor(
          value['onTertiaryContainer'],
          validate: false,
        ),
        outline: decodeColor(
          value['outline'],
          validate: false,
        ),
        outlineVariant: decodeColor(
          value['outlineVariant'],
          validate: false,
        ),
        primary: decodeColor(
          value['primary'],
          validate: false,
        )!,
        primaryContainer: decodeColor(
          value['primaryContainer'] ?? value['primaryVariant'],
          validate: false,
        ),
        // primaryVariant: @deprecated
        secondary: decodeColor(
          value['secondary'],
          validate: false,
        )!,
        secondaryContainer: decodeColor(
          value['secondaryContainer'] ?? value['secondaryVariant'],
          validate: false,
        ),
        // secondaryVariant: : @deprecated,
        shadow: decodeColor(
          value['shadow'],
          validate: false,
        ),
        surface: decodeColor(
          value['surface'],
          validate: false,
        )!,
        surfaceTint: decodeColor(
          value['surfaceTint'],
          validate: false,
        ),
        surfaceVariant: decodeColor(
          value['surfaceVariant'],
          validate: false,
        ),
        tertiary: decodeColor(
          value['tertiary'],
          validate: false,
        ),
        tertiaryContainer: decodeColor(
          value['tertiaryContainer'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [CrossAxisAlignment].  Supported values are:
  ///  * `baseLine`
  ///  * `center`
  ///  * `end`
  ///  * `start`
  ///  * `stretch`
  static CrossAxisAlignment? decodeCrossAxisAlignment(
    dynamic value, {
    bool validate = true,
  }) {
    CrossAxisAlignment? result;

    if (value is CrossAxisAlignment) {
      result = value;
    } else {
      _checkSupported(
        'CrossAxisAlignment',
        [
          'baseline',
          'center',
          'end',
          'start',
          'stretch',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/cross_axis_alignment',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'baseline':
            result = CrossAxisAlignment.baseline;
            break;
          case 'center':
            result = CrossAxisAlignment.center;
            break;
          case 'end':
            result = CrossAxisAlignment.end;
            break;
          case 'start':
            result = CrossAxisAlignment.start;
            break;
          case 'stretch':
            result = CrossAxisAlignment.stretch;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [CrossFadeState].  Supported values are:
  ///  * `showFirst`
  ///  * `showSecond`
  static CrossFadeState? decodeCrossFadeState(
    dynamic value, {
    bool validate = true,
  }) {
    CrossFadeState? result;

    if (value is CrossFadeState) {
      result = value;
    } else {
      _checkSupported(
        'CrossFadeState',
        [
          'showFirst',
          'showSecond',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/cross_fade_state',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'showFirst':
            result = CrossFadeState.showFirst;
            break;
          case 'showSecond':
            result = CrossFadeState.showSecond;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [CupertinoTextThemeData].  This expects the
  /// given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "actionTextStyle": "<TextStyle>",
  ///   "dateTimePickerTextStyle": "<TextStyle>",
  ///   "navActionTextStyle": "<TextStyle>",
  ///   "navLargeTitleTextStyle":<TextStyle>",
  ///   "navTitleTextStyle": "<TextStyle>",
  ///   "pickerTextStyle": "<TextStyle>",
  ///   "primaryColor": "<Color>"
  ///   "tabLabelTextStyle": "<TextStyle>",
  ///   "textStyle": "<TextStyle>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeTextStyle]
  static CupertinoTextThemeData? decodeCupertinoTextThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    CupertinoTextThemeData? result;

    if (value is CupertinoTextThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/cupertino_text_theme_data',
        value: value,
        validate: validate,
      ));
      result = CupertinoTextThemeData(
        actionTextStyle: decodeTextStyle(
          value['actionTextStyle'],
          validate: false,
        ),
        dateTimePickerTextStyle: decodeTextStyle(
          value['dateTimePickerTextStyle'],
          validate: false,
        ),
        navActionTextStyle: decodeTextStyle(
          value['navActionTextStyle'],
          validate: false,
        ),
        navLargeTitleTextStyle: decodeTextStyle(
          value['navLargeTitleTextStyle'],
          validate: false,
        ),
        navTitleTextStyle: decodeTextStyle(
          value['navTitleTextStyle'],
          validate: false,
        ),
        pickerTextStyle: decodeTextStyle(
          value['pickerTextStyle'],
          validate: false,
        ),
        primaryColor: decodeColor(
              value['primaryColor'],
              validate: false,
            ) ??
            CupertinoColors.systemBlue,
        tabLabelTextStyle: decodeTextStyle(
          value['tabLabelTextStyle'],
          validate: false,
        ),
        textStyle: decodeTextStyle(
          value['textStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [CupertinoThemeData].  This expects the
  /// given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "applyThemeToAll": "<bool>"",
  ///   "barBackgroundColor": "<Color>",
  ///   "brightness": "<Brightness>",
  ///   "primaryColor": "<Color>",
  ///   "primaryContrastingColor": "<Color>",
  ///   "scaffoldBackgroundColor": "<Color>",
  ///   "textTheme": "<CupertinoTextThemeData>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBrightness]
  ///  * [decodeColor]
  ///  * [decodeCupertinoTextThemeData]
  static CupertinoThemeData? decodeCupertinoThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    CupertinoThemeData? result;

    if (value is CupertinoThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/cupertino_theme_data',
        value: value,
        validate: validate,
      ));
      result = CupertinoThemeData(
        applyThemeToAll: JsonClass.maybeParseBool(value['applyThemeToAll']),
        barBackgroundColor: decodeColor(
          value['barBackgroundColor'],
          validate: false,
        ),
        brightness: decodeBrightness(
          value['brightness'],
          validate: false,
        ),
        primaryColor: decodeColor(
          value['primaryColor'],
          validate: false,
        ),
        primaryContrastingColor: decodeColor(
          value['primaryContrastingColor'],
          validate: false,
        ),
        scaffoldBackgroundColor: decodeColor(
          value['scaffoldBackgroundColor'],
          validate: false,
        ),
        textTheme: decodeCupertinoTextThemeData(
          value['textTheme'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [DatePickerThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "dayBackgroundColor": "<MaterialStateProperty<Color>>",
  ///   "dayForegroundColor": "<MaterialStateProperty<Color>>",
  ///   "dayOverlayColor": "<MaterialStateProperty<Color>>",
  ///   "dayStyle": "<TextStyle>",
  ///   "elevation": "<double>",
  ///   "headerBackgroundColor": "<Color>",
  ///   "headerForegroundColor": "<Color>",
  ///   "headerHeadlineStyle": "<TextStyle>",
  ///   "headerHelpStyle": "<TextStyle>",
  ///   "rangePickerBackgroundColor": "<Color>",
  ///   "rangePickerElevation": "<double>",
  ///   "rangePickerHeaderBackgroundColor": "<Color>",
  ///   "rangePickerHeaderForegroundColor": "<Color>",
  ///   "rangePickerHeaderHeadlineStyle": "<TextStyle>",
  ///   "rangePickerHeaderHelpStyle": "<TextStyle>",
  ///   "rangePickerShadowColor": "<Color>",
  ///   "rangePickerShape": "<ShapeBorder>",
  ///   "rangePickerSurfaceTintColor": "<Color>",
  ///   "rangeSelectionBackgroundColor": "<Color>",
  ///   "rangeSelectionOverlayColor": "<MaterialStateProperty<Color>>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "surfaceTintColor": "<Color>",
  ///   "todayBackgroundColor": "<MaterialStateProperty<Color>>",
  ///   "todayBorder": "<ShapeBorder>",
  ///   "todayForegroundColor": "<MaterialStateProperty<Color>>",
  ///   "weekdayStyle": "<TextStyle>",
  ///   "yearBackgroundColor": "<MaterialStateProperty<Color>>",
  ///   "yearForegroundColor": "<MaterialStateProperty<Color>>",
  ///   "yearOverlayColor": "<MaterialStateProperty<Color>>",
  ///   "yearStyle": "<TextStyle>",
  /// }
  /// ```
  ///
  /// This will use the properties passed through JSON to create the
  /// [MaterialStateProperty] of each corresponding property by using
  /// the [MaterialStateProperty.all] function with the value passed in.
  ///
  /// See also:
  ///  * [decodeBorderSide]
  ///  * [decodeColor]
  ///  * [decodeMaterialStatePropertyColor]
  ///  * [decodeShapeBorder]
  ///  * [decodeTextStyle]
  static DatePickerThemeData? decodeDatePickerThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    DatePickerThemeData? result;

    if (value is DatePickerThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/date_picker_theme_data',
        value: value,
        validate: validate,
      ));
      result = DatePickerThemeData(
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        dayBackgroundColor: decodeMaterialStatePropertyColor(
          value['dayBackgroundColor'],
          validate: false,
        ),
        dayForegroundColor: decodeMaterialStatePropertyColor(
          value['dayForegroundColor'],
          validate: false,
        ),
        dayOverlayColor: decodeMaterialStatePropertyColor(
          value['dayOverlayColor'],
          validate: false,
        ),
        dayStyle: decodeTextStyle(
          value['dayStyle'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        headerBackgroundColor: decodeColor(
          value['headerBackgroundColor'],
          validate: false,
        ),
        headerForegroundColor: decodeColor(
          value['headerForegroundColor'],
          validate: false,
        ),
        headerHeadlineStyle: decodeTextStyle(
          value['headerHeadlineStyle'],
          validate: false,
        ),
        headerHelpStyle: decodeTextStyle(
          value['headerHelpStyle'],
          validate: false,
        ),
        rangePickerBackgroundColor: decodeColor(
          value['rangePickerBackgroundColor'],
          validate: false,
        ),
        rangePickerElevation:
            JsonClass.maybeParseDouble(value['rangePickerElevation']),
        rangePickerHeaderBackgroundColor: decodeColor(
          value['rangePickerHeaderBackgroundColor'],
          validate: false,
        ),
        rangePickerHeaderForegroundColor: decodeColor(
          value['rangePickerHeaderForegroundColor'],
          validate: false,
        ),
        rangePickerHeaderHeadlineStyle: decodeTextStyle(
          value['rangePickerHeaderHeadlineStyle'],
          validate: false,
        ),
        rangePickerHeaderHelpStyle: decodeTextStyle(
          value['rangePickerHeaderHelpStyle'],
          validate: false,
        ),
        rangePickerShadowColor: decodeColor(
          value['rangePickerShadowColor'],
          validate: false,
        ),
        rangePickerShape: decodeShapeBorder(
          value['rangePickerShape'],
          validate: false,
        ),
        rangePickerSurfaceTintColor: decodeColor(
          value['rangePickerSurfaceTintColor'],
          validate: false,
        ),
        rangeSelectionBackgroundColor: decodeColor(
          value['rangeSelectionBackgroundColor'],
          validate: false,
        ),
        rangeSelectionOverlayColor: decodeMaterialStatePropertyColor(
          value['rangeSelectionOverlayColor'],
          validate: false,
        ),
        shadowColor: decodeColor(
          value['shadowColor'],
          validate: false,
        ),
        shape: decodeShapeBorder(
          value['shape'],
          validate: false,
        ),
        surfaceTintColor: decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
        todayBackgroundColor: decodeMaterialStatePropertyColor(
          value['todayBackgroundColor'],
          validate: false,
        ),
        todayBorder: decodeBorderSide(
          value['todayBorder'],
          validate: false,
        ),
        todayForegroundColor: decodeMaterialStatePropertyColor(
          value['todayForegroundColor'],
          validate: false,
        ),
        weekdayStyle: decodeTextStyle(
          value['weekdayStyle'],
          validate: false,
        ),
        yearBackgroundColor: decodeMaterialStatePropertyColor(
          value['yearBackgroundColor'],
          validate: false,
        ),
        yearForegroundColor: decodeMaterialStatePropertyColor(
          value['yearForegroundColor'],
          validate: false,
        ),
        yearOverlayColor: decodeMaterialStatePropertyColor(
          value['yearOverlayColor'],
          validate: false,
        ),
        yearStyle: decodeTextStyle(
          value['yearStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [DataTableThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "checkboxHorizontalMargin": "<double>",
  ///   "columnSpacing": "<double>",
  ///   "dataRowColor": "<MaterialStateProperty<Color>>",
  ///   "dataRowCursor": "<MaterialStateProperty<MouseCursor>",
  ///   "dataRowMaxHeight": "<double>",
  ///   "dataRowMinHeight": "<double>",
  ///   "dataTextStyle": "<TextStyle,
  ///   "decoration": "<BoxDecoration>",
  ///   "dividerThickness": "<double>",
  ///   "headingCellCursor": "<MaterialStateProperty<MouseCursor>",
  ///   "headingRowColor": "<MaterialStateProperty<Color>>",
  ///   "headingRowHeight": "<double>",
  ///   "headingTextStyle": "<TextStyle>",
  ///   "horizontalMargin": "<double>"
  /// }
  /// ```
  ///
  /// This will use the properties passed through JSON to create the
  /// [MaterialStateProperty] of each corresponding property by using
  /// the [MaterialStateProperty.all] function with the value passed in.
  ///
  /// See also:
  ///  * [decodeBoxDecoration]
  ///  * [decodeColor]
  ///  * [decodeMaterialStatePropertyColor]
  ///  * [decodeMaterialStatePropertyMouseCursor]
  ///  * [decodeTextStyle]
  static DataTableThemeData? decodeDataTableThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    DataTableThemeData? result;

    if (value is DataTableThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/data_table_theme_data',
        value: value,
        validate: validate,
      ));
      result = DataTableThemeData(
        checkboxHorizontalMargin: JsonClass.maybeParseDouble(
          value['checkboxHorizontalMargin'],
        ),
        columnSpacing: JsonClass.maybeParseDouble(
          value['columnSpacing'],
        ),
        dataRowColor: decodeMaterialStatePropertyColor(
          value['dataRowColor'],
          validate: false,
        ),
        dataRowCursor: decodeMaterialStatePropertyMouseCursor(
          value['dataRowCursor'],
          validate: false,
        ),
        dataRowMaxHeight: JsonClass.maybeParseDouble(
          value['dataRowMaxHeight'],
        ),
        dataRowMinHeight: JsonClass.maybeParseDouble(
          value['dataRowMinHeight'],
        ),
        dataTextStyle: decodeTextStyle(
          value['dataTextStyle'],
          validate: false,
        ),
        decoration: decodeBoxDecoration(
          value['decoration'],
          validate: false,
        ),
        dividerThickness: JsonClass.maybeParseDouble(
          value['dividerThickness'],
        ),
        headingCellCursor: decodeMaterialStatePropertyMouseCursor(
          value['dataRowCursor'],
          validate: false,
        ),
        headingRowColor: decodeMaterialStatePropertyColor(
          value['headingRowColor'],
          validate: false,
        ),
        headingRowHeight: JsonClass.maybeParseDouble(
          value['headingRowHeight'],
        ),
        headingTextStyle: decodeTextStyle(
          value['headingTextStyle'],
          validate: false,
        ),
        horizontalMargin: JsonClass.maybeParseDouble(
          value['horizontalMargin'],
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [DecorationImage].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "alignment": "<Alignment>",
  ///   "centerSlice": "<Rect>",
  ///   "filterQuality": "<FilterQuality>",
  ///   "fit": "<BoxFit>",
  ///   "image": "<ImageProvider>",
  ///   "invertColors": "<bool>",
  ///   "isAntiAlias": "<bool>",
  ///   "matchTextDirection": "<bool>",
  ///   "opacity": "<double>",
  ///   "repeat": "<ImageRepeat>",
  ///   "scale": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeAlignment]
  ///  * [decodeBoxFit]
  ///  * [decodeFilterQuality]
  ///  * [decodeImageProvider]
  ///  * [decodeImageRepeat]
  ///  * [decodeRect]
  static DecorationImage? decodeDecorationImage(
    dynamic value, {
    bool validate = true,
  }) {
    DecorationImage? result;

    if (value is DecorationImage) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/decoration_image',
        value: value,
        validate: validate,
      ));
      result = DecorationImage(
        alignment: decodeAlignment(
              value['alignment'],
              validate: false,
            ) ??
            Alignment.center,
        centerSlice: decodeRect(
          value['centerSlice'],
          validate: false,
        ),
        // colorFilter: @unencodable
        // onError: @unencodable
        fit: decodeBoxFit(
          value['fit'],
          validate: false,
        ),
        filterQuality: decodeFilterQuality(
              value['filterQuality'],
              validate: false,
            ) ??
            FilterQuality.low,
        image: decodeImageProvider(
          value['image'],
          validate: false,
        )!,
        invertColors: JsonClass.parseBool(value['invertColors']),
        isAntiAlias: JsonClass.parseBool(value['isAntiAlias']),
        matchTextDirection: JsonClass.parseBool(value['matchTextDirection']),
        opacity: JsonClass.maybeParseDouble(value['opacity']) ?? 1.0,
        repeat: decodeImageRepeat(
              value['repeat'],
              validate: false,
            ) ??
            ImageRepeat.noRepeat,
        scale: JsonClass.maybeParseDouble(value['scale'], 1.0)!,
      );
    }

    return result;
  }

  /// Decodes the [value] to a [DecorationPosition].  Supported values are:
  ///  * `background`
  ///  * `foreground`
  static DecorationPosition? decodeDecorationPosition(
    dynamic value, {
    bool validate = true,
  }) {
    DecorationPosition? result;

    if (value is DecorationPosition) {
      result = value;
    } else {
      _checkSupported(
        'DecorationPosition',
        [
          'background',
          'foreground',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/decoration_position',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'background':
            result = DecorationPosition.background;
            break;
          case 'foreground':
            result = DecorationPosition.foreground;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [DialogTheme].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "actionsPadding": "<EdgeInsetsGeometry>",
  ///   "alignment": "<Alignment>",
  ///   "backgroundColor": "<Color>",
  ///   "contentTextStyle": "<TextStyle>",
  ///   "elevation": "<double>",
  ///   "iconColor": "<Color>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "surfaceColor": "<Color>",
  ///   "titleTextStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeAlignment]
  ///  * [decodeBrightness]
  ///  * [decodeColor]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeShapeBorder]
  ///  * [decodeTextStyle]
  static DialogTheme? decodeDialogTheme(
    dynamic value, {
    bool validate = true,
  }) {
    DialogTheme? result;

    if (value is DialogTheme) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/dialog_theme',
        value: value,
        validate: validate,
      ));
      result = DialogTheme(
        actionsPadding: decodeEdgeInsetsGeometry(
          value['actionsPadding'],
          validate: false,
        ),
        alignment: decodeAlignment(
          value['alignment'],
          validate: false,
        ),
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        contentTextStyle: decodeTextStyle(
          value['contentTextStyle'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        iconColor: decodeColor(
          value['iconColor'],
          validate: false,
        ),
        shadowColor: decodeColor(
          value['shadowColor'],
          validate: false,
        ),
        shape: decodeShapeBorder(
          value['shape'],
          validate: false,
        ),
        surfaceTintColor: decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
        titleTextStyle: decodeTextStyle(
          value['titleTextStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [DividerThemeData].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "endIndent": "<double>",
  ///   "indent": "<double>",
  ///   "space": "<double>",
  ///   "thickness": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  static DividerThemeData? decodeDividerThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    DividerThemeData? result;

    if (value is DividerThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/divider_theme_data',
        value: value,
        validate: validate,
      ));
      result = DividerThemeData(
        color: decodeColor(
          value['color'],
          validate: false,
        ),
        endIndent: JsonClass.maybeParseDouble(value['endIndent']),
        indent: JsonClass.maybeParseDouble(value['indent']),
        space: JsonClass.maybeParseDouble(value['space']),
        thickness: JsonClass.maybeParseDouble(value['thickness']),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [DragStartBehavior].  Supported values are:
  ///  * `horizontal`
  ///  * `start`
  static DragStartBehavior? decodeDragStartBehavior(
    dynamic value, {
    bool validate = true,
  }) {
    DragStartBehavior? result;

    if (value is DragStartBehavior) {
      result = value;
    } else {
      _checkSupported(
        'DragStartBehavior',
        [
          'down',
          'start',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/drag_start_behavior',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'down':
            result = DragStartBehavior.down;
            break;
          case 'start':
            result = DragStartBehavior.start;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [DrawerThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "endShape": "<ShapeBorder>",
  ///   "scrimColor": "<Color>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "surfaceTintColor": "<Color>",
  ///   "width": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeShapeBorder]
  static DrawerThemeData? decodeDrawerThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    DrawerThemeData? result;

    if (value is DrawerThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/drawer_theme_data',
        value: value,
        validate: validate,
      ));

      result = DrawerThemeData(
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        endShape: decodeShapeBorder(
          value['endShape'],
          validate: false,
        ),
        scrimColor: decodeColor(
          value['scrimColor'],
          validate: false,
        ),
        shadowColor: decodeColor(
          value['shadowColor'],
          validate: false,
        ),
        shape: decodeShapeBorder(
          value['shape'],
          validate: false,
        ),
        surfaceTintColor: decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
        width: JsonClass.maybeParseDouble(value['width']),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [DropdownMenuThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "inputDecorationTheme": "<InputDecorationTheme>",
  ///   "menuStyle": "<MenuStyle>",
  ///   "textStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeInputDecorationTheme]
  ///  * [decodeMenuStyle]
  ///  * [decodeTextStyle]
  static DropdownMenuThemeData? decodeDropdownMenuThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    DropdownMenuThemeData? result;

    if (value is DropdownMenuThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/dropdown_menu_theme_data',
        value: value,
        validate: validate,
      ));

      result = DropdownMenuThemeData(
        inputDecorationTheme: decodeInputDecorationTheme(
          value['inputDecorationTheme'],
          validate: false,
        ),
        menuStyle: decodeMenuStyle(
          value['menuStyle'],
          validate: false,
        ),
        textStyle: decodeTextStyle(
          value['textStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] into an [EdgeInsetsGeometry].
  ///
  /// If the value is a [String], [double], or [int] then this will parse the
  /// number and pass it to [EdgeInsets.all].
  ///
  /// If the value is an array with two entities, this call
  /// [EdgeInsets.symmetric] with the first element passed as the horizontal and
  /// the second as the vertical.
  ///
  /// If the value is an array with four entities, this call
  /// [EdgeInsets.fromLTRB] passing each element in order.
  ///
  /// Finally, this may be a Map-like structure in the following JSON format:
  /// ```json
  /// {
  ///   "bottom": "<double>",
  ///   "left": "<double>",
  ///   "right": "<double>",
  ///   "top": "<double>"
  /// }
  /// ```
  static EdgeInsetsGeometry? decodeEdgeInsetsGeometry(
    dynamic value, {
    bool validate = true,
  }) {
    EdgeInsetsGeometry? result;

    if (value is String && value.contains(',')) {
      value = value.split(',');
    }

    if (value is EdgeInsetsGeometry) {
      result = value;
    } else if (value != null) {
      if (value is String || value is double || value is int) {
        result = EdgeInsets.all(JsonClass.maybeParseDouble(value)!);
      } else if (value is List) {
        assert(value.length == 2 || value.length == 4);
        // LR,TB
        if (value.length == 1) {
          result = EdgeInsets.all(
            JsonClass.maybeParseDouble(value[0], 0)!,
          );
        }
        // LR,TB
        else if (value.length == 2) {
          result = EdgeInsets.symmetric(
            horizontal: JsonClass.maybeParseDouble(value[0], 0)!,
            vertical: JsonClass.maybeParseDouble(value[1], 0)!,
          );
        }
        // T,LR,B
        else if (value.length == 3) {
          result = EdgeInsets.fromLTRB(
            JsonClass.maybeParseDouble(value[1])!,
            JsonClass.maybeParseDouble(value[0])!,
            JsonClass.maybeParseDouble(value[1])!,
            JsonClass.maybeParseDouble(value[2])!,
          );
        }
        // L,T,R,B
        else if (value.length == 4) {
          result = EdgeInsets.fromLTRB(
            JsonClass.maybeParseDouble(value[0])!,
            JsonClass.maybeParseDouble(value[1])!,
            JsonClass.maybeParseDouble(value[2])!,
            JsonClass.maybeParseDouble(value[3])!,
          );
        }
      } else {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/edge_insets_geometry',
          value: value,
          validate: validate,
        ));
        result = EdgeInsets.only(
          bottom: JsonClass.maybeParseDouble(value['bottom'], 0.0)!,
          left: JsonClass.maybeParseDouble(value['left'], 0.0)!,
          right: JsonClass.maybeParseDouble(value['right'], 0.0)!,
          top: JsonClass.maybeParseDouble(value['top'], 0.0)!,
        );
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [ElevatedButtonThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "style": "<ButtonStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeButtonStyle]
  static ElevatedButtonThemeData? decodeElevatedButtonThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    ElevatedButtonThemeData? result;

    if (value is ElevatedButtonThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/elevated_button_theme_data',
        value: value,
        validate: validate,
      ));
      result = ElevatedButtonThemeData(
        style: decodeButtonStyle(
          value['style'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [ExpansionTileThemeData].  This expects
  /// the given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "childrenPadding": "<EdgeInsetsGeometry>",
  ///   "clipBehavior": "<Color>",
  ///   "collapsedBackgroundColor": "<Color>",
  ///   "collapsedIconColor": "<Color>",
  ///   "collapsedShape": "<ShapeBorder>",
  ///   "collapsedTextColor": "<Color>",
  ///   "expandedAlignment": "<AlignmentGeometry>",
  ///   "iconColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "textColor": "<Color>",
  ///   "tilePadding": "<EdgeInsetsGeometry>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeAlignment]
  ///  * [decodeClip]
  ///  * [decodeColor]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeShapeBorder]
  static ExpansionTileThemeData? decodeExpansionTileThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    ExpansionTileThemeData? result;

    if (value is ExpansionTileThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/expansion_tile_theme_data',
        value: value,
        validate: validate,
      ));

      result = ExpansionTileThemeData(
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        childrenPadding: decodeEdgeInsetsGeometry(
          value['childrenPadding'],
          validate: false,
        ),
        clipBehavior: decodeClip(
          value['clipBehavior'],
          validate: false,
        ),
        collapsedBackgroundColor: decodeColor(
          value['collapsedBackgroundColor'],
          validate: false,
        ),
        collapsedIconColor: decodeColor(
          value['collapsedIconColor'],
          validate: false,
        ),
        collapsedShape: decodeShapeBorder(
          value['collapsedShape'],
          validate: false,
        ),
        collapsedTextColor: decodeColor(
          value['collapsedTextColor'],
          validate: false,
        ),
        expandedAlignment: decodeAlignment(
          value['expandedAlignment'],
          validate: false,
        ),
        iconColor: decodeColor(
          value['iconColor'],
          validate: false,
        ),
        shape: decodeShapeBorder(
          value['shapeBorder'],
          validate: false,
        ),
        textColor: decodeColor(
          value['textColor'],
          validate: false,
        ),
        tilePadding: decodeEdgeInsetsGeometry(
          value['tilePadding'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [FilledButtonThemeData].  This expects
  /// the given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "style": "<ButtonStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeButtonStyle]
  static FilledButtonThemeData? decodeFilledButtonThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    FilledButtonThemeData? result;

    if (value is FilledButtonThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/filled_button_theme_data',
        value: value,
        validate: validate,
      ));

      result = FilledButtonThemeData(
        style: decodeButtonStyle(
          value['style'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [FilterQuality].  Supported values are:
  ///  * `high`
  ///  * `low`
  ///  * `medium`
  ///  * `none`
  static FilterQuality? decodeFilterQuality(
    dynamic value, {
    bool validate = true,
  }) {
    FilterQuality? result;

    if (value is FilterQuality) {
      result = value;
    } else {
      _checkSupported(
          'FilterQuality',
          [
            'high',
            'low',
            'medium',
            'none',
          ],
          value);

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/filter_quality',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'high':
            result = FilterQuality.high;
            break;

          case 'low':
            result = FilterQuality.low;
            break;

          case 'medium':
            result = FilterQuality.medium;
            break;

          case 'none':
            result = FilterQuality.none;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [FlexFit].  Supported values are:
  ///  * `baseLine`
  ///  * `center`
  ///  * `end`
  ///  * `start`
  ///  * `stretch`
  static FlexFit? decodeFlexFit(
    dynamic value, {
    bool validate = true,
  }) {
    FlexFit? result;

    if (value is FlexFit) {
      result = value;
    } else {
      _checkSupported(
        'FlexFit',
        [
          'loose',
          'tight',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/flex_fit',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'loose':
            result = FlexFit.loose;
            break;
          case 'tight':
            result = FlexFit.tight;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [FloatingActionButtonAnimator].  Supported values
  /// are:
  ///  * `scaling`
  static FloatingActionButtonAnimator? decodeFloatingActionButtonAnimator(
    dynamic value, {
    bool validate = true,
  }) {
    FloatingActionButtonAnimator? result;

    if (value is FloatingActionButtonAnimator) {
      result = value;
    } else {
      _checkSupported(
        'FloatingActionButtonAnimator',
        [
          'scaling',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/floating_action_button_animator',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'scaling':
            result = FloatingActionButtonAnimator.scaling;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [FloatingActionButtonLocation].  Supported values
  /// are:
  ///  * `centerDocked`
  ///  * `centerFloat`
  ///  * `centerTop`
  ///  * `endDocked`
  ///  * `endFloat`
  ///  * `endTop`
  ///  * `miniCenterDocked`
  ///  * `miniCenterFloat`
  ///  * `miniCenterTop`
  ///  * `miniEndDocked`
  ///  * `miniEndFloat`
  ///  * `miniEndTop`
  ///  * `miniStartDocked`
  ///  * `miniStartFloat`
  ///  * `miniStartTop`
  ///  * `startDocked`
  ///  * `startFloat`
  ///  * `startTop`
  static FloatingActionButtonLocation? decodeFloatingActionButtonLocation(
    dynamic value, {
    bool validate = true,
  }) {
    FloatingActionButtonLocation? result;

    if (value is FloatingActionButtonLocation) {
      result = value;
    } else {
      _checkSupported(
        'FloatingActionButtonLocation',
        [
          'centerDocked',
          'centerFloat',
          'centerTop',
          'endDocked',
          'endFloat',
          'endTop',
          'miniCenterDocked',
          'miniCenterFloat',
          'miniCenterTop',
          'miniEndDocked',
          'miniEndFloat',
          'miniEndTop',
          'miniStartDocked',
          'miniStartFloat',
          'miniStartTop',
          'startDocked',
          'startFloat',
          'startTop',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/floating_action_button_location',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'centerDocked':
            result = FloatingActionButtonLocation.centerDocked;
            break;

          case 'centerFloat':
            result = FloatingActionButtonLocation.centerFloat;
            break;

          case 'centerTop':
            result = FloatingActionButtonLocation.centerTop;
            break;

          case 'endDocked':
            result = FloatingActionButtonLocation.endDocked;
            break;

          case 'endFloat':
            result = FloatingActionButtonLocation.endFloat;
            break;

          case 'endTop':
            result = FloatingActionButtonLocation.endTop;
            break;

          case 'miniCenterDocked':
            result = FloatingActionButtonLocation.miniCenterDocked;
            break;

          case 'miniCenterFloat':
            result = FloatingActionButtonLocation.miniCenterFloat;
            break;

          case 'miniCenterTop':
            result = FloatingActionButtonLocation.miniCenterTop;
            break;

          case 'miniEndDocked':
            result = FloatingActionButtonLocation.miniEndDocked;
            break;

          case 'miniEndFloat':
            result = FloatingActionButtonLocation.miniEndFloat;
            break;

          case 'miniEndTop':
            result = FloatingActionButtonLocation.miniEndTop;
            break;

          case 'miniStartDocked':
            result = FloatingActionButtonLocation.miniStartDocked;
            break;

          case 'miniStartFloat':
            result = FloatingActionButtonLocation.miniStartFloat;
            break;

          case 'miniStartTop':
            result = FloatingActionButtonLocation.miniStartTop;
            break;

          case 'startDocked':
            result = FloatingActionButtonLocation.startDocked;
            break;

          case 'startFloat':
            result = FloatingActionButtonLocation.startFloat;
            break;

          case 'startTop':
            result = FloatingActionButtonLocation.startTop;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [FloatingActionButtonThemeData].  This
  /// expects the given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "disabledElevation": "<double>",
  ///   "elevation": "<double>",
  ///   "extendedIconLabelSpacing": "<double>",
  ///   "extendedPadding": "<EdgeInsetsGeometry>",
  ///   "extendedSizeConstraints": "<BoxConstraints>",
  ///   "extendedTextStyle": "<TextStyle>"
  ///   "focusColor": "<Color>",
  ///   "focusElevation": "<double>",
  ///   "foregroundColor": "<Color>",
  ///   "highlightElevation": "<double>",
  ///   "hoverColor": "<Color>",
  ///   "hoverElevation": "<double>",
  ///   "iconSize": "<double>",
  ///   "largeSizeConstraints": "<BoxConstraints>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "shape": "<ShapeBorder>",
  ///   "sizeConstraints": "<BoxConstraints>",
  ///   "smallSizeConstraints": "<BoxConstraints>",
  ///   "splashColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBoxConstraints]
  ///  * [decodeColor]
  ///  * [decodeMaterialStatePropertyMouseCursor]
  ///  * [decodeShapeBorder]
  ///  * [decodeTextStyle]
  static FloatingActionButtonThemeData? decodeFloatingActionButtonThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    FloatingActionButtonThemeData? result;

    if (value is FloatingActionButtonThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/floating_action_button_theme_data',
        value: value,
        validate: validate,
      ));
      result = FloatingActionButtonThemeData(
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        disabledElevation:
            JsonClass.maybeParseDouble(value['disabledElevation']),
        enableFeedback: JsonClass.maybeParseBool(value['enableFeedback']),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        extendedIconLabelSpacing: JsonClass.maybeParseDouble(
          value['extendedIconLabelSpacing'],
        ),
        extendedPadding: decodeEdgeInsetsGeometry(
          value['extendedPadding'],
          validate: false,
        ),
        extendedSizeConstraints: decodeBoxConstraints(
          value['extendedSizeConstraints'],
          validate: false,
        ),
        extendedTextStyle: decodeTextStyle(
          value['extendedTextStyle'],
          validate: false,
        ),
        focusColor: decodeColor(
          value['focusColor'],
          validate: false,
        ),
        focusElevation: JsonClass.maybeParseDouble(value['focusElevation']),
        foregroundColor: decodeColor(
          value['foregroundColor'],
          validate: false,
        ),
        highlightElevation:
            JsonClass.maybeParseDouble(value['highlightElevation']),
        hoverColor: decodeColor(
          value['hoverColor'],
          validate: false,
        ),
        hoverElevation: JsonClass.maybeParseDouble(value['hoverElevation']),
        iconSize: JsonClass.maybeParseDouble(value['iconSize']),
        largeSizeConstraints: decodeBoxConstraints(
          value['largeSizeConstraints'],
          validate: false,
        ),
        mouseCursor: decodeMaterialStatePropertyMouseCursor(
          value['mouseCursor'],
          validate: false,
        ),
        shape: decodeShapeBorder(
          value['shape'],
          validate: false,
        ),
        sizeConstraints: decodeBoxConstraints(
          value['sizeConstraints'],
          validate: false,
        ),
        smallSizeConstraints: decodeBoxConstraints(
          value['smallSizeConstraints'],
          validate: false,
        ),
        splashColor: decodeColor(
          value['splashColor'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [FloatingLabelAlignment].  Supported values are:
  ///  * `always`
  ///  * `auto`
  ///  * `never`
  static FloatingLabelAlignment? decodeFloatingLabelAlignment(
    dynamic value, {
    bool validate = true,
  }) {
    FloatingLabelAlignment? result;

    if (value is FloatingLabelAlignment) {
      result = value;
    } else {
      _checkSupported(
        'FloatingLabelAlignment',
        [
          'center',
          'start',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/floating_label_alignment',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'center':
            result = FloatingLabelAlignment.center;
            break;

          case 'start':
            result = FloatingLabelAlignment.start;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [FloatingLabelBehavior].  Supported values are:
  ///  * `always`
  ///  * `auto`
  ///  * `never`
  static FloatingLabelBehavior? decodeFloatingLabelBehavior(
    dynamic value, {
    bool validate = true,
  }) {
    FloatingLabelBehavior? result;

    if (value is FloatingLabelBehavior) {
      result = value;
    } else {
      _checkSupported(
        'FloatingLabelBehavior',
        [
          'always',
          'auto',
          'never',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/floating_label_behavior',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'always':
            result = FloatingLabelBehavior.always;
            break;

          case 'auto':
            result = FloatingLabelBehavior.auto;
            break;

          case 'never':
            result = FloatingLabelBehavior.never;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [FontFeature].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "feature": "<String>",
  ///   "value": "<int>"
  /// }
  /// ```
  static FontFeature? decodeFontFeature(
    dynamic value, {
    bool validate = true,
  }) {
    FontFeature? result;

    if (value is FontFeature) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/font_feature',
        value: value,
        validate: validate,
      ));
      result = FontFeature(
        value['feature'],
        JsonClass.maybeParseInt(value['value'])!,
      );
    }

    return result;
  }

  /// Decodes the [value] to a [FontStyle].  Supported values are:
  ///  * `italic`
  ///  * `normal`
  static FontStyle? decodeFontStyle(
    dynamic value, {
    bool validate = true,
  }) {
    FontStyle? result;

    if (value is FontStyle) {
      result = value;
    } else {
      _checkSupported(
        'FontStyle',
        [
          'italic',
          'normal',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/font_style',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'italic':
            result = FontStyle.italic;
            break;

          case 'normal':
            result = FontStyle.normal;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [FontWeight].  Supported values are:
  ///  * `bold`
  ///  * `normal`
  ///  * `w100`
  ///  * `w200`
  ///  * `w300`
  ///  * `w400`
  ///  * `w500`
  ///  * `w600`
  ///  * `w700`
  ///  * `w800`
  ///  * `w900`
  static FontWeight? decodeFontWeight(
    dynamic value, {
    bool validate = true,
  }) {
    FontWeight? result;

    if (value is FontWeight) {
      result = value;
    } else {
      _checkSupported(
        'FontWeight',
        [
          'bold',
          'normal',
          'w100',
          'w200',
          'w300',
          'w400',
          'w500',
          'w600',
          'w700',
          'w800',
          'w900',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/font_weight',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'bold':
            result = FontWeight.bold;
            break;

          case 'normal':
            result = FontWeight.normal;
            break;

          case 'w100':
            result = FontWeight.w100;
            break;

          case 'w200':
            result = FontWeight.w200;
            break;

          case 'w300':
            result = FontWeight.w300;
            break;

          case 'w400':
            result = FontWeight.w400;
            break;

          case 'w500':
            result = FontWeight.w500;
            break;

          case 'w600':
            result = FontWeight.w600;
            break;

          case 'w700':
            result = FontWeight.w700;
            break;

          case 'w800':
            result = FontWeight.w800;
            break;

          case 'w900':
            result = FontWeight.w900;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] into a [FontVariation].  If the value is `null`
  /// then `null` will be returned.
  ///
  /// This expects the format:
  /// ```json
  /// {
  ///   "axis": "<String>",
  ///   "value": "<double>"
  /// }
  /// ```
  static FontVariation? decodeFontVariation(
    dynamic value, {
    bool validate = true,
  }) {
    FontVariation? result;

    if (value is FontVariation) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/font_variation',
        value: value,
        validate: validate,
      ));
      result = FontVariation(
        value['axis'],
        JsonClass.maybeParseDouble(value['value'])!,
      );
    }

    return result;
  }

  /// Decodes the given [value] into a [Gradient].  If the value is `null`
  /// then `null` will be returned.
  ///
  /// When the [value] is not `null`, this expects a type attribute of one of
  /// the following values:
  ///  * `linear`
  ///  * `radial`
  ///  * `sweep`
  ///
  /// The expected JSON will depend on the specified type and are each described
  /// below:
  ///
  /// Type: `linear`
  /// ```json
  /// {
  ///   "begin": "<Alignment>",
  ///   "colors": "<Color[]>",
  ///   "end": "<Alignment>",
  ///   "stops": "<double[]>",
  ///   "tileMode": "<TileMode>",
  ///   "transform": "<GradientTransform>",
  ///   "type": "linear"
  /// }
  /// ```
  ///
  /// Type: `radial`
  /// ```json
  /// {
  ///   "center": "<Alignment>",
  ///   "colors": "<Color[]>",
  ///   "focal": "<Alignment>",
  ///   "focalRadius": "<double>",
  ///   "radius": "<double>",
  ///   "stops": "<double[]>",
  ///   "tileMode": "<TileMode>",
  ///   "transform": "<GradientTransform>",
  ///   "type": "radial"
  /// }
  /// ```
  ///
  /// Type: `sweep`
  /// ```json
  /// {
  ///   "center": "<Alignment>",
  ///   "colors": "<Color[]>",
  ///   "endAngle": "<double>",
  ///   "startAngle": "<double>",
  ///   "stops": "<double[]>",
  ///   "tileMode": "<TileMode>",
  ///   "transform": "<GradientTransform>",
  ///   "type": "sweep"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeAlignment]
  ///  * [decodeGradientTransform]
  ///  * [decodeTileMode]
  static Gradient? decodeGradient(
    dynamic value, {
    bool validate = true,
  }) {
    Gradient? result;
    if (value is Gradient) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);
      _checkSupported(
        'Gradient',
        [
          'linear',
          'radial',
          'sweep',
        ],
        value == null ? null : value['type'],
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/gradient',
          value: value,
          validate: validate,
        ));
        final type = value['type'];

        switch (type) {
          case 'linear':
            result = LinearGradient(
              begin: decodeAlignment(
                    value['begin'],
                    validate: false,
                  ) ??
                  Alignment.centerLeft,
              colors: _decodeStringList<Color>(
                value['colors'],
                (value) {
                  final color = decodeColor(
                    value,
                    validate: false,
                  );

                  return color!;
                },
              )!,
              end: decodeAlignment(
                    value['end'],
                    validate: false,
                  ) ??
                  Alignment.centerRight,
              stops: _decodeDynamicList<double>(
                value['stops'],
                (value) => JsonClass.maybeParseDouble(value)!,
              ),
              tileMode: decodeTileMode(
                    value['tileMode'],
                    validate: false,
                  ) ??
                  TileMode.clamp,
              transform: decodeGradientTransform(
                value['transform'],
                validate: false,
              ),
            );
            break;
          case 'radial':
            result = RadialGradient(
              center: decodeAlignment(
                    value['center'],
                    validate: false,
                  ) ??
                  Alignment.center,
              colors: _decodeStringList<Color>(
                value['colors'],
                (value) => decodeColor(
                  value,
                  validate: false,
                )!,
              )!,
              focal: decodeAlignment(
                value['focal'],
                validate: false,
              ),
              focalRadius:
                  JsonClass.maybeParseDouble(value['focalRadius'], 0.0)!,
              radius: JsonClass.maybeParseDouble(value['radius'], 0.5)!,
              stops: _decodeDynamicList<double>(
                value['stops'],
                (value) => JsonClass.maybeParseDouble(value)!,
              ),
              tileMode: decodeTileMode(
                    value['tileMode'],
                    validate: false,
                  ) ??
                  TileMode.clamp,
              transform: decodeGradientTransform(
                value['transform'],
                validate: false,
              ),
            );
            break;
          case 'sweep':
            result = SweepGradient(
              center: decodeAlignment(
                    value['center'],
                    validate: false,
                  ) ??
                  Alignment.center,
              colors: _decodeStringList<Color>(
                value['colors'],
                (value) => decodeColor(
                  value,
                  validate: false,
                )!,
              )!,
              endAngle: JsonClass.maybeParseDouble(
                value['endAngle'],
                math.pi * 2,
              )!,
              startAngle: JsonClass.maybeParseDouble(
                value['startAngle'],
                0.0,
              )!,
              stops: _decodeDynamicList<double>(
                value['stops'],
                (value) => JsonClass.maybeParseDouble(value)!,
              ),
              tileMode: decodeTileMode(
                    value['tileMode'],
                    validate: false,
                  ) ??
                  TileMode.clamp,
              transform: decodeGradientTransform(
                value['transform'],
                validate: false,
              ),
            );
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] into a [GradientTransform].  If the value is
  /// `null` then `null` will be returned.
  ///
  /// When the [value] is not `null`, this will always return a concrete
  /// implementation of [GradientRotation].
  ///
  /// ```json
  /// {
  ///   "radians": "<double>"
  /// }
  /// ```
  static GradientTransform? decodeGradientTransform(
    dynamic value, {
    bool validate = true,
  }) {
    GradientTransform? result;

    if (value is GradientTransform) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/gradient_transform',
        value: value,
        validate: validate,
      ));
      result = GradientRotation(
        JsonClass.maybeParseDouble(value['radians'])!,
      );
    }

    return result;
  }

  /// Decodes the given [value] into a [HitTestBehavior].  Supported values are:
  /// * `deferToChild`
  /// * `opaque`
  /// * `translucent`
  static HitTestBehavior? decodeHitTestBehavior(
    dynamic value, {
    bool validate = true,
  }) {
    HitTestBehavior? result;
    if (value is HitTestBehavior) {
      result = value;
    } else {
      _checkSupported(
        'HitTestBehavior',
        [
          'deferToChild',
          'opaque',
          'translucent',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/hit_test_behavior',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'deferToChild':
            result = HitTestBehavior.deferToChild;
            break;

          case 'opaque':
            result = HitTestBehavior.opaque;
            break;

          case 'translucent':
            result = HitTestBehavior.translucent;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] into an [IconData].  If the value is `null` then
  /// `null` will be returned.
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "fill": "<double>",
  ///   "grade": "<double>",
  ///   "icon": "<IconData>",
  ///   "opticalSize": "<double>",
  ///   "semanticLabel": "<String>",
  ///   "shadows": "<List<Shadow>>",
  ///   "size": "<double>",
  ///   "textDirection": "<TextDirection>",
  ///   "weight": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeIconData]
  ///  * [decodeShadow]
  ///  * [decodeTextDirection]
  static Icon? decodeIcon(
    dynamic value, {
    bool validate = true,
  }) {
    Icon? result;

    if (value is Icon) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/icon',
        value: value,
        validate: validate,
      ));
      result = Icon(
        decodeIconData(value['icon'], validate: false)!,
        color: ThemeDecoder.decodeColor(
          value['color'],
          validate: false,
        ),
        fill: JsonClass.maybeParseDouble(value['fill']),
        grade: JsonClass.maybeParseDouble(value['grade']),
        opticalSize: JsonClass.maybeParseDouble(value['opticalSize']),
        semanticLabel: value['semanticLabel'],
        shadows: JsonClass.maybeFromDynamicList(
          value['shadows'],
          (map) => ThemeDecoder.decodeShadow(
            map,
            validate: false,
          )!,
        ),
        size: JsonClass.maybeParseDouble(value['size']),
        textDirection: ThemeDecoder.decodeTextDirection(
          value['textDirection'],
          validate: false,
        ),
        weight: JsonClass.maybeParseDouble(value['weight']),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [IconButtonThemeData].  This
  /// expects the given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "style": "<ButtonStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeButtonStyle]
  static IconButtonThemeData? decodeIconButtonThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    IconButtonThemeData? result;

    if (value is IconButtonThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/icon_button_theme_data',
        value: value,
        validate: validate,
      ));
      result = IconButtonThemeData(
        style: decodeButtonStyle(
          value['style'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] into an [IconData].  If the value is `null` then
  /// `null` will be returned.
  ///
  /// ```json
  /// {
  ///   "codePoint": "<int>",
  ///   "fontFamily": "<String>",
  ///   "fontPackage": "<String>",
  ///   "matchTextDirection": "<bool>"
  /// }
  /// ```
  static IconData? decodeIconData(
    dynamic value, {
    bool validate = true,
  }) {
    IconData? result;

    if (value is IconData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/icon_data',
        value: value,
        validate: validate,
      ));
      result = IconData(
        JsonClass.maybeParseInt(value['codePoint'])!,
        fontFamily: value['fontFamily'],
        fontPackage: value['fontPackage'],
        matchTextDirection: JsonClass.parseBool(value['matchTextDirection']),
      );
    }

    return result;
  }

  /// Decodes the given [value] into an [IconThemeData].  If the value is `null`
  /// then `null` will be returned.
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "fill": "<Color>",
  ///   "grade": "<double>",
  ///   "opacity": "<double>",
  ///   "opticalSize": "<double>",
  ///   "shadows": "<List<Shadow>>",
  ///   "size": "<double>",
  ///   "weight": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  static IconThemeData? decodeIconThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    IconThemeData? result;

    if (value is IconThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/icon_theme_data',
        value: value,
        validate: validate,
      ));
      result = IconThemeData(
        color: decodeColor(
          value['color'],
          validate: false,
        ),
        fill: JsonClass.maybeParseDouble(value['fill']),
        grade: JsonClass.maybeParseDouble(value['grade']),
        opacity: JsonClass.maybeParseDouble(value['opacity']),
        opticalSize: JsonClass.maybeParseDouble(value['opticalSize']),
        shadows: JsonClass.maybeFromDynamicList(
          value['shadows'],
          (map) => decodeShadow(
            map,
            validate: false,
          )!,
        ),
        size: JsonClass.maybeParseDouble(value['size']),
        weight: JsonClass.maybeParseDouble(value['weight']),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [ImageProvider].  This expects a specific
  /// "type" attribute to be one of:
  ///  * `asset`
  ///  * `memory`
  ///  * `network`
  ///
  /// The expected structure depends on the exact "type" value passed in.
  ///
  /// Type: `asset`
  /// ```json
  /// {
  ///   "assetName": "<String>",
  ///   "package": "<String>",
  ///   "type": "asset"
  /// }
  /// ```
  ///
  /// Type: `memory`
  /// ```json
  /// {
  ///   "bytes": "<String>",
  ///   "scale": "<double>",
  ///   "type": "memory"
  /// }
  /// ```
  ///
  /// Type: `network`
  /// ```json
  /// {
  ///   "headers": "<Map<String, String>>",
  ///   "type": "network",
  ///   "scale": "<double>",
  ///   "url": "<String>"
  /// }
  /// ```
  static ImageProvider? decodeImageProvider(
    dynamic value, {
    bool validate = true,
  }) {
    ImageProvider? result;
    if (value is ImageProvider) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);
      _checkSupported(
        'ImageProvider.type',
        [
          'asset',
          'network',
          'memory',
        ],
        value == null ? null : value['type'],
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/image_provider',
          value: value,
          validate: validate,
        ));
        switch (value['type']) {
          case 'asset':
            result = AssetImage(
              value['assetName'],
              package: value['package'],
            );
            break;
          case 'memory':
            result = MemoryImage(
              base64Decode(value['bytes']),
              scale: JsonClass.maybeParseDouble(value['scale'], 1.0)!,
            );
            break;
          case 'network':
            result = NetworkImage(
              value['url'],
              headers: value['headers'],
              scale: JsonClass.maybeParseDouble(value['scale'], 1.0)!,
            );
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] into an [ImageRepeat].  Supported values are:
  /// * `noRepeat`
  /// * `repeat`
  /// * `repeatX`
  /// * `repeatY`
  static ImageRepeat? decodeImageRepeat(
    dynamic value, {
    bool validate = true,
  }) {
    ImageRepeat? result;
    if (value is ImageRepeat) {
      result = value;
    } else {
      _checkSupported(
        'ImageRepeat',
        [
          'noRepeat',
          'repeat',
          'repeatX',
          'repeatY',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/image_repeat',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'noRepeat':
            result = ImageRepeat.noRepeat;
            break;
          case 'repeat':
            result = ImageRepeat.repeat;
            break;
          case 'repeatX':
            result = ImageRepeat.repeatX;
            break;
          case 'repeatY':
            result = ImageRepeat.repeatY;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [InputBorder].  This expects a specific
  /// "type" attribute to be one of:
  ///  * `outline`
  ///  * `underline`
  ///
  /// The expected structure depends on the exact "type" value passed in.
  ///
  /// Type: `outline`
  /// ```json
  /// {
  ///   borderRadius: "<BorderRadius>",
  ///   borderSide: "<BorderSide>",
  ///   gapPadding: "<double>"
  /// }
  /// ```
  ///
  /// Type: `underline`
  /// ```json
  /// {
  ///   borderRadius: "<BorderRadius>",
  ///   borderSide: "<BorderSide>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderRadius]
  ///  * [decodeBorderSide]
  static InputBorder? decodeInputBorder(
    dynamic value, {
    bool validate = true,
  }) {
    InputBorder? result;
    if (value is InputBorder) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);
      _checkSupported(
        'InputBorder.type',
        [
          'outline',
          'underline',
        ],
        value == null ? null : value['type'],
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/input_border',
          value: value,
          validate: validate,
        ));
        final String? type = value['type'];

        switch (type) {
          case 'outline':
            result = OutlineInputBorder(
              borderRadius: decodeBorderRadius(
                    value['borderRadius'],
                    validate: false,
                  ) ??
                  const BorderRadius.all(Radius.circular(4.0)),
              borderSide: decodeBorderSide(
                    value['borderSide'],
                    validate: false,
                  ) ??
                  const BorderSide(),
              gapPadding: JsonClass.maybeParseDouble(value['gapPadding'], 4.0)!,
            );
            break;

          case 'underline':
            result = UnderlineInputBorder(
              borderRadius: decodeBorderRadius(
                    value['borderRadius'],
                    validate: false,
                  ) ??
                  const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
              borderSide: decodeBorderSide(
                    value['borderSide'],
                    validate: false,
                  ) ??
                  const BorderSide(),
            );
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [InputDecorationTheme].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "activeIndicatorBorder": "<BorderSide>",
  ///   "alignLabelWithHint": "<bool>",
  ///   "border": "<InputBorder>",
  ///   "constraints": "<BoxConstraints>",
  ///   "contentPadding": "<EdgeInsetsGeometry>",
  ///   "counterStyle": "<TextStyle>",
  ///   "disabledBorder": "<InputBorder>",
  ///   "enabledBorder": "<InputBorder>",
  ///   "errorBorder": "<InputBorder>",
  ///   "errorMaxLines": "<int>",
  ///   "errorStyle": "<TextStyle>",
  ///   "fillColor": "<Color>",
  ///   "filled": "<bool>",
  ///   "floatingLabelAlignment": "<FloatingLabelAlignment>",
  ///   "floatingLabelBehavior": "<FloatingLabelBehavior>",
  ///   "floatingLabelStyle": "<TextStyle>",
  ///   "focusColor": "<Color>",
  ///   "focusedBorder": "<InputBorder>",
  ///   "focusedErrorBorder": "<InputBorder>",
  ///   "helperMaxLines": "<int>",
  ///   "helperStyle": "<TextStyle>",
  ///   "hintStyle": "<TextStyle>",
  ///   "hoverColor": "<Color>",
  ///   "iconColor": "<Color>",
  ///   "isCollapsed": "<bool>",
  ///   "isDense": "<bool>",
  ///   "labelStyle": "<TextStyle>",
  ///   "outlineBorder": "<BorderSide>",
  ///   "prefixIconColor": "<Color>",
  ///   "prefixStyle": "<TextStyle>",
  ///   "suffixStyle": "<Color>",
  ///   "suffixStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderSide]
  ///  * [decodeBoxConstraints]
  ///  * [decodeColor]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeInputBorder]
  ///  * [decodeFloatingLabelBehavior]
  ///  * [decodeTextStyle]
  static InputDecorationTheme? decodeInputDecorationTheme(
    dynamic value, {
    bool validate = true,
  }) {
    InputDecorationTheme? result;

    if (value is InputDecorationTheme) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/input_decoration_theme',
        value: value,
        validate: validate,
      ));
      result = InputDecorationTheme(
        activeIndicatorBorder: decodeBorderSide(
          value['activeIndicatorBorder'],
          validate: false,
        ),
        alignLabelWithHint: JsonClass.parseBool(value['alignLabelWithHint']),
        border: decodeInputBorder(
          value['border'],
          validate: false,
        ),
        constraints: decodeBoxConstraints(
          value['constraints'],
          validate: false,
        ),
        contentPadding: decodeEdgeInsetsGeometry(
          value['contentPadding'],
          validate: false,
        ),
        counterStyle: decodeTextStyle(
          value['counterStyle'],
          validate: false,
        ),
        disabledBorder: decodeInputBorder(
          value['disabledBorder'],
          validate: false,
        ),
        enabledBorder: decodeInputBorder(
          value['enabledBorder'],
          validate: false,
        ),
        errorBorder: decodeInputBorder(
          value['errorBorder'],
          validate: false,
        ),
        errorMaxLines: JsonClass.maybeParseInt(value['errorMaxLines']),
        errorStyle: decodeTextStyle(
          value['errorStyle'],
          validate: false,
        ),
        fillColor: decodeColor(
          value['fillColor'],
          validate: false,
        ),
        filled: JsonClass.parseBool(value['filled']),
        floatingLabelAlignment: decodeFloatingLabelAlignment(
              value['floatingLabelAlignment'],
              validate: false,
            ) ??
            FloatingLabelAlignment.start,
        floatingLabelBehavior: decodeFloatingLabelBehavior(
              value['floatingLabelBehavior'],
              validate: false,
            ) ??
            FloatingLabelBehavior.auto,
        floatingLabelStyle: decodeTextStyle(
          value['floatingLabelStyle'],
          validate: false,
        ),
        focusColor: decodeColor(
          value['focusColor'],
          validate: false,
        ),
        focusedBorder: decodeInputBorder(
          value['focusedBorder'],
          validate: false,
        ),
        focusedErrorBorder: decodeInputBorder(
          value['focusedErrorBorder'],
          validate: false,
        ),
        helperMaxLines: JsonClass.maybeParseInt(value['helperMaxLines']),
        helperStyle: decodeTextStyle(
          value['helperStyle'],
          validate: false,
        ),
        hintStyle: decodeTextStyle(
          value['hintStyle'],
          validate: false,
        ),
        hoverColor: decodeColor(
          value['hoverColor'],
          validate: false,
        ),
        iconColor: decodeColor(
          value['iconColor'],
          validate: false,
        ),
        isCollapsed: JsonClass.parseBool(value['isCollapsed']),
        isDense: JsonClass.parseBool(value['isDense']),
        labelStyle: decodeTextStyle(
          value['labelStyle'],
          validate: false,
        ),
        outlineBorder: decodeBorderSide(
          value['outlineBorder'],
          validate: false,
        ),
        prefixIconColor: decodeColor(
          value['prefixIconColor'],
          validate: false,
        ),
        prefixStyle: decodeTextStyle(
          value['prefixStyle'],
          validate: false,
        ),
        suffixIconColor: decodeColor(
          value['suffixIconColor'],
          validate: false,
        ),
        suffixStyle: decodeTextStyle(
          value['suffixStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to an [InteractiveInkFeatureFactory].  Supported
  /// values are:
  ///  * `splash`
  ///  * `ripple`
  ///  * `sparkle`
  ///
  static InteractiveInkFeatureFactory? decodeInteractiveInkFeatureFactory(
    dynamic value, {
    bool validate = true,
  }) {
    InteractiveInkFeatureFactory? result;
    if (value is InteractiveInkFeatureFactory) {
      result = value;
    } else {
      _checkSupported(
        'InteractiveInkFeatureFactory',
        [
          'splash',
          'ripple',
          'sparkle',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/interactive_ink_feature_factory',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'splash':
            result = InkSplash.splashFactory;
            break;

          case 'ripple':
            result = InkRipple.splashFactory;
            break;

          case 'sparkle':
            result = InkSparkle.splashFactory;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to an [ListTileStyle].  Supported
  /// values are:
  ///  * `drawer`
  ///  * `list`
  static ListTileStyle? decodeListTileStyle(
    dynamic value, {
    bool validate = true,
  }) {
    ListTileStyle? result;

    if (value is ListTileStyle) {
      result = value;
    } else if (value != null) {
      _checkSupported(
        'ListTileStyle',
        [
          'drawer',
          'list',
        ],
        value,
      );

      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/list_tile_style',
        value: value,
        validate: validate,
      ));

      switch (value) {
        case 'drawer':
          result = ListTileStyle.drawer;
          break;
        case 'list':
          result = ListTileStyle.list;
          break;
      }
    }

    return result;
  }

  /// Decodes the [value] to an [ListTileTitleAlignment].  Supported
  /// values are:
  ///  * `bottom`
  ///  * `center`
  ///  * `threeLine`
  ///  * `titleHeight`
  ///  * `top`
  static ListTileTitleAlignment? decodeListTileTitleAlignment(
    dynamic value, {
    bool validate = false,
  }) {
    ListTileTitleAlignment? result;

    if (value is ListTileTitleAlignment) {
      result = value;
    } else if (value != null) {
      _checkSupported(
        'ListTileTitleAlignment',
        [
          'bottom',
          'center',
          'threeLine',
          'titleHeight',
          'top',
        ],
        value,
      );

      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/list_tile_title_alignment',
        value: value,
        validate: validate,
      ));

      switch (value) {
        case 'bottom':
          result = ListTileTitleAlignment.bottom;
          break;
        case 'center':
          result = ListTileTitleAlignment.center;
          break;
        case 'threeLine':
          result = ListTileTitleAlignment.threeLine;
          break;
        case 'titleHeight':
          result = ListTileTitleAlignment.titleHeight;
          break;
        case 'top':
          result = ListTileTitleAlignment.top;
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [Locale].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "contentPadding": "<EdgeInsetsGeometry>",
  ///   "dense": "<bool>",
  ///   "enableFeedback": "<bool>",
  ///   "horizontalTitleGap": "<double>",
  ///   "iconColor": "<Color>",
  ///   "leadingAndTrailingTextStyle": "<TextStyle>",
  ///   "minLeadingWidth": "<double>",
  ///   "minVerticalPadding": "<double>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "selectedColor": "<Color>",
  ///   "selectedTileColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "style": "<ListTileStyle>",
  ///   "textColor": "<Color>",
  ///   "tileColor": "<Color>",
  ///   "visualDensity": "<VisualDensity>"
  /// }
  /// ```
  static ListTileThemeData? decodeListTileThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    ListTileThemeData? result;

    if (value is ListTileThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/list_tile_theme_data',
        value: value,
        validate: validate,
      ));

      result = ListTileThemeData(
        contentPadding: decodeEdgeInsetsGeometry(
          value['contentPadding'],
          validate: false,
        ),
        dense: JsonClass.maybeParseBool(value['dense']),
        enableFeedback: JsonClass.maybeParseBool(value['enableFeedback']),
        horizontalTitleGap:
            JsonClass.maybeParseDouble(value['horizontalTitleGap']),
        iconColor: decodeColor(
          value['iconColor'],
          validate: false,
        ),
        leadingAndTrailingTextStyle: decodeTextStyle(
          value['leadingAndTrailingTextStyle'],
          validate: false,
        ),
        minLeadingWidth: JsonClass.maybeParseDouble(value['minLeadingWidth']),
        minVerticalPadding:
            JsonClass.maybeParseDouble(value['minVerticalPadding']),
        mouseCursor: decodeMaterialStatePropertyMouseCursor(
          value['mouseCursor'],
          validate: false,
        ),
        selectedColor: decodeColor(
          value['selectedColor'],
          validate: false,
        ),
        selectedTileColor: decodeColor(
          value['selectedTileColor'],
          validate: false,
        ),
        shape: decodeShapeBorder(
          value['shape'],
          validate: false,
        ),
        subtitleTextStyle: decodeTextStyle(
          value['subtitleTextStyle'],
          validate: false,
        ),
        style: decodeListTileStyle(
          value['style'],
          validate: false,
        ),
        textColor: decodeColor(
          value['textColor'],
          validate: false,
        ),
        tileColor: decodeColor(
          value['tileColor'],
          validate: false,
        ),
        titleAlignment: decodeListTileTitleAlignment(
          value['titleAlignment'],
          validate: false,
        ),
        titleTextStyle: decodeTextStyle(
          value['titleTextStyle'],
          validate: false,
        ),
        visualDensity: decodeVisualDensity(
          value['visualDensity'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [Locale].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "countryCode": "<String>",
  ///   "languageCode": "<String>"
  /// }
  /// ```
  static Locale? decodeLocale(
    dynamic value, {
    bool validate = true,
  }) {
    Locale? result;

    if (value is Locale) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/locale',
        value: value,
        validate: validate,
      ));
      result = Locale(
        value['languageCode'],
        value['countryCode'],
      );
    }

    return result;
  }

  /// Decodes the [value] to a [MainAxisAlignment].  Supported values are:
  ///  * `center`
  ///  * `end`
  ///  * `spaceAround`
  ///  * `spaceBetween`
  ///  * `spaceEvenly`
  ///  * `start`
  static MainAxisAlignment? decodeMainAxisAlignment(
    dynamic value, {
    bool validate = true,
  }) {
    MainAxisAlignment? result;
    if (value is MainAxisAlignment) {
      result = value;
    } else {
      _checkSupported(
        'MainAxisAlignment',
        [
          'center',
          'end',
          'spaceAround',
          'spaceBetween',
          'spaceEvenly',
          'start',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/main_axis_alignment',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'center':
            result = MainAxisAlignment.center;
            break;
          case 'end':
            result = MainAxisAlignment.end;
            break;
          case 'spaceAround':
            result = MainAxisAlignment.spaceAround;
            break;
          case 'spaceBetween':
            result = MainAxisAlignment.spaceBetween;
            break;
          case 'spaceEvenly':
            result = MainAxisAlignment.spaceEvenly;
            break;
          case 'start':
            result = MainAxisAlignment.start;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [MainAxisSize].  Supported values are:
  ///  * `max`
  ///  * `min`
  static MainAxisSize? decodeMainAxisSize(
    dynamic value, {
    bool validate = true,
  }) {
    MainAxisSize? result;
    if (value is MainAxisSize) {
      result = value;
    } else {
      _checkSupported(
        'MainAxisSize',
        [
          'max',
          'min',
        ],
        value,
      );
      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/main_axis_size',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'max':
            result = MainAxisSize.max;
            break;
          case 'min':
            result = MainAxisSize.min;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [MaterialBannerThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "contentTextStyle": "<TextStyle>",
  ///   "dividerColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "leadingPadding": "<EdgeInsetsGeometry>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "shadowColor": "<Color>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeTextStyle]
  static MaterialBannerThemeData? decodeMaterialBannerThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialBannerThemeData? result;

    if (value is MaterialBannerThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/material_banner_theme_data',
        value: value,
        validate: validate,
      ));
      result = MaterialBannerThemeData(
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        contentTextStyle: decodeTextStyle(
          value['contentTextStyle'],
          validate: false,
        ),
        dividerColor: decodeColor(
          value['dividerColor'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        leadingPadding: decodeEdgeInsetsGeometry(
          value['leadingPadding'],
          validate: false,
        ),
        padding: decodeEdgeInsetsGeometry(
          value['padding'],
          validate: false,
        ),
        shadowColor: decodeColor(
          value['shadowColor'],
          validate: false,
        ),
        surfaceTintColor: decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [MaterialColor].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "primary": "<Color>",
  ///   "swatches": "<Map<String, Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  static MaterialColor? decodeMaterialColor(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialColor? result;

    if (value is MaterialColor) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/material_color',
        value: value,
        validate: validate,
      ));
      final swatches = <int, Color>{};

      final swatchesIn = value['swatches'];
      swatchesIn.forEach(
        (key, value) => swatches[JsonClass.maybeParseInt(key)!] = decodeColor(
          value,
          validate: false,
        )!,
      );

      result = MaterialColor(
        decodeColor(
          value['primary'],
          validate: false,
        )!
            .value,
        swatches,
      );
    }

    return result;
  }

  /// Decodes a [value] into a [double] based [MaterialStateProperty].  This
  /// accepts a [double] or a [String] which will be resolved for all states.
  ///
  /// Alternatively, if the [value] is a [Map] then this expects the following
  /// format:
  ///
  /// ```json
  /// {
  ///   "disabled": "<bool>",
  ///   "dragged": "<bool>",
  ///   "empty": "<bool>",
  ///   "error": "<bool>",
  ///   "focused": "<bool>",
  ///   "hovered": "<bool>",
  ///   "pressed": "<bool>",
  ///   "scrolledUnder": "<bool>",
  ///   "selected": "<bool>"
  /// }
  /// ```
  static MaterialStateProperty<bool?>? decodeMaterialStatePropertyBool(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialStateProperty<bool?>? result;

    if (value is MaterialStateProperty<bool?>) {
      result = value;
    } else if (value != null) {
      if (value is int || value is double || value is bool || value is String) {
        result = MaterialStateProperty.all<bool?>(JsonClass.parseBool(value));
      } else if (value is Map) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/material_state_property_bool',
          value: value,
          validate: validate,
        ));

        result = MapMaterialStateProperty.resolveWith((states) {
          bool? result;
          if (states.contains(MaterialState.disabled)) {
            result = JsonClass.maybeParseBool(value['disabled']);
          } else if (states.contains(MaterialState.dragged)) {
            result = JsonClass.maybeParseBool(value['dragged']);
          } else if (states.contains(MaterialState.error)) {
            result = JsonClass.maybeParseBool(value['error']);
          } else if (states.contains(MaterialState.focused)) {
            result = JsonClass.maybeParseBool(value['focused']);
          } else if (states.contains(MaterialState.hovered)) {
            result = JsonClass.maybeParseBool(value['hovered']);
          } else if (states.contains(MaterialState.pressed)) {
            result = JsonClass.maybeParseBool(value['pressed']);
          } else if (states.contains(MaterialState.scrolledUnder)) {
            result = JsonClass.maybeParseBool(value['scrolledUnder']);
          } else if (states.contains(MaterialState.selected)) {
            result = JsonClass.maybeParseBool(value['selected']);
          } else {
            result = JsonClass.maybeParseBool(value['empty']);
          }

          return result;
        });
      } else {
        result = MaterialStateProperty.all<bool?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [BorderSide] based [MaterialStateProperty].  This
  /// accepts a [BorderSide] or a [String] which will be resolved for all
  /// states.
  ///
  /// Alternatively, if the [value] is a [Map] then this expects the following
  /// format:
  ///
  /// ```json
  /// {
  ///   "disabled": "<BorderSide>",
  ///   "dragged": "<BorderSide>",
  ///   "empty": "<BorderSide>",
  ///   "error": "<BorderSide>",
  ///   "focused": "<BorderSide>",
  ///   "hovered": "<BorderSide>",
  ///   "pressed": "<BorderSide>",
  ///   "scrolledUnder": "<BorderSide>",
  ///   "selected": "<BorderSide>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderSide]
  static MaterialStateProperty<BorderSide?>?
      decodeMaterialStatePropertyBorderSide(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialStateProperty<BorderSide?>? result;

    if (value is MaterialStateProperty<BorderSide?>) {
      result = value;
    } else if (value != null) {
      if (value is BorderSide) {
        result = MaterialStateProperty.all<BorderSide?>(value);
      } else if (value is String) {
        result = MaterialStateProperty.all<BorderSide?>(
          decodeBorderSide(
            value,
            validate: false,
          ),
        );
      } else if (value is Map) {
        final testValues = [
          'disabled',
          'dragged',
          'empty',
          'error',
          'focused',
          'hovered',
          'pressed',
          'scrolledUnder',
          'selected',
        ];

        var isMsp = false;
        for (var key in value.keys) {
          if (testValues.contains(key)) {
            isMsp = true;
            break;
          }
        }

        if (isMsp != true) {
          result = MaterialStateProperty.all<BorderSide?>(
            decodeBorderSide(
              value,
              validate: false,
            ),
          );
        } else {
          assert(SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/material_state_property_border_side',
            value: value,
            validate: validate,
          ));

          result = MapMaterialStateProperty.resolveWith((states) {
            BorderSide? result;
            if (states.contains(MaterialState.disabled)) {
              result = decodeBorderSide(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(MaterialState.dragged)) {
              result = decodeBorderSide(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(MaterialState.error)) {
              result = decodeBorderSide(
                value['error'],
                validate: false,
              );
            } else if (states.contains(MaterialState.focused)) {
              result = decodeBorderSide(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(MaterialState.hovered)) {
              result = decodeBorderSide(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(MaterialState.pressed)) {
              result = decodeBorderSide(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(MaterialState.scrolledUnder)) {
              result = decodeBorderSide(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(MaterialState.selected)) {
              result = decodeBorderSide(
                value['selected'],
                validate: false,
              );
            } else {
              result = decodeBorderSide(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = MaterialStateProperty.all<BorderSide?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [Color] based [MaterialStateProperty].  This
  /// accepts a [Color] or a [String] which will be resolved for all states.
  ///
  /// Alternatively, if the [value] is a [Map] then this expects the following
  /// format:
  ///
  /// ```json
  /// {
  ///   "disabled": "<Color>",
  ///   "dragged": "<Color>",
  ///   "empty": "<Color>",
  ///   "error": "<Color>",
  ///   "focused": "<Color>",
  ///   "hovered": "<Color>",
  ///   "pressed": "<Color>",
  ///   "scrolledUnder": "<Color>",
  ///   "selected": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  static MaterialStateProperty<Color?>? decodeMaterialStatePropertyColor(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialStateProperty<Color?>? result;

    if (value is MaterialStateProperty<Color?>) {
      result = value;
    } else if (value != null) {
      if (value is Color) {
        result = MaterialStateProperty.all<Color?>(value);
      } else if (value is String) {
        result = MaterialStateProperty.all<Color?>(decodeColor(
          value,
          validate: false,
        ));
      } else if (value is Map) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/material_state_property_color',
          value: value,
          validate: validate,
        ));

        result = MapMaterialStateProperty.resolveWith((states) {
          Color? result;
          if (states.contains(MaterialState.disabled)) {
            result = decodeColor(
              value['disabled'],
              validate: false,
            );
          } else if (states.contains(MaterialState.dragged)) {
            result = decodeColor(
              value['dragged'],
              validate: false,
            );
          } else if (states.contains(MaterialState.error)) {
            result = decodeColor(
              value['error'],
              validate: false,
            );
          } else if (states.contains(MaterialState.focused)) {
            result = decodeColor(
              value['focused'],
              validate: false,
            );
          } else if (states.contains(MaterialState.pressed)) {
            result = decodeColor(
              value['pressed'],
              validate: false,
            );
          } else if (states.contains(MaterialState.hovered)) {
            result = decodeColor(
              value['hovered'],
              validate: false,
            );
          } else if (states.contains(MaterialState.scrolledUnder)) {
            result = decodeColor(
              value['scrolledUnder'],
              validate: false,
            );
          } else if (states.contains(MaterialState.selected)) {
            result = decodeColor(
              value['selected'],
              validate: false,
            );
          } else {
            result = decodeColor(
              value['empty'],
              validate: false,
            );
          }

          return result;
        });
      } else {
        result = MaterialStateProperty.all<Color?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [double] based [MaterialStateProperty].  This
  /// accepts a [double] or a [String] which will be resolved for all states.
  ///
  /// Alternatively, if the [value] is a [Map] then this expects the following
  /// format:
  ///
  /// ```json
  /// {
  ///   "disabled": "<double>",
  ///   "dragged": "<double>",
  ///   "empty": "<double>",
  ///   "error": "<double>",
  ///   "focused": "<double>",
  ///   "hovered": "<double>",
  ///   "pressed": "<double>",
  ///   "scrolledUnder": "<double>",
  ///   "selected": "<double>"
  /// }
  /// ```
  static MaterialStateProperty<double?>? decodeMaterialStatePropertyDouble(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialStateProperty<double?>? result;

    if (value is MaterialStateProperty<double?>) {
      result = value;
    } else if (value != null) {
      if (value is int) {
        result = MaterialStateProperty.all<double?>(value.toDouble());
      } else if (value is double) {
        result = MaterialStateProperty.all<double?>(value);
      } else if (value is String) {
        result = MaterialStateProperty.all<double?>(
          JsonClass.maybeParseDouble(value),
        );
      } else if (value is Map) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/material_state_property_double',
          value: value,
          validate: validate,
        ));

        result = MapMaterialStateProperty.resolveWith((states) {
          double? result;
          if (states.contains(MaterialState.disabled)) {
            result = JsonClass.maybeParseDouble(value['disabled']);
          } else if (states.contains(MaterialState.dragged)) {
            result = JsonClass.maybeParseDouble(value['dragged']);
          } else if (states.contains(MaterialState.error)) {
            result = JsonClass.maybeParseDouble(value['error']);
          } else if (states.contains(MaterialState.focused)) {
            result = JsonClass.maybeParseDouble(value['focused']);
          } else if (states.contains(MaterialState.hovered)) {
            result = JsonClass.maybeParseDouble(value['hovered']);
          } else if (states.contains(MaterialState.pressed)) {
            result = JsonClass.maybeParseDouble(value['pressed']);
          } else if (states.contains(MaterialState.scrolledUnder)) {
            result = JsonClass.maybeParseDouble(value['scrolledUnder']);
          } else if (states.contains(MaterialState.selected)) {
            result = JsonClass.maybeParseDouble(value['selected']);
          } else {
            result = JsonClass.maybeParseDouble(value['empty']);
          }

          return result;
        });
      } else {
        result = MaterialStateProperty.all<double?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [EdgeInsetsGeometry] based
  /// [MaterialStateProperty].
  ///
  /// If the value is a [String], [double], or [int] then this will parse the
  /// number and pass it to [EdgeInsets.all] for each state.
  ///
  /// If the value is an array with two entities, this calls
  /// [EdgeInsets.symmetric] with the first element passed as the horizontal and
  /// the second as the vertical.
  ///
  /// If the value is an array with four entities, this calls
  /// [EdgeInsets.fromLTRB] passing each element in order.
  ///
  /// The value may be a [Map] in the following format:
  /// ```json
  /// {
  ///   "bottom": "<double>",
  ///   "left": "<double>",
  ///   "right": "<double>",
  ///   "top": "<double>"
  /// }
  /// ```
  ///
  /// Finally, the [value] may be a [Map] in the following format:
  ///
  /// ```json
  /// {
  ///   "disabled": "<EdgeInsetsGeometry>",
  ///   "dragged": "<EdgeInsetsGeometry>",
  ///   "empty": "<EdgeInsetsGeometry>",
  ///   "error": "<EdgeInsetsGeometry>",
  ///   "focused": "<EdgeInsetsGeometry>",
  ///   "hovered": "<EdgeInsetsGeometry>",
  ///   "pressed": "<EdgeInsetsGeometry>",
  ///   "scrolledUnder": "<EdgeInsetsGeometry>",
  ///   "selected": "<EdgeInsetsGeometry>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeEdgeInsetsGeometry]
  static MaterialStateProperty<EdgeInsetsGeometry?>?
      decodeMaterialStatePropertyEdgeInsetsGeometry(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialStateProperty<EdgeInsetsGeometry?>? result;

    if (value is MaterialStateProperty<EdgeInsetsGeometry?>) {
      result = value;
    } else if (value != null) {
      if (value is EdgeInsetsGeometry) {
        result = MaterialStateProperty.all<EdgeInsetsGeometry?>(value);
      } else if (value is String || value is List || value is int) {
        result = MaterialStateProperty.all<EdgeInsetsGeometry?>(
          decodeEdgeInsetsGeometry(
            value,
            validate: false,
          ),
        );
      } else if (value is Map) {
        final testValues = [
          'disabled',
          'dragged',
          'empty',
          'error',
          'focused',
          'hovered',
          'pressed',
          'scrolledUnder',
          'selected',
        ];

        var isMsp = false;
        for (var key in value.keys) {
          if (testValues.contains(key)) {
            isMsp = true;
            break;
          }
        }

        if (isMsp != true) {
          result = MaterialStateProperty.all<EdgeInsetsGeometry?>(
            decodeEdgeInsetsGeometry(
              value,
              validate: false,
            ),
          );
        } else {
          assert(SchemaValidator.validate(
            schemaId:
                '$_baseSchemaUrl/material_state_property_edge_insets_geometry',
            value: value,
            validate: validate,
          ));

          result = MapMaterialStateProperty.resolveWith((states) {
            EdgeInsetsGeometry? result;
            if (states.contains(MaterialState.disabled)) {
              result = decodeEdgeInsetsGeometry(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(MaterialState.dragged)) {
              result = decodeEdgeInsetsGeometry(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(MaterialState.error)) {
              result = decodeEdgeInsetsGeometry(
                value['error'],
                validate: false,
              );
            } else if (states.contains(MaterialState.focused)) {
              result = decodeEdgeInsetsGeometry(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(MaterialState.hovered)) {
              result = decodeEdgeInsetsGeometry(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(MaterialState.pressed)) {
              result = decodeEdgeInsetsGeometry(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(MaterialState.scrolledUnder)) {
              result = decodeEdgeInsetsGeometry(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(MaterialState.selected)) {
              result = decodeEdgeInsetsGeometry(
                value['selected'],
                validate: false,
              );
            } else {
              result = decodeEdgeInsetsGeometry(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = MaterialStateProperty.all<EdgeInsetsGeometry?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [Icon] based [MaterialStateProperty].  This
  /// accepts a [Icon] or a [String] which will be resolved for all states.
  ///
  /// Alternatively, if the [value] is a [Map] then this expects the following
  /// format:
  ///
  /// ```json
  /// {
  ///   "disabled": "<Icon>",
  ///   "dragged": "<Icon>",
  ///   "empty": "<Icon>",
  ///   "error": "<Icon>",
  ///   "focused": "<Icon>",
  ///   "hovered": "<Icon>",
  ///   "pressed": "<Icon>",
  ///   "scrolledUnder": "<Icon>",
  ///   "selected": "<Icon>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeIconData]
  static MaterialStateProperty<Icon?>? decodeMaterialStatePropertyIcon(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialStateProperty<Icon?>? result;

    if (value is MaterialStateProperty<Icon?>) {
      result = value;
    } else if (value != null) {
      if (value is Icon) {
        result = MaterialStateProperty.all<Icon?>(value);
      } else if (value is IconData) {
        result = MaterialStateProperty.all<Icon?>(Icon(value));
      } else if (value is Map) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/material_state_property_icon',
          value: value,
          validate: validate,
        ));

        result = MapMaterialStateProperty.resolveWith((states) {
          Icon? result;
          if (states.contains(MaterialState.disabled)) {
            result = decodeIcon(
              value['disabled'],
              validate: false,
            );
          } else if (states.contains(MaterialState.dragged)) {
            result = decodeIcon(
              value['dragged'],
              validate: false,
            );
          } else if (states.contains(MaterialState.error)) {
            result = decodeIcon(
              value['error'],
              validate: false,
            );
          } else if (states.contains(MaterialState.focused)) {
            result = decodeIcon(
              value['focused'],
              validate: false,
            );
          } else if (states.contains(MaterialState.pressed)) {
            result = decodeIcon(
              value['pressed'],
              validate: false,
            );
          } else if (states.contains(MaterialState.hovered)) {
            result = decodeIcon(
              value['hovered'],
              validate: false,
            );
          } else if (states.contains(MaterialState.scrolledUnder)) {
            result = decodeIcon(
              value['scrolledUnder'],
              validate: false,
            );
          } else if (states.contains(MaterialState.selected)) {
            result = decodeIcon(
              value['selected'],
              validate: false,
            );
          } else {
            result = decodeIcon(
              value['empty'],
              validate: false,
            );
          }

          return result;
        });
      } else {
        result = MaterialStateProperty.all<Icon?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [IconThemeData] based [MaterialStateProperty].
  /// This accepts a [IconThemeData] or a [String] which will be resolved for
  /// all states.
  ///
  /// Alternatively, if the [value] is a [Map] then this expects the following
  /// format:
  ///
  /// ```json
  /// {
  ///   "disabled": "<IconThemeData>",
  ///   "dragged": "<IconThemeData>",
  ///   "empty": "<IconThemeData>",
  ///   "error": "<IconThemeData>",
  ///   "focused": "<IconThemeData>",
  ///   "hovered": "<IconThemeData>",
  ///   "pressed": "<IconThemeData>",
  ///   "scrolledUnder": "<IconThemeData>",
  ///   "selected": "<IconThemeData>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeIconThemeData]
  static MaterialStateProperty<IconThemeData?>?
      decodeMaterialStatePropertyIconThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialStateProperty<IconThemeData?>? result;

    if (value is MaterialStateProperty<IconThemeData?>) {
      result = value;
    } else if (value != null) {
      if (value is IconThemeData) {
        result = MaterialStateProperty.all<IconThemeData?>(value);
      } else if (value is String) {
        result = MaterialStateProperty.all<IconThemeData?>(
          decodeIconThemeData(
            value,
            validate: false,
          ),
        );
      } else if (value is Map) {
        final testValues = [
          'disabled',
          'dragged',
          'empty',
          'error',
          'focused',
          'hovered',
          'pressed',
          'scrolledUnder',
          'selected',
        ];

        var isMsp = false;
        for (var key in value.keys) {
          if (testValues.contains(key)) {
            isMsp = true;
            break;
          }
        }

        if (isMsp != true) {
          result = MaterialStateProperty.all<IconThemeData?>(
            decodeIconThemeData(
              value,
              validate: false,
            ),
          );
        } else {
          assert(SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/material_state_property_icon_theme_data',
            value: value,
            validate: validate,
          ));

          result = MapMaterialStateProperty.resolveWith((states) {
            IconThemeData? result;
            if (states.contains(MaterialState.disabled)) {
              result = decodeIconThemeData(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(MaterialState.dragged)) {
              result = decodeIconThemeData(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(MaterialState.error)) {
              result = decodeIconThemeData(
                value['error'],
                validate: false,
              );
            } else if (states.contains(MaterialState.focused)) {
              result = decodeIconThemeData(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(MaterialState.hovered)) {
              result = decodeIconThemeData(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(MaterialState.pressed)) {
              result = decodeIconThemeData(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(MaterialState.scrolledUnder)) {
              result = decodeIconThemeData(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(MaterialState.selected)) {
              result = decodeIconThemeData(
                value['selected'],
                validate: false,
              );
            } else {
              result = decodeIconThemeData(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = MaterialStateProperty.all<IconThemeData?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [MouseCursor] based [MaterialStateProperty].
  /// This accepts a [MouseCursor] or a [String] which will be resolved for all
  /// states.
  ///
  /// Alternatively, if the [value] is a [Map] then this expects the following
  /// format:
  ///
  /// ```json
  /// {
  ///   "disabled": "<MouseCursor>",
  ///   "dragged": "<MouseCursor>",
  ///   "empty": "<MouseCursor>",
  ///   "error": "<MouseCursor>",
  ///   "focused": "<MouseCursor>",
  ///   "hovered": "<MouseCursor>",
  ///   "pressed": "<MouseCursor>",
  ///   "scrolledUnder": "<MouseCursor>",
  ///   "selected": "<MouseCursor>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeMouseCursor]
  static MaterialStateProperty<MouseCursor?>?
      decodeMaterialStatePropertyMouseCursor(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialStateProperty<MouseCursor?>? result;

    if (value is MaterialStateProperty<MouseCursor?>) {
      result = value;
    } else if (value != null) {
      if (value is MouseCursor) {
        result = MaterialStateProperty.all<MouseCursor?>(value);
      } else if (value is String) {
        result = MaterialStateProperty.all<MouseCursor?>(decodeMouseCursor(
          value,
          validate: false,
        ));
      } else if (value is Map) {
        final testValues = [
          'disabled',
          'dragged',
          'empty',
          'error',
          'focused',
          'hovered',
          'pressed',
          'scrolledUnder',
          'selected',
        ];

        var isMsp = false;
        for (var key in value.keys) {
          if (testValues.contains(key)) {
            isMsp = true;
            break;
          }
        }

        if (isMsp != true) {
          result = MaterialStateProperty.all<MouseCursor?>(
            decodeMouseCursor(
              value,
              validate: false,
            ),
          );
        } else {
          assert(SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/material_state_property_mouse_cursor',
            value: value,
            validate: validate,
          ));

          result = MapMaterialStateProperty.resolveWith((states) {
            MouseCursor? result;
            if (states.contains(MaterialState.disabled)) {
              result = decodeMouseCursor(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(MaterialState.dragged)) {
              result = decodeMouseCursor(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(MaterialState.error)) {
              result = decodeMouseCursor(
                value['error'],
                validate: false,
              );
            } else if (states.contains(MaterialState.focused)) {
              result = decodeMouseCursor(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(MaterialState.hovered)) {
              result = decodeMouseCursor(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(MaterialState.pressed)) {
              result = decodeMouseCursor(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(MaterialState.scrolledUnder)) {
              result = decodeMouseCursor(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(MaterialState.selected)) {
              result = decodeMouseCursor(
                value['selected'],
                validate: false,
              );
            } else {
              result = decodeMouseCursor(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = MaterialStateProperty.all<MouseCursor?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [OutlinedBorder] based [MaterialStateProperty].
  /// This accepts a [OutlinedBorder] or a [String] which will be resolved for
  /// all states.
  ///
  /// Alternatively, if the [value] is a [Map] then this expects the following
  /// format:
  ///
  /// ```json
  /// {
  ///   "disabled": "<OutlinedBorder>",
  ///   "dragged": "<OutlinedBorder>",
  ///   "empty": "<OutlinedBorder>",
  ///   "error": "<OutlinedBorder>",
  ///   "focused": "<OutlinedBorder>",
  ///   "hovered": "<OutlinedBorder>",
  ///   "pressed": "<OutlinedBorder>",
  ///   "scrolledUnder": "<OutlinedBorder>",
  ///   "selected": "<OutlinedBorder>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeOutlinedBorder]
  static MaterialStateProperty<OutlinedBorder?>?
      decodeMaterialStatePropertyOutlinedBorder(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialStateProperty<OutlinedBorder?>? result;

    if (value is MaterialStateProperty<OutlinedBorder?>) {
      result = value;
    } else if (value != null) {
      if (value is OutlinedBorder) {
        result = MaterialStateProperty.all<OutlinedBorder?>(value);
      } else if (value is String) {
        result = MaterialStateProperty.all<OutlinedBorder?>(
          decodeOutlinedBorder(
            value,
            validate: false,
          ),
        );
      } else if (value is Map) {
        final testValues = [
          'disabled',
          'dragged',
          'empty',
          'error',
          'focused',
          'hovered',
          'pressed',
          'scrolledUnder',
          'selected',
        ];

        var isMsp = false;
        for (var key in value.keys) {
          if (testValues.contains(key)) {
            isMsp = true;
            break;
          }
        }

        if (isMsp != true) {
          result = MaterialStateProperty.all<OutlinedBorder?>(
            decodeOutlinedBorder(
              value,
              validate: false,
            ),
          );
        } else {
          assert(SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/material_state_property_outlined_border',
            value: value,
            validate: validate,
          ));

          result = MapMaterialStateProperty.resolveWith((states) {
            OutlinedBorder? result;
            if (states.contains(MaterialState.disabled)) {
              result = decodeOutlinedBorder(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(MaterialState.dragged)) {
              result = decodeOutlinedBorder(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(MaterialState.error)) {
              result = decodeOutlinedBorder(
                value['error'],
                validate: false,
              );
            } else if (states.contains(MaterialState.focused)) {
              result = decodeOutlinedBorder(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(MaterialState.hovered)) {
              result = decodeOutlinedBorder(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(MaterialState.pressed)) {
              result = decodeOutlinedBorder(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(MaterialState.scrolledUnder)) {
              result = decodeOutlinedBorder(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(MaterialState.selected)) {
              result = decodeOutlinedBorder(
                value['selected'],
                validate: false,
              );
            } else {
              result = decodeOutlinedBorder(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = MaterialStateProperty.all<OutlinedBorder?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [Size] based [MaterialStateProperty].  This
  /// accepts a [Size] or a [String] which will be resolved for all states.
  ///
  /// Alternatively, if the [value] is a [Map] then this expects the following
  /// format:
  ///
  /// ```json
  /// {
  ///   "disabled": "<Size>",
  ///   "dragged": "<Size>",
  ///   "empty": "<Size>",
  ///   "error": "<Size>",
  ///   "focused": "<Size>",
  ///   "hovered": "<Size>",
  ///   "pressed": "<Size>",
  ///   "scrolledUnder": "<Size>",
  ///   "selected": "<Size>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeSize]
  static MaterialStateProperty<Size?>? decodeMaterialStatePropertySize(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialStateProperty<Size?>? result;

    if (value is MaterialStateProperty<Size?>) {
      result = value;
    } else if (value != null) {
      if (value is Size) {
        result = MaterialStateProperty.all<Size?>(value);
      } else if (value is String) {
        result = MaterialStateProperty.all<Size?>(decodeSize(
          value,
          validate: false,
        ));
      } else if (value is Map) {
        final testValues = [
          'disabled',
          'dragged',
          'empty',
          'error',
          'focused',
          'hovered',
          'pressed',
          'scrolledUnder',
          'selected',
        ];

        var isMsp = false;
        for (var key in value.keys) {
          if (testValues.contains(key)) {
            isMsp = true;
            break;
          }
        }

        if (isMsp != true) {
          result = MaterialStateProperty.all<Size?>(decodeSize(
            value,
            validate: false,
          ));
        } else {
          assert(SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/material_state_property_size',
            value: value,
            validate: validate,
          ));

          result = MapMaterialStateProperty.resolveWith((states) {
            Size? result;
            if (states.contains(MaterialState.disabled)) {
              result = decodeSize(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(MaterialState.dragged)) {
              result = decodeSize(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(MaterialState.error)) {
              result = decodeSize(
                value['error'],
                validate: false,
              );
            } else if (states.contains(MaterialState.focused)) {
              result = decodeSize(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(MaterialState.hovered)) {
              result = decodeSize(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(MaterialState.pressed)) {
              result = decodeSize(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(MaterialState.scrolledUnder)) {
              result = decodeSize(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(MaterialState.selected)) {
              result = decodeSize(
                value['selected'],
                validate: false,
              );
            } else {
              result = decodeSize(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = MaterialStateProperty.all<Size?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [TextStyle] based [MaterialStateProperty].  This
  /// accepts a [TextStyle] or a [String] which will be resolved for all states.
  ///
  /// Alternatively, if the [value] is a [Map] then this expects the following
  /// format:
  ///
  /// ```json
  /// {
  ///   "disabled": "<TextStyle>",
  ///   "dragged": "<TextStyle>",
  ///   "empty": "<TextStyle>",
  ///   "error": "<TextStyle>",
  ///   "focused": "<TextStyle>",
  ///   "hovered": "<TextStyle>",
  ///   "pressed": "<TextStyle>",
  ///   "scrolledUnder": "<TextStyle>",
  ///   "selected": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeTextStyle]
  static MaterialStateProperty<TextStyle?>?
      decodeMaterialStatePropertyTextStyle(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialStateProperty<TextStyle?>? result;

    if (value is MaterialStateProperty<TextStyle?>) {
      result = value;
    } else if (value != null) {
      if (value is TextStyle) {
        result = MaterialStateProperty.all<TextStyle?>(value);
      } else if (value is String) {
        result = MaterialStateProperty.all<TextStyle?>(decodeTextStyle(
          value,
          validate: false,
        ));
      } else if (value is Map) {
        final testValues = [
          'disabled',
          'dragged',
          'empty',
          'error',
          'focused',
          'hovered',
          'pressed',
          'scrolledUnder',
          'selected',
        ];

        var isMsp = false;
        for (var key in value.keys) {
          if (testValues.contains(key)) {
            isMsp = true;
            break;
          }
        }

        if (isMsp != true) {
          result = MaterialStateProperty.all<TextStyle?>(
            decodeTextStyle(
              value,
              validate: false,
            ),
          );
        } else {
          assert(SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/material_state_property_text_style',
            value: value,
            validate: validate,
          ));

          result = MapMaterialStateProperty.resolveWith((states) {
            TextStyle? result;
            if (states.contains(MaterialState.disabled)) {
              result = decodeTextStyle(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(MaterialState.dragged)) {
              result = decodeTextStyle(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(MaterialState.error)) {
              result = decodeTextStyle(
                value['error'],
                validate: false,
              );
            } else if (states.contains(MaterialState.focused)) {
              result = decodeTextStyle(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(MaterialState.hovered)) {
              result = decodeTextStyle(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(MaterialState.pressed)) {
              result = decodeTextStyle(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(MaterialState.scrolledUnder)) {
              result = decodeTextStyle(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(MaterialState.selected)) {
              result = decodeTextStyle(
                value['selected'],
                validate: false,
              );
            } else {
              result = decodeTextStyle(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = MaterialStateProperty.all<TextStyle?>(value);
      }
    }
    return result;
  }

  /// Decodes the [value] to a [MaterialTargetTapSize].  Supported values are:
  ///  * `padded`
  ///  * `shrinkWrap`
  static MaterialTapTargetSize? decodeMaterialTapTargetSize(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialTapTargetSize? result;
    if (value is MaterialTapTargetSize) {
      result = value;
    } else {
      _checkSupported(
        'MaterialTapTargetSize',
        [
          'padded',
          'shrinkWrap',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/material_tap_target_size',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'padded':
            result = MaterialTapTargetSize.padded;
            break;
          case 'shrinkWrap':
            result = MaterialTapTargetSize.shrinkWrap;
            break;
        }
      }
    }
    return result;
  }

  /// Decodes the [value] to a [MaterialType].  Supported values are:
  ///  * `button`
  ///  * `canvas`
  ///  * `card`
  ///  * `circle`
  ///  * `transparency`
  static MaterialType? decodeMaterialType(
    dynamic value, {
    bool validate = true,
  }) {
    MaterialType? result;
    if (value is MaterialType) {
      result = value;
    } else {
      _checkSupported(
        'MaterialType',
        [
          'button',
          'canvas',
          'card',
          'circle',
          'transparency',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/material_type',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'button':
            result = MaterialType.button;
            break;
          case 'canvas':
            result = MaterialType.canvas;
            break;
          case 'card':
            result = MaterialType.card;
            break;
          case 'circle':
            result = MaterialType.circle;
            break;
          case 'transparency':
            result = MaterialType.transparency;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [Matrix4]. This requires the value to be an
  /// [Iterable] of [double] with exactly 16 elements in it.
  ///
  /// The array is expected to be in the following format:
  /// ```
  /// [
  ///   x0,
  ///   x1,
  ///   x2,
  ///   x3,
  ///   y0,
  ///   y1,
  ///   y2,
  ///   y3,
  ///   z0,
  ///   z1,
  ///   z2,
  ///   z3,
  ///   w0,
  ///   w1,
  ///   w2,
  ///   w3
  /// ]
  /// ```
  static Matrix4? decodeMatrix4(
    dynamic value, {
    bool validate = true,
  }) {
    Matrix4? result;

    if (value is Matrix4) {
      result = value;
    } else {
      if (value is Iterable) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/matrix4',
          value: value,
          validate: validate,
        ));
        final list = value.toList();
        result = Matrix4(
          JsonClass.maybeParseDouble(list[0])!,
          JsonClass.maybeParseDouble(list[1])!,
          JsonClass.maybeParseDouble(list[2])!,
          JsonClass.maybeParseDouble(list[3])!,
          JsonClass.maybeParseDouble(list[4])!,
          JsonClass.maybeParseDouble(list[5])!,
          JsonClass.maybeParseDouble(list[6])!,
          JsonClass.maybeParseDouble(list[7])!,
          JsonClass.maybeParseDouble(list[8])!,
          JsonClass.maybeParseDouble(list[9])!,
          JsonClass.maybeParseDouble(list[10])!,
          JsonClass.maybeParseDouble(list[11])!,
          JsonClass.maybeParseDouble(list[12])!,
          JsonClass.maybeParseDouble(list[13])!,
          JsonClass.maybeParseDouble(list[14])!,
          JsonClass.maybeParseDouble(list[15])!,
        );
      }
    }

    return result;
  }

  /// Decodes the [value] to a [MaxLengthEnforcement].  Supported values are:
  ///  * `enforced`
  ///  * `none`
  ///  * `truncateAfterCompositionEnds`
  static MaxLengthEnforcement? decodeMaxLengthEnforcement(
    dynamic value, {
    bool validate = true,
  }) {
    MaxLengthEnforcement? result;
    if (value is MaxLengthEnforcement) {
      result = value;
    } else {
      _checkSupported(
        'MaxLengthEnforcement',
        [
          'enforced',
          'none',
          'truncateAfterCompositionEnds',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/max_length_enforcement',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'enforced':
            result = MaxLengthEnforcement.enforced;
            break;
          case 'none':
            result = MaxLengthEnforcement.none;
            break;
          case 'truncateAfterCompositionEnds':
            result = MaxLengthEnforcement.truncateAfterCompositionEnds;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [MenuBarThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "style": "<MenuStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeMenuStyle]
  static MenuBarThemeData? decodeMenuBarThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    MenuBarThemeData? result;

    if (value is MenuBarThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/menu_bar_theme_data',
        value: value,
        validate: validate,
      ));

      result = MenuBarThemeData(
        style: decodeMenuStyle(
          value,
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [MenuButtonThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "style": "<ButtonStyle>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeButtonStyle]
  static MenuButtonThemeData? decodeMenuButtonThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    MenuButtonThemeData? result;

    if (value is MenuButtonThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/menu_button_theme_data',
        value: value,
        validate: validate,
      ));

      result = MenuButtonThemeData(
        style: decodeButtonStyle(
          value['style'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [MenuStyle].  This expects the given
  /// [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": "<Alignment>",
  ///   "backgroundColor": "<MaterialStateProperty<Color>>",
  ///   "elevation": "<MaterialStateProperty<double>>",
  ///   "fixedSize": "<MaterialStateProperty<Size>>",
  ///   "maximumSize": "<MaterialStateProperty<Size>>",
  ///   "minimumSize": "<MaterialStateProperty<Size>>",
  ///   "padding": "<MaterialStateProperty<EdgeInsets>>",
  ///   "shadowColor": "<MaterialStateProperty<Color>>",
  ///   "shape": "<MaterialStateProperty<OutlinedBorder>>",
  ///   "side": "<MaterialStateProperty<BorderSide>>",
  ///   "surfaceTintColor": "<MaterialStateProperty<Color>>",
  ///   "visualDensity": "<VisualDensity>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeAlignment]
  ///  * [decodeMaterialStatePropertyBorderSide]
  ///  * [decodeMaterialStatePropertyColor]
  ///  * [decodeMaterialStatePropertyDouble]
  ///  * [decodeMaterialStatePropertyEdgeInsetsGeometry]
  ///  * [decodeMaterialStatePropertyMouseCursor]
  ///  * [decodeMaterialStatePropertySize]
  ///  * [decodeVisualDensity]
  static MenuStyle? decodeMenuStyle(
    dynamic value, {
    bool validate = true,
  }) {
    MenuStyle? result;

    if (value is MenuStyle) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/menu_style',
        value: value,
        validate: validate,
      ));

      result = MenuStyle(
        alignment: decodeAlignment(
          value['alignment'],
          validate: false,
        ),
        backgroundColor: decodeMaterialStatePropertyColor(
          value['backgroundColor'],
          validate: false,
        ),
        elevation: decodeMaterialStatePropertyDouble(
          value['elevation'],
          validate: false,
        ),
        fixedSize: decodeMaterialStatePropertySize(value['fixedSize'],
            validate: false),
        maximumSize: decodeMaterialStatePropertySize(
          value['maximumSize'],
          validate: false,
        ),
        minimumSize: decodeMaterialStatePropertySize(
          value['minimumSize'],
          validate: false,
        ),
        mouseCursor: decodeMaterialStatePropertyMouseCursor(
          value['mouseCursor'],
          validate: false,
        ),
        padding: decodeMaterialStatePropertyEdgeInsetsGeometry(
          value['padding'],
          validate: false,
        ),
        shadowColor: decodeMaterialStatePropertyColor(
          value['shadowColor'],
          validate: false,
        ),
        shape: decodeMaterialStatePropertyOutlinedBorder(
          value['shape'],
          validate: false,
        ),
        side: decodeMaterialStatePropertyBorderSide(
          value['side'],
          validate: false,
        ),
        surfaceTintColor: decodeMaterialStatePropertyColor(
          value['surfaceTintColor'],
          validate: false,
        ),
        visualDensity: decodeVisualDensity(
          value['visualDensity'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [MenuThemeData].  This expects the given
  /// [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "style": "<MenuStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeMenuStyle]
  static MenuThemeData? decodeMenuThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    MenuThemeData? result;

    if (value is MenuThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/menu_theme_data',
        value: value,
        validate: validate,
      ));

      result = MenuThemeData(
        style: decodeMenuStyle(
          value['style'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to a [MouseCursor].  There must be a "type"
  /// attribute that is one of:
  ///  * `defer`
  ///  * `material`
  ///  * `system`
  ///  * `uncontrolled`
  ///
  /// When the `type` is `material`, this expects a `cursor` that is one of:
  ///  * `clickable`
  ///  * `textable`
  ///
  /// When the `type` is `system`, this expects a `cursor` that is one of:
  ///  * `alias`
  ///  * `allScroll`
  ///  * `basic`
  ///  * `cell`
  ///  * `click`
  ///  * `contextMenu`
  ///  * `copy`
  ///  * `disappearing`
  ///  * `forbidden`
  ///  * `grab`
  ///  * `grabbing`
  ///  * `help`
  ///  * `move`
  ///  * `noDrop`
  ///  * `none`
  ///  * `precise`
  ///  * `progress`
  ///  * `resizeColumn`
  ///  * `resizeDown`
  ///  * `resizeDownLeft`
  ///  * `resizeDownRight`
  ///  * `resizeLeft`
  ///  * `resizeRight`
  ///  * `resizeRow`
  ///  * `resizeUp`
  ///  * `resizeUpDown`
  ///  * `resizeUpLeft`
  ///  * `resizeUpLeftDownRight`
  ///  * `resizeUpRight`
  ///  * `resizeUpRightDownLeft`
  ///  * `text`
  ///  * `verticalText`
  ///  * `wait`
  ///  * `zoomIn`
  ///  * `zoomOut`
  static MouseCursor? decodeMouseCursor(
    dynamic value, {
    bool validate = true,
  }) {
    MouseCursor? result;
    if (value is MouseCursor) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);
      _checkSupported(
        'MouseCursor.type',
        [
          'defer',
          'material',
          'system',
          'uncontrolled',
        ],
        value == null ? null : value['type'],
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/mouse_cursor',
          value: value,
          validate: validate,
        ));
        switch (value['type']) {
          case 'defer':
            result = MouseCursor.defer;
            break;
          case 'material':
            assert(value['cursor'] is String);
            _checkSupported(
              'MouseCursor.cursor',
              [
                'clickable',
                'textable',
              ],
              value['cursor'],
            );
            switch (value['cursor']) {
              case 'clickable':
                result = MaterialStateMouseCursor.clickable;
                break;

              case 'textable':
                result = MaterialStateMouseCursor.textable;
                break;
            }
            break;
          case 'system':
            assert(value['cursor'] is String);
            _checkSupported(
              'MouseCursor.cursor',
              [
                'alias',
                'allScroll',
                'basic',
                'cell',
                'click',
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
                'text',
                'verticalText',
                'wait',
                'zoomIn',
                'zoomOut',
              ],
              value['cursor'],
            );

            switch (value['cursor']) {
              case 'alias':
                result = SystemMouseCursors.alias;
                break;

              case 'allScroll':
                result = SystemMouseCursors.allScroll;
                break;

              case 'basic':
                result = SystemMouseCursors.basic;
                break;

              case 'cell':
                result = SystemMouseCursors.cell;
                break;

              case 'click':
                result = SystemMouseCursors.click;
                break;

              case 'contextMenu':
                result = SystemMouseCursors.contextMenu;
                break;

              case 'copy':
                result = SystemMouseCursors.copy;
                break;

              case 'disappearing':
                result = SystemMouseCursors.disappearing;
                break;

              case 'forbidden':
                result = SystemMouseCursors.forbidden;
                break;

              case 'grab':
                result = SystemMouseCursors.grab;
                break;

              case 'grabbing':
                result = SystemMouseCursors.grabbing;
                break;

              case 'help':
                result = SystemMouseCursors.help;
                break;

              case 'move':
                result = SystemMouseCursors.move;
                break;

              case 'noDrop':
                result = SystemMouseCursors.noDrop;
                break;

              case 'none':
                result = SystemMouseCursors.none;
                break;

              case 'precise':
                result = SystemMouseCursors.precise;
                break;

              case 'progress':
                result = SystemMouseCursors.progress;
                break;

              case 'resizeColumn':
                result = SystemMouseCursors.resizeColumn;
                break;

              case 'resizeDown':
                result = SystemMouseCursors.resizeDown;
                break;

              case 'resizeDownLeft':
                result = SystemMouseCursors.resizeDownLeft;
                break;

              case 'resizeDownRight':
                result = SystemMouseCursors.resizeDownRight;
                break;

              case 'resizeLeft':
                result = SystemMouseCursors.resizeLeft;
                break;

              case 'resizeLeftRight':
                result = SystemMouseCursors.resizeLeftRight;
                break;

              case 'resizeRight':
                result = SystemMouseCursors.resizeRight;
                break;

              case 'resizeRow':
                result = SystemMouseCursors.resizeRow;
                break;

              case 'resizeUp':
                result = SystemMouseCursors.resizeUp;
                break;

              case 'resizeUpDown':
                result = SystemMouseCursors.resizeUpDown;
                break;

              case 'resizeUpLeft':
                result = SystemMouseCursors.resizeUpLeft;
                break;

              case 'resizeUpLeftDownRight':
                result = SystemMouseCursors.resizeUpLeftDownRight;
                break;

              case 'resizeUpRight':
                result = SystemMouseCursors.resizeUpRight;
                break;

              case 'resizeUpRightDownLeft':
                result = SystemMouseCursors.resizeUpRightDownLeft;
                break;

              case 'text':
                result = SystemMouseCursors.text;
                break;

              case 'verticalText':
                result = SystemMouseCursors.verticalText;
                break;

              case 'wait':
                result = SystemMouseCursors.wait;
                break;

              case 'zoomIn':
                result = SystemMouseCursors.zoomIn;
                break;

              case 'zoomOut':
                result = SystemMouseCursors.zoomOut;
                break;
            }
            break;
          case 'uncontrolled':
            result = MouseCursor.uncontrolled;
            break;
        }
      }
    }
    return result;
  }

  /// Decodes the given [value] to an [NavigationBarThemeData].  This expects
  /// the given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "height": "<double>",
  ///   "iconTheme": "<MaterialStateProperty<IconThemeData>>",
  ///   "indicatorColor": "<Color>",
  ///   "indicatorShape": "<ShapeBorder>",
  ///   "labelBehavior": "<NavigationDestinationLabelBehavior>",
  ///   "labelTextStyle": "<MaterialStateProperty<TextStyle>>",
  ///   "shadowColor": "<Color>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeMaterialStatePropertyIconThemeData]
  ///  * [decodeMaterialStatePropertyTextStyle]
  ///  * [decodeNavigationDestinationLabelBehavior]
  static NavigationBarThemeData? decodeNavigationBarThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    NavigationBarThemeData? result;

    if (value is NavigationBarThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/navigation_bar_theme_data',
        value: value,
        validate: validate,
      ));
      result = NavigationBarThemeData(
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        height: JsonClass.maybeParseDouble(value['height']),
        iconTheme: decodeMaterialStatePropertyIconThemeData(
          value['iconTheme'],
          validate: false,
        ),
        indicatorColor: decodeColor(
          value['indicatorColor'],
          validate: false,
        ),
        indicatorShape: decodeShapeBorder(
          value['indicatorShape'],
          validate: false,
        ),
        labelBehavior: decodeNavigationDestinationLabelBehavior(
          value['labelBehavior'],
          validate: false,
        ),
        labelTextStyle: decodeMaterialStatePropertyTextStyle(
          value['labelTextStyle'],
          validate: false,
        ),
        shadowColor: decodeColor(
          value['shadowColor'],
          validate: false,
        ),
        surfaceTintColor: decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [NavigationDestinationLabelBehavior].  Supported
  /// values are:
  ///  * `alwaysHide`
  ///  * `alwaysShow`
  ///  * `onlyShowSelected`
  static NavigationDestinationLabelBehavior?
      decodeNavigationDestinationLabelBehavior(
    dynamic value, {
    bool validate = true,
  }) {
    NavigationDestinationLabelBehavior? result;

    if (value is NavigationDestinationLabelBehavior) {
      result = value;
    } else if (value != null) {
      _checkSupported(
        'NavigationDestinationLabelBehavior',
        [
          'alwaysHide',
          'alwaysShow',
          'onlyShowSelected',
        ],
        value,
      );

      switch (value) {
        case 'alwaysHide':
          result = NavigationDestinationLabelBehavior.alwaysHide;
          break;

        case 'alwaysShow':
          result = NavigationDestinationLabelBehavior.alwaysShow;
          break;

        case 'onlyShowSelected':
          result = NavigationDestinationLabelBehavior.onlyShowSelected;
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [NavigationDrawerThemeData].  This expects
  /// the given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "iconTheme": "<MaterialStateProperty<IconThemeData>>",
  ///   "indicatorColor": "<Color>",
  ///   "indicatorShape": "<ShapeBorder>",
  ///   "indicatorSize": "<Size>",
  ///   "labelTextStyle": "<MaterialStateProperty<TextStyle>>",
  ///   "shadowColor": "<Color>",
  ///   "surfaceTintColor": "<Color>",
  ///   "tileHeight": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeMaterialStatePropertyIconThemeData]
  ///  * [decodeShapeBorder]
  static NavigationDrawerThemeData? decodeNavigationDrawerThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    NavigationDrawerThemeData? result;

    if (value is NavigationDrawerThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/navigation_drawer_theme_data',
        value: value,
        validate: validate,
      ));

      result = NavigationDrawerThemeData(
        backgroundColor: decodeColor(value['backgroundColor'], validate: false),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        iconTheme: decodeMaterialStatePropertyIconThemeData(
          value['iconTheme'],
          validate: false,
        ),
        indicatorColor: decodeColor(
          value['indicatorColor'],
          validate: false,
        ),
        indicatorShape: decodeShapeBorder(
          value['indicateShape'],
          validate: false,
        ),
        indicatorSize: decodeSize(
          value['size'],
          validate: false,
        ),
        labelTextStyle: decodeMaterialStatePropertyTextStyle(
          value['labelTextStyle'],
          validate: false,
        ),
        shadowColor: decodeColor(
          value['shadowColor'],
          validate: false,
        ),
        surfaceTintColor: decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
        tileHeight: JsonClass.maybeParseDouble(value['tileHeight']),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [NavigationRailLabelType].  Supported values are:
  ///  * `all`
  ///  * `none`
  ///  * `selected`
  static NavigationRailLabelType? decodeNavigationRailLabelType(
    dynamic value, {
    bool validate = true,
  }) {
    NavigationRailLabelType? result;
    if (value is NavigationRailLabelType) {
      result = value;
    } else {
      _checkSupported(
        'NavigationRailLabelType',
        [
          'all',
          'none',
          'selected',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/navigation_rail_label_type',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'all':
            result = NavigationRailLabelType.all;
            break;

          case 'none':
            result = NavigationRailLabelType.none;
            break;

          case 'selected':
            result = NavigationRailLabelType.selected;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [NavigationRailThemeData].  This expects
  /// the given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "groupAlignment": "<double>",
  ///   "indicatorColor": "<Color>",
  ///   "indicatorShape": "<ShapeBorder>",
  ///   "labelType": "<NavigationRailLabelType>",
  ///   "minExtendedWidth": "<double>",
  ///   "minWidth": "<double>",
  ///   "selectedIconTheme": "<IconThemeData>",
  ///   "selectedLabelTextStyle": "<TextStyle>",
  ///   "unselectedIconTheme": "<IconThemeData>",
  ///   "unselectedLabelTextStyle": "<TextStyle>",
  ///   "useIndicator": "<bool>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeIconThemeData]
  ///  * [decodeNavigationRailLabelType]
  ///  * [decodeShapeBorder]
  ///  * [decodeTextStyle]
  static NavigationRailThemeData? decodeNavigationRailThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    NavigationRailThemeData? result;

    if (value is NavigationRailThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/navigation_rail_theme_data',
        value: value,
        validate: validate,
      ));
      result = NavigationRailThemeData(
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        groupAlignment: JsonClass.maybeParseDouble(value['groupAlignment']),
        indicatorColor: decodeColor(
          value['indicatorColor'],
          validate: false,
        ),
        indicatorShape: decodeShapeBorder(
          value['indicatorShape'],
          validate: false,
        ),
        labelType: decodeNavigationRailLabelType(
          value['labelType'],
          validate: false,
        ),
        minExtendedWidth: JsonClass.maybeParseDouble(value['minExtendedWidth']),
        minWidth: JsonClass.maybeParseDouble(value['minWidth']),
        selectedIconTheme: decodeIconThemeData(
          value['selectedIconTheme'],
          validate: false,
        ),
        selectedLabelTextStyle: decodeTextStyle(
          value['selectedLabelTextStyle'],
          validate: false,
        ),
        unselectedIconTheme: decodeIconThemeData(
          value['unselectedIconTheme'],
          validate: false,
        ),
        unselectedLabelTextStyle: decodeTextStyle(
          value['unselectedLabelTextStyle'],
          validate: false,
        ),
        useIndicator: JsonClass.maybeParseBool(value['useIndicator']),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [NotchedShape].  Supported values are:
  ///  * `circular`
  static NotchedShape? decodeNotchedShape(
    dynamic value, {
    bool validate = true,
  }) {
    NotchedShape? result;
    if (value is NotchedShape) {
      result = value;
    } else {
      _checkSupported(
        'NotchedShape',
        [
          'circular',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/notched_shape',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'circular':
            result = const CircularNotchedRectangle();
            break;
        }
      }
    }
    return result;
  }

  /// Decodes the given [value] to an [Offset].  This expects the given [value]
  /// to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "dx": "<double>",
  ///   "dy": "<double>"
  /// }
  /// ```
  static Offset? decodeOffset(
    dynamic value, {
    bool validate = true,
  }) {
    Offset? result;

    if (value is Offset) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/offset',
        value: value,
        validate: validate,
      ));
      result = Offset(
        JsonClass.maybeParseDouble(value['dx'], 0)!,
        JsonClass.maybeParseDouble(value['dy'], 0)!,
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [OrdinalSortKey].  This expects the given
  /// [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "name": "<String>",
  ///   "order": "<double>"
  /// }
  /// ```
  static OrdinalSortKey? decodeOrdinalSortKey(
    dynamic value, {
    bool validate = true,
  }) {
    OrdinalSortKey? result;

    if (value is OrdinalSortKey) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/ordinal_sort_key',
        value: value,
        validate: validate,
      ));

      result = OrdinalSortKey(
        JsonClass.maybeParseDouble(value['order'])!,
        name: value['name'],
      );
    }

    return result;
  }

  /// Decodes a given Map-like value into a [OutlinedBorder].  The value returned
  /// depends on the "type" parameter.  The "type" must be one of:
  ///  * `beveled`
  ///  * `circle`
  ///  * `rectangle`
  ///  * `rounded`
  ///  * `stadium`
  ///
  /// The JSON format of the [value] depends on the "type" and the associated
  /// class.
  ///
  /// `BeveledRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": "<BorderRadius>",
  ///   "side": "<BorderSide>",
  ///   "type": "beveled"
  /// }
  /// ```
  ///
  /// `CircleBorder`
  /// ```json
  /// {
  ///   "side": "<BorderSide>",
  ///   "type": "circle"
  /// }
  /// ```
  ///
  /// `ContinuousRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": "<BorderRadius>",
  ///   "side": "<BorderSide>",
  ///   "type": "rectangle"
  /// }
  /// ```
  ///
  /// `RoundedRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": "<BorderRadius>",
  ///   "side": "<BorderSide>",
  ///   "type": "rounded"
  /// }
  /// ```
  ///
  /// `StadiumBorder`
  /// ```json
  /// {
  ///   "side": "<BorderSide>",
  ///   "type": "stadium"
  /// }
  ///
  /// See also:
  ///  * [decodeBorderRadius]
  ///  * [decodeBorderSide]
  static OutlinedBorder? decodeOutlinedBorder(
    dynamic value, {
    bool validate = true,
  }) {
    OutlinedBorder? result;
    if (value is OutlinedBorder) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);
      _checkSupported(
        'OutlinedBorder.type',
        [
          'beveled',
          'circle',
          'rectangle',
          'rounded',
          'stadium',
        ],
        value == null ? null : value['type'],
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/outlined_border',
          value: value,
          validate: validate,
        ));
        final String? type = value['type'];

        switch (type) {
          case 'beveled':
            result = BeveledRectangleBorder(
              borderRadius: decodeBorderRadius(
                    value['borderRadius'],
                    validate: false,
                  ) ??
                  BorderRadius.zero,
              side: decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'circle':
            result = CircleBorder(
              side: decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'rectangle':
            result = ContinuousRectangleBorder(
              borderRadius: decodeBorderRadius(
                    value['borderRadius'],
                    validate: false,
                  ) ??
                  BorderRadius.zero,
              side: decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'rounded':
            result = RoundedRectangleBorder(
              borderRadius: decodeBorderRadius(
                    value['borderRadius'],
                    validate: false,
                  ) ??
                  BorderRadius.zero,
              side: decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'stadium':
            result = StadiumBorder(
              side: decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [OutlinedButtonThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "style": "<ButtonStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeButtonStyle]
  static OutlinedButtonThemeData? decodeOutlinedButtonThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    OutlinedButtonThemeData? result;

    if (value is OutlinedButtonThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/outlined_button_theme_data',
        value: value,
        validate: validate,
      ));
      result = OutlinedButtonThemeData(
        style: decodeButtonStyle(
          value['style'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [PageTransitionsBuilder].  Supported values are:
  /// * `cupertino`
  /// * `fadeUpwards`
  /// * `openUpwards`
  /// * `zoom`
  static PageTransitionsBuilder? decodePageTransitionsBuilder(
    dynamic value, {
    bool validate = true,
  }) {
    PageTransitionsBuilder? result;

    if (value is PageTransitionsBuilder) {
      result = value;
    } else if (value != null) {
      _checkSupported(
        'PageTransitionsBuilder',
        [
          'cupertino',
          'fadeUpwards',
          'openUpwards',
          'zoom',
        ],
        value,
      );
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/page_transitions_builder',
        value: value,
        validate: validate,
      ));

      switch (value) {
        case 'cupertino':
          result = const CupertinoPageTransitionsBuilder();
          break;

        case 'fadeUpwards':
          result = const FadeUpwardsPageTransitionsBuilder();
          break;

        case 'openUpwards':
          result = const OpenUpwardsPageTransitionsBuilder();
          break;

        case 'zoom':
          result = const ZoomPageTransitionsBuilder();
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] to a [PopupMenuThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "builders": "<Map<TargetPlatform, PageTransitionBuilder>>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodePageTransitionsBuilder]
  ///  * [decodeTargetPlatform]
  static PageTransitionsTheme? decodePageTransitionsTheme(
    dynamic value, {
    bool validate = true,
  }) {
    PageTransitionsTheme? result;

    if (value is PageTransitionsTheme) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/page_transitions_theme',
        value: value,
        validate: validate,
      ));

      final builders = <TargetPlatform, PageTransitionsBuilder>{};
      value['builders']?.forEach(
        (key, value) => builders[decodeTargetPlatform(
          key,
          validate: false,
        )!] = decodePageTransitionsBuilder(
          value,
          validate: false,
        )!,
      );

      result = PageTransitionsTheme(
        builders: builders,
      );
    }

    return result;
  }

  /// Decodes the [value] to a [PanAxis].  Supported values are:
  ///  * `aligned`
  ///  * `free`
  ///  * `horizontal`
  ///  * `vertical`
  static PanAxis? decodePanAxis(
    dynamic value, {
    bool validate = true,
  }) {
    PanAxis? result;

    if (value is PanAxis) {
      result = value;
    } else if (value != null) {
      _checkSupported(
        'PanAxis',
        [
          'aligned',
          'free',
          'horizontal',
          'vertical',
        ],
        value,
      );
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/pan_axis',
        value: value,
        validate: validate,
      ));

      switch (value) {
        case 'aligned':
          result = PanAxis.aligned;
          break;

        case 'free':
          result = PanAxis.free;
          break;

        case 'horizontal':
          result = PanAxis.horizontal;
          break;

        case 'vertical':
          result = PanAxis.vertical;
          break;
      }
    }

    return result;
  }

  /// Decodes the [value] to a [PointerDeviceKind].  Supported values are:
  ///  * `invertedStylus`
  ///  * `mouse`
  ///  * `stylus`
  ///  * `touch`
  ///  * `trackpad`
  ///  * `unknown`
  static PointerDeviceKind? decodePointerDeviceKind(
    dynamic value, {
    bool validate = true,
  }) {
    PointerDeviceKind? result;

    if (value is PointerDeviceKind) {
      result = value;
    } else if (value != null) {
      _checkSupported(
        'PointerDeviceKind',
        [
          'invertedStylus',
          'mouse',
          'stylus',
          'touch',
          'trackpad',
          'unknown',
        ],
        value,
      );
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/pointer_device_kind',
        value: value,
        validate: validate,
      ));

      switch (value) {
        case 'invertedStylus':
          result = PointerDeviceKind.invertedStylus;
          break;
        case 'mouse':
          result = PointerDeviceKind.mouse;
          break;
        case 'stylus':
          result = PointerDeviceKind.stylus;
          break;
        case 'touch':
          result = PointerDeviceKind.touch;
          break;
        case 'trackpad':
          result = PointerDeviceKind.trackpad;
          break;
        case 'unknown':
          result = PointerDeviceKind.unknown;
          break;
      }
    }

    return result;
  }

  /// Decodes the [value] to a [PopupMenuPosition].  Supported values are:
  ///  * `over`
  ///  * `under`
  static PopupMenuPosition? decodePopupMenuPosition(
    dynamic value, {
    bool validate = true,
  }) {
    PopupMenuPosition? result;

    if (value is PopupMenuPosition) {
      result = value;
    } else if (value != null) {
      _checkSupported(
        'PopupMenuPosition',
        [
          'over',
          'under',
        ],
        value,
      );
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/popup_menu_position',
        value: value,
        validate: validate,
      ));

      switch (value) {
        case 'over':
          result = PopupMenuPosition.over;
          break;

        case 'under':
          result = PopupMenuPosition.under;
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] to a [PopupMenuThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "elevation": "<double>",
  ///   "enableFeedback": "<bool>",
  ///   "labelTextStyle": "<MaterialStateProperty<TextStyle>>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "position": "<PopupMenuPosition>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "surfaceTintColor": "<Color>",
  ///   "textStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeMaterialStatePropertyMouseCursor]
  ///  * [decodeMaterialStatePropertyTextStyle]
  ///  * [decodePopupMenuPosition]
  ///  * [decodeShapeBorder]
  ///  * [decodeTextStyle]
  static PopupMenuThemeData? decodePopupMenuThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    PopupMenuThemeData? result;

    if (value is PopupMenuThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/popup_menu_theme_data',
        value: value,
        validate: validate,
      ));
      result = PopupMenuThemeData(
        color: decodeColor(
          value['color'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        enableFeedback: JsonClass.maybeParseBool(value['enableFeedback']),
        labelTextStyle: decodeMaterialStatePropertyTextStyle(
          value['labelTextStyle'],
          validate: false,
        ),
        mouseCursor: decodeMaterialStatePropertyMouseCursor(
          value['mouseCursor'],
          validate: false,
        ),
        position: decodePopupMenuPosition(
          value['position'],
          validate: false,
        ),
        shadowColor: decodeColor(
          value['shadowColor'],
          validate: false,
        ),
        shape: decodeShapeBorder(
          value['shape'],
          validate: false,
        ),
        surfaceTintColor: decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
        textStyle: decodeTextStyle(
          value['textStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [ProgressIndicatorThemeData].  This
  /// expects the given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "circularTrackColor": "<Color>",
  ///   "color": "<Color>",
  ///   "linearMinHeight": "<double>",
  ///   "linearTrackColor": "<Color>",
  ///   "refreshBackgroundColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  static ProgressIndicatorThemeData? decodeProgressIndicatorThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    ProgressIndicatorThemeData? result;

    if (value is ProgressIndicatorThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/progress_indicator_theme_data',
        value: value,
        validate: validate,
      ));

      result = ProgressIndicatorThemeData(
        circularTrackColor: decodeColor(
          value['circularTrackColor'],
          validate: false,
        ),
        color: decodeColor(
          value['color'],
          validate: false,
        ),
        linearMinHeight: JsonClass.maybeParseDouble(value['linearMinHeight']),
        linearTrackColor: decodeColor(
          value['linearTrackColor'],
          validate: false,
        ),
        refreshBackgroundColor: decodeColor(
          value['refreshBackgroundColor'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [RadioThemeData].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "fillColor": "<MaterialStateProperty<Color>>",
  ///   "materialTapTargetSize": "<MaterialTapTargetSize>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "overlayColor": "<MaterialStateProperty<Color>>",
  ///   "splashRadius": "<double>",
  ///   "visualDensity": "<VisualDensity>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeMaterialStatePropertyColor]
  ///  * [decodeMaterialStatePropertyMouseCursor]
  ///  * [decodeMaterialTapTargetSize]
  ///  * [decodeMouseCursor]
  ///  * [decodeVisualDensity]
  static RadioThemeData? decodeRadioThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    RadioThemeData? result;

    if (value is RadioThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/radio_theme_data',
        value: value,
        validate: validate,
      ));

      result = RadioThemeData(
        fillColor: decodeMaterialStatePropertyColor(
          value['fillColor'],
          validate: false,
        ),
        materialTapTargetSize: decodeMaterialTapTargetSize(
          value['materialTapTargetSize'],
          validate: false,
        ),
        mouseCursor: decodeMaterialStatePropertyMouseCursor(
          value['mouseCursor'],
          validate: false,
        ),
        overlayColor: decodeMaterialStatePropertyColor(
          value['overlayColor'],
          validate: false,
        ),
        splashRadius: JsonClass.maybeParseDouble(value['splashRadius']),
        visualDensity: decodeVisualDensity(
          value['visualDensity'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to a [Radius].  This can be a [String], [int],
  /// [double], or an object.  If this is an object, there must be a "type"
  /// attribute that is one of:
  ///  * `circular`
  ///  * `elliptical`
  ///  * `zero`
  ///
  /// When passed in as a [String], [int], or [double] then this will use
  /// [JsonClass.maybeParseDouble] to parse the number to send to [Radius.circular].
  ///
  /// Otherwise, if this is an object then the structure of the other attributes
  /// depends on the "type".
  ///
  /// Type: `circular`
  /// ```json
  /// {
  ///   "radius": "<double>",
  ///   "type": "circular"
  /// }
  /// ```
  ///
  /// Type: `elliptical`
  /// ```json
  /// {
  ///  "type": "elliptical",
  ///   "x": "<double>",
  ///   "y": "<double>"
  /// }
  /// ```
  ///
  /// Type: `zero`
  /// ```json
  /// {
  ///   "type": "zero"
  /// }
  /// ```
  static Radius? decodeRadius(
    dynamic value, {
    bool validate = true,
  }) {
    Radius? result;
    if (value is Radius) {
      result = value;
    } else {
      final radius = JsonClass.maybeParseDouble(value);

      if (radius != null) {
        result = Radius.circular(radius);
      } else {
        assert(value == null || value['type'] is String);
        _checkSupported(
          'Radius.type',
          [
            'circular',
            'elliptical',
            'zero',
          ],
          value == null ? null : value['type'],
        );

        if (value != null) {
          assert(SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/radius',
            value: value,
            validate: validate,
          ));
          final String? type = value['type'];

          switch (type) {
            case 'circular':
              result =
                  Radius.circular(JsonClass.maybeParseDouble(value['radius'])!);
              break;

            case 'elliptical':
              result = Radius.elliptical(
                JsonClass.maybeParseDouble(value['x']) ?? 0.0,
                JsonClass.maybeParseDouble(value['y']) ?? 0.0,
              );
              break;

            case 'zero':
              result = Radius.zero;
              break;
          }
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to a [RangeSliderThumbShape].  This expects a
  /// "type" attribute to be one of:
  ///  * `round`
  ///
  /// The structure of the other attributes depends on the "type".
  ///
  /// Type: `round`
  /// ```json
  /// {
  ///   "disabledThumbRadius": "<double>",
  ///   "enabledThumbRadius": "<double>",
  ///   "elevation": "<double>",
  ///   "pressedElevation": "<double>",
  ///   "type": "round"
  /// }
  /// ```
  static RangeSliderThumbShape? decodeRangeSliderThumbShape(
    dynamic value, {
    bool validate = true,
  }) {
    RangeSliderThumbShape? result;
    if (value is RangeSliderThumbShape) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);
      _checkSupported(
        'RangeSliderThumbShape.type',
        [
          'round',
        ],
        value == null ? null : value['type'],
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/range_slider_thumb_shape',
          value: value,
          validate: validate,
        ));

        final String? type = value['type'];
        switch (type) {
          case 'round':
            result = RoundRangeSliderThumbShape(
              disabledThumbRadius: JsonClass.maybeParseDouble(
                value['disabledThumbRadius'],
              ),
              elevation: JsonClass.maybeParseDouble(value['elevation']) ?? 1.0,
              enabledThumbRadius: JsonClass.maybeParseDouble(
                    value['enabledThumbRadius'],
                  ) ??
                  10.0,
              pressedElevation: JsonClass.maybeParseDouble(
                    value['pressedElevation'],
                  ) ??
                  6.0,
            );
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to a [RangeSliderTickMarkShape].  This expects
  /// a "type" attribute to be one of:
  ///  * `round`
  ///
  /// The structure of the other attributes depends on the "type".
  ///
  /// Type: `round`
  /// ```json
  /// {
  ///   "tickMarkRadius": "<double>",
  ///   "type": "round"
  /// }
  /// ```
  static RangeSliderTickMarkShape? decodeRangeSliderTickMarkShape(
    dynamic value, {
    bool validate = true,
  }) {
    RangeSliderTickMarkShape? result;
    if (value is RangeSliderTickMarkShape) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);
      _checkSupported(
        'RangeSliderTickMarkShape.type',
        [
          'round',
        ],
        value == null ? null : value['type'],
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/range_slider_tick_mark_shape',
          value: value,
          validate: validate,
        ));
        final String? type = value['type'];

        switch (type) {
          case 'round':
            result = RoundRangeSliderTickMarkShape(
              tickMarkRadius:
                  JsonClass.maybeParseDouble(value['tickMarkRadius']),
            );
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [RangeSliderTrackShape].  Supported values are:
  ///  * `rectangular`
  ///  * `rounded`
  static RangeSliderTrackShape? decodeRangeSliderTrackShape(
    dynamic value, {
    bool validate = true,
  }) {
    RangeSliderTrackShape? result;
    if (value is RangeSliderTrackShape) {
      result = value;
    } else {
      _checkSupported(
        'RangeSliderTrackShape',
        [
          'rectangular',
          'rounded',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/range_slider_track_shape',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'rectangular':
            result = const RectangularRangeSliderTrackShape();
            break;

          case 'rounded':
            result = const RoundedRectRangeSliderTrackShape();
            break;
        }
      }
    }
    return result;
  }

  /// Decodes the [value] to a [RangeSliderValueIndicatorShape].  Supported
  /// values are:
  ///  * `paddle`
  ///  * `rectangular`
  static RangeSliderValueIndicatorShape? decodeRangeSliderValueIndicatorShape(
    dynamic value, {
    bool validate = true,
  }) {
    RangeSliderValueIndicatorShape? result;
    if (value is RangeSliderValueIndicatorShape) {
      result = value;
    } else {
      _checkSupported(
        'RangeSliderValueIndicatorShape.type',
        [
          'paddle',
          'rectangular',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/range_slider_value_indicator_shape',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'paddle':
            result = const PaddleRangeSliderValueIndicatorShape();
            break;

          case 'rectangular':
            result = const RectangularRangeSliderValueIndicatorShape();
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [Rect].  If [value] is not `null` then
  /// it must contain a property named "type" with one of the following values:
  ///  * `center`
  ///  * `circle`
  ///  * `largest`
  ///  * `ltrb`
  ///  * `ltwh`
  ///  * `points`
  ///  * `zero`
  ///
  /// The structure of the remaining attributes depends on the "type" property.
  ///
  /// Type: `center`
  /// ```json
  /// {
  ///   "center": {
  ///     "dx": "<double>",
  ///     "dy": "<double>"
  ///   },
  ///   "height": "<double>",
  ///   "width": "<double>",
  ///   "type": "center"
  /// }
  /// ```
  ///
  /// Type: `circle`
  /// ```json
  /// {
  ///   "center": {
  ///     "dx": "<double>",
  ///     "dy": "<double>"
  ///   },
  ///   "radius": "<double>",
  ///   "type": "circle"
  /// }
  /// ```
  ///
  /// Type: `largest`
  /// ```json
  /// {
  ///   "type": "largest"
  /// }
  /// ```
  ///
  /// Type: `ltrb`
  /// ```json
  /// {
  ///   "bottom": "<double>",
  ///   "left": "<double>",
  ///   "right": "<double>",
  ///   "top": "<double>",
  ///   "type": "ltrb"
  /// }
  /// ```
  ///
  /// Type: `ltwh`
  /// ```json
  /// {
  ///   "height": "<double>",
  ///   "left": "<double>",
  ///   "top": "<double>",
  ///   "type": "ltwh",
  ///   "width": "<double>"
  /// }
  /// ```
  ///
  /// Type: `points`
  /// ```json
  /// {
  ///   "a": {
  ///     "dx": "<double>",
  ///     "dy": "<double>"
  ///   },
  ///   "b": {
  ///     "dx": "<double>",
  ///     "dy": "<double>"
  ///   }
  ///   "type": "points"
  /// }
  /// ```
  ///
  /// Type: `zero`
  /// ```json
  /// {
  ///   "type": "zero"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeOffset]
  static Rect? decodeRect(
    dynamic value, {
    bool validate = true,
  }) {
    Rect? result;
    if (value is Rect) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);
      _checkSupported(
        'Rect.type',
        [
          'center',
          'circle',
          'largest',
          'ltrb',
          'ltwh',
          'points',
          'zero',
        ],
        value == null ? null : value['type'],
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/rect',
          value: value,
          validate: validate,
        ));
        final String? type = value['type'];
        switch (type) {
          case 'center':
            result = Rect.fromCenter(
              center: decodeOffset(
                value['center'],
                validate: false,
              )!,
              height: JsonClass.maybeParseDouble(value['height'])!,
              width: JsonClass.maybeParseDouble(value['width'])!,
            );
            break;

          case 'circle':
            result = Rect.fromCircle(
              center: decodeOffset(
                value['center'],
                validate: false,
              )!,
              radius: JsonClass.maybeParseDouble(value['radius'])!,
            );
            break;

          case 'largest':
            result = Rect.largest;
            break;

          case 'ltrb':
            result = Rect.fromLTRB(
              JsonClass.maybeParseDouble(value['left'])!,
              JsonClass.maybeParseDouble(value['top'])!,
              JsonClass.maybeParseDouble(value['right'])!,
              JsonClass.maybeParseDouble(value['bottom'])!,
            );
            break;

          case 'ltwh':
            result = Rect.fromLTWH(
              JsonClass.maybeParseDouble(value['left'])!,
              JsonClass.maybeParseDouble(value['top'])!,
              JsonClass.maybeParseDouble(value['width'])!,
              JsonClass.maybeParseDouble(value['height'])!,
            );
            break;

          case 'points':
            result = Rect.fromPoints(
              decodeOffset(
                value['a'],
                validate: false,
              )!,
              decodeOffset(
                value['b'],
                validate: false,
              )!,
            );
            break;

          case 'zero':
            result = Rect.zero;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [ScrollBehavior].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  /// }
  /// ```
  static ScrollBehavior? decodeScrollBehavior(
    dynamic value, {
    bool validate = true,
  }) {
    ScrollBehavior? result;

    if (value is ScrollBehavior) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/scroll_behavior',
        value: value,
        validate: validate,
      ));
      result = const ScrollBehavior();
    }

    return result;
  }

  /// Decodes the [value] to a [ScrollPhysics].  If [value] is not `null` then
  /// it must contain a property named "type" with one of the following values:
  ///  * `always`
  ///  * `bouncing`
  ///  * `clamping`
  ///  * `fixedExtent`
  ///  * `never`
  ///  * `page`
  ///  * `rangeMaintaining`
  ///
  /// This expects the JSON representation to follow the structure:
  /// ```json
  /// {
  ///   "parent": "<ScrollPhysics>",
  ///   "type": "<String>"
  /// }
  /// ```
  static ScrollPhysics? decodeScrollPhysics(
    dynamic value, {
    bool validate = true,
  }) {
    ScrollPhysics? result;
    if (value is ScrollPhysics) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);
      _checkSupported(
        'ScrollPhysics.type',
        [
          'always',
          'bouncing',
          'clamping',
          'fixedExtent',
          'never',
          'page',
          'rangeMaintaining',
        ],
        value == null ? null : value['type'],
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/scroll_physics',
          value: value,
          validate: validate,
        ));
        final type = value['type'];

        switch (type) {
          case 'always':
            result = AlwaysScrollableScrollPhysics(
              parent: decodeScrollPhysics(
                value['parent'],
                validate: false,
              ),
            );
            break;

          case 'bouncing':
            result = BouncingScrollPhysics(
              parent: decodeScrollPhysics(
                value['parent'],
                validate: false,
              ),
            );
            break;

          case 'clamping':
            result = ClampingScrollPhysics(
              parent: decodeScrollPhysics(
                value['parent'],
                validate: false,
              ),
            );
            break;

          case 'fixedExtent':
            result = FixedExtentScrollPhysics(
              parent: decodeScrollPhysics(
                value['parent'],
                validate: false,
              ),
            );
            break;

          case 'never':
            result = NeverScrollableScrollPhysics(
              parent: decodeScrollPhysics(
                value['parent'],
                validate: false,
              ),
            );
            break;

          case 'page':
            result = PageScrollPhysics(
              parent: decodeScrollPhysics(
                value['parent'],
                validate: false,
              ),
            );
            break;

          case 'rangeMaintaining':
            result = RangeMaintainingScrollPhysics(
              parent: decodeScrollPhysics(
                value['parent'],
                validate: false,
              ),
            );
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [ScrollViewKeyboardDismissBehavior].  Supported
  /// values are:
  ///  * `manual`
  ///  * `onDrag`
  static ScrollViewKeyboardDismissBehavior?
      decodeScrollViewKeyboardDismissBehavior(
    dynamic value, {
    bool validate = true,
  }) {
    ScrollViewKeyboardDismissBehavior? result;

    if (value is ScrollViewKeyboardDismissBehavior) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/scroll_view_keyboard_dismiss_behavior',
        value: value,
        validate: validate,
      ));

      switch (value) {
        case 'manual':
          result = ScrollViewKeyboardDismissBehavior.manual;
          break;

        case 'onDrag':
          result = ScrollViewKeyboardDismissBehavior.onDrag;
          break;
      }
    }

    return result;
  }

  /// Decodes the [value] to a [ScrollbarOrientation].  Supported values are:
  ///  * `bottom`
  ///  * `left`
  ///  * `right`
  ///  * `top`
  static ScrollbarOrientation? decodeScrollbarOrientation(
    dynamic value, {
    bool validate = true,
  }) {
    ScrollbarOrientation? result;

    if (value is ScrollbarOrientation) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/scrollbar_orientation',
        value: value,
        validate: validate,
      ));
      switch (value) {
        case 'bottom':
          result = ScrollbarOrientation.bottom;
          break;

        case 'left':
          result = ScrollbarOrientation.left;
          break;

        case 'right':
          result = ScrollbarOrientation.right;
          break;

        case 'top':
          result = ScrollbarOrientation.top;
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [ScrollbarThemeData].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "crossAxisMargin": "<double>",
  ///   "interactive": "<bool>",
  ///   "mainAxisMargin": "<double>",
  ///   "minThumbLength": "<double>",
  ///   "radius": "<Radius>",
  ///   "thickness": "<MaterialStateProperty<double>>",
  ///   "thumbColor": "<MaterialStateProperty<Color>>",
  ///   "thumbVisibility": "<MaterialStateProperty<bool>>",
  ///   "trackBorderColor": "<MaterialStateProperty<Color>>",
  ///   "trackColor": "<MaterialStateProperty<Color>>",
  ///   "trackVisibility": "<MaterialStateProperty<bool>>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeMaterialStatePropertyBool]
  ///  * [decodeMaterialStatePropertyColor]
  ///  * [decodeMaterialStatePropertyDouble]
  ///  * [decodeRadius]
  static ScrollbarThemeData? decodeScrollbarThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    ScrollbarThemeData? result;

    if (value is ScrollbarThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/scrollbar_theme_data',
        value: value,
        validate: validate,
      ));
      result = ScrollbarThemeData(
        crossAxisMargin: JsonClass.maybeParseDouble(value['crossAxisMargin']),
        interactive: JsonClass.maybeParseBool(value['interactive']),
        // isAlwaysShown: @deprecated,
        mainAxisMargin: JsonClass.maybeParseDouble(value['mainAxisMargin']),
        minThumbLength: JsonClass.maybeParseDouble(value['minThumbLength']),
        radius: decodeRadius(
          value['radius'],
          validate: false,
        ),
        // showTrackOnHover: @deprecated
        thickness: decodeMaterialStatePropertyDouble(
          value['thickness'],
          validate: false,
        ),
        thumbColor: decodeMaterialStatePropertyColor(
          value['thumbColor'],
          validate: false,
        ),
        thumbVisibility: decodeMaterialStatePropertyBool(
          value['thumbVisibility'],
          validate: false,
        ),
        trackBorderColor: decodeMaterialStatePropertyColor(
          value['trackBorderColor'],
          validate: false,
        ),
        trackColor: decodeMaterialStatePropertyColor(
          value['trackColor'],
          validate: false,
        ),
        trackVisibility: decodeMaterialStatePropertyBool(
          value['trackVisibility'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [SearchBarThemeData].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<MaterialStateProperty<Color>>",
  ///   "constraints": "<BoxConstraints>",
  ///   "elevation": "<MaterialStateProperty<double>>",
  ///   "hintStyle": "<MaterialStateProperty<TextStyle>>",
  ///   "overlayColor": "<MaterialStateProperty<Color>>",
  ///   "padding": "<MaterialStateProperty<EdgeInsetsGeometry>>",
  ///   "shadowColor": "<MaterialStateProperty<Color>>",
  ///   "shape": MaterialStateProperty<OutlinedBorder>,
  ///   "side": "<MaterialStateProperty<BorderSide>>",
  ///   "surfaceTintColor": "<MaterialStateProperty<Color>>",
  ///   "textStyle": "<MaterialStateProperty<TextStyle>>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBoxConstraints]
  ///  * [decodeMaterialStatePropertyBorderSide]
  ///  * [decodeMaterialStatePropertyColor]
  ///  * [decodeMaterialStatePropertyDouble]
  ///  * [decodeMaterialStatePropertyEdgeInsetsGeometry]
  ///  * [decodeMaterialStatePropertyOutlinedBorder]
  ///  * [decodeMaterialStatePropertyTextStyle]
  static SearchBarThemeData? decodeSearchBarThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    SearchBarThemeData? result;

    if (value is SearchBarThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/search_bar_theme_data',
        value: value,
        validate: validate,
      ));

      result = SearchBarThemeData(
        backgroundColor: decodeMaterialStatePropertyColor(
          value['backgroundColor'],
          validate: false,
        ),
        constraints: decodeBoxConstraints(
          value['constraints'],
          validate: false,
        ),
        elevation: decodeMaterialStatePropertyDouble(
          value['elevation'],
          validate: false,
        ),
        hintStyle: decodeMaterialStatePropertyTextStyle(
          value['hintStyle'],
          validate: false,
        ),
        overlayColor: decodeMaterialStatePropertyColor(
          value['overlayColor'],
          validate: false,
        ),
        padding: decodeMaterialStatePropertyEdgeInsetsGeometry(
          value['padding'],
          validate: false,
        ),
        shadowColor: decodeMaterialStatePropertyColor(
          value['shadowColor'],
          validate: false,
        ),
        shape: decodeMaterialStatePropertyOutlinedBorder(
          value['shape'],
          validate: false,
        ),
        side: decodeMaterialStatePropertyBorderSide(
          value['side'],
          validate: false,
        ),
        surfaceTintColor: decodeMaterialStatePropertyColor(
          value['surfaceTintColor'],
          validate: false,
        ),
        textStyle: decodeMaterialStatePropertyTextStyle(
          value['textStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [SearchViewThemeData].  This expects the
  /// given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "constraints": "<BoxConstraints>",
  ///   "dividerColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "headerHintStyle": "<TextStyle>",
  ///   "headerTextStyle": "<TextStyle>",
  ///   "shape": "<OutlinedBorder>",
  ///   "side": "<BorderSide>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderSide]
  ///  * [decodeBoxConstraints]
  ///  * [decodeColor]
  ///  * [decodeOutlinedBorder]
  ///  * [decodeTextStyle]
  static SearchViewThemeData? decodeSearchViewThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    SearchViewThemeData? result;

    if (value is SearchViewThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/search_view_theme_data',
        value: value,
        validate: validate,
      ));

      result = SearchViewThemeData(
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        constraints: decodeBoxConstraints(
          value['constraints'],
          validate: false,
        ),
        dividerColor: decodeColor(
          value['dividerColor'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        headerHintStyle: decodeTextStyle(
          value['headerHintStyle'],
          validate: false,
        ),
        headerTextStyle: decodeTextStyle(
          value['headerTextStyle'],
          validate: false,
        ),
        shape: decodeOutlinedBorder(
          value['shape'],
          validate: false,
        ),
        side: decodeBorderSide(
          value['side'],
          validate: false,
        ),
        surfaceTintColor: decodeColor(
          value['surfaceTintColor'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [SegmentedButtonThemeData].  This expects
  /// the given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "selectedIcon": "<Icon>",
  ///   "style": "<ButtonStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeButtonStyle]
  ///  * [decodeIcon]
  static SegmentedButtonThemeData? decodeSegmentedButtonThemeData(
    dynamic value, {
    validate = true,
  }) {
    SegmentedButtonThemeData? result;

    if (value is SegmentedButtonThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/segmented_button_theme_data',
        value: value,
        validate: validate,
      ));

      result = SegmentedButtonThemeData(
        selectedIcon: decodeIcon(
          value['selectedIcon'],
          validate: false,
        ),
        style: decodeButtonStyle(
          value['style'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [SemanticsTag].  This expects the given
  /// [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "name": "<String>"
  /// }
  /// ```
  static SemanticsTag? decodeSemanticsTag(
    dynamic value, {
    bool validate = true,
  }) {
    SemanticsTag? result;

    if (value is SemanticsTag) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/semantics_tag',
        value: value,
        validate: validate,
      ));

      result = SemanticsTag(value['name']);
    }

    return result;
  }

  /// Decodes the given [value] to a [Shadow].  This expects the [value] to have
  /// the following structure:
  ///
  /// ```json
  /// {
  ///   "blurRadius": "<double>",
  ///   "color": "<Color>",
  ///   "offset": "<Offset>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeOffset]
  static Shadow? decodeShadow(
    dynamic value, {
    bool validate = true,
  }) {
    Shadow? result;

    if (value is Shadow) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/shadow',
        value: value,
        validate: validate,
      ));
      result = Shadow(
        blurRadius: JsonClass.maybeParseDouble(value['blurRadius'], 0.0)!,
        color: decodeColor(
          value['color'],
          validate: false,
        )!,
        offset: decodeOffset(
          value['offset'],
          validate: false,
        )!,
      );
    }

    return result;
  }

  /// Decodes a given Map-like value into a [ShapeBorder].  The value returned
  /// depends on the "type" parameter.  The "type" must be one of:
  ///  * `circle`
  ///  * `rectangle`
  ///  * `rounded`
  ///
  /// The JSON format of the [value] depends on the "type" and the associated
  /// class.
  ///
  /// `CircleBorder`
  /// ```json
  /// {
  ///   "side": "<BorderSide>",
  ///   "type": "circle"
  /// }
  /// ```
  ///
  /// `ContinuousRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": "<BorderRadius>",
  ///   "side": "<BorderSide>",
  ///   "type": "rectangle"
  /// }
  /// ```
  ///
  /// `RoundedRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": "<BorderRadius>",
  ///   "side": "<BorderSide>",
  ///   "type": "rounded"
  /// }
  /// ```
  ///
  /// `StadiumBorder`
  /// ```json
  /// {
  ///   "side": "<BorderSide>",
  ///   "type": "stadium"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderRadius]
  ///  * [decodeBorderSide]
  static ShapeBorder? decodeShapeBorder(
    dynamic value, {
    bool validate = true,
  }) {
    ShapeBorder? result;
    if (value is ShapeBorder) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);
      _checkSupported(
        'ShapeBorder.type',
        [
          'circle',
          'rectangle',
          'rounded',
          'stadium',
        ],
        value == null ? null : value['type'],
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/shape_border',
          value: value,
          validate: validate,
        ));
        final String? type = value['type'];

        switch (type) {
          case 'circle':
            result = CircleBorder(
              side: decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'rectangle':
            result = ContinuousRectangleBorder(
              borderRadius: decodeBorderRadius(
                    value['borderRadius'],
                    validate: false,
                  ) ??
                  BorderRadius.zero,
              side: decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'rounded':
            result = RoundedRectangleBorder(
              borderRadius: decodeBorderRadius(
                    value['borderRadius'],
                    validate: false,
                  ) ??
                  BorderRadius.zero,
              side: decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'stadium':
            result = StadiumBorder(
              side: decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [ShowValueIndicator].  Supported values are:
  ///  * `always`
  ///  * `never`
  ///  * `onlyForContinuous`
  ///  * `onlyForDiscrete`
  static ShowValueIndicator? decodeShowValueIndicator(
    dynamic value, {
    bool validate = true,
  }) {
    ShowValueIndicator? result;
    if (value is ShowValueIndicator) {
      result = value;
    } else {
      _checkSupported(
        'ShowValueIndicator',
        [
          'always',
          'never',
          'onlyForContinuous',
          'onlyForDiscrete',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/show_value_indicator',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'always':
            result = ShowValueIndicator.always;
            break;

          case 'never':
            result = ShowValueIndicator.never;
            break;

          case 'onlyForContinuous':
            result = ShowValueIndicator.onlyForContinuous;
            break;

          case 'onlyForDiscrete':
            result = ShowValueIndicator.onlyForDiscrete;
            break;
        }
      }
    }
    return result;
  }

  /// Decodes the given [value] to a [Size].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "height": "<double>",
  ///   "width": "<double>"
  /// }
  /// ```
  static Size? decodeSize(
    dynamic value, {
    bool validate = true,
  }) {
    Size? result;

    if (value is Size) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/size',
        value: value,
        validate: validate,
      ));
      result = Size(
        JsonClass.maybeParseDouble(value['width'])!,
        JsonClass.maybeParseDouble(value['height'])!,
      );
    }

    return result;
  }

  /// Decodes the [value] to a [SliderComponentShape].  Supported values are:
  ///  * `noOverlay`
  ///  * `noThumb`
  static SliderComponentShape? decodeSliderComponentShape(
    dynamic value, {
    bool validate = true,
  }) {
    SliderComponentShape? result;
    if (value is SliderComponentShape) {
      result = value;
    } else {
      _checkSupported(
        'SliderComponentShape',
        [
          'noOverlay',
          'noThumb',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/slider_component_shape',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'noOverlay':
            result = SliderComponentShape.noOverlay;
            break;

          case 'noThumb':
            result = SliderComponentShape.noThumb;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to a [SliderThemeData].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "activeTickMarkColor": "<Color>",
  ///   "activeTrackColor": "<Color>",
  ///   "disabledActiveTickMarkColor": "<Color>",
  ///   "disabledActiveTrackColor": "<Color>",
  ///   "disabledInactiveTickMarkColor": "<Color>",
  ///   "disabledInactiveTrackColor": "<Color>",
  ///   "disabledSecondaryActiveTrackColor": "<Color>",
  ///   "disabledThumbColor": "<Color>",
  ///   "inactiveTickMarkColor": "<Color>",
  ///   "inactiveTrackColor": "<Color>",
  ///   "minThumbSeparation": "<double>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "overlappingShapeStrokeColor": "<Color>",
  ///   "overlayColor": "<Color>",
  ///   "overlayShape": "<SliderComponentShape>",
  ///   "rangeThumbShape": "<RangeSliderThumbShape>",
  ///   "rangeTickMarkShape": "<RangeSliderTickMarkShape>",
  ///   "rangeTrackShape": "<RangeSliderTrackShape>",
  ///   "rangeValueIndicatorShape": "<RangeSliderValueIndicatorShape>",
  ///   "secondaryActiveTrackColor": "<Color>",
  ///   "showValueIndicator": "<ShowValueIndicator>",
  ///   "thumbColor": "<Color>",
  ///   "thumbShape": "<SliderComponentShape>",
  ///   "tickMarkShape": "<SliderTickMarkShape>",
  ///   "trackHeight": "<double>",
  ///   "trackShape": "<SliderTrackShape>",
  ///   "valueIndicatorColor": "<Color>",
  ///   "valueIndicatorShape": "<SliderComponentShape>",
  ///   "valueIndicatorTextStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeMaterialStatePropertyMouseCursor]
  ///  * [decodeShowValueIndicator]
  ///  * [decodeSliderComponentShape]
  ///  * [decodeSliderTickMarkShape]
  ///  * [decodeRangeSliderThumbShape]
  ///  * [decodeRangeSliderTickMarkShape]
  ///  * [decodeRangeSliderTrackShape]
  ///  * [decodeRangeSliderValueIndicatorShape]
  static SliderThemeData? decodeSliderThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    SliderThemeData? result;

    if (value is SliderThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/slider_theme_data',
        value: value,
        validate: validate,
      ));
      result = SliderThemeData(
        activeTickMarkColor: decodeColor(
          value['activeTickMarkColor'],
          validate: false,
        ),
        activeTrackColor: decodeColor(
          value['activeTrackColor'],
          validate: false,
        ),
        disabledActiveTickMarkColor: decodeColor(
          value['disabledActiveTickMarkColor'],
          validate: false,
        ),
        disabledActiveTrackColor: decodeColor(
          value['disabledActiveTrackColor'],
          validate: false,
        ),
        disabledInactiveTickMarkColor: decodeColor(
          value['disabledInactiveTickMarkColor'],
          validate: false,
        ),
        disabledInactiveTrackColor: decodeColor(
          value['disabledInactiveTrackColor'],
          validate: false,
        ),
        disabledSecondaryActiveTrackColor: decodeColor(
          value['disabledSecondaryActiveTrackColor'],
          validate: false,
        ),
        disabledThumbColor: decodeColor(
          value['disabledThumbColor'],
          validate: false,
        ),
        inactiveTickMarkColor: decodeColor(
          value['inactiveTickMarkColor'],
          validate: false,
        ),
        inactiveTrackColor: decodeColor(
          value['inactiveTrackColor'],
          validate: false,
        ),
        minThumbSeparation:
            JsonClass.maybeParseDouble(value['minThumbSeparation']),
        mouseCursor: decodeMaterialStatePropertyMouseCursor(
          value['mouseCursor'],
          validate: false,
        ),
        overlappingShapeStrokeColor: decodeColor(
          value['overlappingShapeStrokeColor'],
          validate: false,
        ),
        overlayColor: decodeColor(
          value['overlayColor'],
          validate: false,
        ),
        overlayShape: decodeSliderComponentShape(
          value['overlayShape'],
          validate: false,
        ),
        rangeThumbShape: decodeRangeSliderThumbShape(
          value['rangeThumbShape'],
          validate: false,
        ),
        rangeTickMarkShape: decodeRangeSliderTickMarkShape(
          value['rangeTickMarkShape'],
          validate: false,
        ),
        rangeTrackShape: decodeRangeSliderTrackShape(
          value['rangeTrackShape'],
          validate: false,
        ),
        rangeValueIndicatorShape: decodeRangeSliderValueIndicatorShape(
          value['rangeValueIndicatorShape'],
          validate: false,
        ),
        secondaryActiveTrackColor: decodeColor(
          value['secondaryActiveTrackColor'],
          validate: false,
        ),
        showValueIndicator: decodeShowValueIndicator(
          value['showValueIndicator'],
          validate: false,
        ),
        thumbColor: decodeColor(
          value['thumbColor'],
          validate: false,
        ),
        // thumbSelector: @unencodable
        thumbShape: decodeSliderComponentShape(
          value['thumbShape'],
          validate: false,
        ),
        tickMarkShape: decodeSliderTickMarkShape(
          value['tickMarkShape'],
          validate: false,
        ),
        trackHeight: JsonClass.maybeParseDouble(value['trackHeight']),
        trackShape: decodeSliderTrackShape(
          value['trackShape'],
          validate: false,
        ),
        valueIndicatorColor: decodeColor(
          value['valueIndicatorColor'],
          validate: false,
        ),
        valueIndicatorShape: decodeSliderComponentShape(
          value['valueIndicatorShape'],
          validate: false,
        ),
        valueIndicatorTextStyle: decodeTextStyle(
          value['valueIndicatorTextStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [SliderTickMarkShape].  Supported values are:
  ///  * `noTickMark`
  static SliderTickMarkShape? decodeSliderTickMarkShape(
    dynamic value, {
    bool validate = true,
  }) {
    SliderTickMarkShape? result;
    if (value is SliderTickMarkShape) {
      result = value;
    } else {
      _checkSupported(
        'SliderTickMarkShape',
        [
          'noTickMark',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/slider_tick_mark_shape',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'noTickMark':
            result = SliderTickMarkShape.noTickMark;
            break;
        }
      }
    }
    return result;
  }

  /// Decodes the given [value] to a [SliderTrackShape].  This expects the
  /// [value] to have an attribute named "type" that is one of the following
  /// values:
  ///  * `rectangular`
  ///  * `rounded`
  ///
  /// The schema for the rest of the attributes depends on the "type".
  ///
  /// Type: `rectangular`
  /// ```json
  /// {
  ///   "type": "rectangular"
  /// }
  /// ```
  ///
  /// Type: `rounded`
  /// ```json
  /// {
  ///   "type": "rounded"
  /// }
  /// ```
  static SliderTrackShape? decodeSliderTrackShape(
    dynamic value, {
    bool validate = true,
  }) {
    SliderTrackShape? result;
    if (value is SliderTrackShape) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);
      _checkSupported(
        'type',
        [
          'rectangular',
          'rounded',
        ],
        value == null ? null : value['type'],
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/slider_track_shape',
          value: value,
          validate: validate,
        ));
        final String? type = value['type'];
        switch (type) {
          case 'rectangular':
            result = const RectangularSliderTrackShape();
            break;

          case 'rounded':
            result = const RoundedRectSliderTrackShape();
            break;
        }
      }
    }

    return result;
  }

  /// Decodes a [value] to a [SmartDashesType].  Supported values are:
  ///  * `disabled`
  ///  * `enabled`
  static SmartDashesType? decodeSmartDashesType(
    dynamic value, {
    bool validate = true,
  }) {
    SmartDashesType? result;
    if (value is SmartDashesType) {
      result = value;
    } else {
      _checkSupported(
        'SmartDashesType',
        [
          'disabled',
          'enabled',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/smart_dashes_type',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'disabled':
            result = SmartDashesType.disabled;
            break;
          case 'enabled':
            result = SmartDashesType.enabled;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes a [value] to a [SmartQuotesType].  Supported values are:
  ///  * `disabled`
  ///  * `enabled`
  static SmartQuotesType? decodeSmartQuotesType(
    dynamic value, {
    bool validate = true,
  }) {
    SmartQuotesType? result;
    if (value is SmartQuotesType) {
      result = value;
    } else {
      _checkSupported(
        'SmartQuotesType',
        [
          'disabled',
          'enabled',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/smart_quotes_type',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'disabled':
            result = SmartQuotesType.disabled;
            break;
          case 'enabled':
            result = SmartQuotesType.enabled;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes a [value] to a [SnackBarBehavior].  Supported values are:
  ///  * `fixed`
  ///  * `floating`
  static SnackBarBehavior? decodeSnackBarBehavior(
    dynamic value, {
    bool validate = true,
  }) {
    SnackBarBehavior? result;
    if (value is SnackBarBehavior) {
      result = value;
    } else {
      _checkSupported(
        'SnackBarBehavior',
        [
          'fixed',
          'floating',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/snack_bar_behavior',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'fixed':
            result = SnackBarBehavior.fixed;
            break;

          case 'floating':
            result = SnackBarBehavior.floating;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to a [SnackBarThemeData].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "actionBackgroundColor": "<Color>",
  ///   "actionOverflowThreshold": "<double>",
  ///   "actionTextColor": "<Color>",
  ///   "backgroundColor": "<Color>",
  ///   "behavior": "<SnackBarBehavior>",
  ///   "closeIconColor": "<Color>",
  ///   "contentTextStyle": "<TextStyle>",
  ///   "disabledActionBackgroundColor": "<Color>",
  ///   "disabledActionTextColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "insetPadding": "<EdgeInsets>",
  ///   "shape": "<ShapeBorder>",
  ///   "showCloseIcon": "<bool>",
  ///   "width": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeSnackBarBehavior]
  ///  * [decodeShapeBorder]
  ///  * [decodeTextStyle]
  static SnackBarThemeData? decodeSnackBarThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    SnackBarThemeData? result;

    if (value is SnackBarThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/snack_bar_theme_data',
        value: value,
        validate: validate,
      ));
      result = SnackBarThemeData(
        actionBackgroundColor: decodeColor(
          value['actionBackgroundColor'],
          validate: false,
        ),
        actionOverflowThreshold: JsonClass.maybeParseDouble(
          value['actionOverflowThreshold'],
        ),
        actionTextColor: decodeColor(
          value['actionTextColor'],
          validate: false,
        ),
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        behavior: decodeSnackBarBehavior(
          value['behavior'],
          validate: false,
        ),
        closeIconColor: decodeColor(
          value['closeIconColor'],
          validate: false,
        ),
        contentTextStyle: decodeTextStyle(
          value['contentTextStyle'],
          validate: false,
        ),
        disabledActionBackgroundColor: decodeColor(
          value['disabledActionBackgroundColor'],
          validate: false,
        ),
        disabledActionTextColor: decodeColor(
          value['disabledActionTextColor'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        insetPadding: decodeEdgeInsetsGeometry(
          value['insetPadding'],
          validate: false,
        ) as EdgeInsets?,
        shape: decodeShapeBorder(
          value['shape'],
          validate: false,
        ),
        showCloseIcon: JsonClass.maybeParseBool(value['showCloseIcon']),
        width: JsonClass.maybeParseDouble(value['width']),
      );
    }

    return result;
  }

  /// Decodes a [value] to a [StackFit].  Supported values are:
  ///  * `expand`
  ///  * `loose`
  ///  * `passthrough`
  static StackFit? decodeStackFit(
    dynamic value, {
    bool validate = true,
  }) {
    StackFit? result;

    if (value is StackFit) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/stack_fit',
        value: value,
        validate: validate,
      ));
      switch (value) {
        case 'expand':
          result = StackFit.expand;
          break;

        case 'loose':
          result = StackFit.loose;
          break;

        case 'passthrough':
          result = StackFit.passthrough;
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] into a [StrutStyle].  If the value is `null`
  /// then `null` will be returned.  Otherwise, this expects a Map like value
  /// that in JSON would look like:
  ///
  /// ```json
  /// {
  ///   "fontFamily": "<String>",
  ///   "fontFamilyFallback": "<String[]>",
  ///   "fontSize": "<double>",
  ///   "fontStyle": "<FontStyle>",
  ///   "fontWeight": "<FontWeight>"
  ///   "forceStrutHeight": "<bool>",
  ///   "height": "<double>",
  ///   "leading": "<double>",
  ///   "leadingDistribution": "<TextLeadingDistribution>",
  ///   "package": "<String>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeFontStyle]
  ///  * [decodeFontWeight]
  ///  * [decodeTextLeadingDistribution]
  static StrutStyle? decodeStrutStyle(
    dynamic value, {
    bool validate = true,
  }) {
    StrutStyle? result;

    if (value is StrutStyle) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/strut_style',
        value: value,
        validate: validate,
      ));
      result = StrutStyle(
        fontFamily: value['fontFamily'],
        fontFamilyFallback: _decodeStringList(
          value['fontFamilyFallback'],
          (value) => value,
        ),
        fontSize: JsonClass.maybeParseDouble(value['fontSize']),
        fontStyle: decodeFontStyle(
          value['fontStyle'],
          validate: false,
        ),
        fontWeight: decodeFontWeight(
          value['fontWeight'],
          validate: false,
        ),
        forceStrutHeight: JsonClass.maybeParseBool(value['forceStrutHeight']),
        height: JsonClass.maybeParseDouble(value['height']),
        leading: JsonClass.maybeParseDouble(value['leading']),
        leadingDistribution: decodeTextLeadingDistribution(
          value['leadingDistribution'],
          validate: false,
        ),
        package: value['package'],
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [SwitchThemeData].  This expects the given
  /// [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "materialTapTargetSize": "<MaterialTapTargetSize>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "overlayColor": "<MaterialStateProperty<Color>>",
  ///   "splashRadius": "<double>",
  ///   "thumbColor": "<MaterialStateProperty<Color>>",
  ///   "trackColor": "<MaterialStateProperty<Color>>",
  ///   "trackOutlineColor": "<MaterialStateProperty<Color>>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeMaterialStatePropertyMouseCursor]
  ///  * [decodeMaterialTapTargetSize]
  ///  * [decodeMouseCursor]
  static SwitchThemeData? decodeSwitchThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    SwitchThemeData? result;

    if (value is SwitchThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/switch_theme_data',
        value: value,
        validate: validate,
      ));

      result = SwitchThemeData(
        materialTapTargetSize: decodeMaterialTapTargetSize(
          value['materialTapTargetSize'],
          validate: false,
        ),
        mouseCursor: decodeMaterialStatePropertyMouseCursor(
          value['mouseCursor'],
          validate: false,
        ),
        overlayColor: decodeMaterialStatePropertyColor(
          value['overlayColor'],
          validate: false,
        ),
        splashRadius: JsonClass.maybeParseDouble(value['splashRadius']),
        thumbColor: decodeMaterialStatePropertyColor(
          value['thumbColor'],
          validate: false,
        ),
        thumbIcon: decodeMaterialStatePropertyIcon(
          value['thumbIcon'],
          validate: false,
        ),
        trackColor: decodeMaterialStatePropertyColor(
          value['trackColor'],
          validate: false,
        ),
        trackOutlineColor: decodeMaterialStatePropertyColor(
          value['trackOutlineColor'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes a [value] to a [SystemUiOverlayStyle].  Supported values are:
  ///  * `dark`
  ///  * `light`
  static SystemUiOverlayStyle? decodeSystemUiOverlayStyle(
    dynamic value, {
    bool validate = true,
  }) {
    SystemUiOverlayStyle? result;
    if (value is SystemUiOverlayStyle) {
      result = value;
    } else if (value is Map) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/system_ui_overlay_style',
        value: value,
        validate: validate,
      ));

      result = SystemUiOverlayStyle(
        statusBarBrightness: decodeBrightness(
          value['statusBarBrightness'],
          validate: false,
        ),
        statusBarColor: decodeColor(
          value['statusBarColor'],
          validate: false,
        ),
        statusBarIconBrightness: decodeBrightness(
          value['statusBarIconBrightness'],
          validate: false,
        ),
        systemNavigationBarColor: decodeColor(
          value['systemNavigationBarColor'],
          validate: false,
        ),
        systemNavigationBarContrastEnforced: JsonClass.maybeParseBool(
          value['systemNavigationBarContrastEnforced'],
        ),
        systemNavigationBarDividerColor: decodeColor(
          value['systemNavigationBarDividerColor'],
          validate: false,
        ),
        systemNavigationBarIconBrightness: decodeBrightness(
          value['systemNavigationBarIconBrightness'],
          validate: false,
        ),
        systemStatusBarContrastEnforced: JsonClass.maybeParseBool(
          value['systemStatusBarContrastEnforced'],
        ),
      );
    } else {
      _checkSupported(
        'SystemUiOverlayStyle',
        [
          'dark',
          'light',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/system_ui_overlay_style',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'dark':
            result = SystemUiOverlayStyle.dark;
            break;

          case 'light':
            result = SystemUiOverlayStyle.light;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes a [value] to a [TabBarIndicatorSize].  Supported values are:
  ///  * `label`
  ///  * `tab`
  static TabBarIndicatorSize? decodeTabBarIndicatorSize(
    dynamic value, {
    bool validate = true,
  }) {
    TabBarIndicatorSize? result;
    if (value is TabBarIndicatorSize) {
      result = value;
    } else {
      _checkSupported(
        'TabBarIndicatorSize',
        [
          'label',
          'tab',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/tab_bar_indicator_size',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'label':
            result = TabBarIndicatorSize.label;
            break;

          case 'tab':
            result = TabBarIndicatorSize.tab;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to a [TabBarTheme].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "dividerColor": "<Color>",
  ///   "indicatorColor": "<Color>",
  ///   "indicatorSize": "<TabBarIndicatorSize>",
  ///   "labelPadding": "<EdgeInsetsGeometry>",
  ///   "labelColor": "<Color>",
  ///   "labelStyle": "<TextStyle>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "overlayColor": "<MaterialStateProperty<Color>>",
  ///   "splashFactory": "<InteractiveInkSplashFactory>",
  ///   "unselectedLabelColor": "<Color>",
  ///   "unselectedLabelStyle": "<TextStyle>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeInteractiveInkFeatureFactory]
  ///  * [decodeMaterialStatePropertyColor]
  ///  * [decodeMaterialStatePropertyMouseCursor]
  ///  * [decodeTabBarIndicatorSize]
  ///  * [decodeTextStyle]
  static TabBarTheme? decodeTabBarTheme(
    dynamic value, {
    bool validate = true,
  }) {
    TabBarTheme? result;

    if (value is TabBarTheme) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/tab_bar_theme',
        value: value,
        validate: validate,
      ));
      assert(
        value['indicator'] == null,
        'TabBarTheme.indicator is not supported',
      );
      result = TabBarTheme(
        dividerColor: decodeColor(
          value['dividerColor'],
          validate: false,
        ),
        // @unencodable
        // indicator
        indicatorColor: decodeColor(
          value['indicatorColor'],
          validate: false,
        ),
        indicatorSize: decodeTabBarIndicatorSize(
          value['indicatorSize'],
          validate: false,
        ),
        labelPadding: decodeEdgeInsetsGeometry(
          value['labelPadding'],
          validate: false,
        ),
        labelColor: decodeColor(
          value['labelColor'],
          validate: false,
        ),
        labelStyle: decodeTextStyle(
          value['labelStyle'],
          validate: false,
        ),
        mouseCursor: decodeMaterialStatePropertyMouseCursor(
          value['mouseCursor'],
          validate: false,
        ),
        overlayColor: decodeMaterialStatePropertyColor(
          value['overlayColor'],
          validate: false,
        ),
        splashFactory: decodeInteractiveInkFeatureFactory(
          value['splashFactory'],
          validate: false,
        ),
        unselectedLabelColor: decodeColor(
          value['unselectedLabelColor'],
          validate: false,
        ),
        unselectedLabelStyle: decodeTextStyle(
          value['unselectedLabelStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to a [TableBorder].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "borderRadius": "<BorderRadius>",
  ///   "bottom": "<BorderSide>",
  ///   "horizontalInside": "<BorderSide>",
  ///   "left": "<BorderSide>",
  ///   "right": "<BorderSide>",
  ///   "top": "<BorderSide>",
  ///   "verticalInside": "<BorderSide>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderRadius]
  ///  * [decodeBorderSide]
  static TableBorder? decodeTableBorder(
    dynamic value, {
    bool validate = true,
  }) {
    TableBorder? result;

    if (value is TableBorder) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/table_border',
        value: value,
        validate: validate,
      ));
      result = TableBorder(
        borderRadius: decodeBorderRadius(
              value['borderRadius'],
              validate: false,
            ) ??
            BorderRadius.zero,
        bottom: decodeBorderSide(
              value['bottom'],
              validate: false,
            ) ??
            BorderSide.none,
        horizontalInside: decodeBorderSide(
              value['horizontalInside'],
              validate: false,
            ) ??
            BorderSide.none,
        left: decodeBorderSide(
              value['left'],
              validate: false,
            ) ??
            BorderSide.none,
        right: decodeBorderSide(
              value['right'],
              validate: false,
            ) ??
            BorderSide.none,
        top: decodeBorderSide(
              value['top'],
              validate: false,
            ) ??
            BorderSide.none,
        verticalInside: decodeBorderSide(
              value['verticalInside'],
              validate: false,
            ) ??
            BorderSide.none,
      );
    }

    return result;
  }

  /// Decodes the given [value] to a [TableColumnWidth].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "a": "<TableColumnWidth>",
  ///   "b": "<TableColumnWidth>",
  ///   "type": "<"fixed" | "flex" | "fraction" | "intrinsic" | "max" | "min">",
  ///   "value": "<double>"
  /// }
  /// ```
  static TableColumnWidth? decodeTableColumnWidth(
    dynamic value, {
    bool validate = true,
  }) {
    TableColumnWidth? result;

    if (value is TableColumnWidth) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/table_column_width',
        value: value,
        validate: validate,
      ));
      final type = value['type'];

      switch (type) {
        case 'fixed':
          result =
              FixedColumnWidth(JsonClass.maybeParseDouble(value['value'])!);
          break;

        case 'flex':
          result = FlexColumnWidth(
            JsonClass.maybeParseDouble(value['value']) ?? 1.0,
          );
          break;

        case 'fraction':
          result = FractionColumnWidth(
            JsonClass.maybeParseDouble(value['value'])!,
          );
          break;

        case 'intrinsic':
          result = IntrinsicColumnWidth(
            flex: JsonClass.maybeParseDouble(value['value']),
          );
          break;

        case 'max':
          result = MaxColumnWidth(
            decodeTableColumnWidth(value['a'], validate: false)!,
            decodeTableColumnWidth(value['b'], validate: false)!,
          );
          break;

        case 'min':
          result = MinColumnWidth(
            decodeTableColumnWidth(value['a'], validate: false)!,
            decodeTableColumnWidth(value['b'], validate: false)!,
          );
          break;

        default:
          throw Exception(
            '[decodeTableColumnWidth]: unknown type encountered: [$type]',
          );
      }
    }

    return result;
  }

  /// Decodes a [value] to a [TargetPlatform].  Supported values are:
  ///  * `android`
  ///  * `fuchsia`
  ///  * `iOS`
  ///  * `linux`
  ///  * `macOS`
  ///  * `windows`
  static TargetPlatform? decodeTargetPlatform(
    dynamic value, {
    bool validate = true,
  }) {
    TargetPlatform? result;
    if (value is TargetPlatform) {
      result = value;
    } else {
      _checkSupported(
        'TargetPlatform',
        [
          'android',
          'fuchsia',
          'iOS',
          'linux',
          'macOS',
          'windows',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/target_platform',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'android':
            result = TargetPlatform.android;
            break;

          case 'fuchsia':
            result = TargetPlatform.fuchsia;
            break;

          case 'iOS':
            result = TargetPlatform.iOS;
            break;

          case 'linux':
            result = TargetPlatform.linux;
            break;

          case 'macOS':
            result = TargetPlatform.macOS;
            break;

          case 'windows':
            result = TargetPlatform.windows;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [TextAlign].  Supported values are:
  ///  * `center`
  ///  * `end`
  ///  * `justify`
  ///  * `left`
  ///  * `right`
  ///  * `start`
  static TextAlign? decodeTextAlign(
    dynamic value, {
    bool validate = true,
  }) {
    TextAlign? result;
    if (value is TextAlign) {
      result = value;
    } else {
      _checkSupported(
        'TextAlign',
        [
          'center',
          'end',
          'justify',
          'left',
          'right',
          'start',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/text_align',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'center':
            result = TextAlign.center;
            break;
          case 'end':
            result = TextAlign.end;
            break;
          case 'justify':
            result = TextAlign.justify;
            break;
          case 'left':
            result = TextAlign.left;
            break;
          case 'right':
            result = TextAlign.right;
            break;
          case 'start':
            result = TextAlign.start;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [TextAlignVertical].  Supported values are:
  ///  * `bottom`
  ///  * `center`
  ///  * `top`
  static TextAlignVertical? decodeTextAlignVertical(
    dynamic value, {
    bool validate = true,
  }) {
    TextAlignVertical? result;

    if (value is TextAlignVertical) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/text_align_vertical',
        value: value,
        validate: validate,
      ));
      switch (value) {
        case 'bottom':
          result = TextAlignVertical.bottom;
          break;
        case 'center':
          result = TextAlignVertical.center;
          break;
        case 'top':
          result = TextAlignVertical.top;
          break;
      }
    }

    return result;
  }

  /// Decodes the [value] to a [TextBaseline].  Supported values are:
  ///  * `alphabetic`
  ///  * `ideographic`
  static TextBaseline? decodeTextBaseline(
    dynamic value, {
    bool validate = true,
  }) {
    TextBaseline? result;
    if (value is TextBaseline) {
      result = value;
    } else {
      _checkSupported(
        'TextBaseline',
        [
          'alphabetic',
          'ideographic',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/text_baseline',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'alphabetic':
            result = TextBaseline.alphabetic;
            break;

          case 'ideographic':
            result = TextBaseline.ideographic;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [TextButtonThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "style": "<ButtonStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeButtonStyle]
  static TextButtonThemeData? decodeTextButtonThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    TextButtonThemeData? result;

    if (value is TextButtonThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/text_button_theme_data',
        value: value,
        validate: validate,
      ));
      result = TextButtonThemeData(
        style: decodeButtonStyle(
          value['style'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [TextCapitalization].  Supported values are:
  ///  * `characters`
  ///  * `none`
  ///  * `sentences`
  ///  * `words`
  static TextCapitalization? decodeTextCapitalization(
    dynamic value, {
    bool validate = true,
  }) {
    TextCapitalization? result;
    if (value is TextCapitalization) {
      result = value;
    } else {
      _checkSupported(
        'TextCapitalization',
        [
          'characters',
          'none',
          'sentences',
          'words',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/text_capitalization',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'characters':
            result = TextCapitalization.characters;
            break;

          case 'none':
            result = TextCapitalization.none;
            break;

          case 'sentences':
            result = TextCapitalization.sentences;
            break;

          case 'words':
            result = TextCapitalization.words;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [TextDecoration].  Supported values are:
  ///  * `lineThrough`
  ///  * `none`
  ///  * `overline`
  ///  * `underline`
  static TextDecoration? decodeTextDecoration(
    dynamic value, {
    bool validate = true,
  }) {
    TextDecoration? result;
    if (value is TextDecoration) {
      result = value;
    } else {
      _checkSupported(
        'TextDecoration',
        [
          'lineThrough',
          'none',
          'overline',
          'underline',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/text_decoration',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'lineThrough':
            result = TextDecoration.lineThrough;
            break;

          case 'none':
            result = TextDecoration.none;
            break;

          case 'overline':
            result = TextDecoration.overline;
            break;

          case 'underline':
            result = TextDecoration.underline;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [TextDecorationStyle].  Supported values are:
  ///  * `dashed`
  ///  * `dotted`
  ///  * `double`
  ///  * `solid`
  ///  * `wavy`
  static TextDecorationStyle? decodeTextDecorationStyle(
    dynamic value, {
    bool validate = true,
  }) {
    TextDecorationStyle? result;
    if (value is TextDecorationStyle) {
      result = value;
    } else {
      _checkSupported(
        'TextDecorationStyle',
        [
          'dashed',
          'dotted',
          'double',
          'solid',
          'wavy',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/text_decoration_style',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'dashed':
            result = TextDecorationStyle.dashed;
            break;

          case 'dotted':
            result = TextDecorationStyle.dotted;
            break;

          case 'double':
            result = TextDecorationStyle.double;
            break;

          case 'solid':
            result = TextDecorationStyle.solid;
            break;

          case 'wavy':
            result = TextDecorationStyle.wavy;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [TextDirection].  Supported values are:
  ///  * `ltr`
  ///  * `rtl`
  static TextDirection? decodeTextDirection(
    dynamic value, {
    bool validate = true,
  }) {
    TextDirection? result;
    if (value is TextDirection) {
      result = value;
    } else {
      _checkSupported(
        'TextDirection',
        [
          'ltr',
          'rtl',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/text_direction',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'ltr':
            result = TextDirection.ltr;
            break;

          case 'rtl':
            result = TextDirection.rtl;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] into a [TextHeightBehavior].  If the value is
  /// `null` then `null` will be returned.  Otherwise, this expects a Map like
  /// value that in JSON would look like:
  ///
  /// ```json
  /// {
  ///   "applyHeightToFirstAscent": "<bool>",
  ///   "applyHeightToLastDescent": "<bool>",
  ///   "leadingDistribution": "<TextLeadingDistribution>"
  /// }
  /// ```
  static TextHeightBehavior? decodeTextHeightBehavior(
    dynamic value, {
    bool validate = true,
  }) {
    TextHeightBehavior? result;

    if (value is TextHeightBehavior) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/text_height_behavior',
        value: value,
        validate: validate,
      ));
      result = TextHeightBehavior(
        applyHeightToFirstAscent: JsonClass.parseBool(
          value['applyHeightToLastDescent'],
          whenNull: true,
        ),
        applyHeightToLastDescent: JsonClass.parseBool(
          value['applyHeightToLastDescent'],
          whenNull: true,
        ),
        leadingDistribution: decodeTextLeadingDistribution(
              value['leadingDistribution'],
              validate: false,
            ) ??
            TextLeadingDistribution.proportional,
      );
    }

    return result;
  }

  /// Decodes the [value] to a [TextInputAction].  Supported values are:
  ///  * `continueAction`
  ///  * `done`
  ///  * `emergencyCall`
  ///  * `go`
  ///  * `join`
  ///  * `newline`
  ///  * `next`
  ///  * `none`
  ///  * `previous`
  ///  * `route`
  ///  * `search`
  ///  * `send`
  ///  * `unspecified`
  static TextInputAction? decodeTextInputAction(
    dynamic value, {
    bool validate = true,
  }) {
    TextInputAction? result;
    if (value is TextInputAction) {
      result = value;
    } else {
      _checkSupported(
        'TextInputAction',
        [
          'continueAction',
          'done',
          'emergencyCall',
          'go',
          'join',
          'newline',
          'next',
          'none',
          'previous',
          'route',
          'search',
          'send',
          'unspecified',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/text_input_action',
          value: value,
          validate: validate,
        ));

        switch (value) {
          case 'continueAction':
            result = TextInputAction.continueAction;
            break;

          case 'done':
            result = TextInputAction.done;
            break;

          case 'emergencyCall':
            result = TextInputAction.emergencyCall;
            break;

          case 'go':
            result = TextInputAction.go;
            break;

          case 'join':
            result = TextInputAction.join;
            break;

          case 'newline':
            result = TextInputAction.newline;
            break;

          case 'next':
            result = TextInputAction.next;
            break;

          case 'none':
            result = TextInputAction.none;
            break;

          case 'previous':
            result = TextInputAction.previous;
            break;

          case 'route':
            result = TextInputAction.route;
            break;

          case 'search':
            result = TextInputAction.search;
            break;

          case 'send':
            result = TextInputAction.send;
            break;

          case 'unspecified':
            result = TextInputAction.unspecified;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [TextInputType].  Supported values are:
  ///  * `datetime`
  ///  * `emailAddress`
  ///  * `multiline`
  ///  * `name`
  ///  * `none`
  ///  * `number`
  ///  * `phone`
  ///  * `streetAddress`
  ///  * `text`
  ///  * `url`
  ///  * `visiblePassword`
  static TextInputType? decodeTextInputType(
    dynamic value, {
    bool validate = true,
  }) {
    TextInputType? result;
    if (value is TextInputType) {
      result = value;
    } else {
      _checkSupported(
        'TextInputType',
        [
          'datetime',
          'emailAddress',
          'multiline',
          'name',
          'none',
          'number',
          'phone',
          'streetAddress',
          'text',
          'url',
          'visiblePassword',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/text_input_type',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'datetime':
            result = TextInputType.datetime;
            break;

          case 'emailAddress':
            result = TextInputType.emailAddress;
            break;

          case 'multiline':
            result = TextInputType.multiline;
            break;

          case 'name':
            result = TextInputType.name;
            break;

          case 'none':
            result = TextInputType.none;
            break;

          case 'number':
            result = TextInputType.number;
            break;

          case 'phone':
            result = TextInputType.phone;
            break;

          case 'streetAddress':
            result = TextInputType.streetAddress;
            break;

          case 'text':
            result = TextInputType.text;
            break;

          case 'url':
            result = TextInputType.url;
            break;

          case 'visiblePassword':
            result = TextInputType.visiblePassword;
            break;
        }
      }
    }
    return result;
  }

  /// Decodes the [value] to a [TextLeadingDistribution].  Supported values are:
  ///  * `even`
  ///  * `proportional`
  static TextLeadingDistribution? decodeTextLeadingDistribution(
    dynamic value, {
    bool validate = true,
  }) {
    TextLeadingDistribution? result;
    if (value is TextLeadingDistribution) {
      result = value;
    } else {
      _checkSupported(
        'TextLeadingDistribution',
        [
          'even',
          'proportional',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/text_leading_distribution',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'even':
            result = TextLeadingDistribution.even;
            break;

          case 'proportional':
            result = TextLeadingDistribution.proportional;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [TextOverflow].  Supported values are:
  ///  * `clip`
  ///  * `ellipsis`
  ///  * `fade`
  ///  * `visible`
  static TextOverflow? decodeTextOverflow(
    dynamic value, {
    bool validate = true,
  }) {
    TextOverflow? result;
    if (value is TextOverflow) {
      result = value;
    } else {
      _checkSupported(
        'TextOverflow',
        [
          'clip',
          'ellipsis',
          'fade',
          'visible',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/text_overflow',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'clip':
            result = TextOverflow.clip;
            break;
          case 'ellipsis':
            result = TextOverflow.ellipsis;
            break;
          case 'fade':
            result = TextOverflow.fade;
            break;
          case 'visible':
            result = TextOverflow.visible;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to an [TextSelectionThemeData].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "cursorColor": "<Color>",
  ///   "selectionColor": "<Color>",
  ///   "selectionHandleColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  static TextSelectionThemeData? decodeTextSelectionThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    TextSelectionThemeData? result;

    if (value is TextSelectionThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/text_selection_theme_data',
        value: value,
        validate: validate,
      ));
      result = TextSelectionThemeData(
        cursorColor: decodeColor(
          value['cursorColor'],
          validate: false,
        ),
        selectionColor: decodeColor(
          value['selectionColor'],
          validate: false,
        ),
        selectionHandleColor: decodeColor(
          value['selectionHandleColor'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes a given Map-like [value] into a [TextStyle].  This expects the
  /// given [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "children": "<List<TextSpan>>",
  ///   "locale": "<Locale>",
  ///   "mouseCursor": "<MouseCursor>",
  ///   "onEnter": "<PointerEnterEventListener>",
  ///   "onExit": "<PointerExitEventListener>",
  ///   "recognizer": "<GestureRecognizer>",
  ///   "semanticsLabel": "<String>",
  ///   "spellOut": "<bool>",
  ///   "style": "<TextStyle>",
  ///   "text": "<String>"
  /// }
  /// ```
  ///
  /// See Also:
  ///  * [decodeLocale]
  ///  * [decodeMouseCursor]
  ///  * [decodeTextStyle]
  static TextSpan? decodeTextSpan(
    dynamic value, {
    bool validate = true,
  }) {
    TextSpan? result;

    if (value is TextSpan) {
      result = value;
    } else if (value is String) {
      result = TextSpan(text: value);
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/text_span',
        value: value,
        validate: validate,
      ));

      result = TextSpan(
        children: (value['children'] as List?)
            ?.map((e) => decodeTextSpan(e, validate: false)!)
            .toList(),
        locale: decodeLocale(
          value['locale'],
          validate: false,
        ),
        mouseCursor: decodeMouseCursor(
          value['mouseCursor'],
          validate: false,
        ),
        onEnter: value['onEnter'],
        onExit: value['onExit'],
        recognizer: value['recognizer'],
        semanticsLabel: value['semanticsLabel']?.toString(),
        spellOut: JsonClass.maybeParseBool(value['spellOut']),
        style: decodeTextStyle(
          value['style'],
          validate: false,
        ),
        text: value['text']?.toString(),
      );
    }

    return result;
  }

  /// Decodes a given Map-like [value] into a [TextStyle].  This expects the
  /// given [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "color": "<Color>",
  ///   "decoration": "<TextDecoration>",
  ///   "decorationColor": "<Color>",
  ///   "decorationStyle": "<TextDecorationStyle>",
  ///   "decorationThickness": "<double>",
  ///   "fontFamily": "<FontFamily>",
  ///   "fontFamilyFallback": "<String[]>",
  ///   "fontFeatures": "<FontFeature[]>",
  ///   "fontSize": "<double>",
  ///   "fontStyle": "<FontStyle>",
  ///   "fontWeight": "<FontWeight>",
  ///   "height": "<double>",
  ///   "inherit": "<bool>",
  ///   "leadingDistribution": "<TextLeadingDistribution>",
  ///   "letterSpacing": "<double>",
  ///   "locale": "<Locale>",
  ///   "overflow": "<TextOverflow>",
  ///   "package": "<String>",
  ///   "shadows": "<Shadow[]>",
  ///   "textBaseline": "<TextBaseline>",
  ///   "wordSpacing": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeFontFeature]
  ///  * [decodeFontStyle]
  ///  * [decodeFontVariation]
  ///  * [decodeFontWeight]
  ///  * [decodeLocale]
  ///  * [decodeShadow]
  ///  * [decodeTextBaseline]
  ///  * [decodeTextDecoration]
  ///  * [decodeTextDecorationStyle]
  ///  * [decodeTextLeadingDistribution]
  ///  * [decodeTextOverflow]
  static TextStyle? decodeTextStyle(
    dynamic value, {
    bool validate = true,
  }) {
    TextStyle? result;

    if (value is TextStyle) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/text_style',
        value: value,
        validate: validate,
      ));
      result = TextStyle(
        // background: @unencodable
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        color: decodeColor(
          value['color'],
          validate: false,
        ),
        decoration: decodeTextDecoration(
          value['decoration'],
          validate: false,
        ),
        decorationColor: decodeColor(
          value['decorationColor'],
          validate: false,
        ),
        decorationStyle: decodeTextDecorationStyle(
          value['decorationStyle'],
          validate: false,
        ),
        decorationThickness:
            JsonClass.maybeParseDouble(value['decorationThickness']),
        fontFamily: value['fontFamily'],
        fontFamilyFallback: value['fontFamilyFallback'] == null
            ? null
            : List<String>.from(value['fontFamilyFallback']),
        fontFeatures: value['fontFeatures'] == null
            ? null
            : List<FontFeature>.from(
                value['fontFeatures'].map(
                  (value) => decodeFontFeature(
                    value,
                    validate: false,
                  ),
                ),
              ),
        fontVariations: (value['fontVariations'] as List?)
            ?.map<FontVariation>(
              (e) => decodeFontVariation(
                e,
                validate: false,
              )!,
            )
            .toList(),
        fontWeight: decodeFontWeight(
          value['fontWeight'],
          validate: false,
        ),
        fontSize: JsonClass.maybeParseDouble(value['fontSize']),
        fontStyle: decodeFontStyle(
          value['fontStyle'],
          validate: false,
        ),
        // foreground: @unencodable
        height: JsonClass.maybeParseDouble(value['height']),
        inherit: JsonClass.parseBool(
          value['inherit'],
          whenNull: true,
        ),
        leadingDistribution: decodeTextLeadingDistribution(
          value['leadingDistribution'],
          validate: false,
        ),
        letterSpacing: JsonClass.maybeParseDouble(value['letterSpacing']),
        locale: decodeLocale(
          value['locale'],
          validate: false,
        ),
        overflow: decodeTextOverflow(
          value['overflow'],
          validate: false,
        ),
        package: value['package'],
        shadows: value['shadows'] == null
            ? null
            : List<Shadow>.from(
                value['shadows'].map(
                  (value) => decodeShadow(
                    value,
                    validate: false,
                  ),
                ),
              ),
        textBaseline: decodeTextBaseline(
          value['textBaseline'],
          validate: false,
        ),
        wordSpacing: JsonClass.maybeParseDouble(value['wordSpacing']),
      );
    }

    return result;
  }

  /// Decodes the given [value] to a [TextTheme].  This expects the [value] to
  /// have one of the following structures:
  ///
  /// ## 2018 version
  /// ```json
  /// {
  ///   "bodyText1": "<TextStyle>",
  ///   "bodyText2": "<TextStyle>",
  ///   "button": "<TextStyle>",
  ///   "caption": "<TextStyle>",
  ///   "headline1": "<TextStyle>",
  ///   "headline2": "<TextStyle>",
  ///   "headline3": "<TextStyle>",
  ///   "headline4": "<TextStyle>",
  ///   "headline5": "<TextStyle>",
  ///   "headline6": "<TextStyle>",
  ///   "overline": "<TextStyle>",
  ///   "subtitle1": "<TextStyle>",
  ///   "subtitle2": "<TextStyle>"
  /// }
  /// ```
  ///
  /// ## 2021 version
  /// ```json
  /// {
  ///   "bodyLarge": "<TextStyle>",
  ///   "bodyMedium": "<TextStyle>",
  ///   "bodySmall": "<TextStyle>",
  ///   "displayLarge": "<TextStyle>",
  ///   "displayMedium": "<TextStyle>",
  ///   "displaySmall": "<TextStyle>",
  ///   "headlineLarge": "<TextStyle>",
  ///   "headlineMedium": "<TextStyle>",
  ///   "headlineSmall": "<TextStyle>",
  ///   "labelLarge": "<TextStyle>",
  ///   "labelMedium": "<TextStyle>",
  ///   "labelSmall": "<TextStyle>",
  ///   "titleLarge": "<TextStyle>",
  ///   "titleMedium": "<TextStyle>",
  ///   "titleSmall": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeTextStyle]
  static TextTheme? decodeTextTheme(
    dynamic value, {
    bool validate = true,
  }) {
    TextTheme? result;

    if (value is TextTheme) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/text_theme',
        value: value,
        validate: validate,
      ));
      result = TextTheme(
        bodyLarge: decodeTextStyle(
          value['bodyLarge'] ?? value['bodyText1'],
          validate: false,
        ),
        bodyMedium: decodeTextStyle(
          value['bodyMedium'] ?? value['bodyText2'],
          validate: false,
        ),
        bodySmall: decodeTextStyle(
          value['bodySmall'] ?? value['caption'],
          validate: false,
        ),
        // bodyText1: @deprecated,
        // bodyText2: @deprecated,
        // button: @deprecated,
        // caption: @deprecated,

        displayLarge: decodeTextStyle(
          value['displayLarge'] ?? value['headline1'],
          validate: false,
        ),
        displayMedium: decodeTextStyle(
          value['displayMedium'] ?? value['headline2'],
          validate: false,
        ),
        displaySmall: decodeTextStyle(
          value['displaySmall'] ?? value['headline3'],
          validate: false,
        ),
        // headline1: @deprecated,
        // headline2: @deprecated,
        // headline3: @deprecated,
        // headline4: @deprecated,
        // headline5: @deprecated,
        // headline6: @deprecated,
        headlineLarge: decodeTextStyle(
          value['headlineLarge'] ?? value[''],
          validate: false,
        ),
        headlineMedium: decodeTextStyle(
          value['headlineMedium'] ?? value['headline4'],
          validate: false,
        ),
        headlineSmall: decodeTextStyle(
          value['headlineSmall'] ?? value['headline5'],
          validate: false,
        ),
        labelLarge: decodeTextStyle(
          value['labelLarge'] ?? value['button'],
          validate: false,
        ),
        labelMedium: decodeTextStyle(
          value['labelMedium'] ?? value[''],
          validate: false,
        ),
        labelSmall: decodeTextStyle(
          value['labelSmall'] ?? value['overline'],
          validate: false,
        ),
        // overline: @deprecated,
        // subtitle1: @deprecated,
        // subtitle2: @deprecated,
        titleLarge: decodeTextStyle(
          value['titleLarge'] ?? value['headline6'],
          validate: false,
        ),
        titleMedium: decodeTextStyle(
          value['titleMedium'] ?? value['subtitle1'],
          validate: false,
        ),
        titleSmall: decodeTextStyle(
          value['titleSmall'] ?? value['subtitle2'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [TextWidthBasis].  Supported values are:
  ///  * `longestLine`
  ///  * `parent`
  static TextWidthBasis? decodeTextWidthBasis(
    dynamic value, {
    bool validate = true,
  }) {
    TextWidthBasis? result;

    if (value is TextWidthBasis) {
      result = value;
    } else {
      _checkSupported(
        'TextWidthBasis',
        [
          'longestLine',
          'parent',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/text_width_basis',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'longestLine':
            result = TextWidthBasis.longestLine;
            break;
          case 'parent':
            result = TextWidthBasis.parent;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to a [ThemeData].  This expects the [value] to
  /// have the following structure:
  ///
  /// ```json
  /// {
  ///   "appBarTheme": "<AppBarTheme>",
  ///   "applyElevationOverlayColor": "<bool>",
  ///   "badgeTheme": "<BadgeThemeData>",
  ///   "bannerTheme": "<MaterialBannerThemeData>",
  ///   "bottomAppBarTheme": "<BottomAppBarThemeScheme.id,
  ///   "bottomNavigationBarTheme": "<BottomNavigationBarThemeData>",
  ///   "bottomSheetTheme": "<BottomSheetThemeData>",
  ///   "brightness": "<Brightness>",
  ///   "buttonBarTheme": "<ButtonBarThemeData>",
  ///   "buttonTheme": "<ButtonThemeData>",
  ///   "canvasColor": "<Color>",
  ///   "cardColor": "<Color>",
  ///   "cardTheme": "<CardTheme>",
  ///   "checkboxTheme": "<CheckboxThemeData>",
  ///   "chipTheme": "<ChipThemeData>",
  ///   "colorScheme": "<ColorScheme>",
  ///   "colorSchemeSeed": "<Color>",
  ///   "cupertinoOverrideTheme": "<CupertinoThemeData>",
  ///   "datePickerTheme": "<DatePickerThemeData>",
  ///   "dataTableTheme": "<DataTableThemeData>",
  ///   "dialogBackgroundColor": "<Color>",
  ///   "dialogTheme": "<DialogTheme>",
  ///   "disabledColor": "<Color>",
  ///   "dividerColor": "<Color>",
  ///   "dividerTheme": "<DividerThemeData>",
  ///   "drawerTheme": "<DrawerThemeData>",
  ///   "dropdownMenuTheme": "<DropDownMenuThemeData>",
  ///   "elevatedButtonTheme": "<ElevatedButtonThemeData>",
  ///   "expansionTileTheme": "<ExpansionTileThemeData>",
  ///   "filledButtonTheme": "<FilledButtonThemeDataScheme>"",
  ///   "floatingActionButtonTheme": "<FloatingActionButtonThemeData>",
  ///   "focusColor": "<Color>",
  ///   "fontFamily": "<String>",
  ///   "fontFamilyFallback": "<List<String>>",
  ///   "highlightColor": "<Color>",
  ///   "hintColor": "<Color>",
  ///   "hoverColor": "<Color>",
  ///   "iconButtonTheme": "<IconButtonThemeData>",
  ///   "iconTheme": "<IconThemeData>",
  ///   "indicatorColor": "<Color>",
  ///   "inputDecorationTheme": "<InputDecorationTheme>",
  ///   "listTileTheme": "<ListTileThemeData>",
  ///   "materialTapTargetSize": "<MaterialTapTargetSize>",
  ///   "menuBarTheme": "<MenuBarThemeData>",
  ///   "menuButtonTheme": "<MenuButtonThemeData>",
  ///   "menuTheme": "<MenuThemeData>",
  ///   "navigationBarTheme": "<NavigationBarThemeData>",
  ///   "navigationDrawerTheme": "<NavigationDrawerThemeData>",
  ///   "navigationRailTheme": "<NavigationRailThemeData>",
  ///   "outlinedButtonTheme": "<OutlinedButtonThemeData>",
  ///   "package": "<String>",
  ///   "pageTransitionsTheme": "<PageTransitionsTheme>",
  ///   "platform": "<TargetPlatform>",
  ///   "popupMenuTheme": "<PopupMenuThemeData>",
  ///   "primaryColor": "<Color>",
  ///   "primaryColorDark": "<Color>",
  ///   "primaryColorLight": "<Color>",
  ///   "primaryIconTheme": "<IconThemeData>",
  ///   "primarySwatch": "<MaterialColor>",
  ///   "primaryTextTheme": "<TextTheme>",
  ///   "progressIndicatorTheme": "<ProgressIndicatorThemeData>",
  ///   "radioTheme": "<RadioThemeData>",
  ///   "scaffoldBackgroundColor": "<Color>",
  ///   "scrollbarTheme": "<ScrollbarThemeData>",
  ///   "searchBarTheme": "<SearchBarThemeData>",
  ///   "searchViewTheme": "<SearchViewThemeData>",
  ///   "secondaryHeaderColor": "<Color>",
  ///   "segmentedButtonTheme": "<SegmentedButtonThemeData>",
  ///   "shadowColor": "<Color>",
  ///   "sliderTheme": "<SliderThemeData>",
  ///   "snackBarTheme": "<SnackBarThemeData>",
  ///   "splashColor": "<Color>",
  ///   "splashFactory": "<InteractiveInkFeatureFactory>",
  ///   "switchTheme": "<SwitchThemeData>",
  ///   "tabBarTheme": "<TabBarTheme>",
  ///   "textButtonTheme": "<TextButtonThemeData>",
  ///   "textSelectionTheme": "<TextSelectionThemeData>",
  ///   "textTheme": "<TextTheme>",
  ///   "timePickerTheme": "<TimePickerThemeData>",
  ///   "toggleButtonsTheme": "<ToggleButtonsThemeData>",
  ///   "tooltipTheme": "<TooltipThemeData>",
  ///   "typography": "<Typography>",
  ///   "unselectedWidgetColor": "<Color>",
  ///   "useMaterial3": "<bool>",
  ///   "visualDensity": "<VisualDensity>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeAppBarTheme]
  ///  * [decodeBadgeThemeData]
  ///  * [decodeBottomAppBarTheme]
  ///  * [decodeBottomNavigationBarThemeData]
  ///  * [decodeBottomSheetThemeData]
  ///  * [decodeBrightness]
  ///  * [decodeButtonBarThemeData]
  ///  * [decodeButtonThemeData]
  ///  * [decodeCardTheme]
  ///  * [decodeCheckboxThemeData]
  ///  * [decodeChipThemeData]
  ///  * [decodeColor]
  ///  * [decodeColorScheme]
  ///  * [decodeDatePickerThemeData]
  ///  * [decodeDataTableThemeData]
  ///  * [decodeDialogTheme]
  ///  * [decodeDividerThemeData]
  ///  * [decodeDrawerThemeData]
  ///  * [decodeElevatedButtonThemeData]
  ///  * [decodeExpansionTileThemeData]
  ///  * [decodeFilledButtonThemeData]
  ///  * [decodeFloatingActionButtonThemeData]
  ///  * [decodeIconButtonThemeData]
  ///  * [decodeIconThemeData]
  ///  * [decodeInputDecorationTheme]
  ///  * [decodeInteractiveInkFeatureFactory]
  ///  * [decodeListTileThemeData]
  ///  * [decodeMaterialBannerThemeData]
  ///  * [decodeMaterialTapTargetSize]
  ///  * [decodeMenuBarThemeData]
  ///  * [decodeMenuButtonThemeData]
  ///  * [decodeMenuThemeData]
  ///  * [decodeNavigationBarThemeData]
  ///  * [decodeNavigationDrawerThemeData]
  ///  * [decodeNavigationRailThemeData]
  ///  * [decodeOutlinedButtonThemeData]
  ///  * [decodePageTransitionsTheme]
  ///  * [decodePopupMenuThemeData]
  ///  * [decodeProgressIndicatorThemeData]
  ///  * [decodeRadioThemeData]
  ///  * [decodeScrollbarThemeData]
  ///  * [decodeSearchBarThemeData]
  ///  * [decodeSearchViewThemeData]
  ///  * [decodeSegmentedButtonThemeData]
  ///  * [decodeSliderThemeData]
  ///  * [decodeSnackBarThemeData]
  ///  * [decodeSwitchThemeData]
  ///  * [decodeTabBarTheme]
  ///  * [decodeTargetPlatform]
  ///  * [decodeTextButtonThemeData]
  ///  * [decodeTextSelectionThemeData]
  ///  * [decodeTimePickerThemeData]
  ///  * [decodeTextStyle]
  ///  * [decodeToggleButtonsThemeData]
  ///  * [decodeTypography]
  ///  * [decodeVisualDensity]
  static ThemeData? decodeThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    ThemeData? result;

    if (value is ThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/theme_data',
        value: value,
        validate: validate,
      ));
      result = ThemeData(
        // accentColor: @deprecated
        // accentColorBrightness: @deprecated
        // accentIconTheme: @deprecated
        // accentTextTheme: @deprecated
        // androidOverscrollIndicator: @deprecated

        appBarTheme: decodeAppBarTheme(
          value['appBarTheme'],
          validate: false,
        ),
        applyElevationOverlayColor: JsonClass.maybeParseBool(
          value['applyElevationOverlayColor'],
        ),
        // backgroundColor: @deprecated,
        badgeTheme: decodeBadgeThemeData(
          value['badgeTheme'],
          validate: false,
        ),
        bannerTheme: decodeMaterialBannerThemeData(
          value['bannerTheme'],
          validate: false,
        ),
        // bottomAppBarColor: @deprecated,
        bottomAppBarTheme: decodeBottomAppBarTheme(
          value['bottomAppBarTheme'],
          validate: false,
        ),
        bottomNavigationBarTheme: decodeBottomNavigationBarThemeData(
          value['bottomNavigationBarTheme'],
          validate: false,
        ),
        bottomSheetTheme: decodeBottomSheetThemeData(
          value['bottomSheetTheme'],
          validate: false,
        ),
        brightness: decodeBrightness(
          value['brightness'],
          validate: false,
        ),
        buttonBarTheme: decodeButtonBarThemeData(
          value['buttonBarTheme'],
          validate: false,
        ),

        // buttonColor: @deprecated

        buttonTheme: decodeButtonThemeData(
          value['buttonTheme'],
          validate: false,
        ),
        canvasColor: decodeColor(
          value['canvasColor'],
          validate: false,
        ),
        cardColor: decodeColor(
          value['cardColor'],
          validate: false,
        ),
        cardTheme: decodeCardTheme(
          value['cardTheme'],
          validate: false,
        ),
        checkboxTheme: decodeCheckboxThemeData(
          value['checkboxTheme'],
          validate: false,
        ),
        chipTheme: decodeChipThemeData(
          value['chipTheme'],
          validate: false,
        ),
        colorScheme: decodeColorScheme(
          value['colorScheme'],
          validate: false,
        ),
        colorSchemeSeed: decodeColor(
          value['colorSchemeSeed'],
          validate: false,
        ),
        cupertinoOverrideTheme: decodeCupertinoThemeData(
          value['cupertinoOverrideTheme'],
          validate: false,
        ),

        // cursorColor: @deprecated

        datePickerTheme: decodeDatePickerThemeData(
          value['datePickerThemeData'],
          validate: false,
        ),
        dataTableTheme: decodeDataTableThemeData(
          value['dataTableTheme'],
          validate: false,
        ),
        dialogBackgroundColor: decodeColor(
          value['dialogBackgroundColor'],
          validate: false,
        ),
        dialogTheme: decodeDialogTheme(
          value['dialogTheme'],
          validate: false,
        ),
        disabledColor: decodeColor(
          value['disabledColor'],
          validate: false,
        ),
        dividerColor: decodeColor(
          value['dividerColor'],
          validate: false,
        ),
        dividerTheme: decodeDividerThemeData(
          value['dividerTheme'],
          validate: false,
        ),
        drawerTheme: decodeDrawerThemeData(
          value['drawerTheme'],
          validate: false,
        ),
        dropdownMenuTheme: decodeDropdownMenuThemeData(
          value['dropdownMenuTheme'],
          validate: false,
        ),
        elevatedButtonTheme: decodeElevatedButtonThemeData(
          value['elevatedButtonTheme'],
          validate: false,
        ),
        expansionTileTheme: decodeExpansionTileThemeData(
          value['expansionTileTheme'],
          validate: false,
        ),

        // errorColor: @deprecated,
        // extensions: @unencodable,

        filledButtonTheme: decodeFilledButtonThemeData(
          value[''],
          validate: false,
        ),

        // fixTextFieldOutlineLabel: @deprecated
        floatingActionButtonTheme: decodeFloatingActionButtonThemeData(
          value['floatingActionButtonTheme'],
          validate: false,
        ),

        focusColor: decodeColor(
          value['focusColor'],
          validate: false,
        ),
        fontFamily: value['fontFamily'],
        fontFamilyFallback: value['fontFamilyFallback'] == null
            ? null
            : List<String>.from(
                value['fontFamilyFallback'],
              ),
        highlightColor: decodeColor(
          value['highlightColor'],
          validate: false,
        ),
        hintColor: decodeColor(
          value['hintColor'],
          validate: false,
        ),
        hoverColor: decodeColor(
          value['hoverColor'],
          validate: false,
        ),
        iconButtonTheme: decodeIconButtonThemeData(
          value['iconButtonTheme'],
          validate: false,
        ),
        iconTheme: decodeIconThemeData(
          value['iconTheme'],
          validate: false,
        ),
        indicatorColor: decodeColor(
          value['indicatorColor'],
          validate: false,
        ),
        inputDecorationTheme: decodeInputDecorationTheme(
          value['inputDecorationTheme'],
          validate: false,
        ),
        listTileTheme: decodeListTileThemeData(
          value['listTileTheme'],
          validate: false,
        ),
        materialTapTargetSize: decodeMaterialTapTargetSize(
          value['materialTapTargetSize'],
          validate: false,
        ),
        menuBarTheme: decodeMenuBarThemeData(
          value['menuBarTheme'],
          validate: false,
        ),
        menuButtonTheme: decodeMenuButtonThemeData(
          value['menuButtonTheme'],
          validate: false,
        ),
        menuTheme: decodeMenuThemeData(
          value['menuTheme'],
          validate: false,
        ),
        navigationBarTheme: decodeNavigationBarThemeData(
          value['navigationBarTheme'],
          validate: false,
        ),
        navigationDrawerTheme: decodeNavigationDrawerThemeData(
          value['navigationDrawerTheme'],
          validate: false,
        ),
        navigationRailTheme: decodeNavigationRailThemeData(
          value['navigationRailTheme'],
          validate: false,
        ),
        outlinedButtonTheme: decodeOutlinedButtonThemeData(
          value['outlinedButtonTheme'],
          validate: false,
        ),
        pageTransitionsTheme: decodePageTransitionsTheme(
          value['pageTransitionsTheme'],
          validate: false,
        ),
        package: value['package'],
        platform: decodeTargetPlatform(
          value['platform'],
          validate: false,
        ),
        popupMenuTheme: decodePopupMenuThemeData(
          value['popupMenuTheme'],
          validate: false,
        ),
        primaryColor: decodeColor(
          value['primaryColor'],
          validate: false,
        ),

        // primaryColorBrightness: @deprecated

        primaryColorDark: decodeColor(
          value['primaryColorDark'],
          validate: false,
        ),
        primaryColorLight: decodeColor(
          value['primaryColorLight'],
          validate: false,
        ),
        primaryIconTheme: decodeIconThemeData(
          value['primaryIconTheme'],
          validate: false,
        ),
        primarySwatch: decodeMaterialColor(
          value['primarySwatch'],
          validate: false,
        ),
        primaryTextTheme: decodeTextTheme(
          value['primaryTextTheme'],
          validate: false,
        ),
        progressIndicatorTheme: decodeProgressIndicatorThemeData(
          value['progressIndicatorTheme'],
          validate: false,
        ),
        radioTheme: decodeRadioThemeData(
          value['radioTheme'],
          validate: false,
        ),
        scaffoldBackgroundColor: decodeColor(
          value['scaffoldBackgroundColor'],
          validate: false,
        ),
        scrollbarTheme: decodeScrollbarThemeData(
          value['scrollbarTheme'],
          validate: false,
        ),
        searchBarTheme: decodeSearchBarThemeData(
          value['searchBarTheme'],
          validate: false,
        ),
        searchViewTheme: decodeSearchViewThemeData(
          value['searchViewTheme'],
          validate: false,
        ),
        secondaryHeaderColor: decodeColor(
          value['secondaryHeaderColor'],
          validate: false,
        ),
        segmentedButtonTheme: decodeSegmentedButtonThemeData(
          value['segmentedButtonTheme'],
          validate: false,
        ),
        // selectedRowColor: @deprecated

        shadowColor: decodeColor(
          value['shadowColor'],
          validate: false,
        ),
        sliderTheme: decodeSliderThemeData(
          value['sliderTheme'],
          validate: false,
        ),
        snackBarTheme: decodeSnackBarThemeData(
          value['snackBarTheme'],
          validate: false,
        ),
        splashColor: decodeColor(
          value['splashColor'],
          validate: false,
        ),
        splashFactory: decodeInteractiveInkFeatureFactory(
          value['splashFactory'],
          validate: false,
        ),
        switchTheme: decodeSwitchThemeData(
          value['switchTheme'],
          validate: false,
        ),
        tabBarTheme: decodeTabBarTheme(
          value['tabBarTheme'],
          validate: false,
        ),
        textButtonTheme: decodeTextButtonThemeData(
          value['textButtonTheme'],
          validate: false,
        ),

        // textSelectionColor: @deprecated,
        // textSelectionHandleColor: @deprecated,

        textSelectionTheme: decodeTextSelectionThemeData(
          value['textSelectionTheme'],
          validate: false,
        ),
        textTheme: decodeTextTheme(
          value['textTheme'],
          validate: false,
        ),
        timePickerTheme: decodeTimePickerThemeData(
          value['timePickerTheme'],
          validate: false,
        ),
        toggleButtonsTheme: decodeToggleButtonsThemeData(
          value['toggleButtonsTheme'],
          validate: false,
        ),
        // toggleableActiveColor: @deprecated,
        tooltipTheme: decodeTooltipThemeData(
          value['tooltipTheme'],
          validate: false,
        ),
        typography: decodeTypography(
          value['typography'],
          validate: false,
        ),
        unselectedWidgetColor: decodeColor(
          value['unselectedWidgetColor'],
          validate: false,
        ),
        useMaterial3: JsonClass.maybeParseBool(value['useMaterial3']),

        // useTextSelectionTheme: @deprecated,

        visualDensity: decodeVisualDensity(
          value['visualDensity'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [TileMode].  Supported values are:
  ///  * `clamp`
  ///  * `decal`
  ///  * `mirror`
  ///  * `repeated`
  static TileMode? decodeTileMode(
    dynamic value, {
    bool validate = true,
  }) {
    TileMode? result;
    if (value is TileMode) {
      result = value;
    } else {
      _checkSupported(
        'TileMode',
        [
          'clamp',
          'decal',
          'mirror',
          'repeated',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/tile_mode',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'clamp':
            result = TileMode.clamp;
            break;

          case 'decal':
            result = TileMode.decal;
            break;

          case 'mirror':
            result = TileMode.mirror;
            break;

          case 'repeated':
            result = TileMode.repeated;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the given [value] to a [TimePickerThemeData].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "cancelButtonStyle": "<ButtonStyle>",
  ///   "confirmButtonStyle": "<ButtonStyle>",
  ///   "dayPeriodBorderSide": "<BorderSide>",
  ///   "dayPeriodColor": "<Color>",
  ///   "dayPeriodShape": "<ShapeBorder>",
  ///   "dayPeriodTextColor": "<Color>",
  ///   "dayPeriodTextStyle": "<TextStyle>",
  ///   "dialBackgroundColor": "<Color>",
  ///   "dialHandColor": "<Color>",
  ///   "dialTextColor": "<Color>",
  ///   "dialTextStyle": "<TextStyle>",
  ///   "elevation": "<double>",
  ///   "entryModeIconColor": "<Color>",
  ///   "helpTextStyle": "<TextStyle>",
  ///   "hourMinuteColor": "<Color>",
  ///   "hourMinuteShape": "<ShapeBorder>",
  ///   "hourMinuteTextColor": "<Color>",
  ///   "hourMinuteTextStyle": "<TextStyle>",
  ///   "inputDecorationTheme": "<InputDecorationTheme>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "shape": "<ShapeBorder>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderSide]
  ///  * [decodeButtonStyle]
  ///  * [decodeColor]
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeInputDecorationTheme]
  ///  * [decodeShapeBorder]
  ///  * [decodeTextStyle]
  static TimePickerThemeData? decodeTimePickerThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    TimePickerThemeData? result;

    if (value is TimePickerThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/time_picker_theme_data',
        value: value,
        validate: validate,
      ));

      result = TimePickerThemeData(
        backgroundColor: decodeColor(
          value['backgroundColor'],
          validate: false,
        ),
        cancelButtonStyle: decodeButtonStyle(
          value['cancelButtonStyle'],
          validate: false,
        ),
        confirmButtonStyle: decodeButtonStyle(
          value['confirmButtonStyle'],
          validate: false,
        ),
        dayPeriodBorderSide: decodeBorderSide(
          value['dayPeriodBorderSide'],
          validate: false,
        ),
        dayPeriodColor: decodeColor(
          value['dayPeriodColor'],
          validate: false,
        ),
        dayPeriodShape: value['dayPeriodShape'] == null
            ? null
            : decodeShapeBorder(
                value['dayPeriodShape'],
                validate: false,
              ) as OutlinedBorder?,
        dayPeriodTextColor: decodeColor(
          value['dayPeriodTextColor'],
          validate: false,
        ),
        dayPeriodTextStyle: decodeTextStyle(
          value['dayPeriodTextStyle'],
          validate: false,
        ),
        dialBackgroundColor: decodeColor(
          value['dialBackgroundColor'],
          validate: false,
        ),
        dialHandColor: decodeColor(
          value['dialHandColor'],
          validate: false,
        ),
        dialTextColor: decodeColor(
          value['dialTextColor'],
          validate: false,
        ),
        dialTextStyle: decodeTextStyle(
          value['dialTextStyle'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseDouble(value['elevation']),
        entryModeIconColor: decodeColor(
          value['entryModeIconColor'],
          validate: false,
        ),
        helpTextStyle: decodeTextStyle(
          value['helpTextStyle'],
          validate: false,
        ),
        hourMinuteColor: decodeColor(
          value['hourMinuteColor'],
          validate: false,
        ),
        hourMinuteShape: decodeShapeBorder(
          value['hourMinuteShape'],
          validate: false,
        ),
        hourMinuteTextColor: decodeColor(
          value['hourMinuteTextColor'],
          validate: false,
        ),
        hourMinuteTextStyle: decodeTextStyle(
          value['hourMinuteTextStyle'],
          validate: false,
        ),
        inputDecorationTheme: decodeInputDecorationTheme(
          value['inputDecorationTheme'],
          validate: false,
        ),
        padding: decodeEdgeInsetsGeometry(value['padding'], validate: false),
        shape: decodeShapeBorder(
          value['shape'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to a [ToggleButtonsThemeData].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "borderColor": "<Color>",
  ///   "borderRadius": "<BorderRadius>",
  ///   "borderWidth": "<double>",
  ///   "color": "<Color>",
  ///   "constraints": "<BoxConstraints>",
  ///   "disabledBorderColor": "<Color>",
  ///   "disabledColor": "<Color>",
  ///   "fillColor": "<Color>",
  ///   "focusColor": "<Color>",
  ///   "highlightColor": "<Color>",
  ///   "hoverColor": "<Color>",
  ///   "selectedBorderColor": "<Color>",
  ///   "selectedColor": "<Color>",
  ///   "splashColor": "<Color>",
  ///   "textStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderRadius]
  ///  * [decodeBoxConstraints]
  ///  * [decodeColor]
  ///  * [decodeTextStyle]
  static ToggleButtonsThemeData? decodeToggleButtonsThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    ToggleButtonsThemeData? result;

    if (value is ToggleButtonsThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/toggle_buttons_theme_data',
        value: value,
        validate: validate,
      ));

      result = ToggleButtonsThemeData(
        borderColor: decodeColor(
          value['borderColor'],
          validate: false,
        ),
        borderRadius: decodeBorderRadius(
          value['borderRadius'],
          validate: false,
        ),
        borderWidth: JsonClass.maybeParseDouble(value['borderWidth']),
        color: decodeColor(
          value['color'],
          validate: false,
        ),
        constraints: decodeBoxConstraints(
          value['constraints'],
          validate: false,
        ),
        disabledBorderColor: decodeColor(
          value['disabledBorderColor'],
          validate: false,
        ),
        disabledColor: decodeColor(
          value['disabledColor'],
          validate: false,
        ),
        fillColor: decodeColor(
          value['fillColor'],
          validate: false,
        ),
        focusColor: decodeColor(
          value['focusColor'],
          validate: false,
        ),
        highlightColor: decodeColor(
          value['highlightColor'],
          validate: false,
        ),
        hoverColor: decodeColor(
          value['hoverColor'],
          validate: false,
        ),
        selectedBorderColor: decodeColor(
          value['selectedBorderColor'],
          validate: false,
        ),
        selectedColor: decodeColor(
          value['selectedColor'],
          validate: false,
        ),
        splashColor: decodeColor(
          value['splashColor'],
          validate: false,
        ),
        textStyle: decodeTextStyle(
          value['textStyle'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the given [value] to a [TooltipThemeData].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "enableFeedback": "<bool>",
  ///   "excludeFromSemantics": "<bool>",
  ///   "height": "<double>",
  ///   "margin": "<EdgeInsetsGeometry>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "preferBelow": "<bool>"
  ///   "showDuration": "<int; millis>",
  ///   "textAlign": "<TextAlign>",
  ///   "textStyle": "<TextStyle>",
  ///   "verticalOffset": "<double>",
  ///   "waitDuration": "<int; millis>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeEdgeInsetsGeometry]
  ///  * [decodeTextAlign]
  ///  * [decodeTextStyle]
  ///  * [decodeTooltipTriggerMode]
  static TooltipThemeData? decodeTooltipThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    TooltipThemeData? result;

    if (value is TooltipThemeData) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/tooltip_theme_data',
        value: value,
        validate: validate,
      ));
      assert(
        value['decoration'] == null,
        'TooltipThemeData.decoration is not supported',
      );
      result = TooltipThemeData(
        // decoration: @unencodable
        enableFeedback: JsonClass.maybeParseBool(value['enableFeedback']),
        excludeFromSemantics: JsonClass.maybeParseBool(
          value['excludeFromSemantics'],
        ),
        height: JsonClass.maybeParseDouble(value['height']),
        margin: decodeEdgeInsetsGeometry(
          value['margin'],
          validate: false,
        ),
        padding: decodeEdgeInsetsGeometry(
          value['padding'],
          validate: false,
        ),
        preferBelow: JsonClass.maybeParseBool(value['preferBelow']),
        showDuration: JsonClass.maybeParseDurationFromMillis(
          value['showDuration'],
        ),
        textAlign: decodeTextAlign(
          value['textAlign'],
          validate: false,
        ),
        textStyle: decodeTextStyle(
          value['textStyle'],
          validate: false,
        ),
        triggerMode: decodeTooltipTriggerMode(
          value['triggerMode'],
          validate: false,
        ),
        verticalOffset: JsonClass.maybeParseDouble(value['verticalOffset']),
        waitDuration:
            JsonClass.maybeParseDurationFromMillis(value['waitDuration']),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [TooltipTriggerMode].  Supported values are:
  ///  * `longPress`
  ///  * `manual`
  ///  * `tap`
  static TooltipTriggerMode? decodeTooltipTriggerMode(
    dynamic value, {
    bool validate = true,
  }) {
    TooltipTriggerMode? result;

    if (value is TooltipTriggerMode) {
      result = value;
    } else if (value != null) {
      _checkSupported(
        'TooltipTriggerMode',
        [
          'longPress',
          'manual',
          'tap',
        ],
        value,
      );

      switch (value) {
        case 'longPress':
          result = TooltipTriggerMode.longPress;
          break;

        case 'manual':
          result = TooltipTriggerMode.manual;
          break;

        case 'tap':
          result = TooltipTriggerMode.tap;
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] to a [Typography].  This expects the [value] to
  /// have the following structure:
  ///
  /// ```json
  /// {
  ///   "black": "<TextTheme>",
  ///   "dense": "<TextTheme>",
  ///   "englishLike": "<TextTheme>",
  ///   "platform": "<TargetPlatform>",
  ///   "tall": "<TextTheme>",
  ///   "white": "<TextTheme>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeTargetPlatform]
  ///  * [decodeTextTheme]
  static Typography? decodeTypography(
    dynamic value, {
    bool validate = true,
  }) {
    Typography? result;

    if (value is Typography) {
      result = value;
    } else if (value != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/typography',
        value: value,
        validate: validate,
      ));
      result = Typography.material2018(
        black: decodeTextTheme(
          value['black'],
          validate: false,
        ),
        dense: decodeTextTheme(
          value['dense'],
          validate: false,
        ),
        englishLike: decodeTextTheme(
          value['englishLike'],
          validate: false,
        ),
        platform: decodeTargetPlatform(
          value['platform'],
          validate: false,
        ),
        tall: decodeTextTheme(
          value['tall'],
          validate: false,
        ),
        white: decodeTextTheme(
          value['white'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [VerticalDirection].  Supported values are:
  ///  * `down`
  ///  * `up`
  static VerticalDirection? decodeVerticalDirection(
    dynamic value, {
    bool validate = true,
  }) {
    VerticalDirection? result;
    if (value is VerticalDirection) {
      result = value;
    } else {
      _checkSupported(
        'VerticalDirection',
        [
          'down',
          'up',
        ],
        value,
      );

      if (value != null) {
        switch (value) {
          case 'down':
            result = VerticalDirection.down;
            break;
          case 'up':
            result = VerticalDirection.up;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [VisualDensity].  Supported values are:
  ///  * `adaptivePlatformDensity`
  ///  * `comfortable`
  ///  * `compact`
  ///  * `standard`
  static VisualDensity? decodeVisualDensity(
    dynamic value, {
    bool validate = true,
  }) {
    VisualDensity? result;
    if (value is VisualDensity) {
      result = value;
    } else {
      _checkSupported(
        'VisualDensity',
        [
          'adaptivePlatformDensity',
          'comfortable',
          'compact',
          'standard',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/visual_density',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'adaptivePlatformDensity':
            result = VisualDensity.adaptivePlatformDensity;
            break;

          case 'comfortable':
            result = VisualDensity.comfortable;
            break;

          case 'compact':
            result = VisualDensity.compact;
            break;

          case 'standard':
            result = VisualDensity.standard;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [WrapAlignment].  Supported values are:
  ///  * `center`
  ///  * `end`
  ///  * `spaceAround`
  ///  * `spaceBetween`
  ///  * `spaceEvenly`
  ///  * `start`
  static WrapAlignment? decodeWrapAlignment(
    dynamic value, {
    bool validate = true,
  }) {
    WrapAlignment? result;
    if (value is WrapAlignment) {
      result = value;
    } else {
      _checkSupported(
        'WrapAlignment',
        [
          'center',
          'end',
          'spaceAround',
          'spaceBetween',
          'spaceEvenly',
          'start',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/wrap_alignment',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'center':
            result = WrapAlignment.center;
            break;

          case 'end':
            result = WrapAlignment.end;
            break;

          case 'spaceAround':
            result = WrapAlignment.spaceAround;
            break;

          case 'spaceBetween':
            result = WrapAlignment.spaceBetween;
            break;

          case 'spaceEvenly':
            result = WrapAlignment.spaceEvenly;
            break;

          case 'start':
            result = WrapAlignment.start;
            break;
        }
      }
    }

    return result;
  }

  /// Decodes the [value] to a [WrapCrossAlignment].  Supported values are:
  ///  * `center`
  ///  * `end`
  ///  * `start`
  static WrapCrossAlignment? decodeWrapCrossAlignment(
    dynamic value, {
    bool validate = true,
  }) {
    WrapCrossAlignment? result;
    if (value is WrapCrossAlignment) {
      result = value;
    } else {
      _checkSupported(
        'WrapCrossAlignment',
        [
          'center',
          'end',
          'start',
        ],
        value,
      );

      if (value != null) {
        assert(SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/wrap_cross_alignment',
          value: value,
          validate: validate,
        ));
        switch (value) {
          case 'center':
            result = WrapCrossAlignment.center;
            break;

          case 'end':
            result = WrapCrossAlignment.end;
            break;

          case 'start':
            result = WrapCrossAlignment.start;
            break;
        }
      }
    }

    return result;
  }

  static void _checkSupported(
    String type,
    List<String> supported,
    dynamic value,
  ) {
    assert(value == null || value is String);
    assert(
      value == null || supported.contains(value),
      '$type($value) is not supported.  Supported values: $supported',
    );
  }

  static List<T>? _decodeDynamicList<T>(
    Iterable<dynamic>? list,
    T Function(
      dynamic value,
    ) decoder,
  ) {
    List<T>? result;

    if (list != null) {
      result = [];
      for (var value in list) {
        result.add(decoder(value));
      }
    }

    return result;
  }

  static List<T>? _decodeStringList<T>(
    Iterable<dynamic>? list,
    T Function(String value) decoder,
  ) {
    List<T>? result;

    if (list != null) {
      result = [];
      for (var value in list) {
        result.add(decoder(value));
      }
    }

    return result;
  }
}
