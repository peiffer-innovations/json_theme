part of 'theme_decoder.dart';

abstract class _ThemeDecoderFunctions {
  const _ThemeDecoderFunctions();

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
  Alignment? decodeAlignment(dynamic value, {bool validate = true}) {
    Alignment? result;

    if (value is Alignment) {
      result = value;
    } else if (value is Map) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/alignment',
          value: value,
          validate: validate,
        ),
      );

      result = Alignment(
        JsonClass.maybeParseDouble(value['x']) ?? 0.0,
        JsonClass.maybeParseDouble(value['y']) ?? 0.0,
      );
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/alignment',
            value: value,
            validate: validate,
          ),
        );
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
  AlignmentGeometry? decodeAlignmentGeometry(
    dynamic value, {
    bool validate = true,
  }) {
    AlignmentGeometry? result;

    if (value is AlignmentGeometry) {
      result = value;
    } else if (value is Map) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/alignment',
          value: value,
          validate: validate,
        ),
      );

      result = Alignment(
        JsonClass.maybeParseDouble(value['x']) ?? 0.0,
        JsonClass.maybeParseDouble(value['y']) ?? 0.0,
      );
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/alignment_geometry',
          value: value,
          validate: validate,
        ),
      );
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
  BorderRadius? decodeBorderRadius(dynamic value, {bool validate = true}) {
    BorderRadius? result;

    if (value is BorderRadius) {
      result = value;
    } else {
      final radius = JsonClass.maybeParseDouble(value);
      if (radius != null) {
        result = BorderRadius.circular(radius);
      } else {
        if (value != null) {
          assert(
            SchemaValidator.validate(
              schemaId: '$_baseSchemaUrl/border_radius',
              value: value,
              validate: validate,
            ),
          );
          final String? type = value['type'];

          switch (type) {
            case 'all':
              result = BorderRadius.all(
                ThemeDecoder.instance.decodeRadius(
                      value['radius'],
                      validate: false,
                    ) ??
                    Radius.zero,
              );
              break;
            case 'circular':
              result = BorderRadius.circular(
                JsonClass.maybeParseDouble(value['radius'])!,
              );
              break;
            case 'horizontal':
              result = BorderRadius.horizontal(
                left:
                    ThemeDecoder.instance.decodeRadius(
                      value['left'],
                      validate: false,
                    ) ??
                    Radius.zero,
                right:
                    ThemeDecoder.instance.decodeRadius(
                      value['right'],
                      validate: false,
                    ) ??
                    Radius.zero,
              );
              break;
            case 'only':
              result = BorderRadius.only(
                bottomLeft:
                    ThemeDecoder.instance.decodeRadius(
                      value['bottomLeft'],
                      validate: false,
                    ) ??
                    Radius.zero,
                bottomRight:
                    ThemeDecoder.instance.decodeRadius(
                      value['bottomRight'],
                      validate: false,
                    ) ??
                    Radius.zero,
                topLeft:
                    ThemeDecoder.instance.decodeRadius(
                      value['topLeft'],
                      validate: false,
                    ) ??
                    Radius.zero,
                topRight:
                    ThemeDecoder.instance.decodeRadius(
                      value['topRight'],
                      validate: false,
                    ) ??
                    Radius.zero,
              );
              break;
            case 'vertical':
              result = BorderRadius.vertical(
                bottom:
                    ThemeDecoder.instance.decodeRadius(
                      value['bottom'],
                      validate: false,
                    ) ??
                    Radius.zero,
                top:
                    ThemeDecoder.instance.decodeRadius(
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
  BorderRadius? decodeBorderRadiusGeometry(
    dynamic value, {
    bool validate = true,
  }) => decodeBorderRadius(value, validate: validate);

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
  BoxBorder? decodeBoxBorder(dynamic value, {bool validate = true}) {
    BoxBorder? result;

    if (value is BoxBorder) {
      result = value;
    } else if (value != null) {
      if (value['color'] != null ||
          value['style'] != null ||
          value['width'] != null) {
        final side = ThemeDecoder.instance.decodeBorderSide(
          value,
          validate: false,
        )!;
        result = Border.all(
          color: side.color,
          style: side.style,
          width: side.width,
        );
      } else {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/box_border',
            value: value,
            validate: validate,
          ),
        );
        result = Border(
          bottom:
              ThemeDecoder.instance.decodeBorderSide(
                value['bottom'],
                validate: false,
              ) ??
              BorderSide.none,
          left:
              ThemeDecoder.instance.decodeBorderSide(
                value['left'],
                validate: false,
              ) ??
              BorderSide.none,
          right:
              ThemeDecoder.instance.decodeBorderSide(
                value['right'],
                validate: false,
              ) ??
              BorderSide.none,
          top:
              ThemeDecoder.instance.decodeBorderSide(
                value['top'],
                validate: false,
              ) ??
              BorderSide.none,
        );
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
  Color? decodeColor(dynamic value, {bool validate = true}) {
    Color? result;

    if (value is Color) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/color',
          value: value,
          validate: validate,
        ),
      );
      var i = 0;

      if (value?.startsWith('#') == true) {
        value = value.substring(1);
      }

      if (value?.length == 3) {
        value =
            value.substring(0, 1) +
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
  ColorFilter? decodeColorFilter(dynamic value, {bool validate = true}) {
    ColorFilter? result;

    if (value is ColorFilter) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/color_filter',
          value: value,
          validate: validate,
        ),
      );

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
            ThemeDecoder.instance.decodeBlendMode(value['blendMode']) ??
                BlendMode.srcIn,
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

  Decoration? decodeDecoration(dynamic value, {bool validate = true}) =>
      ThemeDecoder.instance.decodeBoxDecoration(value, validate: validate);

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
  EdgeInsets? decodeEdgeInsets(dynamic value, {bool validate = true}) =>
      ThemeDecoder.instance.decodeEdgeInsetsGeometry(value, validate: validate)
          as EdgeInsets?;

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
  ///   "end": "<double>",
  ///   "start": "<double>",
  ///   "top": "<double>"
  /// }
  /// ```
  EdgeInsetsDirectional? decodeEdgeInsetsDirectional(
    dynamic value, {
    bool ltr = true,
    bool validate = true,
  }) {
    EdgeInsetsDirectional? result;
    final decoded = ThemeDecoder.instance.decodeEdgeInsetsGeometry(
      value,
      validate: validate,
    );

    if (decoded is EdgeInsets) {
      result = EdgeInsetsDirectional.only(
        bottom: decoded.bottom,
        end: ltr ? decoded.right : decoded.left,
        start: ltr ? decoded.left : decoded.right,
        top: decoded.top,
      );
    } else if (decoded is EdgeInsetsDirectional) {
      result = decoded;
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
  /// Finally, this may be a Map-like structure in one of the following JSON
  /// formats:
  /// ```json
  /// {
  ///   "bottom": "<double>",
  ///   "left": "<double>",
  ///   "right": "<double>",
  ///   "top": "<double>"
  /// }
  /// ```
  ///
  /// ```json
  /// {
  ///   "bottom": "<double>",
  ///   "end": "<double>",
  ///   "start": "<double>",
  ///   "top": "<double>"
  /// }
  /// ```
  EdgeInsetsGeometry? decodeEdgeInsetsGeometry(
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
        result = EdgeInsets.all(JsonClass.parseDouble(value));
      } else if (value is List) {
        assert(value.length == 2 || value.length == 3 || value.length == 4);
        // LR,TB
        if (value.length == 1) {
          result = EdgeInsets.all(JsonClass.maybeParseDouble(value[0]) ?? 0.0);
        }
        // LR,TB
        else if (value.length == 2) {
          result = EdgeInsets.symmetric(
            horizontal: JsonClass.maybeParseDouble(value[0]) ?? 0.0,
            vertical: JsonClass.maybeParseDouble(value[1]) ?? 0.0,
          );
        }
        // T,LR,B
        else if (value.length == 3) {
          result = EdgeInsets.fromLTRB(
            JsonClass.maybeParseDouble(value[1]) ?? 0.0,
            JsonClass.maybeParseDouble(value[0]) ?? 0.0,
            JsonClass.maybeParseDouble(value[1]) ?? 0.0,
            JsonClass.maybeParseDouble(value[2]) ?? 0.0,
          );
        }
        // L,T,R,B
        else if (value.length == 4) {
          result = EdgeInsets.fromLTRB(
            JsonClass.maybeParseDouble(value[0]) ?? 0.0,
            JsonClass.maybeParseDouble(value[1]) ?? 0.0,
            JsonClass.maybeParseDouble(value[2]) ?? 0.0,
            JsonClass.maybeParseDouble(value[3]) ?? 0.0,
          );
        }
      } else {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/edge_insets_geometry',
            value: value,
            validate: validate,
          ),
        );
        final end = JsonClass.maybeParseDouble(value['end']);
        final start = JsonClass.maybeParseDouble(value['start']);

        if (start != null || end != null) {
          result = EdgeInsetsDirectional.only(
            bottom: JsonClass.maybeParseDouble(value['bottom']) ?? 0.0,
            end: end ?? 0.0,
            start: start ?? 0.0,
            top: JsonClass.maybeParseDouble(value['top']) ?? 0.0,
          );
        } else {
          result = EdgeInsets.only(
            bottom: JsonClass.maybeParseDouble(value['bottom']) ?? 0.0,
            left: JsonClass.maybeParseDouble(value['left']) ?? 0.0,
            right: JsonClass.maybeParseDouble(value['right']) ?? 0.0,
            top: JsonClass.maybeParseDouble(value['top']) ?? 0.0,
          );
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
  FontFeature? decodeFontFeature(dynamic value, {bool validate = true}) {
    FontFeature? result;

    if (value is FontFeature) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/font_feature',
          value: value,
          validate: validate,
        ),
      );
      result = FontFeature(
        value['feature'],
        JsonClass.maybeParseInt(value['value'])!,
      );
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
  FontVariation? decodeFontVariation(dynamic value, {bool validate = true}) {
    FontVariation? result;

    if (value is FontVariation) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/font_variation',
          value: value,
          validate: validate,
        ),
      );
      result = FontVariation(
        value['axis'],
        JsonClass.parseDouble(value['value']),
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
  Gradient? decodeGradient(dynamic value, {bool validate = true}) {
    Gradient? result;
    if (value is Gradient) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);

      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/gradient',
            value: value,
            validate: validate,
          ),
        );
        final type = value['type'];

        switch (type) {
          case 'linear':
            result = LinearGradient(
              begin:
                  decodeAlignment(value['begin'], validate: false) ??
                  Alignment.centerLeft,
              colors: _decodeStringList<Color>(value['colors'], (value) {
                final color = ThemeDecoder.instance.decodeColor(
                  value,
                  validate: false,
                );

                return color!;
              })!,
              end:
                  decodeAlignment(value['end'], validate: false) ??
                  Alignment.centerRight,
              stops: _decodeDynamicList<double>(
                value['stops'],
                (value) => JsonClass.maybeParseDouble(value)!,
              ),
              tileMode:
                  ThemeDecoder.instance.decodeTileMode(
                    value['tileMode'],
                    validate: false,
                  ) ??
                  TileMode.clamp,
              transform: ThemeDecoder.instance.decodeGradientTransform(
                value['transform'],
                validate: false,
              ),
            );
            break;
          case 'radial':
            result = RadialGradient(
              center:
                  decodeAlignment(value['center'], validate: false) ??
                  Alignment.center,
              colors: _decodeStringList<Color>(
                value['colors'],
                (value) =>
                    ThemeDecoder.instance.decodeColor(value, validate: false)!,
              )!,
              focal: decodeAlignment(value['focal'], validate: false),
              focalRadius: JsonClass.maybeParseDouble(
                value['focalRadius'],
                0.0,
              )!,
              radius: JsonClass.maybeParseDouble(value['radius'], 0.5)!,
              stops: _decodeDynamicList<double>(
                value['stops'],
                (value) => JsonClass.maybeParseDouble(value)!,
              ),
              tileMode:
                  ThemeDecoder.instance.decodeTileMode(
                    value['tileMode'],
                    validate: false,
                  ) ??
                  TileMode.clamp,
              transform: ThemeDecoder.instance.decodeGradientTransform(
                value['transform'],
                validate: false,
              ),
            );
            break;
          case 'sweep':
            result = SweepGradient(
              center:
                  decodeAlignment(value['center'], validate: false) ??
                  Alignment.center,
              colors: _decodeStringList<Color>(
                value['colors'],
                (value) =>
                    ThemeDecoder.instance.decodeColor(value, validate: false)!,
              )!,
              endAngle: JsonClass.maybeParseDouble(
                value['endAngle'],
                math.pi * 2,
              )!,
              startAngle: JsonClass.maybeParseDouble(value['startAngle'], 0.0)!,
              stops: _decodeDynamicList<double>(
                value['stops'],
                (value) => JsonClass.maybeParseDouble(value)!,
              ),
              tileMode:
                  ThemeDecoder.instance.decodeTileMode(
                    value['tileMode'],
                    validate: false,
                  ) ??
                  TileMode.clamp,
              transform: ThemeDecoder.instance.decodeGradientTransform(
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
  GradientTransform? decodeGradientTransform(
    dynamic value, {
    bool validate = true,
  }) {
    GradientTransform? result;

    if (value is GradientTransform) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/gradient_transform',
          value: value,
          validate: validate,
        ),
      );
      result = GradientRotation(JsonClass.maybeParseDouble(value['radians'])!);
    }

    return result;
  }

  /// Decodes the given [value] into an [IconData].  If the value is `null` then
  /// `null` will be returned.
  ///
  /// ```json
  /// {
  ///   "applyTextScaling": "<bool>",
  ///   "blendMode": "<BlendMode>",
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
  Icon? decodeIcon(dynamic value, {bool validate = true}) {
    Icon? result;

    if (value is Icon) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/icon',
          value: value,
          validate: validate,
        ),
      );
      result = Icon(
        ThemeDecoder.instance.decodeIconData(value['icon'], validate: false)!,
        applyTextScaling: JsonClass.maybeParseBool(value['applyTextScaling']),
        blendMode: ThemeDecoder.instance.decodeBlendMode(
          value['blendMode'],
          validate: false,
        ),
        color: decodeColor(value['color'], validate: false),
        fill: JsonClass.maybeParseDouble(value['fill']),
        grade: JsonClass.maybeParseDouble(value['grade']),
        opticalSize: JsonClass.maybeParseDouble(value['opticalSize']),
        semanticLabel: value['semanticLabel'],
        shadows: JsonClass.maybeFromDynamicList(
          value['shadows'],
          (map) => ThemeDecoder.instance.decodeShadow(map, validate: false)!,
        ),
        size: JsonClass.maybeParseDouble(value['size']),
        textDirection: ThemeDecoder.instance.decodeTextDirection(
          value['textDirection'],
          validate: false,
        ),
        weight: JsonClass.maybeParseDouble(value['weight']),
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
  ///   "fontFamilyFallback": "<List<String>>",
  ///   "fontPackage": "<String>",
  ///   "matchTextDirection": "<bool>"
  /// }
  /// ```
  IconData? decodeIconData(dynamic value, {bool validate = true}) {
    IconData? result;

    if (value is IconData) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/icon_data',
          value: value,
          validate: validate,
        ),
      );
      result = IconData(
        JsonClass.maybeParseInt(value['codePoint'])!,
        fontFamily: value['fontFamily'],
        fontFamilyFallback: value['fontFamilyFallback'],
        fontPackage: value['fontPackage'],
        matchTextDirection: JsonClass.parseBool(value['matchTextDirection']),
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
  ImageProvider? decodeImageProvider(dynamic value, {bool validate = true}) {
    ImageProvider? result;
    if (value is ImageProvider) {
      result = value;
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/image_provider',
            value: value,
            validate: validate,
          ),
        );
        switch (value['type']) {
          case 'asset':
            result = AssetImage(value['assetName'], package: value['package']);
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

  ImageProvider? decodeImageProviderObject(
    dynamic value, {
    bool validate = true,
  }) => decodeImageProvider(value, validate: validate);

  InlineSpan? decodeInlineSpan(dynamic value, {bool validate = true}) =>
      ThemeDecoder.instance.decodeTextSpan(value, validate: validate);

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
  InputBorder? decodeInputBorder(dynamic value, {bool validate = true}) {
    InputBorder? result;
    if (value is InputBorder) {
      result = value;
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/input_border',
            value: value,
            validate: validate,
          ),
        );
        final String? type = value['type'];

        switch (type) {
          case 'outline':
            result = OutlineInputBorder(
              borderRadius:
                  decodeBorderRadius(value['borderRadius'], validate: false) ??
                  const BorderRadius.all(Radius.circular(4.0)),
              borderSide:
                  ThemeDecoder.instance.decodeBorderSide(
                    value['borderSide'],
                    validate: false,
                  ) ??
                  const BorderSide(),
              gapPadding: JsonClass.maybeParseDouble(value['gapPadding'], 4.0)!,
            );
            break;

          case 'underline':
            result = UnderlineInputBorder(
              borderRadius:
                  decodeBorderRadius(value['borderRadius'], validate: false) ??
                  const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
              borderSide:
                  ThemeDecoder.instance.decodeBorderSide(
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

  /// Decodes the [value] to an [InteractiveInkFeatureFactory].  Supported
  /// values are:
  ///  * `splash`
  ///  * `ripple`
  ///  * `sparkle`
  InteractiveInkFeatureFactory? decodeInteractiveInkFeatureFactory(
    dynamic value, {
    bool validate = true,
  }) {
    InteractiveInkFeatureFactory? result;
    if (value is InteractiveInkFeatureFactory) {
      result = value;
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/interactive_ink_feature_factory',
            value: value,
            validate: validate,
          ),
        );
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

  /// Decodes the given [value] to an [Locale].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "countryCode": "<String>",
  ///   "languageCode": "<String>"
  /// }
  /// ```
  Locale? decodeLocale(dynamic value, {bool validate = true}) {
    Locale? result;

    if (value is Locale) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/locale',
          value: value,
          validate: validate,
        ),
      );
      result = Locale(value['languageCode'], value['countryCode']);
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
  MaterialColor? decodeMaterialColor(dynamic value, {bool validate = true}) {
    MaterialColor? result;

    if (value is MaterialColor) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/material_color',
          value: value,
          validate: validate,
        ),
      );
      final swatches = <int, Color>{};

      final swatchesIn = value['swatches'];
      swatchesIn.forEach(
        (key, value) => swatches[JsonClass.maybeParseInt(key)!] = decodeColor(
          value,
          validate: false,
        )!,
      );

      result = MaterialColor(
        colorToInt(decodeColor(value['primary'], validate: false)!)!,
        swatches,
      );
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
  Matrix4? decodeMatrix4(dynamic value, {bool validate = true}) {
    Matrix4? result;

    if (value is Matrix4) {
      result = value;
    } else {
      if (value is Iterable) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/matrix4',
            value: value,
            validate: validate,
          ),
        );
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
  MouseCursor? decodeMouseCursor(dynamic value, {bool validate = true}) {
    MouseCursor? result;
    if (value is MouseCursor) {
      result = value;
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/mouse_cursor',
            value: value,
            validate: validate,
          ),
        );
        switch (value['type']) {
          case 'defer':
            result = MouseCursor.defer;
            break;
          case 'material':
            switch (value['cursor']) {
              case 'clickable':
                result = WidgetStateMouseCursor.clickable;
                break;

              case 'textable':
                result = WidgetStateMouseCursor.textable;
                break;
            }
            break;
          case 'system':
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

  NoDefaultCupertinoThemeData? decodeNoDefaultCupertinoThemeData(
    dynamic value, {
    bool validate = true,
  }) => ThemeDecoder.instance.decodeCupertinoThemeData(value, validate: false);

  /// Decodes the [value] to a [NotchedShape].  Supported values are:
  ///  * `circular`
  NotchedShape? decodeNotchedShape(dynamic value, {bool validate = true}) {
    NotchedShape? result;
    if (value is NotchedShape) {
      result = value;
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/notched_shape',
            value: value,
            validate: validate,
          ),
        );
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
  Offset? decodeOffset(dynamic value, {bool validate = true}) {
    Offset? result;

    if (value is Offset) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/offset',
          value: value,
          validate: validate,
        ),
      );
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
  OrdinalSortKey? decodeOrdinalSortKey(dynamic value, {bool validate = true}) {
    OrdinalSortKey? result;

    if (value is OrdinalSortKey) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/ordinal_sort_key',
          value: value,
          validate: validate,
        ),
      );

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
  OutlinedBorder? decodeOutlinedBorder(dynamic value, {bool validate = true}) {
    OutlinedBorder? result;
    if (value is OutlinedBorder) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);

      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/outlined_border',
            value: value,
            validate: validate,
          ),
        );
        final String? type = value['type'];

        switch (type) {
          case 'beveled':
            result = BeveledRectangleBorder(
              borderRadius:
                  decodeBorderRadius(value['borderRadius'], validate: false) ??
                  BorderRadius.zero,
              side:
                  ThemeDecoder.instance.decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'circle':
            result = CircleBorder(
              side:
                  ThemeDecoder.instance.decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'rectangle':
            result = ContinuousRectangleBorder(
              borderRadius:
                  decodeBorderRadius(value['borderRadius'], validate: false) ??
                  BorderRadius.zero,
              side:
                  ThemeDecoder.instance.decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'rounded':
            result = RoundedRectangleBorder(
              borderRadius:
                  decodeBorderRadius(value['borderRadius'], validate: false) ??
                  BorderRadius.zero,
              side:
                  ThemeDecoder.instance.decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'stadium':
            result = StadiumBorder(
              side:
                  ThemeDecoder.instance.decodeBorderSide(
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

  /// Decodes the [value] to a [PageTransitionsBuilder].  Supported values are:
  /// * `cupertino`
  /// * `fadeUpwards`
  /// * `openUpwards`
  /// * `zoom`
  PageTransitionsBuilder? decodePageTransitionsBuilder(
    dynamic value, {
    bool validate = true,
  }) {
    PageTransitionsBuilder? result;

    if (value is PageTransitionsBuilder) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/page_transitions_builder',
          value: value,
          validate: validate,
        ),
      );

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

  /// Decodes the given [value] to a [PageTransitionsTheme].  This expects the
  /// given [value] to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "builders": "<Map<TargetPlatform, PageTransitionBuilder>>"
  /// }
  /// ```
  PageTransitionsTheme? decodePageTransitionsTheme(
    dynamic value, {
    bool validate = true,
  }) {
    PageTransitionsTheme? result;

    if (value is PageTransitionsTheme) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/page_transitions_theme',
          value: value,
          validate: validate,
        ),
      );

      final builders = <TargetPlatform, PageTransitionsBuilder>{};
      value['builders']?.forEach(
        (key, value) =>
            builders[ThemeDecoder.instance.decodeTargetPlatform(
              key,
              validate: false,
            )!] = decodePageTransitionsBuilder(
              value,
              validate: false,
            )!,
      );

      result = PageTransitionsTheme(builders: builders);
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
  Radius? decodeRadius(dynamic value, {bool validate = true}) {
    Radius? result;
    if (value is Radius) {
      result = value;
    } else {
      final radius = JsonClass.maybeParseDouble(value);

      if (radius != null) {
        result = Radius.circular(radius);
      } else {
        assert(value == null || value['type'] is String);

        if (value != null) {
          assert(
            SchemaValidator.validate(
              schemaId: '$_baseSchemaUrl/radius',
              value: value,
              validate: validate,
            ),
          );
          final String? type = value['type'];

          switch (type) {
            case 'circular':
              result = Radius.circular(
                JsonClass.maybeParseDouble(value['radius'])!,
              );
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
  RangeSliderThumbShape? decodeRangeSliderThumbShape(
    dynamic value, {
    bool validate = true,
  }) {
    RangeSliderThumbShape? result;
    if (value is RangeSliderThumbShape) {
      result = value;
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/range_slider_thumb_shape',
            value: value,
            validate: validate,
          ),
        );

        final String? type = value['type'];
        switch (type) {
          case 'round':
            result = RoundRangeSliderThumbShape(
              disabledThumbRadius: JsonClass.maybeParseDouble(
                value['disabledThumbRadius'],
              ),
              elevation: JsonClass.maybeParseDouble(value['elevation']) ?? 1.0,
              enabledThumbRadius:
                  JsonClass.maybeParseDouble(value['enabledThumbRadius']) ??
                  10.0,
              pressedElevation:
                  JsonClass.maybeParseDouble(value['pressedElevation']) ?? 6.0,
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
  RangeSliderTickMarkShape? decodeRangeSliderTickMarkShape(
    dynamic value, {
    bool validate = true,
  }) {
    RangeSliderTickMarkShape? result;
    if (value is RangeSliderTickMarkShape) {
      result = value;
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/range_slider_tick_mark_shape',
            value: value,
            validate: validate,
          ),
        );
        final String? type = value['type'];

        switch (type) {
          case 'round':
            result = RoundRangeSliderTickMarkShape(
              tickMarkRadius: JsonClass.maybeParseDouble(
                value['tickMarkRadius'],
              ),
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
  RangeSliderTrackShape? decodeRangeSliderTrackShape(
    dynamic value, {
    bool validate = true,
  }) {
    RangeSliderTrackShape? result;
    if (value is RangeSliderTrackShape) {
      result = value;
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/range_slider_track_shape',
            value: value,
            validate: validate,
          ),
        );
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
  RangeSliderValueIndicatorShape? decodeRangeSliderValueIndicatorShape(
    dynamic value, {
    bool validate = true,
  }) {
    RangeSliderValueIndicatorShape? result;
    if (value is RangeSliderValueIndicatorShape) {
      result = value;
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/range_slider_value_indicator_shape',
            value: value,
            validate: validate,
          ),
        );
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
  Rect? decodeRect(dynamic value, {bool validate = true}) {
    Rect? result;
    if (value is Rect) {
      result = value;
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/rect',
            value: value,
            validate: validate,
          ),
        );
        final String? type = value['type'];
        switch (type) {
          case 'center':
            result = Rect.fromCenter(
              center: ThemeDecoder.instance.decodeOffset(
                value['center'],
                validate: false,
              )!,
              height: JsonClass.maybeParseDouble(value['height'])!,
              width: JsonClass.maybeParseDouble(value['width'])!,
            );
            break;

          case 'circle':
            result = Rect.fromCircle(
              center: ThemeDecoder.instance.decodeOffset(
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
              ThemeDecoder.instance.decodeOffset(value['a'], validate: false)!,
              ThemeDecoder.instance.decodeOffset(value['b'], validate: false)!,
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
  ScrollBehavior? decodeScrollBehavior(dynamic value, {bool validate = true}) {
    ScrollBehavior? result;

    if (value is ScrollBehavior) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/scroll_behavior',
          value: value,
          validate: validate,
        ),
      );
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
  ScrollPhysics? decodeScrollPhysics(dynamic value, {bool validate = true}) {
    ScrollPhysics? result;
    if (value is ScrollPhysics) {
      result = value;
    } else {
      assert(value == null || value['type'] is String);
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/scroll_physics',
            value: value,
            validate: validate,
          ),
        );
        final type = value['type'];

        switch (type) {
          case 'always':
            result = AlwaysScrollableScrollPhysics(
              parent: decodeScrollPhysics(value['parent'], validate: false),
            );
            break;

          case 'bouncing':
            result = BouncingScrollPhysics(
              parent: decodeScrollPhysics(value['parent'], validate: false),
            );
            break;

          case 'clamping':
            result = ClampingScrollPhysics(
              parent: decodeScrollPhysics(value['parent'], validate: false),
            );
            break;

          case 'fixedExtent':
            result = FixedExtentScrollPhysics(
              parent: decodeScrollPhysics(value['parent'], validate: false),
            );
            break;

          case 'never':
            result = NeverScrollableScrollPhysics(
              parent: decodeScrollPhysics(value['parent'], validate: false),
            );
            break;

          case 'page':
            result = PageScrollPhysics(
              parent: decodeScrollPhysics(value['parent'], validate: false),
            );
            break;

          case 'rangeMaintaining':
            result = RangeMaintainingScrollPhysics(
              parent: decodeScrollPhysics(value['parent'], validate: false),
            );
            break;
        }
      }
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
  SemanticsTag? decodeSemanticsTag(dynamic value, {bool validate = true}) {
    SemanticsTag? result;

    if (value is SemanticsTag) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/semantics_tag',
          value: value,
          validate: validate,
        ),
      );

      result = SemanticsTag(value['name']);
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
  ShapeBorder? decodeShapeBorder(dynamic value, {bool validate = true}) {
    ShapeBorder? result;
    if (value is ShapeBorder) {
      result = value;
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/shape_border',
            value: value,
            validate: validate,
          ),
        );
        final String? type = value['type'];

        switch (type) {
          case 'circle':
            result = CircleBorder(
              side:
                  ThemeDecoder.instance.decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'rectangle':
            result = ContinuousRectangleBorder(
              borderRadius:
                  decodeBorderRadius(value['borderRadius'], validate: false) ??
                  BorderRadius.zero,
              side:
                  ThemeDecoder.instance.decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'rounded':
            result = RoundedRectangleBorder(
              borderRadius:
                  decodeBorderRadius(value['borderRadius'], validate: false) ??
                  BorderRadius.zero,
              side:
                  ThemeDecoder.instance.decodeBorderSide(
                    value['side'],
                    validate: false,
                  ) ??
                  BorderSide.none,
            );
            break;

          case 'stadium':
            result = StadiumBorder(
              side:
                  ThemeDecoder.instance.decodeBorderSide(
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

  /// Decodes the given [value] to a [Size].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "height": "<double>",
  ///   "width": "<double>"
  /// }
  /// ```
  Size? decodeSize(dynamic value, {bool validate = true}) {
    Size? result;

    if (value is Size) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/size',
          value: value,
          validate: validate,
        ),
      );
      result = Size(
        JsonClass.maybeParseDouble(value['width'])!,
        JsonClass.maybeParseDouble(value['height'])!,
      );
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
  SliderTrackShape? decodeSliderTrackShape(
    dynamic value, {
    bool validate = true,
  }) {
    SliderTrackShape? result;
    if (value is SliderTrackShape) {
      result = value;
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/slider_track_shape',
            value: value,
            validate: validate,
          ),
        );
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

  /// Decodes a [value] to a [SystemUiOverlayStyle].  Supported values are:
  ///  * `dark`
  ///  * `light`
  SystemUiOverlayStyle? decodeSystemUiOverlayStyle(
    dynamic value, {
    bool validate = true,
  }) {
    SystemUiOverlayStyle? result;
    if (value is SystemUiOverlayStyle) {
      result = value;
    } else if (value is Map) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/system_ui_overlay_style',
          value: value,
          validate: validate,
        ),
      );

      result = SystemUiOverlayStyle(
        statusBarBrightness: ThemeDecoder.instance.decodeBrightness(
          value['statusBarBrightness'],
          validate: false,
        ),
        statusBarColor: decodeColor(value['statusBarColor'], validate: false),
        statusBarIconBrightness: ThemeDecoder.instance.decodeBrightness(
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
        systemNavigationBarIconBrightness: ThemeDecoder.instance
            .decodeBrightness(
              value['systemNavigationBarIconBrightness'],
              validate: false,
            ),
        systemStatusBarContrastEnforced: JsonClass.maybeParseBool(
          value['systemStatusBarContrastEnforced'],
        ),
      );
    } else {
      if (value != null) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/system_ui_overlay_style',
            value: value,
            validate: validate,
          ),
        );
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
  TableColumnWidth? decodeTableColumnWidth(
    dynamic value, {
    bool validate = true,
  }) {
    TableColumnWidth? result;

    if (value is TableColumnWidth) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/table_column_width',
          value: value,
          validate: validate,
        ),
      );
      final type = value['type'];

      switch (type) {
        case 'fixed':
          result = FixedColumnWidth(
            JsonClass.maybeParseDouble(value['value'])!,
          );
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
  TextButtonThemeData? decodeTextButtonThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    TextButtonThemeData? result;

    if (value is TextButtonThemeData) {
      result = value;
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/text_button_theme_data',
          value: value,
          validate: validate,
        ),
      );
      result = TextButtonThemeData(
        style: ThemeDecoder.instance.decodeButtonStyle(
          value['style'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes a [value] into a [WidgetStateColor].  If the value is a
  /// [String] then the value will be used for all states.
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
  /// The "empty" will be used for when any other value is missing.
  WidgetStateColor? decodeWidgetStateColor(
    dynamic value, {
    bool validate = true,
  }) {
    WidgetStateColor? result;

    if (value is WidgetStateColor) {
      result = value;
    } else if (value is Color) {
      result = WidgetStateColor.resolveWith((_) => value);
    } else if (value != null) {
      assert(
        SchemaValidator.validate(
          schemaId: '$_baseSchemaUrl/widget_state_color',
          value: value,
          validate: validate,
        ),
      );

      result = WidgetStateColor.resolveWith((states) {
        Color? result;

        if (value is String) {
          result = decodeColor(value, validate: false);
        } else if (value is Color) {
          result = value;
        } else if (states.contains(WidgetState.disabled)) {
          result = decodeColor(value['disabled'], validate: false);
        } else if (states.contains(WidgetState.dragged)) {
          result = decodeColor(value['dragged'], validate: false);
        } else if (states.contains(WidgetState.error)) {
          result = decodeColor(value['error'], validate: false);
        } else if (states.contains(WidgetState.focused)) {
          result = decodeColor(value['focused'], validate: false);
        } else if (states.contains(WidgetState.hovered)) {
          result = decodeColor(value['hovered'], validate: false);
        } else if (states.contains(WidgetState.pressed)) {
          result = decodeColor(value['pressed'], validate: false);
        } else if (states.contains(WidgetState.scrolledUnder)) {
          result = decodeColor(value['scrolledUnder'], validate: false);
        } else if (states.contains(WidgetState.selected)) {
          result = decodeColor(value['selected'], validate: false);
        }

        result ??= decodeColor(value['empty'], validate: false);

        return result!;
      });
    }
    return result;
  }

  /// Decodes a [value] into a [double] based [WidgetStateProperty].  This
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
  WidgetStateProperty<bool?>? decodeWidgetStatePropertyBool(
    dynamic value, {
    bool validate = true,
  }) {
    WidgetStateProperty<bool?>? result;

    if (value is WidgetStateProperty<bool?>) {
      result = value;
    } else if (value != null) {
      if (value is int || value is double || value is bool || value is String) {
        result = WidgetStateProperty.all<bool?>(JsonClass.parseBool(value));
      } else if (value is Map) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/widget_state_property_bool',
            value: value,
            validate: validate,
          ),
        );

        result = MapWidgetStateProperty.resolveWith((states) {
          bool? result;
          if (states.contains(WidgetState.disabled)) {
            result = JsonClass.maybeParseBool(value['disabled']);
          } else if (states.contains(WidgetState.dragged)) {
            result = JsonClass.maybeParseBool(value['dragged']);
          } else if (states.contains(WidgetState.error)) {
            result = JsonClass.maybeParseBool(value['error']);
          } else if (states.contains(WidgetState.focused)) {
            result = JsonClass.maybeParseBool(value['focused']);
          } else if (states.contains(WidgetState.hovered)) {
            result = JsonClass.maybeParseBool(value['hovered']);
          } else if (states.contains(WidgetState.pressed)) {
            result = JsonClass.maybeParseBool(value['pressed']);
          } else if (states.contains(WidgetState.scrolledUnder)) {
            result = JsonClass.maybeParseBool(value['scrolledUnder']);
          } else if (states.contains(WidgetState.selected)) {
            result = JsonClass.maybeParseBool(value['selected']);
          } else {
            result = JsonClass.maybeParseBool(value['empty']);
          }

          return result;
        });
      } else {
        result = WidgetStateProperty.all<bool?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [BorderSide] based [WidgetStateProperty].  This
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
  WidgetStateProperty<BorderSide?>? decodeWidgetStatePropertyBorderSide(
    dynamic value, {
    bool validate = true,
  }) {
    WidgetStateProperty<BorderSide?>? result;

    if (value is WidgetStateProperty<BorderSide?>) {
      result = value;
    } else if (value != null) {
      if (value is BorderSide) {
        result = WidgetStateProperty.all<BorderSide?>(value);
      } else if (value is String) {
        result = WidgetStateProperty.all<BorderSide?>(
          ThemeDecoder.instance.decodeBorderSide(value, validate: false),
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
          result = WidgetStateProperty.all<BorderSide?>(
            ThemeDecoder.instance.decodeBorderSide(value, validate: false),
          );
        } else {
          assert(
            SchemaValidator.validate(
              schemaId: '$_baseSchemaUrl/widget_state_property_border_side',
              value: value,
              validate: validate,
            ),
          );

          result = MapWidgetStateProperty.resolveWith((states) {
            BorderSide? result;
            if (states.contains(WidgetState.disabled)) {
              result = ThemeDecoder.instance.decodeBorderSide(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(WidgetState.dragged)) {
              result = ThemeDecoder.instance.decodeBorderSide(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(WidgetState.error)) {
              result = ThemeDecoder.instance.decodeBorderSide(
                value['error'],
                validate: false,
              );
            } else if (states.contains(WidgetState.focused)) {
              result = ThemeDecoder.instance.decodeBorderSide(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(WidgetState.hovered)) {
              result = ThemeDecoder.instance.decodeBorderSide(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(WidgetState.pressed)) {
              result = ThemeDecoder.instance.decodeBorderSide(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(WidgetState.scrolledUnder)) {
              result = ThemeDecoder.instance.decodeBorderSide(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(WidgetState.selected)) {
              result = ThemeDecoder.instance.decodeBorderSide(
                value['selected'],
                validate: false,
              );
            } else {
              result = ThemeDecoder.instance.decodeBorderSide(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = WidgetStateProperty.all<BorderSide?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [Color] based [WidgetStateProperty].  This
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
  WidgetStateProperty<Color?>? decodeWidgetStatePropertyColor(
    dynamic value, {
    bool validate = true,
  }) {
    WidgetStateProperty<Color?>? result;

    if (value is WidgetStateProperty<Color?>) {
      result = value;
    } else if (value != null) {
      if (value is Color) {
        result = WidgetStateProperty.all<Color?>(value);
      } else if (value is String) {
        result = WidgetStateProperty.all<Color?>(
          ThemeDecoder.instance.decodeColor(value, validate: false),
        );
      } else if (value is Map) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/widget_state_property_color',
            value: value,
            validate: validate,
          ),
        );

        result = MapWidgetStateProperty.resolveWith((states) {
          Color? result;
          if (states.contains(WidgetState.disabled)) {
            result = ThemeDecoder.instance.decodeColor(
              value['disabled'],
              validate: false,
            );
          } else if (states.contains(WidgetState.dragged)) {
            result = ThemeDecoder.instance.decodeColor(
              value['dragged'],
              validate: false,
            );
          } else if (states.contains(WidgetState.error)) {
            result = ThemeDecoder.instance.decodeColor(
              value['error'],
              validate: false,
            );
          } else if (states.contains(WidgetState.focused)) {
            result = ThemeDecoder.instance.decodeColor(
              value['focused'],
              validate: false,
            );
          } else if (states.contains(WidgetState.pressed)) {
            result = ThemeDecoder.instance.decodeColor(
              value['pressed'],
              validate: false,
            );
          } else if (states.contains(WidgetState.hovered)) {
            result = ThemeDecoder.instance.decodeColor(
              value['hovered'],
              validate: false,
            );
          } else if (states.contains(WidgetState.scrolledUnder)) {
            result = ThemeDecoder.instance.decodeColor(
              value['scrolledUnder'],
              validate: false,
            );
          } else if (states.contains(WidgetState.selected)) {
            result = ThemeDecoder.instance.decodeColor(
              value['selected'],
              validate: false,
            );
          } else {
            result = ThemeDecoder.instance.decodeColor(
              value['empty'],
              validate: false,
            );
          }

          return result;
        });
      } else {
        result = WidgetStateProperty.all<Color?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [double] based [WidgetStateProperty].  This
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
  WidgetStateProperty<double?>? decodeWidgetStatePropertyDouble(
    dynamic value, {
    bool validate = true,
  }) {
    WidgetStateProperty<double?>? result;

    if (value is WidgetStateProperty<double?>) {
      result = value;
    } else if (value != null) {
      if (value is int) {
        result = WidgetStateProperty.all<double?>(value.toDouble());
      } else if (value is double) {
        result = WidgetStateProperty.all<double?>(value);
      } else if (value is String) {
        result = WidgetStateProperty.all<double?>(
          JsonClass.maybeParseDouble(value),
        );
      } else if (value is Map) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/widget_state_property_double',
            value: value,
            validate: validate,
          ),
        );

        result = MapWidgetStateProperty.resolveWith((states) {
          double? result;
          if (states.contains(WidgetState.disabled)) {
            result = JsonClass.maybeParseDouble(value['disabled']);
          } else if (states.contains(WidgetState.dragged)) {
            result = JsonClass.maybeParseDouble(value['dragged']);
          } else if (states.contains(WidgetState.error)) {
            result = JsonClass.maybeParseDouble(value['error']);
          } else if (states.contains(WidgetState.focused)) {
            result = JsonClass.maybeParseDouble(value['focused']);
          } else if (states.contains(WidgetState.hovered)) {
            result = JsonClass.maybeParseDouble(value['hovered']);
          } else if (states.contains(WidgetState.pressed)) {
            result = JsonClass.maybeParseDouble(value['pressed']);
          } else if (states.contains(WidgetState.scrolledUnder)) {
            result = JsonClass.maybeParseDouble(value['scrolledUnder']);
          } else if (states.contains(WidgetState.selected)) {
            result = JsonClass.maybeParseDouble(value['selected']);
          } else {
            result = JsonClass.maybeParseDouble(value['empty']);
          }

          return result;
        });
      } else {
        result = WidgetStateProperty.all<double?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [EdgeInsetsGeometry] based
  /// [WidgetStateProperty].
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
  WidgetStateProperty<EdgeInsetsGeometry?>?
  decodeWidgetStatePropertyEdgeInsetsGeometry(
    dynamic value, {
    bool validate = true,
  }) {
    WidgetStateProperty<EdgeInsetsGeometry?>? result;

    if (value is WidgetStateProperty<EdgeInsetsGeometry?>) {
      result = value;
    } else if (value != null) {
      if (value is EdgeInsetsGeometry) {
        result = WidgetStateProperty.all<EdgeInsetsGeometry?>(value);
      } else if (value is String || value is List || value is int) {
        result = WidgetStateProperty.all<EdgeInsetsGeometry?>(
          ThemeDecoder.instance.decodeEdgeInsetsGeometry(
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
          result = WidgetStateProperty.all<EdgeInsetsGeometry?>(
            ThemeDecoder.instance.decodeEdgeInsetsGeometry(
              value,
              validate: false,
            ),
          );
        } else {
          assert(
            SchemaValidator.validate(
              schemaId:
                  '$_baseSchemaUrl/widget_state_property_edge_insets_geometry',
              value: value,
              validate: validate,
            ),
          );

          result = MapWidgetStateProperty.resolveWith((states) {
            EdgeInsetsGeometry? result;
            if (states.contains(WidgetState.disabled)) {
              result = ThemeDecoder.instance.decodeEdgeInsetsGeometry(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(WidgetState.dragged)) {
              result = ThemeDecoder.instance.decodeEdgeInsetsGeometry(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(WidgetState.error)) {
              result = ThemeDecoder.instance.decodeEdgeInsetsGeometry(
                value['error'],
                validate: false,
              );
            } else if (states.contains(WidgetState.focused)) {
              result = ThemeDecoder.instance.decodeEdgeInsetsGeometry(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(WidgetState.hovered)) {
              result = ThemeDecoder.instance.decodeEdgeInsetsGeometry(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(WidgetState.pressed)) {
              result = ThemeDecoder.instance.decodeEdgeInsetsGeometry(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(WidgetState.scrolledUnder)) {
              result = ThemeDecoder.instance.decodeEdgeInsetsGeometry(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(WidgetState.selected)) {
              result = ThemeDecoder.instance.decodeEdgeInsetsGeometry(
                value['selected'],
                validate: false,
              );
            } else {
              result = ThemeDecoder.instance.decodeEdgeInsetsGeometry(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = WidgetStateProperty.all<EdgeInsetsGeometry?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [Icon] based [WidgetStateProperty].  This
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
  WidgetStateProperty<Icon?>? decodeWidgetStatePropertyIcon(
    dynamic value, {
    bool validate = true,
  }) {
    WidgetStateProperty<Icon?>? result;

    if (value is WidgetStateProperty<Icon?>) {
      result = value;
    } else if (value != null) {
      if (value is Icon) {
        result = WidgetStateProperty.all<Icon?>(value);
      } else if (value is IconData) {
        result = WidgetStateProperty.all<Icon?>(Icon(value));
      } else if (value is Map) {
        assert(
          SchemaValidator.validate(
            schemaId: '$_baseSchemaUrl/widget_state_property_icon',
            value: value,
            validate: validate,
          ),
        );

        result = MapWidgetStateProperty.resolveWith((states) {
          Icon? result;
          if (states.contains(WidgetState.disabled)) {
            result = ThemeDecoder.instance.decodeIcon(
              value['disabled'],
              validate: false,
            );
          } else if (states.contains(WidgetState.dragged)) {
            result = ThemeDecoder.instance.decodeIcon(
              value['dragged'],
              validate: false,
            );
          } else if (states.contains(WidgetState.error)) {
            result = ThemeDecoder.instance.decodeIcon(
              value['error'],
              validate: false,
            );
          } else if (states.contains(WidgetState.focused)) {
            result = ThemeDecoder.instance.decodeIcon(
              value['focused'],
              validate: false,
            );
          } else if (states.contains(WidgetState.pressed)) {
            result = ThemeDecoder.instance.decodeIcon(
              value['pressed'],
              validate: false,
            );
          } else if (states.contains(WidgetState.hovered)) {
            result = ThemeDecoder.instance.decodeIcon(
              value['hovered'],
              validate: false,
            );
          } else if (states.contains(WidgetState.scrolledUnder)) {
            result = ThemeDecoder.instance.decodeIcon(
              value['scrolledUnder'],
              validate: false,
            );
          } else if (states.contains(WidgetState.selected)) {
            result = ThemeDecoder.instance.decodeIcon(
              value['selected'],
              validate: false,
            );
          } else {
            result = ThemeDecoder.instance.decodeIcon(
              value['empty'],
              validate: false,
            );
          }

          return result;
        });
      } else {
        result = WidgetStateProperty.all<Icon?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [IconThemeData] based [WidgetStateProperty].
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
  WidgetStateProperty<IconThemeData?>? decodeWidgetStatePropertyIconThemeData(
    dynamic value, {
    bool validate = true,
  }) {
    WidgetStateProperty<IconThemeData?>? result;

    if (value is WidgetStateProperty<IconThemeData?>) {
      result = value;
    } else if (value != null) {
      if (value is IconThemeData) {
        result = WidgetStateProperty.all<IconThemeData?>(value);
      } else if (value is String) {
        result = WidgetStateProperty.all<IconThemeData?>(
          ThemeDecoder.instance.decodeIconThemeData(value, validate: false),
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
          result = WidgetStateProperty.all<IconThemeData?>(
            ThemeDecoder.instance.decodeIconThemeData(value, validate: false),
          );
        } else {
          assert(
            SchemaValidator.validate(
              schemaId: '$_baseSchemaUrl/widget_state_property_icon_theme_data',
              value: value,
              validate: validate,
            ),
          );

          result = MapWidgetStateProperty.resolveWith((states) {
            IconThemeData? result;
            if (states.contains(WidgetState.disabled)) {
              result = ThemeDecoder.instance.decodeIconThemeData(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(WidgetState.dragged)) {
              result = ThemeDecoder.instance.decodeIconThemeData(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(WidgetState.error)) {
              result = ThemeDecoder.instance.decodeIconThemeData(
                value['error'],
                validate: false,
              );
            } else if (states.contains(WidgetState.focused)) {
              result = ThemeDecoder.instance.decodeIconThemeData(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(WidgetState.hovered)) {
              result = ThemeDecoder.instance.decodeIconThemeData(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(WidgetState.pressed)) {
              result = ThemeDecoder.instance.decodeIconThemeData(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(WidgetState.scrolledUnder)) {
              result = ThemeDecoder.instance.decodeIconThemeData(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(WidgetState.selected)) {
              result = ThemeDecoder.instance.decodeIconThemeData(
                value['selected'],
                validate: false,
              );
            } else {
              result = ThemeDecoder.instance.decodeIconThemeData(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = WidgetStateProperty.all<IconThemeData?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [MouseCursor] based [WidgetStateProperty].
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
  WidgetStateProperty<MouseCursor?>? decodeWidgetStatePropertyMouseCursor(
    dynamic value, {
    bool validate = true,
  }) {
    WidgetStateProperty<MouseCursor?>? result;

    if (value is WidgetStateProperty<MouseCursor?>) {
      result = value;
    } else if (value != null) {
      if (value is MouseCursor) {
        result = WidgetStateProperty.all<MouseCursor?>(value);
      } else if (value is String) {
        result = WidgetStateProperty.all<MouseCursor?>(
          ThemeDecoder.instance.decodeMouseCursor(value, validate: false),
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
          result = WidgetStateProperty.all<MouseCursor?>(
            ThemeDecoder.instance.decodeMouseCursor(value, validate: false),
          );
        } else {
          assert(
            SchemaValidator.validate(
              schemaId: '$_baseSchemaUrl/widget_state_property_mouse_cursor',
              value: value,
              validate: validate,
            ),
          );

          result = MapWidgetStateProperty.resolveWith((states) {
            MouseCursor? result;
            if (states.contains(WidgetState.disabled)) {
              result = ThemeDecoder.instance.decodeMouseCursor(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(WidgetState.dragged)) {
              result = ThemeDecoder.instance.decodeMouseCursor(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(WidgetState.error)) {
              result = ThemeDecoder.instance.decodeMouseCursor(
                value['error'],
                validate: false,
              );
            } else if (states.contains(WidgetState.focused)) {
              result = ThemeDecoder.instance.decodeMouseCursor(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(WidgetState.hovered)) {
              result = ThemeDecoder.instance.decodeMouseCursor(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(WidgetState.pressed)) {
              result = ThemeDecoder.instance.decodeMouseCursor(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(WidgetState.scrolledUnder)) {
              result = ThemeDecoder.instance.decodeMouseCursor(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(WidgetState.selected)) {
              result = ThemeDecoder.instance.decodeMouseCursor(
                value['selected'],
                validate: false,
              );
            } else {
              result = ThemeDecoder.instance.decodeMouseCursor(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = WidgetStateProperty.all<MouseCursor?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [OutlinedBorder] based [WidgetStateProperty].
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
  WidgetStateProperty<OutlinedBorder?>? decodeWidgetStatePropertyOutlinedBorder(
    dynamic value, {
    bool validate = true,
  }) {
    WidgetStateProperty<OutlinedBorder?>? result;

    if (value is WidgetStateProperty<OutlinedBorder?>) {
      result = value;
    } else if (value != null) {
      if (value is OutlinedBorder) {
        result = WidgetStateProperty.all<OutlinedBorder?>(value);
      } else if (value is String) {
        result = WidgetStateProperty.all<OutlinedBorder?>(
          ThemeDecoder.instance.decodeOutlinedBorder(value, validate: false),
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
          result = WidgetStateProperty.all<OutlinedBorder?>(
            ThemeDecoder.instance.decodeOutlinedBorder(value, validate: false),
          );
        } else {
          assert(
            SchemaValidator.validate(
              schemaId: '$_baseSchemaUrl/widget_state_property_outlined_border',
              value: value,
              validate: validate,
            ),
          );

          result = MapWidgetStateProperty.resolveWith((states) {
            OutlinedBorder? result;
            if (states.contains(WidgetState.disabled)) {
              result = ThemeDecoder.instance.decodeOutlinedBorder(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(WidgetState.dragged)) {
              result = ThemeDecoder.instance.decodeOutlinedBorder(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(WidgetState.error)) {
              result = ThemeDecoder.instance.decodeOutlinedBorder(
                value['error'],
                validate: false,
              );
            } else if (states.contains(WidgetState.focused)) {
              result = ThemeDecoder.instance.decodeOutlinedBorder(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(WidgetState.hovered)) {
              result = ThemeDecoder.instance.decodeOutlinedBorder(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(WidgetState.pressed)) {
              result = ThemeDecoder.instance.decodeOutlinedBorder(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(WidgetState.scrolledUnder)) {
              result = ThemeDecoder.instance.decodeOutlinedBorder(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(WidgetState.selected)) {
              result = ThemeDecoder.instance.decodeOutlinedBorder(
                value['selected'],
                validate: false,
              );
            } else {
              result = ThemeDecoder.instance.decodeOutlinedBorder(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = WidgetStateProperty.all<OutlinedBorder?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [Size] based [WidgetStateProperty].  This
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
  WidgetStateProperty<Size?>? decodeWidgetStatePropertySize(
    dynamic value, {
    bool validate = true,
  }) {
    WidgetStateProperty<Size?>? result;

    if (value is WidgetStateProperty<Size?>) {
      result = value;
    } else if (value != null) {
      if (value is Size) {
        result = WidgetStateProperty.all<Size?>(value);
      } else if (value is String) {
        result = WidgetStateProperty.all<Size?>(
          ThemeDecoder.instance.decodeSize(value, validate: false),
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
          result = WidgetStateProperty.all<Size?>(
            ThemeDecoder.instance.decodeSize(value, validate: false),
          );
        } else {
          assert(
            SchemaValidator.validate(
              schemaId: '$_baseSchemaUrl/widget_state_property_size',
              value: value,
              validate: validate,
            ),
          );

          result = MapWidgetStateProperty.resolveWith((states) {
            Size? result;
            if (states.contains(WidgetState.disabled)) {
              result = ThemeDecoder.instance.decodeSize(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(WidgetState.dragged)) {
              result = ThemeDecoder.instance.decodeSize(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(WidgetState.error)) {
              result = ThemeDecoder.instance.decodeSize(
                value['error'],
                validate: false,
              );
            } else if (states.contains(WidgetState.focused)) {
              result = ThemeDecoder.instance.decodeSize(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(WidgetState.hovered)) {
              result = ThemeDecoder.instance.decodeSize(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(WidgetState.pressed)) {
              result = ThemeDecoder.instance.decodeSize(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(WidgetState.scrolledUnder)) {
              result = ThemeDecoder.instance.decodeSize(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(WidgetState.selected)) {
              result = ThemeDecoder.instance.decodeSize(
                value['selected'],
                validate: false,
              );
            } else {
              result = ThemeDecoder.instance.decodeSize(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = WidgetStateProperty.all<Size?>(value);
      }
    }
    return result;
  }

  /// Decodes a [value] into a [TextStyle] based [WidgetStateProperty].  This
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
  WidgetStateProperty<TextStyle?>? decodeWidgetStatePropertyTextStyle(
    dynamic value, {
    bool validate = true,
  }) {
    WidgetStateProperty<TextStyle?>? result;

    if (value is WidgetStateProperty<TextStyle?>) {
      result = value;
    } else if (value != null) {
      if (value is TextStyle?) {
        result = WidgetStateProperty.all<TextStyle?>(value);
      } else if (value is String) {
        result = WidgetStateProperty.all<TextStyle?>(
          ThemeDecoder.instance.decodeTextStyle(value, validate: false),
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
          result = WidgetStateProperty.all<TextStyle?>(
            ThemeDecoder.instance.decodeTextStyle(value, validate: false),
          );
        } else {
          assert(
            SchemaValidator.validate(
              schemaId: '$_baseSchemaUrl/widget_state_property_text_style',
              value: value,
              validate: validate,
            ),
          );

          result = MapWidgetStateProperty.resolveWith((states) {
            TextStyle? result;
            if (states.contains(WidgetState.disabled)) {
              result = ThemeDecoder.instance.decodeTextStyle(
                value['disabled'],
                validate: false,
              );
            } else if (states.contains(WidgetState.dragged)) {
              result = ThemeDecoder.instance.decodeTextStyle(
                value['dragged'],
                validate: false,
              );
            } else if (states.contains(WidgetState.error)) {
              result = ThemeDecoder.instance.decodeTextStyle(
                value['error'],
                validate: false,
              );
            } else if (states.contains(WidgetState.focused)) {
              result = ThemeDecoder.instance.decodeTextStyle(
                value['focused'],
                validate: false,
              );
            } else if (states.contains(WidgetState.hovered)) {
              result = ThemeDecoder.instance.decodeTextStyle(
                value['hovered'],
                validate: false,
              );
            } else if (states.contains(WidgetState.pressed)) {
              result = ThemeDecoder.instance.decodeTextStyle(
                value['pressed'],
                validate: false,
              );
            } else if (states.contains(WidgetState.scrolledUnder)) {
              result = ThemeDecoder.instance.decodeTextStyle(
                value['scrolledUnder'],
                validate: false,
              );
            } else if (states.contains(WidgetState.selected)) {
              result = ThemeDecoder.instance.decodeTextStyle(
                value['selected'],
                validate: false,
              );
            } else {
              result = ThemeDecoder.instance.decodeTextStyle(
                value['empty'],
                validate: false,
              );
            }

            return result;
          });
        }
      } else {
        result = WidgetStateProperty.all<TextStyle>(value);
      }
    }
    return result;
  }

  WidgetStateProperty<Widget?>? decodeWidgetStatePropertyWidget(
    dynamic value, {
    bool validate = true,
  }) => decodeWidgetStatePropertyIcon(value, validate: validate);

  List<T>? _decodeDynamicList<T>(
    Iterable<dynamic>? list,
    T Function(dynamic value) decoder,
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

  List<T>? _decodeStringList<T>(
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
