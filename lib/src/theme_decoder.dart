import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:json_class/json_class.dart';

@immutable
class ThemeDecoder {
  ThemeDecoder._();

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

  static BorderRadius decodeBorderRadius(dynamic value) {
    assert(value == null || value['type'] != null);
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

  static BorderStyle decodeBorderStyle(dynamic value) {
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

  static BottomNavigationBarType decodeBottomNavigationBarType(dynamic value) {
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

  static Brightness decodeBrightness(dynamic value) {
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

  static ButtonBarLayoutBehavior decodeButtonLayoutBehavior(dynamic value) {
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

  static ButtonTextTheme decodeButtonTextTheme(dynamic value) {
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

  static Clip decodeClip(dynamic value) {
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

  static Color decodeColor(dynamic value) {
    assert(value == null || value is String);
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

  static CrossAxisAlignment decodeCrossAxisAlignment(dynamic value) {
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

  static FloatingLabelBehavior decodeFloatingLabelBehavior(dynamic value) {
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

  static FontWeight decodeFontWeight(dynamic value) {
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

  static FontStyle decodeFontStyle(dynamic value) {
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

  static InteractiveInkFeatureFactory decodeInteractiveInkFeatureFactory(
    dynamic value,
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

  static MainAxisAlignment decodeMainAxisAlignment(dynamic value) {
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

  static MainAxisSize decodeMainAxisSize(dynamic value) {
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

  static MaterialTapTargetSize decodeMaterialTapTargetSize(dynamic value) {
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

  static NavigationRailLabelType decodeNavigationRailLabelType(dynamic value) {
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

  static NotchedShape decodeNotchedShape(dynamic value) {
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
    assert(value == null || value['type'] != null);
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
    assert(value == null || value['type'] != null);
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
    assert(value == null || value['type'] != null);
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

  static RangeSliderTrackShape decodeRangeSliderTrackShape(dynamic value) {
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

  static RangeSliderValueIndicatorShape decodeRangeSliderValueIndicatorShape(
    dynamic value,
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
    assert(value == null || value['type'] != null);
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

  static ShowValueIndicator decodeShowValueIndicator(dynamic value) {
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

  static SliderComponentShape decodeSliderComponentShape(dynamic value) {
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
    assert(value == null || value['type'] != null);
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

  static SnackBarBehavior decodeSnackBarBehavior(dynamic value) {
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

  static TabBarIndicatorSize decodeTabBarIndicatorSize(dynamic value) {
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

  static TargetPlatform decodeTargetPlatform(dynamic value) {
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

  static TextBaseline decodeTextBaseline(dynamic value) {
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

  static TextDecoration decodeTextDecoration(dynamic value) {
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

  static TextDecorationStyle decodeTextDecorationStyle(dynamic value) {
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

  static VerticalDirection decodeVerticalDirection(dynamic value) {
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

  static VisualDensity decodeVisualDensity(dynamic value) {
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
}
