import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:json_class/json_class.dart';

@immutable
class ThemeDecoder {
  ThemeDecoder._();

  /// Decodes the given [value] to an [Alignment].  Supported values are:
  ///  * `bottomCenter`
  ///  * `bottomLeft`
  ///  * `bottomRight`
  ///  * `center`
  ///  * `centerLeft`
  ///  * `centerRight`
  ///  * `topCenter`
  ///  * `topLeft`
  ///  * `topRight`
  static Alignment decodeAlignment(String value) {
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
    AlignmentGeometry result;

    if (value != null) {
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

    return result;
  }

  static AppBarTheme decodeAppBarTheme(dynamic value) {
    AppBarTheme result;

    if (value != null) {
      result = AppBarTheme(
        actionsIconTheme: decodeIconThemeData(value['actionsIconTheme']),
        brightness: decodeBrightness(value['brightness']),
        color: decodeColor(value['color']),
        elevation: JsonClass.parseDouble(value['elevation']),
        iconTheme: decodeIconThemeData(value['iconTheme']),
        textTheme: decodeTextTheme(value['textTheme']),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [Axis].  Supported values are:
  ///  * `horizontal`
  ///  * `vertical`
  static Axis decodeAxis(String value) {
    _checkSupported(
      'Axis',
      [
        'horizontal',
        'vertical',
      ],
      value,
    );
    Axis result;

    if (value != null) {
      switch (value) {
        case 'horizontal':
          result = Axis.horizontal;
          break;
        case 'vertical':
          result = Axis.vertical;
          break;
      }
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
  static BlendMode decodeBlendMode(String value) {
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

    BlendMode result;

    if (value != null) {
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

    return result;
  }

  static BorderRadius decodeBorderRadius(dynamic value) {
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

    BorderRadius result;

    if (value != null) {
      String type = value['type'];
      switch (type) {
        case 'all':
          result = BorderRadius.all(decodeRadius(value['radius']));
          break;
        case 'circular':
          result = BorderRadius.circular(
            JsonClass.parseDouble(value['radius']),
          );
          break;
        case 'horizontal':
          result = BorderRadius.horizontal(
            left: decodeRadius(value['left']),
            right: decodeRadius(value['right']),
          );
          break;
        case 'only':
          result = BorderRadius.only(
            bottomLeft: decodeRadius(value['bottomLeft']),
            bottomRight: decodeRadius(value['bottomRight']),
            topLeft: decodeRadius(value['topLeft']),
            topRight: decodeRadius(value['topRight']),
          );
          break;
        case 'vertical':
          result = BorderRadius.vertical(
            bottom: decodeRadius(value['bottom']),
            top: decodeRadius(value['top']),
          );
          break;
      }
    }

    return result;
  }

  static BorderSide decodeBorderSide(dynamic value) {
    BorderSide result;

    if (value != null) {
      result = BorderSide(
        color: decodeColor(value['color']),
        style: decodeBorderStyle(value['style']),
        width: JsonClass.parseDouble(value['width'], 1.0),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [BorderStyle].  Supported values are:
  ///  * `none`
  ///  * `solid`
  static BorderStyle decodeBorderStyle(String value) {
    _checkSupported(
      'BorderStyle',
      [
        'none',
        'solid',
      ],
      value,
    );
    BorderStyle result;

    if (value != null) {
      switch (value) {
        case 'none':
          result = BorderStyle.none;
          break;

        case 'solid':
          result = BorderStyle.solid;
          break;
      }
    }

    return result;
  }

  static BottomAppBarTheme decodeBottomAppBarTheme(dynamic value) {
    BottomAppBarTheme result;

    if (value != null) {
      result = BottomAppBarTheme(
        color: decodeColor(value['color']),
        elevation: JsonClass.parseDouble(value['elevation']),
        shape: decodeNotchedShape(value['shape']),
      );
    }

    return result;
  }

  // static BottomNavigationBarThemeData decodeBottomNavigationBarThemeData(
  //     dynamic value) {
  //   BottomNavigationBarThemeData result;

  //   if (value != null) {
  //     result = BottomNavigationBarThemeData(
  //       backgroundColor: decodeColor(value['backgroundColor']),
  //       elevation: JsonClass.parseDouble(value['elevation']),
  //       selectedIconTheme: decodeIconThemeData(value['selectedIconTheme']),
  //       selectedItemColor: decodeColor(value['selectedItemColor']),
  //       selectedLabelStyle: decodeTextStyle(value['selectedLabelStyle']),
  //       showSelectedLabels: value['showSelectedLabels'] == null
  //           ? null
  //           : JsonClass.parseBool(value['showSelectedLabels']),
  //       showUnselectedLabels: value['showUnselectedLabels'] == null
  //           ? null
  //           : JsonClass.parseBool(value['showUnselectedLabels']),
  //       type: decodeBottomNavigationBarType(value['type']),
  //     );
  //   }

  //   return result;
  // }

  /// Decodes the [value] to a [BottomNavigationBarType].  Supported values are:
  ///  * `fixed`
  ///  * `shifting`
  static BottomNavigationBarType decodeBottomNavigationBarType(String value) {
    _checkSupported(
      'BottomNavigationBarType',
      [
        'fixed',
        'shifting',
      ],
      value,
    );
    BottomNavigationBarType result;

    if (value != null) {
      switch (value) {
        case 'fixed':
          result = BottomNavigationBarType.fixed;
          break;
        case 'shifting':
          result = BottomNavigationBarType.shifting;
          break;
      }
    }

    return result;
  }

  static BottomSheetThemeData decodeBottomSheetThemeData(dynamic value) {
    BottomSheetThemeData result;

    if (value != null) {
      result = BottomSheetThemeData(
        backgroundColor: decodeColor(value['backgroundColor']),
        clipBehavior: decodeClip(value['clipBehavior']),
        elevation: JsonClass.parseDouble(value['elevation']),
        modalBackgroundColor: decodeColor(value['modalBackgroundColor']),
        modalElevation: JsonClass.parseDouble(value['modalElevation']),
        shape: decodeShapeBorder(value['shape']),
      );
    }

    return result;
  }

  /// Decodes the given [value] into a [BoxBorder].  If the value is [null]
  /// then [null] will be returned.  Otherwise, this expects a Map like value
  /// that in JSON would look like:
  ///
  /// ```json
  /// {
  ///   "bottom": <BorderSide>,
  ///   "left": <BorderSide>,
  ///   "right": <BorderSide>,
  ///   "top": <BorderSide>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeBorderSide]
  static BoxBorder decodeBoxBorder(dynamic value) {
    BoxBorder result;

    if (value != null) {
      result = Border(
        bottom: decodeBorderSide(value['bottom']),
        left: decodeBorderSide(value['left']),
        right: decodeBorderSide(value['right']),
        top: decodeBorderSide(value['top']),
      );
    }

    return result;
  }

  /// Decodes the given [value] into a [BoxConstraints].  If the value is [null]
  /// then [null] will be returned.  Otherwise, this expects a Map like value
  /// that in JSON would look like:
  ///
  /// ```json
  /// {
  ///   "maxHeight": <double>,
  ///   "maxWidth": <double>,
  ///   "minHeight": <double>,
  ///   "minWidth": <double>
  /// }
  /// ```
  static BoxConstraints decodeBoxConstraints(dynamic value) {
    BoxConstraints result;

    if (value != null) {
      result = BoxConstraints(
        maxHeight: JsonClass.parseDouble(value['maxHeight'], double.infinity),
        maxWidth: JsonClass.parseDouble(value['maxWidth'], double.infinity),
        minHeight: JsonClass.parseDouble(value['minHeight'], 0),
        minWidth: JsonClass.parseDouble(value['minWidth'], 0),
      );
    }

    return result;
  }

  /// Decodes the given [value] into a [BoxDecoration].  If the value is [null]
  /// then [null] will be returned.  Otherwise, this expects a Map like value
  /// that in JSON would look like:
  ///
  /// ```json
  /// {
  ///   "backgroundBlendMode": <BlendMode>,
  ///   "border": <BoxBorder>,
  ///   "borderRadius": <BorderRadius>,
  ///   "boxShadow": <BoxShadow[]>
  ///   "color": <Color>,
  ///   "gradient": <Gradient>,
  ///   "shape": <BoxShape>
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
  ///  * [decodeGradient]
  static BoxDecoration decodeBoxDecoration(dynamic value) {
    BoxDecoration result;

    if (value != null) {
      result = BoxDecoration(
        backgroundBlendMode: decodeBlendMode(value['backgroundBlendMode']),
        border: decodeBoxBorder(value['border']),
        borderRadius: decodeBorderRadius(value['borderRadius']),
        boxShadow: _decodeDynamicList(value['boxShadow'], decodeBoxShadow),
        color: decodeColor(value['color']),
        gradient: decodeGradient(value['gradient']),
        shape: decodeBoxShape(value['shape']),
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
  static BoxFit decodeBoxFit(String value) {
    BoxFit result;

    if (value != null) {
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

  /// Decodes the given [value] into a [BoxDecoration].  If the value is [null]
  /// then [null] will be returned.  Otherwise, this expects a Map like value
  /// that in JSON would look like:
  ///
  /// ```json
  /// {
  ///   "blurRadius": <double>,
  ///   "color": <Color>,
  ///   "offset": <Offset>,
  ///   "spreadRadius": <double>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeColor]
  ///  * [decodeOffset]
  static BoxShadow decodeBoxShadow(dynamic value) {
    BoxShadow result;

    if (value != null) {
      result = BoxShadow(
        blurRadius: JsonClass.parseDouble(value['blurRadius']),
        color: decodeColor(value['color']),
        offset: decodeOffset(value['offset']),
        spreadRadius: JsonClass.parseDouble(value['spreadRadius']),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [BoxShape].  Supported values are:
  ///  * `circle`
  ///  * `rectangle`
  static BoxShape decodeBoxShape(String value) {
    BoxShape result;

    if (value != null) {
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
  static Brightness decodeBrightness(String value) {
    Brightness result;

    if (value != null) {
      result = value == 'light'
          ? Brightness.light
          : value == 'dark' ? Brightness.dark : null;
    }

    return result;
  }

  static ButtonBarThemeData decodeButtonBarThemeData(dynamic value) {
    ButtonBarThemeData result;

    if (value != null) {
      result = ButtonBarThemeData(
        alignment: decodeMainAxisAlignment(value['alignment']),
        buttonAlignedDropdown: value['buttonAlignedDropdown'] == null
            ? null
            : JsonClass.parseBool(value['buttonAlignedDropdown']),
        buttonHeight: JsonClass.parseDouble(value['buttonHeight']),
        buttonMinWidth: JsonClass.parseDouble(value['buttonMinWidth']),
        buttonPadding: decodeEdgeInsetsGeometry(value['buttonPadding']),
        buttonTextTheme: decodeButtonTextTheme(value['buttonTextTheme']),
        layoutBehavior: decodeButtonLayoutBehavior(value['layoutBehavior']),
        mainAxisSize: decodeMainAxisSize(value['mainAxisSize']),
        overflowDirection: decodeVerticalDirection(value['overflowDirection']),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [ButtonBarLayoutBehavior].  Supported values are:
  ///  * `constrained`
  ///  * `padded`
  static ButtonBarLayoutBehavior decodeButtonLayoutBehavior(String value) {
    _checkSupported(
      'ButtonBarLayoutBehavior',
      [
        'constrained',
        'padded',
      ],
      value,
    );
    ButtonBarLayoutBehavior result;

    if (value != null) {
      switch (value) {
        case 'constrained':
          result = ButtonBarLayoutBehavior.constrained;
          break;
        case 'padded':
          result = ButtonBarLayoutBehavior.padded;
          break;
      }
    }

    return result;
  }

  /// Decodes the [value] to a [ButtonTextTheme].  Supported values are:
  ///  * `accent`
  ///  * `normal`
  ///  * `primary`
  static ButtonTextTheme decodeButtonTextTheme(String value) {
    _checkSupported(
      'ButtonTextTheme',
      [
        'accent',
        'normal',
        'primary',
      ],
      value,
    );
    ButtonTextTheme result;

    if (value != null) {
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

    return result;
  }

  static ButtonThemeData decodeButtonThemeData(dynamic value) {
    ButtonThemeData result;

    if (value != null) {
      result = ButtonThemeData(
        alignedDropdown: JsonClass.parseBool(value['alignedDropdown']),
        buttonColor: decodeColor(value['buttonColor']),
        colorScheme: decodeColorScheme(value['colorScheme']),
        disabledColor: decodeColor(value['disabledColor']),
        focusColor: decodeColor(value['focusColor']),
        height: JsonClass.parseDouble(value['height'], 36.0),
        highlightColor: decodeColor(value['highlightColor']),
        hoverColor: decodeColor(value['hoverColor']),
        layoutBehavior: decodeButtonLayoutBehavior(value['layoutBehavior']) ??
            ButtonBarLayoutBehavior.padded,
        materialTapTargetSize:
            decodeMaterialTapTargetSize(value['materialTapTargetSize']),
        minWidth: JsonClass.parseDouble(value['minWidth'], 88.0),
        padding: decodeEdgeInsetsGeometry(value['padding']),
        shape: decodeShapeBorder(value['shape']),
        splashColor: decodeColor(value['splashColor']),
        textTheme: decodeButtonTextTheme(value['textTheme']),
      );
    }

    return result;
  }

  static CardTheme decodeCardTheme(dynamic value) {
    CardTheme result;

    if (value != null) {
      result = CardTheme(
        clipBehavior: decodeClip(value['clipBehavior']),
        color: decodeColor(value['color']),
        elevation: JsonClass.parseDouble(value['elevation']),
        margin: decodeEdgeInsetsGeometry(value['margin']),
        shadowColor: decodeColor(value['shadowColor']),
        shape: decodeShapeBorder(value['shape']),
      );
    }

    return result;
  }

  static ChipThemeData decodeChipThemeData(dynamic value) {
    ChipThemeData result;

    if (value != null) {
      result = ChipThemeData(
        backgroundColor: decodeColor(value['backgroundColor']),
        brightness: decodeBrightness(value['brightness']),
        checkmarkColor: decodeColor(value['checkmarkColor']),
        deleteIconColor: decodeColor(value['deleteIconColor']),
        disabledColor: decodeColor(value['disabledColor']),
        elevation: JsonClass.parseDouble(value['elevation']),
        labelPadding: decodeEdgeInsetsGeometry(value['labelPadding']),
        labelStyle: decodeTextStyle(value['labelStyle']),
        padding: decodeEdgeInsetsGeometry(value['padding']),
        pressElevation: JsonClass.parseDouble(value['pressElevation']),
        secondaryLabelStyle: decodeTextStyle(value['secondaryLabelStyle']),
        secondarySelectedColor: decodeColor(value['secondarySelectedColor']),
        selectedColor: decodeColor(value['selectedColor']),
        shape: decodeShapeBorder(value['shape']),
        selectedShadowColor: decodeColor(value['selectedShadowColor']),
        shadowColor: decodeColor(value['shadowColor']),
        showCheckmark: value['showCheckmark'] == null
            ? null
            : JsonClass.parseBool(value['showCheckmark']),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [Clip].  Supported values are:
  ///  * `antiAlias`
  ///  * `antiAliasWithSaveLayer`
  ///  * `hardEdge`
  ///  * `none`
  static Clip decodeClip(String value) {
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
    Clip result;

    if (value != null) {
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

    return result;
  }

  /// Decodes a given [value] into a color.  A [value] of [null] will result in
  /// [null] being returned.
  ///
  /// This supports the following formats:
  ///  * `rgb`
  ///  * `rrggbb`
  ///  * `aarrggbb`
  ///  * `#rgb`
  ///  * `#rrggbb`
  ///  * `#aarrggbb`
  static Color decodeColor(String value) {
    Color result;

    if (value != null) {
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

  static ColorScheme decodeColorScheme(dynamic value) {
    ColorScheme result;

    if (value != null) {
      result = ColorScheme(
        background: decodeColor(value['background']),
        brightness: decodeBrightness(value['brightness']),
        error: decodeColor(value['error']),
        onBackground: decodeColor(value['onBackground']),
        onError: decodeColor(value['onError']),
        onPrimary: decodeColor(value['onPrimary']),
        onSecondary: decodeColor(value['onSecondary']),
        onSurface: decodeColor(value['onSurface']),
        primary: decodeColor(value['primary']),
        primaryVariant: decodeColor(value['primaryVariant']),
        secondary: decodeColor(value['secondary']),
        secondaryVariant: decodeColor(value['secondaryVariant']),
        surface: decodeColor(value['surface']),
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
  static CrossAxisAlignment decodeCrossAxisAlignment(String value) {
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

    CrossAxisAlignment result;

    if (value != null) {
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

    return result;
  }

  static CupertinoTextThemeData decodeCupertinoTextThemeData(dynamic value) {
    CupertinoTextThemeData result;

    if (value != null) {
      result = CupertinoTextThemeData(
        actionTextStyle: decodeTextStyle(value['actionTextStyle']),
        dateTimePickerTextStyle: decodeTextStyle(
          value['dateTimePickerTextStyle'],
        ),
        navActionTextStyle: decodeTextStyle(value['navActionTextStyle']),
        navLargeTitleTextStyle:
            decodeTextStyle(value['navLargeTitleTextStyle']),
        navTitleTextStyle: decodeTextStyle(value['navTitleTextStyle']),
        pickerTextStyle: decodeTextStyle(value['pickerTextStyle']),
        primaryColor: decodeColor(value['primaryColor']),
        tabLabelTextStyle: decodeTextStyle(value['tabLabelTextStyle']),
        textStyle: decodeTextStyle(value['textStyle']),
      );
    }

    return result;
  }

  static CupertinoThemeData decodeCupertinoThemeData(dynamic value) {
    CupertinoThemeData result;

    if (value != null) {
      result = CupertinoThemeData(
        barBackgroundColor: decodeColor(value['barBackgroundColor']),
        brightness: decodeBrightness(value['brightness']),
        primaryColor: decodeColor(value['primaryColor']),
        primaryContrastingColor: decodeColor(value['primaryContrastingColor']),
        scaffoldBackgroundColor: decodeColor(value['scaffoldBackgroundColor']),
        textTheme: decodeCupertinoTextThemeData(value['textTheme']),
      );
    }

    return result;
  }

  static DialogTheme decodeDialogTheme(dynamic value) {
    DialogTheme result;

    if (value != null) {
      result = DialogTheme(
        backgroundColor: decodeColor(value['backgroundColor']),
        contentTextStyle: decodeTextStyle(value['contentTextStyle']),
        elevation: JsonClass.parseDouble(value['elevation']),
        shape: decodeShapeBorder(value['shape']),
        titleTextStyle: decodeTextStyle(value['titleTextStyle']),
      );
    }

    return result;
  }

  static DividerThemeData decodeDividerThemeData(dynamic value) {
    DividerThemeData result;

    if (value != null) {
      result = DividerThemeData(
        color: decodeColor(value['color']),
        endIndent: JsonClass.parseDouble(value['endIndent']),
        indent: JsonClass.parseDouble(value['indent']),
        space: JsonClass.parseDouble(value['space']),
        thickness: JsonClass.parseDouble(value['thickness']),
      );
    }

    return result;
  }

  /// Decodes the given [value] to an [DragStartBehavior].  Supported values are:
  ///  * `horizontal`
  ///  * `start`
  static DragStartBehavior decodeDragStartBehavior(String value) {
    _checkSupported(
      'DragStartBehavior',
      [
        'down',
        'start',
      ],
      value,
    );
    DragStartBehavior result;

    if (value != null) {
      switch (value) {
        case 'down':
          result = DragStartBehavior.down;
          break;
        case 'start':
          result = DragStartBehavior.start;
          break;
      }
    }

    return result;
  }

  static EdgeInsetsGeometry decodeEdgeInsetsGeometry(dynamic value) {
    EdgeInsetsGeometry result;

    if (value != null) {
      result = EdgeInsets.only(
        bottom: JsonClass.parseDouble(value['bottom'], 0.0),
        left: JsonClass.parseDouble(value['left'], 0.0),
        right: JsonClass.parseDouble(value['right'], 0.0),
        top: JsonClass.parseDouble(value['top'], 0.0),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [FlexFit].  Supported values are:
  ///  * `baseLine`
  ///  * `center`
  ///  * `end`
  ///  * `start`
  ///  * `stretch`
  static FlexFit decodeFlexFit(String value) {
    _checkSupported(
      'FlexFit',
      [
        'loose',
        'tight',
      ],
      value,
    );

    FlexFit result;

    if (value != null) {
      switch (value) {
        case 'loose':
          result = FlexFit.loose;
          break;
        case 'tight':
          result = FlexFit.tight;
          break;
      }
    }

    return result;
  }

  static FloatingActionButtonThemeData decodeFloatingActionButtonThemeData(
      dynamic value) {
    FloatingActionButtonThemeData result;

    if (value != null) {
      result = FloatingActionButtonThemeData(
        backgroundColor: decodeColor(value['backgroundColor']),
        disabledElevation: JsonClass.parseDouble(value['disabledElevation']),
        elevation: JsonClass.parseDouble(value['elevation']),
        focusColor: decodeColor(value['focusColor']),
        focusElevation: JsonClass.parseDouble(value['focusElevation']),
        foregroundColor: decodeColor(value['foregroundColor']),
        highlightElevation: JsonClass.parseDouble(value['highlightElevation']),
        hoverColor: decodeColor(value['hoverColor']),
        hoverElevation: JsonClass.parseDouble(value['hoverElevation']),
        shape: decodeShapeBorder(value['shape']),
        splashColor: decodeColor(value['splashColor']),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [FloatingLabelBehavior].  Supported values are:
  ///  * `always`
  ///  * `auto`
  ///  * `never`
  static FloatingLabelBehavior decodeFloatingLabelBehavior(String value) {
    _checkSupported(
      'FloatingLabelBehavior',
      [
        'always',
        'auto',
        'never',
      ],
      value,
    );
    FloatingLabelBehavior result;

    if (value != null) {
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

    return result;
  }

  static FontFeature decodeFontFeature(dynamic value) {
    FontFeature result;

    if (value != null) {
      result = FontFeature(
        value['feature'],
        JsonClass.parseInt(value['value']),
      );
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
  static FontWeight decodeFontWeight(String value) {
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
    FontWeight result;

    if (value != null) {
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

    return result;
  }

  /// Decodes the [value] to a [FontStyle].  Supported values are:
  ///  * `italic`
  ///  * `normal`
  static FontStyle decodeFontStyle(String value) {
    _checkSupported(
      'FontStyle',
      [
        'italic',
        'normal',
      ],
      value,
    );
    FontStyle result;

    if (value != null) {
      switch (value) {
        case 'italic':
          result = FontStyle.italic;
          break;

        case 'normal':
          result = FontStyle.normal;
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] into a [Gradient].  If the value is [null]
  /// then [null] will be returned.
  ///
  /// When the [value] is not [null], this expects a type attribute of one of
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
  ///   "begin": <Alignment>,
  ///   "colors": <Color[]>,
  ///   "end": <Alignment>,
  ///   "stops": <double[]>,
  ///   "tileMode": <TileMode>,
  ///   "transform": <GradientTransform>
  ///   "type": "linear",
  /// }
  /// ```
  ///
  /// Type: `radial`
  /// ```json
  /// {
  ///   "center": <Alignment>,
  ///   "colors": <Color[]>,
  ///   "focal": <Alignment>,
  ///   "focalRadius": <double>,
  ///   "radius": <double>,
  ///   "stops": <double[]>,
  ///   "tileMode": <TileMode>,
  ///   "transform": <GradientTransform>
  ///   "type": "radial",
  /// }
  /// ```
  ///
  /// Type: `sweep`
  /// ```json
  /// {
  ///   "center": <Alignment>,
  ///   "colors": <Color[]>,
  ///   "endAngle": <double>,
  ///   "startAngle": <double>,
  ///   "stops": <double[]>,
  ///   "tileMode": <TileMode>,
  ///   "transform": <GradientTransform>
  ///   "type": "sweep",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeAlignment]
  ///  * [decodeGradientTransform]
  ///  * [decodeTileMode]
  static Gradient decodeGradient(dynamic value) {
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
    Gradient result;

    if (value != null) {
      var type = value['type'];
      switch (type) {
        case 'linear':
          result = LinearGradient(
            begin: decodeAlignment(value['begin']),
            colors: _decodeStringList<Color>(
              value['colors'],
              decodeColor,
            ),
            end: decodeAlignment(value['end']),
            stops: _decodeDynamicList<double>(
              value['stops'],
              (value) => JsonClass.parseDouble(value),
            ),
            tileMode: decodeTileMode(value['tileMode']),
            transform: decodeGradientTransform(value['transform']),
          );
          break;
        case 'radial':
          result = RadialGradient(
            center: decodeAlignment(value['center']),
            colors: _decodeStringList<Color>(
              value['colors'],
              decodeColor,
            ),
            focal: decodeAlignment(value['focal']),
            focalRadius: JsonClass.parseDouble(value['focalRadius']),
            radius: JsonClass.parseDouble(value['radius']),
            stops: _decodeDynamicList<double>(
              value['stops'],
              (value) => JsonClass.parseDouble(value),
            ),
            tileMode: decodeTileMode(value['tileMode']),
            transform: decodeGradientTransform(value['transform']),
          );
          break;
        case 'sweep':
          result = SweepGradient(
            center: decodeAlignment(value['center']),
            colors: _decodeStringList<Color>(
              value['colors'],
              decodeColor,
            ),
            endAngle: JsonClass.parseDouble(value['endAngle']),
            startAngle: JsonClass.parseDouble(value['startAngle']),
            stops: _decodeDynamicList<double>(
              value['stops'],
              (value) => JsonClass.parseDouble(value),
            ),
            tileMode: decodeTileMode(value['tileMode']),
            transform: decodeGradientTransform(value['transform']),
          );
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] into a [GradientTransform].  If the value is
  /// [null] then [null] will be returned.
  ///
  /// When the [value] is not [null], this will always return a concrete
  /// implementation of [GradientRotation].
  ///
  /// ```json
  /// {
  ///   "radians": <double>
  /// }
  /// ```
  static GradientTransform decodeGradientTransform(dynamic value) {
    GradientTransform result;

    if (value != null) {
      result = GradientRotation(
        JsonClass.parseDouble(value['radians']),
      );
    }

    return result;
  }

  /// Decodes the given [value] into an [IconData].  If the value is [null] then
  /// [null] will be returned.
  ///
  /// ```json
  /// {
  ///   "codePoint": <int>,
  ///   "fontFamily": <String>,
  ///   "fontPackage": <String>,
  ///   "matchTextDirection": <bool>
  /// }
  /// ```
  static IconData decodeIconData(dynamic value) {
    IconData result;

    if (value != null) {
      result = IconData(
        JsonClass.parseInt(value['codePoint']),
        fontFamily: value['fontFamily'],
        fontPackage: value['fontPackage'],
        matchTextDirection: value['matchTextDirection'] == null
            ? null
            : JsonClass.parseBool(value['matchTextDirection']),
      );
    }

    return result;
  }

  static IconThemeData decodeIconThemeData(dynamic value) {
    IconThemeData result;

    if (value != null) {
      result = IconThemeData(
        color: decodeColor(value['color']),
        opacity: JsonClass.parseDouble(value['opacity']),
        size: JsonClass.parseDouble(value['size']),
      );
    }

    return result;
  }

  static InputBorder decodeInputBorder(dynamic value) {
    _checkSupported(
      'InputBorder.type',
      [
        'outline',
        'underline',
      ],
      value == null ? null : value['type'],
    );
    InputBorder result;

    if (value != null) {
      String type = value['type'];

      switch (type) {
        case 'outline':
          result = OutlineInputBorder(
            borderRadius: decodeBorderRadius(value['borderRadius']) ??
                BorderRadius.all(Radius.circular(4.0)),
            borderSide: decodeBorderSide(value['borderSide']) ?? BorderSide(),
            gapPadding: JsonClass.parseDouble(value['gapPadding'], 4.0),
          );
          break;

        case 'underline':
          result = UnderlineInputBorder(
                  borderRadius: decodeBorderRadius(value['borderRadius']) ??
                      BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                  borderSide: decodeBorderSide(value['borderSide'])) ??
              BorderSide();
          break;
      }
    }

    return result;
  }

  static InputDecorationTheme decodeInputDecorationTheme(dynamic value) {
    InputDecorationTheme result;

    if (value != null) {
      result = InputDecorationTheme(
        alignLabelWithHint: JsonClass.parseBool(value['alignLabelWithHint']),
        border: decodeInputBorder(value['border']),
        contentPadding: decodeEdgeInsetsGeometry(value['contentPadding']),
        counterStyle: decodeTextStyle(value['counterStyle']),
        disabledBorder: decodeInputBorder(value['disabledBorder']),
        enabledBorder: decodeInputBorder(value['enabledBorder']),
        errorBorder: decodeInputBorder(value['errorBorder']),
        errorMaxLines: JsonClass.parseInt(value['errorMaxLines']),
        errorStyle: decodeTextStyle(value['errorStyle']),
        fillColor: decodeColor(value['fillColor']),
        filled: JsonClass.parseBool(value['filled']),
        floatingLabelBehavior: decodeFloatingLabelBehavior(
          value['floatingLabelBehavior'],
        ),
        focusColor: decodeColor(value['focusColor']),
        focusedBorder: decodeInputBorder(value['focusedBorder']),
        focusedErrorBorder: decodeInputBorder(value['focusedErrorBorder']),
        helperMaxLines: JsonClass.parseInt(value['helperMaxLines']),
        helperStyle: decodeTextStyle(value['helperStyle']),
        hintStyle: decodeTextStyle(value['hintStyle']),
        hoverColor: decodeColor(value['hoverColor']),
        isCollapsed: JsonClass.parseBool(value['isCollapsed']),
        isDense: JsonClass.parseBool(value['isDense']),
        labelStyle: decodeTextStyle(value['labelStyle']),
        prefixStyle: decodeTextStyle(value['prefixStyle']),
        suffixStyle: decodeTextStyle(value['suffixStyle']),
      );
    }

    return result;
  }

  /// Decodes the [value] to an [InteractiveInkFeatureFactory].  Supported
  /// values are:
  ///  * `splash`
  ///  * `ripple`
  static InteractiveInkFeatureFactory decodeInteractiveInkFeatureFactory(
    String value,
  ) {
    _checkSupported(
      'InteractiveInkFeatureFactory',
      [
        'splash',
        'ripple',
      ],
      value,
    );
    InteractiveInkFeatureFactory result;

    if (value != null) {
      switch (value) {
        case 'splash':
          result = InkSplash.splashFactory;
          break;

        case 'ripple':
          result = InkRipple.splashFactory;
          break;
      }
    }

    return result;
  }

  static Locale decodeLocale(dynamic value) {
    Locale result;

    if (value != null) {
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
  static MainAxisAlignment decodeMainAxisAlignment(String value) {
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

    MainAxisAlignment result;

    if (value != null) {
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

    return result;
  }

  /// Decodes the [value] to a [MainAxisSize].  Supported values are:
  ///  * `max`
  ///  * `min`
  static MainAxisSize decodeMainAxisSize(String value) {
    MainAxisSize result;
    _checkSupported(
      'MainAxisSize',
      [
        'max',
        'min',
      ],
      value,
    );
    if (value != null) {
      switch (value) {
        case 'max':
          result = MainAxisSize.max;
          break;
        case 'min':
          result = MainAxisSize.min;
          break;
      }
    }

    return result;
  }

  static MaterialBannerThemeData decodeMaterialBannerThemeData(dynamic value) {
    MaterialBannerThemeData result;

    if (value != null) {
      result = MaterialBannerThemeData(
        backgroundColor: decodeColor(value['backgroundColor']),
        contentTextStyle: decodeTextStyle(value['contentTextStyle']),
        leadingPadding: decodeEdgeInsetsGeometry(value['leadingPadding']),
        padding: decodeEdgeInsetsGeometry(value['padding']),
      );
    }

    return result;
  }

  static MaterialColor decodeMaterialColor(dynamic value) {
    MaterialColor result;

    if (value != null) {
      var swatches = <int, Color>{};

      var swatchesIn = value['swatches'];
      swatchesIn.forEach(
        (key, value) => swatches[JsonClass.parseInt(key)] = decodeColor(value),
      );

      result = MaterialColor(
        decodeColor(value['primary']).value,
        swatches,
      );
    }

    return result;
  }

  /// Decodes the [value] to a [MaterialTargetTapSize].  Supported values are:
  ///  * `padded`
  ///  * `shrinkWrap`
  static MaterialTapTargetSize decodeMaterialTapTargetSize(String value) {
    _checkSupported(
      'MaterialTapTargetSize',
      [
        'padded',
        'shrinkWrap',
      ],
      value,
    );
    MaterialTapTargetSize result;

    if (value != null) {
      switch (value) {
        case 'padded':
          result = MaterialTapTargetSize.padded;
          break;
        case 'shrinkWrap':
          result = MaterialTapTargetSize.shrinkWrap;
          break;
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
  static MaterialType decodeMaterialType(String value) {
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
    MaterialType result;

    if (value != null) {
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
  static Matrix4 decodeMatrix4(Iterable<double> value) {
    Matrix4 result;

    if (value != null) {
      var list = value.toList();
      result = Matrix4(
        JsonClass.parseDouble(list[0]),
        JsonClass.parseDouble(list[1]),
        JsonClass.parseDouble(list[2]),
        JsonClass.parseDouble(list[3]),
        JsonClass.parseDouble(list[4]),
        JsonClass.parseDouble(list[5]),
        JsonClass.parseDouble(list[6]),
        JsonClass.parseDouble(list[7]),
        JsonClass.parseDouble(list[8]),
        JsonClass.parseDouble(list[9]),
        JsonClass.parseDouble(list[10]),
        JsonClass.parseDouble(list[11]),
        JsonClass.parseDouble(list[12]),
        JsonClass.parseDouble(list[13]),
        JsonClass.parseDouble(list[14]),
        JsonClass.parseDouble(list[15]),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [NavigationRailLabelType].  Supported values are:
  ///  * `all`
  ///  * `none`
  ///  * `selected`
  static NavigationRailLabelType decodeNavigationRailLabelType(String value) {
    _checkSupported(
      'NavigationRailLabelType',
      [
        'all',
        'none',
        'selected',
      ],
      value,
    );
    NavigationRailLabelType result;

    if (value != null) {
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

    return result;
  }

  static NavigationRailThemeData decodeNavigationRailThemeData(dynamic value) {
    NavigationRailThemeData result;

    if (value != null) {
      result = NavigationRailThemeData(
        backgroundColor: decodeColor(value['backgroundColor']),
        elevation: JsonClass.parseDouble(value['elevation']),
        groupAlignment: JsonClass.parseDouble(value['groupAlignment']),
        labelType: decodeNavigationRailLabelType(value['labelType']),
        selectedIconTheme: decodeIconThemeData(value['selectedIconTheme']),
        selectedLabelTextStyle:
            decodeTextStyle(value['selectedLabelTextStyle']),
        unselectedIconTheme: decodeIconThemeData(value['unselectedIconTheme']),
        unselectedLabelTextStyle: decodeTextStyle(
          value['unselectedLabelTextStyle'],
        ),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [NotchedShape].  Supported values are:
  ///  * `circular`
  static NotchedShape decodeNotchedShape(String value) {
    _checkSupported(
      'NotchedShape',
      [
        'circular',
      ],
      value,
    );
    NotchedShape result;

    if (value != null) {
      switch (value) {
        case 'circular':
          result = CircularNotchedRectangle();
          break;
      }
    }

    return result;
  }

  static Offset decodeOffset(dynamic value) {
    Offset result;

    if (value != null) {
      result = Offset(
        JsonClass.parseDouble(value['dx']),
        JsonClass.parseDouble(value['dy']),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [Overflow].  Supported values are:
  ///  * `clip`
  ///  * `visible`
  static Overflow decodeOverflow(String value) {
    _checkSupported(
      'Overflow',
      [
        'clip',
        'visible',
      ],
      value,
    );
    Overflow result;

    if (value != null) {
      switch (value) {
        case 'clip':
          result = Overflow.clip;
          break;
        case '':
        case 'visible':
          result = Overflow.visible;
          break;
      }
    }

    return result;
  }

  static PopupMenuThemeData decodePopupMenuThemeData(dynamic value) {
    PopupMenuThemeData result;

    if (value != null) {
      result = PopupMenuThemeData(
        color: decodeColor(value['color']),
        elevation: JsonClass.parseDouble(value['elevation']),
        shape: decodeShapeBorder(value['shape']),
        textStyle: decodeTextStyle(value['textStyle']),
      );
    }

    return result;
  }

  static Radius decodeRadius(dynamic value) {
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
    Radius result;

    if (value != null) {
      String type = value['type'];

      switch (type) {
        case 'circular':
          result = Radius.circular(JsonClass.parseDouble(value['radius']));
          break;

        case 'elliptical':
          result = Radius.elliptical(
            JsonClass.parseDouble(value['x']),
            JsonClass.parseDouble(value['y']),
          );
          break;

        case 'zero':
          result = Radius.zero;
          break;
      }
    }

    return result;
  }

  static RangeSliderThumbShape decodeRangeSliderThumbShape(dynamic value) {
    assert(value == null || value['type'] is String);
    _checkSupported(
      'RangeSliderThumbShape.type',
      [
        'round',
      ],
      value == null ? null : value['type'],
    );
    RangeSliderThumbShape result;

    if (value != null) {
      String type = value['type'];

      switch (type) {
        case 'round':
          result = RoundRangeSliderThumbShape(
            disabledThumbRadius: JsonClass.parseDouble(
              value['disabledThumbRadius'],
            ),
            // elevation: JsonClass.parseDouble(value['elevation'], 1.0),
            enabledThumbRadius: JsonClass.parseDouble(
              value['enabledThumbRadius'],
              10.0,
            ),
            // pressedElevation: JsonClass.parseDouble(value['pressedElevation'], 6.0,),
          );
          break;
      }
    }

    return result;
  }

  static RangeSliderTickMarkShape decodeRangeSliderTickMarkShape(
      dynamic value) {
    assert(value == null || value['type'] is String);
    _checkSupported(
      'RangeSliderTickMarkShape.type',
      [
        'round',
      ],
      value == null ? null : value['type'],
    );
    RangeSliderTickMarkShape result;

    if (value != null) {
      String type = value['type'];

      switch (type) {
        case 'round':
          result = RoundRangeSliderTickMarkShape(
            tickMarkRadius: JsonClass.parseDouble(value['tickMarkRadius']),
          );
          break;
      }
    }

    return result;
  }

  /// Decodes the [value] to a [RangeSliderTrackShape].  Supported values are:
  ///  * `rectangular`
  ///  * `rounded`
  static RangeSliderTrackShape decodeRangeSliderTrackShape(String value) {
    _checkSupported(
      'RangeSliderTrackShape',
      [
        'rectangular',
        'rounded',
      ],
      value,
    );
    RangeSliderTrackShape result;

    if (value != null) {
      switch (value) {
        case 'rectangular':
          result = RectangularRangeSliderTrackShape();
          break;

        case 'rounded':
          result = RoundedRectRangeSliderTrackShape();
          break;
      }
    }

    return result;
  }

  /// Decodes the [value] to a [RangeSliderValueIndicatorShape].  Supported
  /// values are:
  ///  * `paddle`
  static RangeSliderValueIndicatorShape decodeRangeSliderValueIndicatorShape(
    String value,
  ) {
    _checkSupported(
      'RangeSliderValueIndicatorShape.type',
      [
        'paddle',
        // 'rectangular',
      ],
      value,
    );
    RangeSliderValueIndicatorShape result;

    if (value != null) {
      switch (value) {
        case 'paddle':
          result = PaddleRangeSliderValueIndicatorShape();
          break;

        // case 'rectangular':
        //   result = RectangularRangeSliderValueIndicatorShape();
        //   break;
      }
    }

    return result;
  }

  /// Decodes the [value] to a [ScrollPhysics].  If [value] is not [null] then
  /// it must contain a property named "type" with one of the following values:
  ///  * `always`
  ///  * `bouncing`
  ///  * `clamping`
  ///  * `fixedExtent`
  ///  * `never`
  ///  * `page`
  ///
  /// This expects the JSON representation to follow the structure:
  /// ```json
  /// {
  ///   "parent": <ScrollPhysics>,
  ///   "type": <String>
  /// }
  /// ```
  static ScrollPhysics decodeScrollPhysics(dynamic value) {
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
      ],
      value == null ? null : value['type'],
    );
    ScrollPhysics result;

    if (value != null) {
      var type = value['type'];

      switch (type) {
        case 'always':
          result = AlwaysScrollableScrollPhysics(
            parent: decodeScrollPhysics(value['parent']),
          );
          break;

        case 'bouncing':
          result = BouncingScrollPhysics(
            parent: decodeScrollPhysics(value['parent']),
          );
          break;

        case 'clamping':
          result = ClampingScrollPhysics(
            parent: decodeScrollPhysics(value['parent']),
          );
          break;

        case 'fixedExtent':
          result = FixedExtentScrollPhysics(
            parent: decodeScrollPhysics(value['parent']),
          );
          break;

        case 'never':
          result = NeverScrollableScrollPhysics(
            parent: decodeScrollPhysics(value['parent']),
          );
          break;

        case 'page':
          result = PageScrollPhysics(
            parent: decodeScrollPhysics(value['parent']),
          );
          break;
      }
    }

    return result;
  }

  static Shadow decodeShadow(dynamic value) {
    Shadow result;

    if (value != null) {
      result = Shadow(
        blurRadius: JsonClass.parseDouble(value['blurRadius'], 0.0),
        color: decodeColor(value['color']),
        offset: decodeOffset(value['offset']),
      );
    }

    return result;
  }

  static ShapeBorder decodeShapeBorder(dynamic value) {
    assert(value == null || value['type'] is String);
    _checkSupported(
      'ShapeBorder.type',
      [
        'circle',
        'rectangle',
        'rounded',
      ],
      value == null ? null : value['type'],
    );
    ShapeBorder result;

    if (value != null) {
      String type = value['type'];

      switch (type) {
        case 'circle':
          result = CircleBorder(
            side: decodeBorderSide(value['side']),
          );
          break;

        case 'rectangle':
          result = ContinuousRectangleBorder(
            borderRadius: decodeBorderRadius(
              value['borderRadius'],
            ),
            side: decodeBorderSide(value['side']),
          );
          break;

        case 'rounded':
          result = RoundedRectangleBorder(
            borderRadius: decodeBorderRadius(
              value['borderRadius'],
            ),
            side: decodeBorderSide(value['side']),
          );
          break;
      }
    }

    return result;
  }

  /// Decodes the [value] to a [ShowValueIndicator].  Supported values are:
  ///  * `always`
  ///  * `never`
  ///  * `onlyForContinuous`
  ///  * `onlyForDiscrete`
  static ShowValueIndicator decodeShowValueIndicator(String value) {
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
    ShowValueIndicator result;

    if (value != null) {
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

    return result;
  }

  /// Decodes the [value] to a [SliderComponentShape].  Supported values are:
  ///  * `noOverlay`
  ///  * `noThumb`
  static SliderComponentShape decodeSliderComponentShape(String value) {
    _checkSupported(
      'SliderComponentShape',
      [
        'noOverlay',
        'noThumb',
      ],
      value,
    );
    SliderComponentShape result;

    if (value != null) {
      switch (value) {
        case 'noOverlay':
          result = SliderComponentShape.noOverlay;
          break;

        case 'noThumb':
          result = SliderComponentShape.noThumb;
          break;
      }
    }

    return result;
  }

  static SliderThemeData decodeSliderThemeData(dynamic value) {
    SliderThemeData result;

    if (value != null) {
      assert(
          value[''] == null, 'SliderThemeData.tickMarkShape is not supported');
      result = SliderThemeData(
        activeTickMarkColor: decodeColor(value['activeTickMarkColor']),
        activeTrackColor: decodeColor(value['activeTrackColor']),
        disabledActiveTickMarkColor: decodeColor(
          value['disabledActiveTickMarkColor'],
        ),
        disabledActiveTrackColor:
            decodeColor(value['disabledActiveTrackColor']),
        disabledInactiveTickMarkColor: decodeColor(
          value['disabledInactiveTickMarkColor'],
        ),
        disabledInactiveTrackColor:
            decodeColor(value['disabledInactiveTrackColor']),
        disabledThumbColor: decodeColor(value['disabledThumbColor']),
        inactiveTickMarkColor: decodeColor(value['inactiveTickMarkColor']),
        inactiveTrackColor: decodeColor(value['inactiveTrackColor']),
        minThumbSeparation: JsonClass.parseDouble(value['minThumbSeparation']),
        overlappingShapeStrokeColor: decodeColor(
          value['overlappingShapeStrokeColor'],
        ),
        overlayColor: decodeColor(value['overlayColor']),
        overlayShape: decodeSliderComponentShape(value['overlayShape']),
        rangeThumbShape: decodeRangeSliderThumbShape(value['rangeThumbShape']),
        rangeTickMarkShape: decodeRangeSliderTickMarkShape(
          value['rangeTickMarkShape'],
        ),
        rangeTrackShape: decodeRangeSliderTrackShape(value['rangeTrackShape']),
        rangeValueIndicatorShape: decodeRangeSliderValueIndicatorShape(
          value['rangeValueIndicatorShape'],
        ),
        showValueIndicator:
            decodeShowValueIndicator(value['showValueIndicator']),
        thumbColor: decodeColor(value['thumbColor']),
        thumbShape: decodeSliderComponentShape(value['thumbShape']),
        trackHeight: JsonClass.parseDouble(value['trackHeight']),
        trackShape: decodeSliderTrackShape(value['trackShape']),
        valueIndicatorColor: decodeColor(value['valueIndicatorColor']),
        valueIndicatorShape: decodeSliderComponentShape(
          value['valueIndicatorShape'],
        ),
        valueIndicatorTextStyle: decodeTextStyle(
          value['valueIndicatorTextStyle'],
        ),
      );
    }

    return result;
  }

  static SliderTrackShape decodeSliderTrackShape(dynamic value) {
    assert(value == null || value['type'] is String);
    _checkSupported(
      'type',
      [
        'rectangular',
        'rounded',
      ],
      value == null ? null : value['type'],
    );
    SliderTrackShape result;

    if (value != null) {
      String type = value['type'];
      switch (type) {
        case 'rectangular':
          result = RectangularSliderTrackShape(
            disabledThumbGapWidth: JsonClass.parseDouble(
              value['disabledThumbGapWidth'],
              2.0,
            ),
          );
          break;

        case 'rounded':
          result = RoundedRectSliderTrackShape();
          break;
      }
    }

    return result;
  }

  /// Decodes a [value] to a [SnackBarBehavior].  Supported values are:
  ///  * `fixed`
  ///  * `floating`
  static SnackBarBehavior decodeSnackBarBehavior(String value) {
    _checkSupported(
      'SnackBarBehavior',
      [
        'fixed',
        'floating',
      ],
      value,
    );
    SnackBarBehavior result;

    if (value != null) {
      switch (value) {
        case 'fixed':
          result = SnackBarBehavior.fixed;
          break;

        case 'floating':
          result = SnackBarBehavior.floating;
          break;
      }
    }

    return result;
  }

  static SnackBarThemeData decodeSnackBarThemeData(dynamic value) {
    SnackBarThemeData result;

    if (value != null) {
      result = SnackBarThemeData(
        actionTextColor: decodeColor(value['actionTextColor']),
        backgroundColor: decodeColor(value['backgroundColor']),
        behavior: decodeSnackBarBehavior(value['behavior']),
        contentTextStyle: decodeTextStyle(value['contentTextStyle']),
        disabledActionTextColor: decodeColor(value['disabledActionTextColor']),
        elevation: JsonClass.parseDouble(value['elevation']),
        shape: decodeShapeBorder(value['shape']),
      );
    }

    return result;
  }

  /// Decodes a [value] to a [StackFit].  Supported values are:
  ///  * `expand`
  ///  * `loose`
  ///  * `passthrough`
  static StackFit decodeStackFit(String value) {
    StackFit result;

    if (value != null) {
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

  /// Decodes the given [value] into a [StrutStyle].  If the value is [null]
  /// then [null] will be returned.  Otherwise, this expects a Map like value
  /// that in JSON would look like:
  ///
  /// ```json
  /// {
  ///   "fontFamily": <String>,
  ///   "fontFamilyFallback": <String[]>,
  ///   "fontSize": <double>,
  ///   "fontStyle": <FontStyle>,
  ///   "fontWeight": <FontWeight>
  ///   "forceStrutHeight": <bool>,
  ///   "height": <double>,
  ///   "leading": <double>,
  ///   "package": <String>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [decodeFontStyle]
  ///  * [decodeFontWeight]
  static StrutStyle decodeStrutStyle(dynamic value) {
    StrutStyle result;

    if (value != null) {
      result = StrutStyle(
        fontFamily: value['fontFamily'],
        fontFamilyFallback: _decodeStringList(
          value['fontFamilyFallback'],
          (value) => value,
        ),
        fontSize: JsonClass.parseDouble(value['fontSize']),
        fontStyle: decodeFontStyle(value['fontStyle']),
        fontWeight: decodeFontWeight(value['fontWeight']),
        forceStrutHeight: value['forceStrutHeight'] == null
            ? null
            : JsonClass.parseBool(value['forceStrutHeight']),
        height: JsonClass.parseDouble(value['height']),
        leading: JsonClass.parseDouble(value['leading']),
        package: value['package'],
      );
    }

    return result;
  }

  /// Decodes a [value] to a [TabBarIndicatorSize].  Supported values are:
  ///  * `label`
  ///  * `tab`
  static TabBarIndicatorSize decodeTabBarIndicatorSize(String value) {
    _checkSupported(
      'TabBarIndicatorSize',
      [
        'label',
        'tab',
      ],
      value,
    );
    TabBarIndicatorSize result;

    if (value != null) {
      switch (value) {
        case 'label':
          result = TabBarIndicatorSize.label;
          break;

        case 'tab':
          result = TabBarIndicatorSize.tab;
          break;
      }
    }

    return result;
  }

  static TabBarTheme decodeTabBarTheme(dynamic value) {
    TabBarTheme result;

    if (value != null) {
      assert(
        value['indicator'] == null,
        'TabBarTheme.indicator is not supported',
      );
      result = TabBarTheme(
        indicatorSize: decodeTabBarIndicatorSize(value['indicatorSize']),
        labelPadding: decodeEdgeInsetsGeometry(value['labelPadding']),
        labelColor: decodeColor(value['labelColor']),
        labelStyle: decodeTextStyle(value['labelStyle']),
        unselectedLabelColor: decodeColor(value['unselectedLabelColor']),
        unselectedLabelStyle: decodeTextStyle(value['unselectedLabelStyle']),
      );
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
  static TargetPlatform decodeTargetPlatform(String value) {
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
    TargetPlatform result;

    if (value != null) {
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

    return result;
  }

  /// Decodes the [value] to a [TextAlign].  Supported values are:
  ///  * `center`
  ///  * `end`
  ///  * `justify`
  ///  * `left`
  ///  * `right`
  ///  * `start`
  static TextAlign decodeTextAlign(String value) {
    TextAlign result;

    if (value != null) {
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

    return result;
  }

  /// Decodes the [value] to a [TextBaseline].  Supported values are:
  ///  * `alphabetic`
  ///  * `ideographic`
  static TextBaseline decodeTextBaseline(String value) {
    _checkSupported(
      'TextBaseline',
      [
        'alphabetic',
        'ideographic',
      ],
      value,
    );
    TextBaseline result;

    if (value != null) {
      switch (value) {
        case 'alphabetic':
          result = TextBaseline.alphabetic;
          break;

        case 'ideographic':
          result = TextBaseline.ideographic;
          break;
      }
    }

    return result;
  }

  /// Decodes the [value] to a [TextDecoration].  Supported values are:
  ///  * `lineThrough`
  ///  * `none`
  ///  * `overline`
  ///  * `underline`
  static TextDecoration decodeTextDecoration(String value) {
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
    TextDecoration result;

    if (value != null) {
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

    return result;
  }

  /// Decodes the [value] to a [TextDecorationStyle].  Supported values are:
  ///  * `dashed`
  ///  * `dotted`
  ///  * `double`
  ///  * `solid`
  ///  * `wavy`
  static TextDecorationStyle decodeTextDecorationStyle(String value) {
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
    TextDecorationStyle result;

    if (value != null) {
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

    return result;
  }

  /// Decodes the [value] to a [TextDirection].  Supported values are:
  ///  * `ltr`
  ///  * `rtl`
  static TextDirection decodeTextDirection(String value) {
    _checkSupported(
      'TextDirection',
      [
        'ltr',
        'rtl',
      ],
      value,
    );
    TextDirection result;

    if (value != null) {
      switch (value) {
        case 'ltr':
          result = TextDirection.ltr;
          break;

        case 'rtl':
          result = TextDirection.rtl;
          break;
      }
    }

    return result;
  }

  /// Decodes the given [value] into a [TextHeightBehavior].  If the value is
  /// [null] then [null] will be returned.  Otherwise, this expects a Map like
  /// value that in JSON would look like:
  ///
  /// ```json
  /// {
  ///   "applyHeightToFirstAscent": <bool>,
  ///   "applyHeightToLastDescent": <bool>
  /// }
  /// ```
  static TextHeightBehavior decodeTextHeightBehavior(dynamic value) {
    TextHeightBehavior result;

    if (value != null) {
      result = TextHeightBehavior(
        applyHeightToFirstAscent: value['applyHeightToFirstAscent'] == null
            ? null
            : JsonClass.parseBool(value['applyHeightToLastDescent']),
        applyHeightToLastDescent: value['applyHeightToLastDescent'] == null
            ? null
            : JsonClass.parseBool(value['applyHeightToLastDescent']),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [TextOverflow].  Supported values are:
  ///  * `clip`
  ///  * `ellipsis`
  ///  * `fade`
  ///  * `visible`
  static TextOverflow decodeTextOverflow(String value) {
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
    TextOverflow result;

    if (value != null) {
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

    return result;
  }

  static TextStyle decodeTextStyle(dynamic value) {
    TextStyle result;

    if (value != null) {
      result = TextStyle(
        backgroundColor: decodeColor(value['backgroundColor']),
        color: decodeColor(value['color']),
        decoration: decodeTextDecoration(value['decoration']),
        decorationColor: decodeColor(value['decorationColor']),
        decorationStyle: decodeTextDecorationStyle(value['decorationStyle']),
        decorationThickness:
            JsonClass.parseDouble(value['decorationThickness']),
        fontFamily: value['fontFamily'],
        fontFamilyFallback: value['fontFamilyFallback'] == null
            ? null
            : List<String>.from(value['fontFamilyFallback']),
        fontFeatures: value['fontFeatures'] == null
            ? null
            : List<FontFeature>.from(
                value['fontFeatures'].map(
                  (value) => decodeFontFeature(value),
                ),
              ),
        fontWeight: decodeFontWeight(value['fontWeight']),
        fontSize: JsonClass.parseDouble(value['fontSize']),
        fontStyle: decodeFontStyle(value['fontStyle']),
        height: JsonClass.parseDouble(value['height']),
        inherit: value['inherit'] == null
            ? true
            : JsonClass.parseBool(
                value['inherit'],
              ),
        letterSpacing: JsonClass.parseDouble(value['letterSpacing']),
        locale: decodeLocale(value['locale']),
        package: value['package'],
        shadows: value['shadows'] == null
            ? null
            : List<Shadow>.from(
                value['shadows'].map(
                  (value) => decodeShadow(value),
                ),
              ),
        textBaseline: decodeTextBaseline(value['textBaseline']),
        wordSpacing: JsonClass.parseDouble(value['wordSpacing']),
      );
    }

    return result;
  }

  static TextTheme decodeTextTheme(dynamic value) {
    TextTheme result;

    if (value != null) {
      result = TextTheme(
        bodyText1: decodeTextStyle(value['bodyText1']),
        bodyText2: decodeTextStyle(value['bodyText2']),
        button: decodeTextStyle(value['button']),
        caption: decodeTextStyle(value['caption']),
        headline1: decodeTextStyle(value['headline1']),
        headline2: decodeTextStyle(value['headline2']),
        headline3: decodeTextStyle(value['headline3']),
        headline4: decodeTextStyle(value['headline4']),
        headline5: decodeTextStyle(value['headline5']),
        headline6: decodeTextStyle(value['headline6']),
        overline: decodeTextStyle(value['overline']),
        subtitle1: decodeTextStyle(value['subtitle1']),
        subtitle2: decodeTextStyle(value['subtitle2']),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [TextWidthBasis].  Supported values are:
  ///  * `longestLine`
  ///  * `parent`
  static TextWidthBasis decodeTextWidthBasis(String value) {
    _checkSupported(
      'TextWidthBasis',
      [
        'longestLine',
        'parent',
      ],
      value,
    );
    TextWidthBasis result;

    if (value != null) {
      switch (value) {
        case 'longestLine':
          result = TextWidthBasis.longestLine;
          break;
        case 'parent':
          result = TextWidthBasis.parent;
          break;
      }
    }

    return result;
  }

  static ThemeData decodeThemeData(dynamic value) {
    ThemeData result;

    if (value != null) {
      result = ThemeData(
        accentColor: decodeColor(value['accentColor']),
        accentColorBrightness: decodeBrightness(value['accentColorBrightness']),
        accentIconTheme: decodeIconThemeData(value['accentIconTheme']),
        accentTextTheme: decodeTextTheme(value['accentTextTheme']),
        appBarTheme: decodeAppBarTheme(value['appBarTheme']),
        applyElevationOverlayColor: value['applyElevationOverlayColor'] == null
            ? null
            : JsonClass.parseBool(value['applyElevationOverlayColor']),
        bannerTheme: decodeMaterialBannerThemeData(value['bannerTheme']),
        backgroundColor: decodeColor(value['backgroundColor']),
        bottomAppBarColor: decodeColor(value['bottomAppBarColor']),
        bottomAppBarTheme: decodeBottomAppBarTheme(value['bottomAppBarTheme']),
        // bottomNavigationBarTheme: decodeBottomNavigationBarThemeData(
        //   value['bottomNavigationBarTheme'],
        // ),
        brightness: decodeBrightness(value['brightness']),
        bottomSheetTheme: decodeBottomSheetThemeData(value['bottomSheetTheme']),
        buttonColor: decodeColor(value['buttonColor']),
        buttonBarTheme: decodeButtonBarThemeData(value['buttonBarTheme']),
        buttonTheme: decodeButtonThemeData(value['buttonTheme']),
        canvasColor: decodeColor(value['canvasColor']),
        cardColor: decodeColor(value['cardColor']),
        cardTheme: decodeCardTheme(value['cardTheme']),
        chipTheme: decodeChipThemeData(value['chipTheme']),
        colorScheme: decodeColorScheme(value['colorScheme']),
        cupertinoOverrideTheme: decodeCupertinoThemeData(
          value['cupertinoOverrideTheme'],
        ),
        cursorColor: decodeColor(value['cursorColor']),
        dialogBackgroundColor: decodeColor(value['dialogBackgroundColor']),
        dialogTheme: decodeDialogTheme(value['dialogTheme']),
        disabledColor: decodeColor(value['disabledColor']),
        dividerColor: decodeColor(value['dividerColor']),
        dividerTheme: decodeDividerThemeData(value['dividerTheme']),
        errorColor: decodeColor(value['errorColor']),
        // fixTextFieldOutlineLabel: value['fixTextFieldOutlineLabel'] == null
        //     ? null
        //     : JsonClass.parseBool(value['fixTextFieldOutlineLabel']),
        floatingActionButtonTheme: decodeFloatingActionButtonThemeData(
          value['floatingActionButtonTheme'],
        ),
        focusColor: decodeColor(value['focusColor']),
        fontFamily: value['fontFamily'],
        highlightColor: decodeColor(value['highlightColor']),
        hintColor: decodeColor(value['hintColor']),
        hoverColor: decodeColor(value['hoverColor']),
        iconTheme: decodeIconThemeData(value['iconTheme']),
        indicatorColor: decodeColor(value['indicatorColor']),
        inputDecorationTheme: decodeInputDecorationTheme(
          value['inputDecorationTheme'],
        ),
        materialTapTargetSize: decodeMaterialTapTargetSize(
          value['materialTapTargetSize'],
        ),
        navigationRailTheme: decodeNavigationRailThemeData(
          value['navigationRailTheme'],
        ),
        platform: decodeTargetPlatform(value['platform']),
        popupMenuTheme: decodePopupMenuThemeData(value['popupMenuTheme']),
        primaryColor: decodeColor(value['primaryColor']),
        primaryColorBrightness:
            decodeBrightness(value['primaryColorBrightness']),
        primaryColorDark: decodeColor(value['primaryColorDark']),
        primaryColorLight: decodeColor(value['primaryColorLight']),
        primaryIconTheme: decodeIconThemeData(value['primaryIconTheme']),
        primarySwatch: decodeMaterialColor(value['primarySwatch']),
        primaryTextTheme: decodeTextTheme(value['primaryTextTheme']),
        scaffoldBackgroundColor: decodeColor(value['scaffoldBackgroundColor']),
        secondaryHeaderColor: decodeColor(value['secondaryHeaderColor']),
        selectedRowColor: decodeColor(value['selectedRowColor']),
        sliderTheme: decodeSliderThemeData(value['sliderTheme']),
        snackBarTheme: decodeSnackBarThemeData(value['snackBarTheme']),
        splashColor: decodeColor(value['splashColor']),
        splashFactory:
            decodeInteractiveInkFeatureFactory(value['splashFactory']),
        tabBarTheme: decodeTabBarTheme(value['tabBarTheme']),
        textSelectionColor: decodeColor(value['textSelectionColor']),
        textSelectionHandleColor:
            decodeColor(value['textSelectionHandleColor']),
        textTheme: decodeTextTheme(value['textTheme']),
        toggleButtonsTheme: decodeToggleButtonsThemeData(
          value['toggleButtonsTheme'],
        ),
        toggleableActiveColor: decodeColor(value['toggleableActiveColor']),
        tooltipTheme: decodeTooltipThemeData(value['tooltipTheme']),
        typography: decodeTypography(value['typography']),
        unselectedWidgetColor: decodeColor(value['unselectedWidgetColor']),
        visualDensity: decodeVisualDensity(value['visualDensity']),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [TileMode].  Supported values are:
  ///  * `clamp`
  ///  * `mirror`
  ///  * `repeated`
  static TileMode decodeTileMode(String value) {
    _checkSupported(
      'TileMode',
      [
        'clamp',
        'mirror',
        'repeated',
      ],
      value,
    );
    TileMode result;

    if (value != null) {
      switch (value) {
        case 'clamp':
          result = TileMode.clamp;
          break;

        case 'mirror':
          result = TileMode.mirror;
          break;

        case 'repeated':
          result = TileMode.repeated;
          break;
      }
    }

    return result;
  }

  static ToggleButtonsThemeData decodeToggleButtonsThemeData(dynamic value) {
    ToggleButtonsThemeData result;

    if (value != null) {
      result = ToggleButtonsThemeData(
        borderColor: decodeColor(value['borderColor']),
        borderRadius: decodeBorderRadius(value['borderRadius']),
        borderWidth: JsonClass.parseDouble(value['borderWidth']),
        color: decodeColor(value['color']),
        constraints: decodeBoxConstraints(value['constraints']),
        disabledBorderColor: decodeColor(value['disabledBorderColor']),
        disabledColor: decodeColor(value['disabledColor']),
        fillColor: decodeColor(value['fillColor']),
        focusColor: decodeColor(value['focusColor']),
        highlightColor: decodeColor(value['highlightColor']),
        hoverColor: decodeColor(value['hoverColor']),
        selectedBorderColor: decodeColor(value['selectedBorderColor']),
        selectedColor: decodeColor(value['selectedColor']),
        splashColor: decodeColor(value['splashColor']),
        textStyle: decodeTextStyle(value['textStyle']),
      );
    }

    return result;
  }

  static TooltipThemeData decodeTooltipThemeData(dynamic value) {
    TooltipThemeData result;

    if (value != null) {
      assert(
        value['decoration'] == null,
        'TooltipThemeData.decoration is not supported',
      );
      result = TooltipThemeData(
        excludeFromSemantics: value['excludeFromSemantics'] == null
            ? null
            : JsonClass.parseBool(value['excludeFromSemantics']),
        height: JsonClass.parseDouble(value['height']),
        margin: decodeEdgeInsetsGeometry(value['margin']),
        padding: decodeEdgeInsetsGeometry(value['padding']),
        preferBelow: value['preferBelow'] == null
            ? null
            : JsonClass.parseBool(value['preferBelow']),
        showDuration: JsonClass.parseDurationFromMillis(value['showDuration']),
        textStyle: decodeTextStyle(value['textStyle']),
        verticalOffset: JsonClass.parseDouble(value['verticalOffset']),
        waitDuration: JsonClass.parseDurationFromMillis(value['waitDuration']),
      );
    }

    return result;
  }

  static Typography decodeTypography(dynamic value) {
    Typography result;

    if (value != null) {
      result = Typography.material2018(
        black: decodeTextTheme(value['black']),
        dense: decodeTextTheme(value['dense']),
        englishLike: decodeTextTheme(value['englishLike']),
        platform: decodeTargetPlatform(value['platform']),
        tall: decodeTextTheme(value['tall']),
        white: decodeTextTheme(value['white']),
      );
    }

    return result;
  }

  /// Decodes the [value] to a [VerticalDirection].  Supported values are:
  ///  * `down`
  ///  * `up`
  static VerticalDirection decodeVerticalDirection(String value) {
    _checkSupported(
      'VerticalDirection',
      [
        'down',
        'up',
      ],
      value,
    );
    VerticalDirection result;

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

    return result;
  }

  /// Decodes the [value] to a [VisualDensity].  Supported values are:
  ///  * `adaptivePlatformDensity`
  ///  * `comfortable`
  ///  * `compact`
  ///  * `standard`
  static VisualDensity decodeVisualDensity(String value) {
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
    VisualDensity result;

    if (value != null) {
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

  static List<T> _decodeDynamicList<T>(
    Iterable<dynamic> list,
    T Function(dynamic value) decoder,
  ) {
    List<T> result;

    if (list != null) {
      result = [];
      for (var value in list) {
        result.add(decoder(value));
      }
    }

    return result;
  }

  static List<T> _decodeStringList<T>(
    Iterable<dynamic> list,
    T Function(String value) decoder,
  ) {
    List<T> result;

    if (list != null) {
      result = [];
      for (var value in list) {
        result.add(decoder(value));
      }
    }

    return result;
  }
}
