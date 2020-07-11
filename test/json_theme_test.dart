import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_class/json_class.dart';
import 'package:json_theme/json_theme.dart';

const _kColor = Color(0x00123456);
const _kColorStr = '#00123456';
const _kTextStyle = TextStyle(color: _kColor);
const _kTextStyleJson = {
  'color': _kColorStr,
  'inherit': true,
};

void main() {
  test('Alignment', () {
    expect(ThemeDecoder.decodeAlignment(null), null);
    expect(ThemeEncoder.encodeAlignment(null), null);

    expect(
      ThemeDecoder.decodeAlignment('bottomCenter'),
      Alignment.bottomCenter,
    );
    expect(
      ThemeDecoder.decodeAlignment('bottomLeft'),
      Alignment.bottomLeft,
    );
    expect(
      ThemeDecoder.decodeAlignment('bottomRight'),
      Alignment.bottomRight,
    );

    expect(
      ThemeDecoder.decodeAlignment('center'),
      Alignment.center,
    );
    expect(
      ThemeDecoder.decodeAlignment('centerLeft'),
      Alignment.centerLeft,
    );
    expect(
      ThemeDecoder.decodeAlignment('centerRight'),
      Alignment.centerRight,
    );

    expect(
      ThemeDecoder.decodeAlignment('topCenter'),
      Alignment.topCenter,
    );
    expect(
      ThemeDecoder.decodeAlignment('topLeft'),
      Alignment.topLeft,
    );
    expect(
      ThemeDecoder.decodeAlignment('topRight'),
      Alignment.topRight,
    );

    expect(
      ThemeEncoder.encodeAlignment(Alignment.bottomCenter),
      'bottomCenter',
    );
    expect(
      ThemeEncoder.encodeAlignment(Alignment.bottomLeft),
      'bottomLeft',
    );
    expect(
      ThemeEncoder.encodeAlignment(Alignment.bottomRight),
      'bottomRight',
    );

    expect(
      ThemeEncoder.encodeAlignment(Alignment.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeAlignment(Alignment.centerLeft),
      'centerLeft',
    );
    expect(
      ThemeEncoder.encodeAlignment(Alignment.centerRight),
      'centerRight',
    );

    expect(
      ThemeEncoder.encodeAlignment(Alignment.topCenter),
      'topCenter',
    );
    expect(
      ThemeEncoder.encodeAlignment(Alignment.topLeft),
      'topLeft',
    );
    expect(
      ThemeEncoder.encodeAlignment(Alignment.topRight),
      'topRight',
    );
  });

  test('AppBarTheme', () {
    expect(ThemeDecoder.decodeAppBarTheme(null), null);
    expect(ThemeEncoder.encodeAppBarTheme(null), null);

    var entry = AppBarTheme(
      brightness: Brightness.dark,
      color: _kColor,
      elevation: 6.0,
    );

    var encoded = ThemeEncoder.encodeAppBarTheme(entry);
    var decoded = ThemeDecoder.decodeAppBarTheme(encoded);

    expect(
      json.encode(encoded),
      json.encode(
        {
          'brightness': 'dark',
          'color': _kColorStr,
          'elevation': 6.0,
        },
      ),
    );

    expect(
      decoded,
      entry,
    );
  });

  test('Axis', () {
    expect(ThemeDecoder.decodeAxis(null), null);
    expect(ThemeEncoder.encodeAxis(null), null);

    expect(ThemeDecoder.decodeAxis('horizontal'), Axis.horizontal);
    expect(ThemeDecoder.decodeAxis('vertical'), Axis.vertical);

    expect(ThemeEncoder.encodeAxis(Axis.horizontal), 'horizontal');
    expect(ThemeEncoder.encodeAxis(Axis.vertical), 'vertical');
  });

  test('BlendMode', () {
    expect(ThemeDecoder.decodeBlendMode(null), null);
    expect(ThemeEncoder.encodeBlendMode(null), null);

    expect(ThemeDecoder.decodeBlendMode('clear'), BlendMode.clear);
    expect(ThemeDecoder.decodeBlendMode('color'), BlendMode.color);
    expect(ThemeDecoder.decodeBlendMode('colorBurn'), BlendMode.colorBurn);
    expect(ThemeDecoder.decodeBlendMode('colorDodge'), BlendMode.colorDodge);
    expect(ThemeDecoder.decodeBlendMode('darken'), BlendMode.darken);
    expect(ThemeDecoder.decodeBlendMode('difference'), BlendMode.difference);
    expect(ThemeDecoder.decodeBlendMode('dst'), BlendMode.dst);
    expect(ThemeDecoder.decodeBlendMode('dstATop'), BlendMode.dstATop);
    expect(ThemeDecoder.decodeBlendMode('dstIn'), BlendMode.dstIn);
    expect(ThemeDecoder.decodeBlendMode('dstOut'), BlendMode.dstOut);
    expect(ThemeDecoder.decodeBlendMode('dstOver'), BlendMode.dstOver);
    expect(ThemeDecoder.decodeBlendMode('exclusion'), BlendMode.exclusion);
    expect(ThemeDecoder.decodeBlendMode('hardLight'), BlendMode.hardLight);
    expect(ThemeDecoder.decodeBlendMode('hue'), BlendMode.hue);
    expect(ThemeDecoder.decodeBlendMode('lighten'), BlendMode.lighten);
    expect(ThemeDecoder.decodeBlendMode('luminosity'), BlendMode.luminosity);
    expect(ThemeDecoder.decodeBlendMode('modulate'), BlendMode.modulate);
    expect(ThemeDecoder.decodeBlendMode('multiply'), BlendMode.multiply);
    expect(ThemeDecoder.decodeBlendMode('overlay'), BlendMode.overlay);
    expect(ThemeDecoder.decodeBlendMode('plus'), BlendMode.plus);
    expect(ThemeDecoder.decodeBlendMode('saturation'), BlendMode.saturation);
    expect(ThemeDecoder.decodeBlendMode('screen'), BlendMode.screen);
    expect(ThemeDecoder.decodeBlendMode('softLight'), BlendMode.softLight);
    expect(ThemeDecoder.decodeBlendMode('src'), BlendMode.src);
    expect(ThemeDecoder.decodeBlendMode('srcATop'), BlendMode.srcATop);
    expect(ThemeDecoder.decodeBlendMode('srcIn'), BlendMode.srcIn);
    expect(ThemeDecoder.decodeBlendMode('srcOut'), BlendMode.srcOut);
    expect(ThemeDecoder.decodeBlendMode('srcOver'), BlendMode.srcOver);
    expect(ThemeDecoder.decodeBlendMode('xor'), BlendMode.xor);

    expect(ThemeEncoder.encodeBlendMode(BlendMode.clear), 'clear');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.color), 'color');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.colorBurn), 'colorBurn');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.colorDodge), 'colorDodge');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.darken), 'darken');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.difference), 'difference');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.dst), 'dst');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.dstATop), 'dstATop');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.dstIn), 'dstIn');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.dstOut), 'dstOut');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.dstOver), 'dstOver');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.exclusion), 'exclusion');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.hardLight), 'hardLight');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.hue), 'hue');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.lighten), 'lighten');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.luminosity), 'luminosity');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.modulate), 'modulate');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.multiply), 'multiply');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.overlay), 'overlay');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.plus), 'plus');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.saturation), 'saturation');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.screen), 'screen');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.softLight), 'softLight');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.src), 'src');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.srcATop), 'srcATop');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.srcIn), 'srcIn');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.srcOut), 'srcOut');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.srcOver), 'srcOver');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.xor), 'xor');
  });

  test('BorderRadius', () {
    expect(ThemeDecoder.decodeBorderRadius(null), null);
    expect(ThemeEncoder.encodeBorderRadius(null), null);

    var entry = BorderRadius.circular(16.0);

    var encoded = ThemeEncoder.encodeBorderRadius(entry);
    var decoded = ThemeDecoder.decodeBorderRadius(encoded);

    const corner = {
      'type': 'elliptical',
      'x': 16.0,
      'y': 16.0,
    };

    expect(
      encoded,
      {
        'bottomLeft': corner,
        'bottomRight': corner,
        'topLeft': corner,
        'topRight': corner,
        'type': 'only',
      },
    );

    expect(
      entry,
      decoded,
    );

    expect(ThemeDecoder.decodeBorderRadius(16), BorderRadius.circular(16));
  });

  test('BorderSide', () {
    expect(ThemeDecoder.decodeBorderSide(null), null);
    expect(ThemeEncoder.encodeBorderSide(null), null);

    var entry = BorderSide(
      color: _kColor,
      style: BorderStyle.solid,
      width: 5.0,
    );

    var encoded = ThemeEncoder.encodeBorderSide(entry);
    var decoded = ThemeDecoder.decodeBorderSide(encoded);

    expect(
      encoded,
      {
        'color': _kColorStr,
        'style': 'solid',
        'width': 5.0,
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('BorderStyle', () {
    expect(ThemeDecoder.decodeBorderStyle(null), null);
    expect(ThemeEncoder.encodeBorderStyle(null), null);

    expect(ThemeDecoder.decodeBorderStyle('none'), BorderStyle.none);
    expect(ThemeDecoder.decodeBorderStyle('solid'), BorderStyle.solid);

    expect(ThemeEncoder.encodeBorderStyle(BorderStyle.none), 'none');
    expect(ThemeEncoder.encodeBorderStyle(BorderStyle.solid), 'solid');
  });

  test('BottomAppBarTheme', () {
    expect(ThemeDecoder.decodeBottomAppBarTheme(null), null);
    expect(ThemeEncoder.encodeBottomAppBarTheme(null), null);

    var entry = BottomAppBarTheme(
      color: _kColor,
      elevation: 8.0,
      shape: CircularNotchedRectangle(),
    );

    var encoded = ThemeEncoder.encodeBottomAppBarTheme(entry);
    var decoded = ThemeDecoder.decodeBottomAppBarTheme(encoded);

    expect(encoded, {
      'color': _kColorStr,
      'elevation': 8.0,
      'shape': 'circular',
    });

    expect(
      decoded.color,
      entry.color,
    );

    expect(
      decoded.elevation,
      entry.elevation,
    );

    expect(
      decoded.shape?.runtimeType,
      entry.shape?.runtimeType,
    );
  });

  test('BottomNavigationBarType', () {
    expect(ThemeDecoder.decodeBottomNavigationBarType(null), null);
    expect(ThemeEncoder.encodeBottomNavigationBarType(null), null);

    expect(
      ThemeDecoder.decodeBottomNavigationBarType('fixed'),
      BottomNavigationBarType.fixed,
    );
    expect(
      ThemeDecoder.decodeBottomNavigationBarType('shifting'),
      BottomNavigationBarType.shifting,
    );

    expect(
      ThemeEncoder.encodeBottomNavigationBarType(
        BottomNavigationBarType.fixed,
      ),
      'fixed',
    );
    expect(
      ThemeEncoder.encodeBottomNavigationBarType(
        BottomNavigationBarType.shifting,
      ),
      'shifting',
    );
  });

  test('BottomSheetThemeData', () {
    expect(ThemeDecoder.decodeBottomSheetThemeData(null), null);
    expect(ThemeEncoder.encodeBottomSheetThemeData(null), null);

    var entry = BottomSheetThemeData(
      backgroundColor: Color(0xff111111),
      clipBehavior: Clip.antiAlias,
      elevation: 12.0,
      modalBackgroundColor: Color(0xff222222),
      modalElevation: 18.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
    );

    var encoded = ThemeEncoder.encodeBottomSheetThemeData(entry);
    var decoded = ThemeDecoder.decodeBottomSheetThemeData(encoded);

    expect(
      encoded,
      {
        'backgroundColor': '#ff111111',
        'clipBehavior': 'antiAlias',
        'elevation': 12.0,
        'modalBackgroundColor': '#ff222222',
        'modalElevation': 18.0,
        'shape': {
          'borderRadius': {
            'bottomLeft': {'type': 'elliptical', 'x': 16.0, 'y': 16.0},
            'bottomRight': {'type': 'elliptical', 'x': 16.0, 'y': 16.0},
            'topLeft': {'type': 'elliptical', 'x': 16.0, 'y': 16.0},
            'topRight': {'type': 'elliptical', 'x': 16.0, 'y': 16.0},
            'type': 'only'
          },
          'side': {'color': '#ff000000', 'style': 'none', 'width': 0.0},
          'type': 'rounded'
        }
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('BoxBorder', () {
    expect(ThemeDecoder.decodeBoxBorder(null), null);
    expect(ThemeEncoder.encodeBoxBorder(null), null);

    var entry = Border(
      bottom: BorderSide(color: Color(0xff111111)),
      left: BorderSide(color: Color(0xff222222)),
      right: BorderSide(color: Color(0xff333333)),
      top: BorderSide(color: Color(0xff444444)),
    );

    var encoded = ThemeEncoder.encodeBoxBorder(entry);
    var decoded = ThemeDecoder.decodeBoxBorder(encoded);

    expect(encoded, {
      'bottom': {
        'color': '#ff111111',
        'style': 'solid',
        'width': 1.0,
      },
      'left': {
        'color': '#ff222222',
        'style': 'solid',
        'width': 1.0,
      },
      'right': {
        'color': '#ff333333',
        'style': 'solid',
        'width': 1.0,
      },
      'top': {
        'color': '#ff444444',
        'style': 'solid',
        'width': 1.0,
      },
    });

    expect(
      decoded,
      entry,
    );

    expect(
      ThemeDecoder.decodeBoxBorder({
        'color': '#000',
        'style': 'solid',
        'width': 1,
      }),
      Border.all(
        color: Color(0xff000000),
        style: BorderStyle.solid,
        width: 1.0,
      ),
    );
  });

  test('BoxConstraints', () {
    expect(ThemeDecoder.decodeBoxConstraints(null), null);
    expect(ThemeEncoder.encodeBoxConstraints(null), null);

    var entry = BoxConstraints(
      maxHeight: 1000.0,
      maxWidth: 1001.0,
      minHeight: 100.0,
      minWidth: 101.0,
    );

    var encoded = ThemeEncoder.encodeBoxConstraints(entry);
    var decoded = ThemeDecoder.decodeBoxConstraints(encoded);

    expect(
      encoded,
      {
        'maxHeight': 1000.0,
        'maxWidth': 1001.0,
        'minHeight': 100.0,
        'minWidth': 101.0,
      },
    );

    expect(
      ThemeEncoder.encodeBoxConstraints(BoxConstraints()),
      {
        'minHeight': 0.0,
        'minWidth': 0.0,
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('BoxDecoration', () {
    expect(ThemeDecoder.decodeBoxDecoration(null), null);
    expect(ThemeEncoder.encodeBoxDecoration(null), null);

    var entry = BoxDecoration(
      backgroundBlendMode: BlendMode.colorBurn,
      border: Border.all(color: _kColor),
      borderRadius: BorderRadius.circular(1.0),
      boxShadow: [
        BoxShadow(
          color: Color(0xff111111),
        ),
        BoxShadow(
          color: Color(0xff222222),
        )
      ],
      color: Color(0xff333333),
      gradient: RadialGradient(
        colors: [
          Color(0xff444444),
          Color(0xff555555),
        ],
      ),
      shape: BoxShape.circle,
    );

    var encoded = ThemeEncoder.encodeBoxDecoration(entry);
    var decoded = ThemeDecoder.decodeBoxDecoration(encoded);

    expect(
      encoded,
      {
        'backgroundBlendMode': 'colorBurn',
        'border': {
          'bottom': {
            'color': _kColorStr,
            'style': 'solid',
            'width': 1.0,
          },
          'left': {
            'color': _kColorStr,
            'style': 'solid',
            'width': 1.0,
          },
          'right': {
            'color': _kColorStr,
            'style': 'solid',
            'width': 1.0,
          },
          'top': {
            'color': _kColorStr,
            'style': 'solid',
            'width': 1.0,
          },
        },
        'borderRadius': {
          'bottomLeft': {
            'type': 'elliptical',
            'x': 1.0,
            'y': 1.0,
          },
          'bottomRight': {
            'type': 'elliptical',
            'x': 1.0,
            'y': 1.0,
          },
          'topLeft': {
            'type': 'elliptical',
            'x': 1.0,
            'y': 1.0,
          },
          'topRight': {
            'type': 'elliptical',
            'x': 1.0,
            'y': 1.0,
          },
          'type': 'only',
        },
        'boxShadow': [
          {
            'blurRadius': 0.0,
            'color': '#ff111111',
            'offset': {
              'dx': 0.0,
              'dy': 0.0,
            },
            'spreadRadius': 0.0,
          },
          {
            'blurRadius': 0.0,
            'color': '#ff222222',
            'offset': {
              'dx': 0.0,
              'dy': 0.0,
            },
            'spreadRadius': 0.0,
          }
        ],
        'color': '#ff333333',
        'gradient': {
          'center': 'center',
          'colors': [
            '#ff444444',
            '#ff555555',
          ],
          'focal': null,
          'focalRadius': 0.0,
          'radius': 0.5,
          'stops': null,
          'tileMode': 'clamp',
          'transform': null,
          'type': 'radial'
        },
        'shape': 'circle',
      },
    );

    expect(
      ThemeEncoder.encodeBoxDecoration(decoded),
      encoded,
    );
  });

  test('BoxFit', () {
    expect(ThemeDecoder.decodeBoxFit(null), null);
    expect(ThemeEncoder.encodeBoxFit(null), null);

    expect(ThemeDecoder.decodeBoxFit('contain'), BoxFit.contain);
    expect(ThemeDecoder.decodeBoxFit('cover'), BoxFit.cover);
    expect(ThemeDecoder.decodeBoxFit('fill'), BoxFit.fill);
    expect(ThemeDecoder.decodeBoxFit('fitHeight'), BoxFit.fitHeight);
    expect(ThemeDecoder.decodeBoxFit('fitWidth'), BoxFit.fitWidth);
    expect(ThemeDecoder.decodeBoxFit('none'), BoxFit.none);
    expect(ThemeDecoder.decodeBoxFit('scaleDown'), BoxFit.scaleDown);

    expect(ThemeEncoder.encodeBoxFit(BoxFit.contain), 'contain');
    expect(ThemeEncoder.encodeBoxFit(BoxFit.cover), 'cover');
    expect(ThemeEncoder.encodeBoxFit(BoxFit.fill), 'fill');
    expect(ThemeEncoder.encodeBoxFit(BoxFit.fitHeight), 'fitHeight');
    expect(ThemeEncoder.encodeBoxFit(BoxFit.fitWidth), 'fitWidth');
    expect(ThemeEncoder.encodeBoxFit(BoxFit.none), 'none');
    expect(ThemeEncoder.encodeBoxFit(BoxFit.scaleDown), 'scaleDown');
  });

  test('BoxShadow', () {
    expect(ThemeDecoder.decodeBoxShadow(null), null);
    expect(ThemeEncoder.encodeBoxShadow(null), null);

    var entry = BoxShadow(
      blurRadius: 1.0,
      color: _kColor,
      offset: Offset(2.0, 3.0),
      spreadRadius: 4.0,
    );

    var encoded = ThemeEncoder.encodeBoxShadow(entry);
    var decoded = ThemeDecoder.decodeBoxShadow(encoded);

    expect(
      encoded,
      {
        'blurRadius': entry.blurRadius,
        'color': _kColorStr,
        'offset': {
          'dx': 2.0,
          'dy': 3.0,
        },
        'spreadRadius': entry.spreadRadius,
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('BoxShape', () {
    expect(ThemeDecoder.decodeBoxShape(null), null);
    expect(ThemeEncoder.encodeBoxShape(null), null);

    expect(ThemeDecoder.decodeBoxShape('circle'), BoxShape.circle);
    expect(ThemeDecoder.decodeBoxShape('rectangle'), BoxShape.rectangle);

    expect(ThemeEncoder.encodeBoxShape(BoxShape.circle), 'circle');
    expect(ThemeEncoder.encodeBoxShape(BoxShape.rectangle), 'rectangle');
  });

  test('Brightness', () {
    expect(ThemeDecoder.decodeBrightness(null), null);
    expect(ThemeEncoder.encodeBrightness(null), null);

    expect(ThemeEncoder.encodeBrightness(Brightness.dark), 'dark');
    expect(ThemeEncoder.encodeBrightness(Brightness.light), 'light');

    expect(ThemeDecoder.decodeBrightness('dark'), Brightness.dark);
    expect(ThemeDecoder.decodeBrightness('light'), Brightness.light);
  });

  test('ButtonBarThemeData', () {
    expect(ThemeDecoder.decodeButtonBarThemeData(null), null);
    expect(ThemeEncoder.encodeButtonBarThemeData(null), null);

    var entry = ButtonBarThemeData(
      alignment: MainAxisAlignment.spaceEvenly,
      buttonAlignedDropdown: true,
      buttonHeight: 16.0,
      buttonMinWidth: 17.0,
      buttonPadding: EdgeInsets.all(18.0),
      buttonTextTheme: ButtonTextTheme.accent,
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      mainAxisSize: MainAxisSize.min,
      overflowDirection: VerticalDirection.down,
    );

    var encoded = ThemeEncoder.encodeButtonBarThemeData(entry);
    var decoded = ThemeDecoder.decodeButtonBarThemeData(encoded);

    expect(
      encoded,
      {
        'alignment': 'spaceEvenly',
        'buttonAlignedDropdown': true,
        'buttonHeight': 16.0,
        'buttonMinWidth': 17.0,
        'buttonPadding': {
          'bottom': 18.0,
          'left': 18.0,
          'right': 18.0,
          'top': 18.0,
        },
        'buttonTextTheme': 'accent',
        'layoutBehavior': 'padded',
        'mainAxisSize': 'min',
        'overflowDirection': 'down',
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('ButtonBarLayoutBehavior', () {
    expect(ThemeDecoder.decodeButtonBarLayoutBehavior(null), null);
    expect(ThemeEncoder.encodeButtonBarLayoutBehavior(null), null);

    expect(
      ThemeDecoder.decodeButtonBarLayoutBehavior('constrained'),
      ButtonBarLayoutBehavior.constrained,
    );
    expect(
      ThemeDecoder.decodeButtonBarLayoutBehavior('padded'),
      ButtonBarLayoutBehavior.padded,
    );

    expect(
      ThemeEncoder.encodeButtonBarLayoutBehavior(
        ButtonBarLayoutBehavior.constrained,
      ),
      'constrained',
    );
    expect(
      ThemeEncoder.encodeButtonBarLayoutBehavior(
          ButtonBarLayoutBehavior.padded),
      'padded',
    );
  });

  test('ButtonTextTheme', () {
    expect(ThemeDecoder.decodeButtonTextTheme(null), null);
    expect(ThemeEncoder.encodeButtonTextTheme(null), null);

    expect(
      ThemeDecoder.decodeButtonTextTheme('accent'),
      ButtonTextTheme.accent,
    );
    expect(
      ThemeDecoder.decodeButtonTextTheme('normal'),
      ButtonTextTheme.normal,
    );
    expect(
      ThemeDecoder.decodeButtonTextTheme('primary'),
      ButtonTextTheme.primary,
    );

    expect(
      ThemeEncoder.encodeButtonTextTheme(ButtonTextTheme.accent),
      'accent',
    );
    expect(
      ThemeEncoder.encodeButtonTextTheme(ButtonTextTheme.normal),
      'normal',
    );
    expect(
      ThemeEncoder.encodeButtonTextTheme(ButtonTextTheme.primary),
      'primary',
    );
  });

  test('ButtonThemeData', () {
    expect(ThemeDecoder.decodeButtonThemeData(null), null);
    expect(ThemeEncoder.encodeButtonThemeData(null), null);

    var entry = ButtonThemeData(
      alignedDropdown: true,
      buttonColor: Color(0xff111111),
      colorScheme: ColorScheme.dark(),
      disabledColor: Color(0xff222222),
      focusColor: Color(0xff333333),
      height: 16.0,
      highlightColor: Color(0xff444444),
      hoverColor: Color(0xff555555),
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      minWidth: 10.0,
      padding: EdgeInsets.all(18.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: Color(0xff666666),
          width: 2.0,
          style: BorderStyle.solid,
        ),
      ),
      splashColor: Color(0xff777777),
      textTheme: ButtonTextTheme.accent,
    );

    var encoded = ThemeEncoder.encodeButtonThemeData(entry);
    var decoded = ThemeDecoder.decodeButtonThemeData({
      'alignedDropdown': true,
      'buttonColor': '#ff111111',
      'colorScheme': {
        'background': '#ff121212',
        'brightness': 'dark',
        'error': '#ffcf6679',
        'onBackground': '#ffffffff',
        'onError': '#ff000000',
        'onPrimary': '#ff000000',
        'onSecondary': '#ff000000',
        'onSurface': '#ffffffff',
        'primary': '#ffbb86fc',
        'primaryVariant': '#ff3700b3',
        'secondary': '#ff03dac6',
        'secondaryVariant': '#ff03dac6',
        'surface': '#ff121212'
      },
      'disabledColor': '#ff222222',
      'focusColor': '#ff333333',
      'height': 16.0,
      'highlightColor': '#ff444444',
      'hoverColor': '#ff555555',
      'layoutBehavior': 'padded',
      'materialTapTargetSize': 'padded',
      'minWidth': 10.0,
      'padding': {
        'bottom': 18.0,
        'left': 18.0,
        'right': 18.0,
        'top': 18.0,
      },
      'shape': {
        'borderRadius': {
          'radius': 20.0,
          'type': 'circular',
        },
        'side': {
          'color': '#ff666666',
          'width': 2.0,
          'style': 'solid',
        },
        'type': 'rounded',
      },
      'splashColor': '#ff777777',
      'textTheme': 'accent',
    });

    expect(
      encoded,
      {
        'alignedDropdown': true,
        'colorScheme': {
          'background': '#ff121212',
          'brightness': 'dark',
          'error': '#ffcf6679',
          'onBackground': '#ffffffff',
          'onError': '#ff000000',
          'onPrimary': '#ff000000',
          'onSecondary': '#ff000000',
          'onSurface': '#ffffffff',
          'primary': '#ffbb86fc',
          'primaryVariant': '#ff3700b3',
          'secondary': '#ff03dac6',
          'secondaryVariant': '#ff03dac6',
          'surface': '#ff121212'
        },
        'height': 16.0,
        'layoutBehavior': 'padded',
        'minWidth': 10.0,
        'padding': {
          'bottom': 18.0,
          'left': 18.0,
          'right': 18.0,
          'top': 18.0,
        },
        'shape': {
          'borderRadius': {
            'bottomLeft': {
              'type': 'elliptical',
              'x': 20.0,
              'y': 20.0,
            },
            'bottomRight': {
              'type': 'elliptical',
              'x': 20.0,
              'y': 20.0,
            },
            'topLeft': {
              'type': 'elliptical',
              'x': 20.0,
              'y': 20.0,
            },
            'topRight': {
              'type': 'elliptical',
              'x': 20.0,
              'y': 20.0,
            },
            'type': 'only'
          },
          'side': {
            'color': '#ff666666',
            'style': 'solid',
            'width': 2.0,
          },
          'type': 'rounded'
        },
        'textTheme': 'accent'
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('CardTheme', () {
    expect(ThemeDecoder.decodeCardTheme(null), null);
    expect(ThemeEncoder.encodeCardTheme(null), null);

    var entry = CardTheme(
      clipBehavior: Clip.hardEdge,
      color: Color(0xff111111),
      elevation: 3.0,
      margin: EdgeInsets.all(10.0),
      shadowColor: Color(0xff222222),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide.none,
      ),
    );

    const corner = {
      'type': 'elliptical',
      'x': 12.0,
      'y': 12.0,
    };

    var encoded = ThemeEncoder.encodeCardTheme(entry);
    var decoded = ThemeDecoder.decodeCardTheme(encoded);

    expect(encoded, {
      'clipBehavior': 'hardEdge',
      'color': '#ff111111',
      'elevation': 3.0,
      'margin': {
        'bottom': 10.0,
        'left': 10.0,
        'right': 10.0,
        'top': 10.0,
      },
      'shadowColor': '#ff222222',
      'shape': {
        'borderRadius': {
          'bottomLeft': corner,
          'bottomRight': corner,
          'topLeft': corner,
          'topRight': corner,
          'type': 'only'
        },
        'side': {
          'color': '#ff000000',
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded'
      }
    });

    expect(
      decoded,
      entry,
    );
  });
  test('ChipThemeData', () {
    expect(ThemeDecoder.decodeChipThemeData(null), null);
    expect(ThemeEncoder.encodeChipThemeData(null), null);

    var entry = ChipThemeData(
      backgroundColor: Color(0xff111111),
      brightness: Brightness.light,
      checkmarkColor: Color(0xff222222),
      deleteIconColor: Color(0xff333333),
      disabledColor: Color(0xff444444),
      elevation: 2.0,
      labelPadding: EdgeInsets.all(4.0),
      labelStyle: TextStyle(color: Color(0xff555555)),
      padding: EdgeInsets.all(8.0),
      pressElevation: 1.0,
      secondaryLabelStyle: TextStyle(
        color: _kColor,
      ),
      secondarySelectedColor: Color(0xff666666),
      selectedColor: _kColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      selectedShadowColor: Color(0xff777777),
      shadowColor: Color(0xff888888),
      showCheckmark: true,
    );

    var encoded = ThemeEncoder.encodeChipThemeData(entry);
    var decoded = ThemeDecoder.decodeChipThemeData(encoded);

    expect(
      encoded,
      {
        'backgroundColor': '#ff111111',
        'brightness': 'light',
        'checkmarkColor': '#ff222222',
        'deleteIconColor': '#ff333333',
        'disabledColor': '#ff444444',
        'elevation': 2.0,
        'labelPadding': {
          'bottom': 4.0,
          'left': 4.0,
          'right': 4.0,
          'top': 4.0,
        },
        'labelStyle': {'color': '#ff555555', 'inherit': true},
        'padding': {
          'bottom': 8.0,
          'left': 8.0,
          'right': 8.0,
          'top': 8.0,
        },
        'pressElevation': 1.0,
        'secondaryLabelStyle': {
          'color': '#00123456',
          'inherit': true,
        },
        'secondarySelectedColor': '#ff666666',
        'selectedColor': '#00123456',
        'shape': {
          'borderRadius': {
            'bottomLeft': {
              'type': 'elliptical',
              'x': 10.0,
              'y': 10.0,
            },
            'bottomRight': {
              'type': 'elliptical',
              'x': 10.0,
              'y': 10.0,
            },
            'topLeft': {
              'type': 'elliptical',
              'x': 10.0,
              'y': 10.0,
            },
            'topRight': {
              'type': 'elliptical',
              'x': 10.0,
              'y': 10.0,
            },
            'type': 'only'
          },
          'side': {
            'color': '#ff000000',
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rounded'
        },
        'selectedShadowColor': '#ff777777',
        'shadowColor': '#ff888888',
        'showCheckmark': true
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('Clip', () {
    expect(ThemeDecoder.decodeClip(null), null);
    expect(ThemeEncoder.encodeClip(null), null);

    expect(ThemeDecoder.decodeClip('antiAlias'), Clip.antiAlias);
    expect(
      ThemeDecoder.decodeClip('antiAliasWithSaveLayer'),
      Clip.antiAliasWithSaveLayer,
    );
    expect(ThemeDecoder.decodeClip('hardEdge'), Clip.hardEdge);
    expect(ThemeDecoder.decodeClip('none'), Clip.none);

    expect(ThemeEncoder.encodeClip(Clip.antiAlias), 'antiAlias');
    expect(
      ThemeEncoder.encodeClip(Clip.antiAliasWithSaveLayer),
      'antiAliasWithSaveLayer',
    );
    expect(ThemeEncoder.encodeClip(Clip.hardEdge), 'hardEdge');
    expect(ThemeEncoder.encodeClip(Clip.none), 'none');
  });

  test('Color', () {
    expect(ThemeDecoder.decodeColor(null), null);
    expect(ThemeEncoder.encodeColor(null), null);

    var entry = _kColor;

    var encoded = ThemeEncoder.encodeColor(entry);
    var decoded = ThemeDecoder.decodeColor(encoded);

    expect(encoded, _kColorStr);

    expect(
      decoded,
      entry,
    );

    expect(ThemeDecoder.decodeColor('ddd'), Color(0xffdddddd));
    expect(ThemeDecoder.decodeColor('#ddd'), Color(0xffdddddd));
    expect(ThemeDecoder.decodeColor('DDD'), Color(0xffdddddd));
    expect(ThemeDecoder.decodeColor('#DDD'), Color(0xffdddddd));

    expect(ThemeDecoder.decodeColor('dadada'), Color(0xffdadada));
    expect(ThemeDecoder.decodeColor('#dadada'), Color(0xffdadada));
    expect(ThemeDecoder.decodeColor('DADADA'), Color(0xffdadada));
    expect(ThemeDecoder.decodeColor('#DADADA'), Color(0xffdadada));

    expect(ThemeDecoder.decodeColor('dadadada'), Color(0xdadadada));
    expect(ThemeDecoder.decodeColor('#dadadada'), Color(0xdadadada));
    expect(ThemeDecoder.decodeColor('DADADADA'), Color(0xdadadada));
    expect(ThemeDecoder.decodeColor('#DADADADA'), Color(0xdadadada));
  });

  test('ColorScheme', () {
    expect(ThemeDecoder.decodeColorScheme(null), null);
    expect(ThemeEncoder.encodeColorScheme(null), null);

    var entry = ColorScheme.dark();

    var encoded = ThemeEncoder.encodeColorScheme(entry);
    var decoded = ThemeDecoder.decodeColorScheme(encoded);

    expect(
      encoded,
      {
        'background': '#ff121212',
        'brightness': 'dark',
        'error': '#ffcf6679',
        'onBackground': '#ffffffff',
        'onError': '#ff000000',
        'onPrimary': '#ff000000',
        'onSecondary': '#ff000000',
        'onSurface': '#ffffffff',
        'primary': '#ffbb86fc',
        'primaryVariant': '#ff3700b3',
        'secondary': '#ff03dac6',
        'secondaryVariant': '#ff03dac6',
        'surface': '#ff121212'
      },
    );
    expect(
      decoded,
      entry,
    );
  });

  test('CrossAxisAlignment', () {
    expect(ThemeDecoder.decodeCrossAxisAlignment(null), null);
    expect(ThemeEncoder.encodeCrossAxisAlignment(null), null);

    expect(
      ThemeDecoder.decodeCrossAxisAlignment('baseline'),
      CrossAxisAlignment.baseline,
    );
    expect(
      ThemeDecoder.decodeCrossAxisAlignment('center'),
      CrossAxisAlignment.center,
    );
    expect(
      ThemeDecoder.decodeCrossAxisAlignment('end'),
      CrossAxisAlignment.end,
    );
    expect(
      ThemeDecoder.decodeCrossAxisAlignment('start'),
      CrossAxisAlignment.start,
    );
    expect(
      ThemeDecoder.decodeCrossAxisAlignment('stretch'),
      CrossAxisAlignment.stretch,
    );

    expect(
      ThemeEncoder.encodeCrossAxisAlignment(CrossAxisAlignment.baseline),
      'baseline',
    );
    expect(
      ThemeEncoder.encodeCrossAxisAlignment(CrossAxisAlignment.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeCrossAxisAlignment(CrossAxisAlignment.end),
      'end',
    );
    expect(
      ThemeEncoder.encodeCrossAxisAlignment(CrossAxisAlignment.start),
      'start',
    );
    expect(
      ThemeEncoder.encodeCrossAxisAlignment(CrossAxisAlignment.stretch),
      'stretch',
    );
  });

  test('CupertinoTextThemeData', () {
    expect(ThemeDecoder.decodeCupertinoTextThemeData(null), null);
    expect(ThemeEncoder.encodeCupertinoTextThemeData(null), null);

    var entry = CupertinoTextThemeData(
      actionTextStyle: _kTextStyle,
      dateTimePickerTextStyle: _kTextStyle,
      navActionTextStyle: _kTextStyle,
      navLargeTitleTextStyle: _kTextStyle,
      navTitleTextStyle: _kTextStyle,
      pickerTextStyle: _kTextStyle,
      primaryColor: _kColor,
      tabLabelTextStyle: _kTextStyle,
      textStyle: _kTextStyle,
    );

    var encoded = ThemeEncoder.encodeCupertinoTextThemeData(entry);
    var decoded = ThemeDecoder.decodeCupertinoTextThemeData(
      {
        'actionTextStyle': _kTextStyleJson,
        'dateTimePickerTextStyle': _kTextStyleJson,
        'navActionTextStyle': _kTextStyleJson,
        'navLargeTitleTextStyle': _kTextStyleJson,
        'navTitleTextStyle': _kTextStyleJson,
        'pickerTextStyle': _kTextStyleJson,
        'primaryColor': _kColorStr,
        'tabLabelTextStyle': _kTextStyleJson,
        'textStyle': _kTextStyleJson,
      },
    );

    expect(
      encoded,
      {
        'actionTextStyle': _kTextStyleJson,
        'dateTimePickerTextStyle': _kTextStyleJson,
        'navActionTextStyle': _kTextStyleJson,
        'navLargeTitleTextStyle': _kTextStyleJson,
        'navTitleTextStyle': _kTextStyleJson,
        'pickerTextStyle': _kTextStyleJson,
        'tabLabelTextStyle': _kTextStyleJson,
        'textStyle': _kTextStyleJson,
      },
    );

    expect(
      decoded.actionTextStyle,
      entry.actionTextStyle,
    );

    expect(
      decoded.dateTimePickerTextStyle,
      entry.dateTimePickerTextStyle,
    );
    expect(
      decoded.navActionTextStyle,
      entry.navActionTextStyle,
    );
    expect(
      decoded.navLargeTitleTextStyle,
      entry.navLargeTitleTextStyle,
    );
    expect(
      decoded.navTitleTextStyle,
      entry.navTitleTextStyle,
    );
    expect(
      decoded.pickerTextStyle,
      entry.pickerTextStyle,
    );
    expect(
      decoded.tabLabelTextStyle,
      entry.tabLabelTextStyle,
    );
    expect(
      decoded.textStyle,
      entry.textStyle,
    );
  });

  test('CupertinoThemeData', () {
    expect(ThemeDecoder.decodeCupertinoThemeData(null), null);
    expect(ThemeEncoder.encodeCupertinoThemeData(null), null);

    var entry = CupertinoThemeData(
      barBackgroundColor: Color(0xff111111),
      brightness: Brightness.light,
      primaryColor: Color(0xff222222),
      primaryContrastingColor: Color(0xff333333),
      scaffoldBackgroundColor: Color(0xff444444),
      textTheme: CupertinoTextThemeData(
        actionTextStyle: TextStyle(color: Color(0x11111111)),
        dateTimePickerTextStyle: TextStyle(color: Color(0x22222222)),
        navActionTextStyle: TextStyle(color: Color(0x33333333)),
        navLargeTitleTextStyle: TextStyle(color: Color(0x44444444)),
        navTitleTextStyle: TextStyle(color: Color(0x55555555)),
        pickerTextStyle: TextStyle(color: Color(0x66666666)),
        primaryColor: Color(0xff555555),
        tabLabelTextStyle: TextStyle(color: Color(0x77777777)),
        textStyle: TextStyle(color: Color(0x88888888)),
      ),
    );

    var encoded = ThemeEncoder.encodeCupertinoThemeData(entry);
    var decoded = ThemeDecoder.decodeCupertinoThemeData(encoded);

    expect(encoded, {
      'barBackgroundColor': '#ff111111',
      'brightness': 'light',
      'primaryColor': '#ff222222',
      'primaryContrastingColor': '#ff333333',
      'scaffoldBackgroundColor': '#ff444444',
      'textTheme': {
        'actionTextStyle': {
          'color': '#11111111',
          'inherit': true,
        },
        'dateTimePickerTextStyle': {
          'color': '#22222222',
          'inherit': true,
        },
        'navActionTextStyle': {
          'color': '#33333333',
          'inherit': true,
        },
        'navLargeTitleTextStyle': {
          'color': '#44444444',
          'inherit': true,
        },
        'navTitleTextStyle': {
          'color': '#55555555',
          'inherit': true,
        },
        'pickerTextStyle': {
          'color': '#66666666',
          'inherit': true,
        },
        'tabLabelTextStyle': {
          'color': '#77777777',
          'inherit': true,
        },
        'textStyle': {
          'color': '#88888888',
          'inherit': true,
        },
      },
    });

    expect(
      decoded.barBackgroundColor,
      entry.barBackgroundColor,
    );

    expect(
      decoded.brightness,
      entry.brightness,
    );

    expect(
      decoded.primaryColor,
      entry.primaryColor,
    );

    expect(
      decoded.primaryContrastingColor,
      entry.primaryContrastingColor,
    );

    expect(
      decoded.scaffoldBackgroundColor,
      entry.scaffoldBackgroundColor,
    );

    expect(
      decoded.textTheme.actionTextStyle,
      entry.textTheme.actionTextStyle,
    );

    expect(
      decoded.textTheme.dateTimePickerTextStyle,
      entry.textTheme.dateTimePickerTextStyle,
    );
    expect(
      decoded.textTheme.navActionTextStyle,
      entry.textTheme.navActionTextStyle,
    );
    expect(
      decoded.textTheme.navLargeTitleTextStyle,
      entry.textTheme.navLargeTitleTextStyle,
    );
    expect(
      decoded.textTheme.navTitleTextStyle,
      entry.textTheme.navTitleTextStyle,
    );
    expect(
      decoded.textTheme.pickerTextStyle,
      entry.textTheme.pickerTextStyle,
    );
    expect(
      decoded.textTheme.tabLabelTextStyle,
      entry.textTheme.tabLabelTextStyle,
    );
    expect(
      decoded.textTheme.textStyle,
      entry.textTheme.textStyle,
    );
  });

  test('DialogTheme', () {
    expect(ThemeDecoder.decodeDialogTheme(null), null);
    expect(ThemeEncoder.encodeDialogTheme(null), null);

    var entry = DialogTheme(
      backgroundColor: _kColor,
      contentTextStyle: _kTextStyle,
      elevation: 1.0,
      shape: RoundedRectangleBorder(),
    );

    var encoded = ThemeEncoder.encodeDialogTheme(entry);
    var decoded = ThemeDecoder.decodeDialogTheme(encoded);

    expect(
      encoded,
      {
        'backgroundColor': _kColorStr,
        'contentTextStyle': _kTextStyleJson,
        'elevation': 1.0,
        'shape': {
          'borderRadius': {
            'bottomLeft': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'bottomRight': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'topLeft': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'topRight': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'type': 'only'
          },
          'side': {
            'color': '#ff000000',
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rounded'
        },
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('DividerThemeData', () {
    expect(ThemeDecoder.decodeDividerThemeData(null), null);
    expect(ThemeEncoder.encodeDividerThemeData(null), null);

    var entry = DividerThemeData(
      color: _kColor,
      endIndent: 1.0,
      indent: 2.0,
      space: 3.0,
      thickness: 4.0,
    );

    var encoded = ThemeEncoder.encodeDividerThemeData(entry);
    var decoded = ThemeDecoder.decodeDividerThemeData(encoded);

    expect(
      encoded,
      {
        'color': _kColorStr,
        'endIndent': 1.0,
        'indent': 2.0,
        'space': 3.0,
        'thickness': 4.0,
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('DragStartBehavior', () {
    expect(ThemeDecoder.decodeDragStartBehavior(null), null);
    expect(ThemeEncoder.encodeDragStartBehavior(null), null);

    expect(
      ThemeDecoder.decodeDragStartBehavior('down'),
      DragStartBehavior.down,
    );
    expect(
      ThemeDecoder.decodeDragStartBehavior('start'),
      DragStartBehavior.start,
    );

    expect(
      ThemeEncoder.encodeDragStartBehavior(DragStartBehavior.down),
      'down',
    );
    expect(
      ThemeEncoder.encodeDragStartBehavior(DragStartBehavior.start),
      'start',
    );
  });

  test('EdgeInsetsGeometry', () {
    expect(ThemeDecoder.decodeEdgeInsetsGeometry(null), null);
    expect(ThemeEncoder.encodeEdgeInsetsGeometry(null), null);

    var entry = EdgeInsets.fromLTRB(
      1.0,
      2.0,
      3.0,
      4.0,
    );

    var encoded = ThemeEncoder.encodeEdgeInsetsGeometry(entry);
    var decoded = ThemeDecoder.decodeEdgeInsetsGeometry(encoded);

    expect(encoded, {
      'bottom': 4.0,
      'left': 1.0,
      'right': 3.0,
      'top': 2.0,
    });

    expect(
      decoded,
      entry,
    );

    expect(
      ThemeDecoder.decodeEdgeInsetsGeometry('16'),
      EdgeInsets.all(16.0),
    );
    expect(
      ThemeDecoder.decodeEdgeInsetsGeometry(16),
      EdgeInsets.all(16.0),
    );
    expect(
      ThemeDecoder.decodeEdgeInsetsGeometry(['1', 2]),
      EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
    );
    expect(
      ThemeDecoder.decodeEdgeInsetsGeometry(['1', 2, 3.0, '4.0']),
      EdgeInsets.fromLTRB(1.0, 2.0, 3.0, 4.0),
    );
  });

  test('FilterQuality', () {
    expect(ThemeDecoder.decodeFilterQuality(null), null);
    expect(ThemeEncoder.encodeFilterQuality(null), null);

    expect(ThemeDecoder.decodeFilterQuality('high'), FilterQuality.high);
    expect(ThemeDecoder.decodeFilterQuality('low'), FilterQuality.low);
    expect(ThemeDecoder.decodeFilterQuality('medium'), FilterQuality.medium);
    expect(ThemeDecoder.decodeFilterQuality('none'), FilterQuality.none);

    expect(ThemeEncoder.encodeFilterQuality(FilterQuality.high), 'high');
    expect(ThemeEncoder.encodeFilterQuality(FilterQuality.low), 'low');
    expect(ThemeEncoder.encodeFilterQuality(FilterQuality.medium), 'medium');
    expect(ThemeEncoder.encodeFilterQuality(FilterQuality.none), 'none');
  });

  test('FlexFit', () {
    expect(ThemeDecoder.decodeFlexFit(null), null);
    expect(ThemeEncoder.encodeFlexFit(null), null);

    expect(ThemeDecoder.decodeFlexFit('loose'), FlexFit.loose);
    expect(ThemeDecoder.decodeFlexFit('tight'), FlexFit.tight);

    expect(ThemeEncoder.encodeFlexFit(FlexFit.loose), 'loose');
    expect(ThemeEncoder.encodeFlexFit(FlexFit.tight), 'tight');
  });

  test('FloatingActionButtonAnimator', () {
    expect(ThemeDecoder.decodeFloatingActionButtonAnimator(null), null);
    expect(ThemeEncoder.encodeFloatingActionButtonAnimator(null), null);

    expect(
      ThemeDecoder.decodeFloatingActionButtonAnimator('scaling'),
      FloatingActionButtonAnimator.scaling,
    );
    expect(
      ThemeEncoder.encodeFloatingActionButtonAnimator(
          FloatingActionButtonAnimator.scaling),
      'scaling',
    );
  });

  test('FloatingActionButtonLocation', () {
    expect(ThemeDecoder.decodeFloatingActionButtonLocation(null), null);
    expect(ThemeEncoder.encodeFloatingActionButtonLocation(null), null);

    var values = <String, FloatingActionButtonLocation>{
      'centerDocked': FloatingActionButtonLocation.centerDocked,
      'centerFloat': FloatingActionButtonLocation.centerFloat,
      'endDocked': FloatingActionButtonLocation.endDocked,
      'endFloat': FloatingActionButtonLocation.endFloat,
      'endTop': FloatingActionButtonLocation.endTop,
      'miniStartTop': FloatingActionButtonLocation.miniStartTop,
      'startTop': FloatingActionButtonLocation.startTop,
    };

    values.forEach((key, value) {
      expect(ThemeDecoder.decodeFloatingActionButtonLocation(key), value);

      expect(ThemeEncoder.encodeFloatingActionButtonLocation(value), key);
    });
  });

  test('FloatingActionButtonThemeData', () {
    expect(ThemeDecoder.decodeFloatingActionButtonThemeData(null), null);
    expect(ThemeEncoder.encodeFloatingActionButtonThemeData(null), null);

    var entry = FloatingActionButtonThemeData(
      backgroundColor: Color(0xff111111),
      disabledElevation: 1.0,
      elevation: 2.0,
      focusColor: Color(0xff222222),
      focusElevation: 3.0,
      foregroundColor: Color(0xff333333),
      highlightElevation: 4.0,
      hoverColor: Color(0xff444444),
      hoverElevation: 5.0,
      shape: RoundedRectangleBorder(),
      splashColor: Color(0xff555555),
    );

    var encoded = ThemeEncoder.encodeFloatingActionButtonThemeData(entry);
    var decoded = ThemeDecoder.decodeFloatingActionButtonThemeData(encoded);

    expect(
      encoded,
      {
        'backgroundColor': '#ff111111',
        'disabledElevation': 1.0,
        'elevation': 2.0,
        'focusColor': '#ff222222',
        'focusElevation': 3.0,
        'foregroundColor': '#ff333333',
        'highlightElevation': 4.0,
        'hoverColor': '#ff444444',
        'hoverElevation': 5.0,
        'shape': {
          'borderRadius': {
            'bottomLeft': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'bottomRight': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'topLeft': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'topRight': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'type': 'only'
          },
          'side': {
            'color': '#ff000000',
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rounded'
        },
        'splashColor': '#ff555555'
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('FloatingLabelBehavior', () {
    expect(ThemeDecoder.decodeFloatingLabelBehavior(null), null);
    expect(ThemeEncoder.encodeFloatingLabelBehavior(null), null);

    expect(
      ThemeDecoder.decodeFloatingLabelBehavior('always'),
      FloatingLabelBehavior.always,
    );
    expect(
      ThemeDecoder.decodeFloatingLabelBehavior('auto'),
      FloatingLabelBehavior.auto,
    );
    expect(
      ThemeDecoder.decodeFloatingLabelBehavior('never'),
      FloatingLabelBehavior.never,
    );

    expect(
      ThemeEncoder.encodeFloatingLabelBehavior(FloatingLabelBehavior.always),
      'always',
    );
    expect(
      ThemeEncoder.encodeFloatingLabelBehavior(FloatingLabelBehavior.auto),
      'auto',
    );
    expect(
      ThemeEncoder.encodeFloatingLabelBehavior(FloatingLabelBehavior.never),
      'never',
    );
  });

  test('FontFeature', () {
    expect(ThemeDecoder.decodeFontFeature(null), null);
    expect(ThemeEncoder.encodeFontFeature(null), null);

    var entry = FontFeature('fooo', 2);

    var encoded = ThemeEncoder.encodeFontFeature(entry);
    var decoded = ThemeDecoder.decodeFontFeature(encoded);

    expect(
      encoded,
      {
        'feature': 'fooo',
        'value': 2,
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('FontWeight', () {
    expect(ThemeDecoder.decodeFontWeight(null), null);
    expect(ThemeEncoder.encodeFontWeight(null), null);

    const weights = {
      'bold': FontWeight.bold,
      'normal': FontWeight.normal,
      'w100': FontWeight.w100,
      'w200': FontWeight.w200,
      'w300': FontWeight.w300,
      'w400': FontWeight.w400,
      'w500': FontWeight.w500,
      'w600': FontWeight.w600,
      'w700': FontWeight.w700,
      'w800': FontWeight.w800,
      'w900': FontWeight.w900,
    };

    weights.forEach((key, value) {
      expect(ThemeDecoder.decodeFontWeight(key), value);

      // 'bold' and 'normal' are convenience keys that map to a w* value.  They
      // don't actually exist.
      if ('bold' != key && 'normal' != key) {
        expect(ThemeEncoder.encodeFontWeight(value), key);
      }
    });
  });

  test('FontStyle', () {
    expect(ThemeDecoder.decodeFontStyle(null), null);
    expect(ThemeEncoder.encodeFontStyle(null), null);

    expect(ThemeDecoder.decodeFontStyle('italic'), FontStyle.italic);
    expect(ThemeDecoder.decodeFontStyle('normal'), FontStyle.normal);

    expect(ThemeEncoder.encodeFontStyle(FontStyle.italic), 'italic');
    expect(ThemeEncoder.encodeFontStyle(FontStyle.normal), 'normal');
  });

  test('Gradient', () {
    expect(ThemeDecoder.decodeGradient(null), null);
    expect(ThemeEncoder.encodeGradient(null), null);

    Gradient entry = LinearGradient(
      colors: <Color>[Color(0xff111111), Color(0xff222222)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [1.0, 2.0, 3.0],
      tileMode: TileMode.clamp,
      transform: GradientRotation(4.0),
    );

    var encoded = ThemeEncoder.encodeGradient(entry);
    var decoded = ThemeDecoder.decodeGradient(encoded);

    expect(
      encoded,
      {
        'colors': ['#ff111111', '#ff222222'],
        'begin': 'topLeft',
        'end': 'bottomRight',
        'stops': [1.0, 2.0, 3.0],
        'tileMode': 'clamp',
        'transform': {'radians': 4.0},
        'type': 'linear',
      },
    );

    expect(
      decoded,
      entry,
    );

    entry = RadialGradient(
      center: Alignment.bottomCenter,
      colors: <Color>[Color(0xff111111), Color(0xff222222)],
      focal: Alignment.topCenter,
      focalRadius: 5.0,
      radius: 6.0,
      stops: [1.0, 2.0, 3.0],
      tileMode: TileMode.clamp,
      transform: GradientRotation(4.0),
    );

    encoded = ThemeEncoder.encodeGradient(entry);
    decoded = ThemeDecoder.decodeGradient(encoded);

    expect(
      encoded,
      {
        'center': 'bottomCenter',
        'colors': ['#ff111111', '#ff222222'],
        'focal': 'topCenter',
        'focalRadius': 5.0,
        'radius': 6.0,
        'stops': [1.0, 2.0, 3.0],
        'tileMode': 'clamp',
        'transform': {'radians': 4.0},
        'type': 'radial',
      },
    );

    expect(
      decoded,
      entry,
    );

    entry = SweepGradient(
      center: Alignment.bottomCenter,
      colors: <Color>[Color(0xff111111), Color(0xff222222)],
      endAngle: 5.0,
      startAngle: 6.0,
      stops: [1.0, 2.0, 3.0],
      tileMode: TileMode.clamp,
      transform: GradientRotation(4.0),
    );

    encoded = ThemeEncoder.encodeGradient(entry);
    decoded = ThemeDecoder.decodeGradient(encoded);

    expect(
      encoded,
      {
        'center': 'bottomCenter',
        'colors': ['#ff111111', '#ff222222'],
        'endAngle': 5.0,
        'startAngle': 6.0,
        'stops': [1.0, 2.0, 3.0],
        'tileMode': 'clamp',
        'transform': {'radians': 4.0},
        'type': 'sweep',
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('GradientTransform', () {
    expect(ThemeDecoder.decodeGradientTransform(null), null);
    expect(ThemeEncoder.encodeGradientTransform(null), null);

    var entry = GradientRotation(10.0);

    var encoded = ThemeEncoder.encodeGradientTransform(entry);
    var decoded = ThemeDecoder.decodeGradientTransform(encoded);

    expect(
      encoded,
      {
        'radians': 10.0,
      },
    );

    expect(
      decoded.runtimeType,
      entry.runtimeType,
    );

    expect(
      (decoded as GradientRotation).radians,
      entry.radians,
    );
  });

  test('HitTestBehavior', () {
    expect(ThemeDecoder.decodeHitTestBehavior(null), null);
    expect(ThemeEncoder.encodeHitTestBehavior(null), null);

    expect(
      ThemeDecoder.decodeHitTestBehavior('deferToChild'),
      HitTestBehavior.deferToChild,
    );
    expect(
      ThemeDecoder.decodeHitTestBehavior('opaque'),
      HitTestBehavior.opaque,
    );
    expect(
      ThemeDecoder.decodeHitTestBehavior('translucent'),
      HitTestBehavior.translucent,
    );

    expect(
      ThemeEncoder.encodeHitTestBehavior(HitTestBehavior.deferToChild),
      'deferToChild',
    );
    expect(
      ThemeEncoder.encodeHitTestBehavior(HitTestBehavior.opaque),
      'opaque',
    );
    expect(
      ThemeEncoder.encodeHitTestBehavior(HitTestBehavior.translucent),
      'translucent',
    );
  });

  test('IconData', () {
    expect(ThemeDecoder.decodeIconData(null), null);
    expect(ThemeEncoder.encodeIconData(null), null);

    var entry = IconData(
      2,
      fontFamily: 'foo',
      fontPackage: 'bar',
      matchTextDirection: true,
    );

    var encoded = ThemeEncoder.encodeIconData(entry);
    var decoded = ThemeDecoder.decodeIconData(encoded);

    expect(
      encoded,
      {
        'codePoint': 2,
        'fontFamily': 'foo',
        'fontPackage': 'bar',
        'matchTextDirection': true,
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('IconThemeData', () {
    expect(ThemeDecoder.decodeIconThemeData(null), null);
    expect(ThemeEncoder.encodeIconThemeData(null), null);

    var entry = IconThemeData(
      color: _kColor,
      opacity: 1.0,
      size: 10.0,
    );

    var encoded = ThemeEncoder.encodeIconThemeData(entry);
    var decoded = ThemeDecoder.decodeIconThemeData(encoded);

    expect(
      encoded,
      {
        'color': _kColorStr,
        'opacity': 1.0,
        'size': 10.0,
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('ImageRepeat', () {
    expect(ThemeDecoder.decodeImageRepeat(null), null);
    expect(ThemeEncoder.encodeImageRepeat(null), null);

    expect(ThemeDecoder.decodeImageRepeat('noRepeat'), ImageRepeat.noRepeat);
    expect(ThemeDecoder.decodeImageRepeat('repeat'), ImageRepeat.repeat);
    expect(ThemeDecoder.decodeImageRepeat('repeatX'), ImageRepeat.repeatX);
    expect(ThemeDecoder.decodeImageRepeat('repeatY'), ImageRepeat.repeatY);

    expect(ThemeEncoder.encodeImageRepeat(ImageRepeat.noRepeat), 'noRepeat');
    expect(ThemeEncoder.encodeImageRepeat(ImageRepeat.repeat), 'repeat');
    expect(ThemeEncoder.encodeImageRepeat(ImageRepeat.repeatX), 'repeatX');
    expect(ThemeEncoder.encodeImageRepeat(ImageRepeat.repeatY), 'repeatY');
  });

  test('InputBorder', () {
    expect(ThemeDecoder.decodeInputBorder(null), null);
    expect(ThemeEncoder.encodeInputBorder(null), null);

    var entry = OutlineInputBorder(
      borderSide: BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 3.0,
      ),
      gapPadding: 1.0,
    );

    var encoded = ThemeEncoder.encodeInputBorder(entry);
    var decoded = ThemeDecoder.decodeInputBorder(encoded);

    expect(
      encoded,
      {
        'borderRadius': {
          'bottomLeft': {
            'type': 'elliptical',
            'x': 4.0,
            'y': 4.0,
          },
          'bottomRight': {
            'type': 'elliptical',
            'x': 4.0,
            'y': 4.0,
          },
          'topLeft': {
            'type': 'elliptical',
            'x': 4.0,
            'y': 4.0,
          },
          'topRight': {
            'type': 'elliptical',
            'x': 4.0,
            'y': 4.0,
          },
          'type': 'only'
        },
        'borderSide': {
          'color': '#00123456',
          'style': 'solid',
          'width': 3.0,
        },
        'gapPadding': 1.0,
        'type': 'outline'
      },
    );

    expect(
      decoded,
      entry,
    );

    var entry2 = UnderlineInputBorder(
      borderSide: BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 3.0,
      ),
    );

    var encoded2 = ThemeEncoder.encodeInputBorder(entry2);
    var decoded2 = ThemeDecoder.decodeInputBorder(encoded2);

    expect(
      encoded2,
      {
        'borderRadius': {
          'bottomLeft': {
            'type': 'elliptical',
            'x': 0.0,
            'y': 0.0,
          },
          'bottomRight': {
            'type': 'elliptical',
            'x': 0.0,
            'y': 0.0,
          },
          'topLeft': {
            'type': 'elliptical',
            'x': 4.0,
            'y': 4.0,
          },
          'topRight': {
            'type': 'elliptical',
            'x': 4.0,
            'y': 4.0,
          },
          'type': 'only'
        },
        'borderSide': {
          'color': '#00123456',
          'style': 'solid',
          'width': 3.0,
        },
        'type': 'underline'
      },
    );

    expect(
      decoded2,
      entry2,
    );
  });

  test('InputDecorationTheme', () {
    expect(ThemeDecoder.decodeInputDecorationTheme(null), null);
    expect(ThemeEncoder.encodeInputDecorationTheme(null), null);

    var entry = InputDecorationTheme(
      alignLabelWithHint: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
      contentPadding: EdgeInsets.all(10.0),
      counterStyle: TextStyle(color: Color(0xff111111)),
      disabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(2.0)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      errorMaxLines: 1,
      errorStyle: TextStyle(color: Color(0xff222222)),
      fillColor: Color(0xff333333),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      focusColor: Color(0xff444444),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      helperMaxLines: 2,
      helperStyle: TextStyle(color: Color(0xff555555)),
      hintStyle: TextStyle(color: Color(0xff666666)),
      hoverColor: Color(0xff777777),
      isCollapsed: true,
      isDense: true,
      labelStyle: TextStyle(color: Color(0xff888888)),
      prefixStyle: TextStyle(color: Color(0xff999999)),
      suffixStyle: TextStyle(color: Color(0xff000000)),
    );

    var encoded = ThemeEncoder.encodeInputDecorationTheme(entry);
    var decoded = ThemeDecoder.decodeInputDecorationTheme(encoded);

    expect(
      encoded,
      {
        'alignLabelWithHint': true,
        'border': {
          'borderRadius': {
            'bottomLeft': {
              'type': 'elliptical',
              'x': 1.0,
              'y': 1.0,
            },
            'bottomRight': {
              'type': 'elliptical',
              'x': 1.0,
              'y': 1.0,
            },
            'topLeft': {
              'type': 'elliptical',
              'x': 1.0,
              'y': 1.0,
            },
            'topRight': {
              'type': 'elliptical',
              'x': 1.0,
              'y': 1.0,
            },
            'type': 'only'
          },
          'borderSide': {
            'color': '#ff000000',
            'style': 'solid',
            'width': 1.0,
          },
          'gapPadding': 4.0,
          'type': 'outline'
        },
        'contentPadding': {
          'bottom': 10.0,
          'left': 10.0,
          'right': 10.0,
          'top': 10.0
        },
        'counterStyle': {
          'color': '#ff111111',
          'inherit': true,
        },
        'disabledBorder': {
          'borderRadius': {
            'bottomLeft': {
              'type': 'elliptical',
              'x': 2.0,
              'y': 2.0,
            },
            'bottomRight': {
              'type': 'elliptical',
              'x': 2.0,
              'y': 2.0,
            },
            'topLeft': {
              'type': 'elliptical',
              'x': 2.0,
              'y': 2.0,
            },
            'topRight': {
              'type': 'elliptical',
              'x': 2.0,
              'y': 2.0,
            },
            'type': 'only'
          },
          'borderSide': {
            'color': '#ff000000',
            'style': 'solid',
            'width': 1.0,
          },
          'gapPadding': 4.0,
          'type': 'outline'
        },
        'enabledBorder': {
          'borderRadius': {
            'bottomLeft': {
              'type': 'elliptical',
              'x': 3.0,
              'y': 3.0,
            },
            'bottomRight': {
              'type': 'elliptical',
              'x': 3.0,
              'y': 3.0,
            },
            'topLeft': {
              'type': 'elliptical',
              'x': 3.0,
              'y': 3.0,
            },
            'topRight': {
              'type': 'elliptical',
              'x': 3.0,
              'y': 3.0,
            },
            'type': 'only'
          },
          'borderSide': {
            'color': '#ff000000',
            'style': 'solid',
            'width': 1.0,
          },
          'gapPadding': 4.0,
          'type': 'outline'
        },
        'errorBorder': {
          'borderRadius': {
            'bottomLeft': {
              'type': 'elliptical',
              'x': 4.0,
              'y': 4.0,
            },
            'bottomRight': {
              'type': 'elliptical',
              'x': 4.0,
              'y': 4.0,
            },
            'topLeft': {
              'type': 'elliptical',
              'x': 4.0,
              'y': 4.0,
            },
            'topRight': {
              'type': 'elliptical',
              'x': 4.0,
              'y': 4.0,
            },
            'type': 'only'
          },
          'borderSide': {
            'color': '#ff000000',
            'style': 'solid',
            'width': 1.0,
          },
          'gapPadding': 4.0,
          'type': 'outline'
        },
        'errorMaxLines': 1,
        'errorStyle': {
          'color': '#ff222222',
          'inherit': true,
        },
        'fillColor': '#ff333333',
        'filled': true,
        'floatingLabelBehavior': 'always',
        'focusColor': '#ff444444',
        'focusedBorder': {
          'borderRadius': {
            'bottomLeft': {
              'type': 'elliptical',
              'x': 3.0,
              'y': 3.0,
            },
            'bottomRight': {
              'type': 'elliptical',
              'x': 3.0,
              'y': 3.0,
            },
            'topLeft': {
              'type': 'elliptical',
              'x': 3.0,
              'y': 3.0,
            },
            'topRight': {
              'type': 'elliptical',
              'x': 3.0,
              'y': 3.0,
            },
            'type': 'only'
          },
          'borderSide': {
            'color': '#ff000000',
            'style': 'solid',
            'width': 1.0,
          },
          'gapPadding': 4.0,
          'type': 'outline'
        },
        'focusedErrorBorder': {
          'borderRadius': {
            'bottomLeft': {
              'type': 'elliptical',
              'x': 4.0,
              'y': 4.0,
            },
            'bottomRight': {
              'type': 'elliptical',
              'x': 4.0,
              'y': 4.0,
            },
            'topLeft': {
              'type': 'elliptical',
              'x': 4.0,
              'y': 4.0,
            },
            'topRight': {
              'type': 'elliptical',
              'x': 4.0,
              'y': 4.0,
            },
            'type': 'only'
          },
          'borderSide': {
            'color': '#ff000000',
            'style': 'solid',
            'width': 1.0,
          },
          'gapPadding': 4.0,
          'type': 'outline'
        },
        'helperMaxLines': 2,
        'helperStyle': {
          'color': '#ff555555',
          'inherit': true,
        },
        'hintStyle': {
          'color': '#ff666666',
          'inherit': true,
        },
        'hoverColor': '#ff777777',
        'isCollapsed': true,
        'isDense': true,
        'labelStyle': {
          'color': '#ff888888',
          'inherit': true,
        },
        'prefixStyle': {
          'color': '#ff999999',
          'inherit': true,
        },
        'suffixStyle': {
          'color': '#ff000000',
          'inherit': true,
        }
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('InteractiveInkFeatureFactory', () {
    expect(ThemeDecoder.decodeInteractiveInkFeatureFactory(null), null);
    expect(ThemeEncoder.encodeInteractiveInkFeatureFactory(null), null);

    expect(
      ThemeDecoder.decodeInteractiveInkFeatureFactory('splash'),
      InkSplash.splashFactory,
    );
    expect(
      ThemeDecoder.decodeInteractiveInkFeatureFactory('ripple'),
      InkRipple.splashFactory,
    );

    expect(
      ThemeEncoder.encodeInteractiveInkFeatureFactory(InkSplash.splashFactory),
      'splash',
    );
    expect(
      ThemeEncoder.encodeInteractiveInkFeatureFactory(InkRipple.splashFactory),
      'ripple',
    );
  });

  test('Locale', () {
    expect(ThemeDecoder.decodeLocale(null), null);
    expect(ThemeEncoder.encodeLocale(null), null);

    var entry = Locale('en', 'US');

    var encoded = ThemeEncoder.encodeLocale(entry);
    var decoded = ThemeDecoder.decodeLocale(encoded);

    expect(
      encoded,
      {
        'countryCode': 'US',
        'languageCode': 'en',
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('MainAxisAlignment', () {
    expect(ThemeDecoder.decodeMainAxisAlignment(null), null);
    expect(ThemeEncoder.encodeMainAxisAlignment(null), null);

    expect(
      ThemeDecoder.decodeMainAxisAlignment('center'),
      MainAxisAlignment.center,
    );
    expect(
      ThemeDecoder.decodeMainAxisAlignment('end'),
      MainAxisAlignment.end,
    );
    expect(
      ThemeDecoder.decodeMainAxisAlignment('spaceAround'),
      MainAxisAlignment.spaceAround,
    );
    expect(
      ThemeDecoder.decodeMainAxisAlignment('spaceBetween'),
      MainAxisAlignment.spaceBetween,
    );
    expect(
      ThemeDecoder.decodeMainAxisAlignment('spaceEvenly'),
      MainAxisAlignment.spaceEvenly,
    );
    expect(
      ThemeDecoder.decodeMainAxisAlignment('start'),
      MainAxisAlignment.start,
    );

    expect(
      ThemeEncoder.encodeMainAxisAlignment(MainAxisAlignment.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeMainAxisAlignment(MainAxisAlignment.end),
      'end',
    );
    expect(
      ThemeEncoder.encodeMainAxisAlignment(MainAxisAlignment.spaceAround),
      'spaceAround',
    );
    expect(
      ThemeEncoder.encodeMainAxisAlignment(MainAxisAlignment.spaceBetween),
      'spaceBetween',
    );
    expect(
      ThemeEncoder.encodeMainAxisAlignment(MainAxisAlignment.spaceEvenly),
      'spaceEvenly',
    );
    expect(
      ThemeEncoder.encodeMainAxisAlignment(MainAxisAlignment.start),
      'start',
    );
  });

  test('MainAxisSize', () {
    expect(ThemeDecoder.decodeMainAxisSize(null), null);
    expect(ThemeEncoder.encodeMainAxisSize(null), null);

    expect(ThemeDecoder.decodeMainAxisSize('max'), MainAxisSize.max);
    expect(ThemeDecoder.decodeMainAxisSize('min'), MainAxisSize.min);

    expect(ThemeEncoder.encodeMainAxisSize(MainAxisSize.max), 'max');
    expect(ThemeEncoder.encodeMainAxisSize(MainAxisSize.min), 'min');
  });

  test('MaterialBannerThemeData', () {
    expect(ThemeDecoder.decodeMaterialBannerThemeData(null), null);
    expect(ThemeEncoder.encodeMaterialBannerThemeData(null), null);

    var entry = MaterialBannerThemeData(
      backgroundColor: _kColor,
      contentTextStyle: _kTextStyle,
      leadingPadding: EdgeInsets.all(1.0),
      padding: EdgeInsets.all(2.0),
    );

    var encoded = ThemeEncoder.encodeMaterialBannerThemeData(entry);
    var decoded = ThemeDecoder.decodeMaterialBannerThemeData(encoded);

    expect(
      encoded,
      {
        'backgroundColor': _kColorStr,
        'contentTextStyle': _kTextStyleJson,
        'leadingPadding': {
          'bottom': 1.0,
          'left': 1.0,
          'right': 1.0,
          'top': 1.0,
        },
        'padding': {
          'bottom': 2.0,
          'left': 2.0,
          'right': 2.0,
          'top': 2.0,
        },
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('MaterialColor', () {
    expect(ThemeDecoder.decodeMaterialColor(null), null);
    expect(ThemeEncoder.encodeMaterialColor(null), null);

    var entry = MaterialColor(_kColor.value, {
      50: _kColor,
    });

    var encoded = ThemeEncoder.encodeMaterialColor(entry);
    var decoded = ThemeDecoder.decodeMaterialColor(encoded);

    expect(
      encoded,
      {
        'primary': _kColorStr,
        'swatches': {
          '50': _kColorStr,
        }
      },
    );

    expect(ThemeEncoder.encodeMaterialColor(decoded), encoded);
  });

  test('MaterialTapTargetSize', () {
    expect(ThemeDecoder.decodeMaterialTapTargetSize(null), null);
    expect(ThemeEncoder.encodeMaterialTapTargetSize(null), null);

    expect(
      ThemeDecoder.decodeMaterialTapTargetSize('padded'),
      MaterialTapTargetSize.padded,
    );
    expect(
      ThemeDecoder.decodeMaterialTapTargetSize('shrinkWrap'),
      MaterialTapTargetSize.shrinkWrap,
    );

    expect(
      ThemeEncoder.encodeMaterialTapTargetSize(MaterialTapTargetSize.padded),
      'padded',
    );
    expect(
      ThemeEncoder.encodeMaterialTapTargetSize(
        MaterialTapTargetSize.shrinkWrap,
      ),
      'shrinkWrap',
    );
  });

  test('MaterialType', () {
    expect(ThemeDecoder.decodeMaterialType(null), null);
    expect(ThemeEncoder.encodeMaterialType(null), null);

    expect(ThemeDecoder.decodeMaterialType('button'), MaterialType.button);
    expect(ThemeDecoder.decodeMaterialType('canvas'), MaterialType.canvas);
    expect(ThemeDecoder.decodeMaterialType('card'), MaterialType.card);
    expect(ThemeDecoder.decodeMaterialType('circle'), MaterialType.circle);
    expect(
      ThemeDecoder.decodeMaterialType('transparency'),
      MaterialType.transparency,
    );

    expect(ThemeEncoder.encodeMaterialType(MaterialType.button), 'button');
    expect(ThemeEncoder.encodeMaterialType(MaterialType.canvas), 'canvas');
    expect(ThemeEncoder.encodeMaterialType(MaterialType.card), 'card');
    expect(ThemeEncoder.encodeMaterialType(MaterialType.circle), 'circle');
    expect(
      ThemeEncoder.encodeMaterialType(MaterialType.transparency),
      'transparency',
    );
  });

  test('Matrix4', () {
    expect(ThemeDecoder.decodeMatrix4(null), null);
    expect(ThemeEncoder.encodeMatrix4(null), null);

    var entry = Matrix4(
      1.0,
      2.0,
      3.0,
      4.0,
      5.0,
      6.0,
      7.0,
      8.0,
      9.0,
      10.0,
      11.0,
      12.0,
      13.0,
      14.0,
      15.0,
      16.0,
    );

    var encoded = ThemeEncoder.encodeMatrix4(entry);
    var decoded = ThemeDecoder.decodeMatrix4(encoded);

    expect(
      encoded,
      [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
      ],
    );

    expect(
      decoded,
      entry,
    );
  });

  test('NavigationRailLabelType', () {
    expect(ThemeDecoder.decodeNavigationRailLabelType(null), null);
    expect(ThemeEncoder.encodeNavigationRailLabelType(null), null);

    expect(
      ThemeDecoder.decodeNavigationRailLabelType('all'),
      NavigationRailLabelType.all,
    );
    expect(
      ThemeDecoder.decodeNavigationRailLabelType('none'),
      NavigationRailLabelType.none,
    );
    expect(
      ThemeDecoder.decodeNavigationRailLabelType('selected'),
      NavigationRailLabelType.selected,
    );

    expect(
      ThemeEncoder.encodeNavigationRailLabelType(NavigationRailLabelType.all),
      'all',
    );
    expect(
      ThemeEncoder.encodeNavigationRailLabelType(NavigationRailLabelType.none),
      'none',
    );
    expect(
      ThemeEncoder.encodeNavigationRailLabelType(
        NavigationRailLabelType.selected,
      ),
      'selected',
    );
  });

  test('NavigationRailThemeData', () {
    expect(ThemeDecoder.decodeNavigationRailThemeData(null), null);
    expect(ThemeEncoder.encodeNavigationRailThemeData(null), null);

    var entry = NavigationRailThemeData(
      backgroundColor: Color(0xff111111),
      elevation: 1.0,
      groupAlignment: 2.0,
      labelType: NavigationRailLabelType.all,
      selectedIconTheme: IconThemeData(
        color: Color(0xff222222),
        opacity: 0.5,
        size: 4.0,
      ),
      selectedLabelTextStyle: TextStyle(color: Color(0xff333333)),
      unselectedIconTheme: IconThemeData(
        color: Color(0xff444444),
        opacity: 0.6,
        size: 6.0,
      ),
      unselectedLabelTextStyle: TextStyle(color: Color(0xff555555)),
    );

    var encoded = ThemeEncoder.encodeNavigationRailThemeData(entry);
    var decoded = ThemeDecoder.decodeNavigationRailThemeData(encoded);

    expect(
      encoded,
      {
        'backgroundColor': '#ff111111',
        'elevation': 1.0,
        'groupAlignment': 2.0,
        'labelType': 'all',
        'selectedIconTheme': {
          'color': '#ff222222',
          'opacity': 0.5,
          'size': 4.0
        },
        'selectedLabelTextStyle': {
          'color': '#ff333333',
          'inherit': true,
        },
        'unselectedIconTheme': {
          'color': '#ff444444',
          'opacity': 0.6,
          'size': 6.0
        },
        'unselectedLabelTextStyle': {
          'color': '#ff555555',
          'inherit': true,
        },
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('NotchedShape', () {
    expect(ThemeDecoder.decodeNotchedShape(null), null);
    expect(ThemeEncoder.encodeNotchedShape(null), null);

    expect(
      ThemeDecoder.decodeNotchedShape('circular')?.runtimeType,
      CircularNotchedRectangle()?.runtimeType,
    );
    expect(
      ThemeEncoder.encodeNotchedShape(CircularNotchedRectangle()),
      'circular',
    );
  });

  test('Offset', () {
    expect(ThemeDecoder.decodeOffset(null), null);
    expect(ThemeEncoder.encodeOffset(null), null);

    var entry = Offset(
      1.0,
      2.0,
    );

    var encoded = ThemeEncoder.encodeOffset(entry);
    var decoded = ThemeDecoder.decodeOffset(encoded);

    expect(
      encoded,
      {
        'dx': 1.0,
        'dy': 2.0,
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('Overflow', () {
    expect(ThemeDecoder.decodeOverflow(null), null);
    expect(ThemeEncoder.encodeOverflow(null), null);

    expect(ThemeDecoder.decodeOverflow('clip'), Overflow.clip);
    expect(ThemeDecoder.decodeOverflow('visible'), Overflow.visible);

    expect(ThemeEncoder.encodeOverflow(Overflow.clip), 'clip');
    expect(ThemeEncoder.encodeOverflow(Overflow.visible), 'visible');
  });

  test('PopupMenuThemeData', () {
    expect(ThemeDecoder.decodePopupMenuThemeData(null), null);
    expect(ThemeEncoder.encodePopupMenuThemeData(null), null);

    var entry = PopupMenuThemeData(
      color: _kColor,
      elevation: 1.0,
      shape: RoundedRectangleBorder(),
      textStyle: _kTextStyle,
    );

    var encoded = ThemeEncoder.encodePopupMenuThemeData(entry);
    var decoded = ThemeDecoder.decodePopupMenuThemeData(encoded);

    expect(
      encoded,
      {
        'color': '#00123456',
        'elevation': 1.0,
        'shape': {
          'borderRadius': {
            'bottomLeft': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'bottomRight': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'topLeft': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'topRight': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'type': 'only'
          },
          'side': {
            'color': '#ff000000',
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rounded'
        },
        'textStyle': {
          'color': '#00123456',
          'inherit': true,
        }
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('Radius', () {
    expect(ThemeDecoder.decodeRadius(null), null);
    expect(ThemeEncoder.encodeRadius(null), null);

    var entry = Radius.circular(1.0);

    var encoded = ThemeEncoder.encodeRadius(entry);
    var decoded = ThemeDecoder.decodeRadius(encoded);

    expect(
      encoded,
      {
        'type': 'elliptical',
        'x': 1.0,
        'y': 1.0,
      },
    );

    expect(
      decoded,
      entry,
    );

    expect(
      ThemeDecoder.decodeRadius({
        'radius': 4.0,
        'type': 'circular',
      }),
      Radius.circular(4.0),
    );
    expect(
      ThemeDecoder.decodeRadius({
        'type': 'elliptical',
        'x': 1.0,
        'y': 2.0,
      }),
      Radius.elliptical(1.0, 2.0),
    );
    expect(
      ThemeDecoder.decodeRadius({
        'type': 'zero',
      }),
      Radius.zero,
    );

    expect(ThemeDecoder.decodeRadius(16), Radius.circular(16));
  });

  test('RangeSliderThumbShape', () {
    expect(ThemeDecoder.decodeRangeSliderThumbShape(null), null);
    expect(ThemeEncoder.encodeRangeSliderThumbShape(null), null);

    var entry = RoundRangeSliderThumbShape(
      disabledThumbRadius: 1.0,
      enabledThumbRadius: 2.0,
    );

    var encoded = ThemeEncoder.encodeRangeSliderThumbShape(entry);
    RoundRangeSliderThumbShape decoded =
        ThemeDecoder.decodeRangeSliderThumbShape(encoded);

    expect(
      encoded,
      {
        'disabledThumbRadius': 1.0,
        'enabledThumbRadius': 2.0,
        'type': 'round',
      },
    );

    expect(
      decoded.disabledThumbRadius,
      entry.disabledThumbRadius,
    );

    expect(
      decoded.enabledThumbRadius,
      entry.enabledThumbRadius,
    );
  });

  test('RangeSliderTickMarkShape', () {
    expect(ThemeDecoder.decodeRangeSliderTickMarkShape(null), null);
    expect(ThemeEncoder.encodeRangeSliderTickMarkShape(null), null);

    var entry = RoundRangeSliderTickMarkShape(
      tickMarkRadius: 1.0,
    );

    var encoded = ThemeEncoder.encodeRangeSliderTickMarkShape(entry);
    RoundRangeSliderTickMarkShape decoded =
        ThemeDecoder.decodeRangeSliderTickMarkShape(encoded);

    expect(
      encoded,
      {
        'tickMarkRadius': 1.0,
        'type': 'round',
      },
    );

    expect(
      decoded.tickMarkRadius,
      entry.tickMarkRadius,
    );
  });

  test('RangeSliderTrackShape', () {
    expect(ThemeDecoder.decodeRangeSliderTrackShape(null), null);
    expect(ThemeEncoder.encodeRangeSliderTrackShape(null), null);

    var entry = RectangularRangeSliderTrackShape();

    var encoded = ThemeEncoder.encodeRangeSliderTrackShape(entry);
    var decoded = ThemeDecoder.decodeRangeSliderTrackShape(encoded);

    expect(encoded, 'rectangular');
    expect(
      ThemeEncoder.encodeRangeSliderTrackShape(
        RoundedRectRangeSliderTrackShape(),
      ),
      'rounded',
    );
    expect(
      ThemeDecoder.decodeRangeSliderTrackShape(
        'rounded',
      ).runtimeType,
      RoundedRectRangeSliderTrackShape().runtimeType,
    );

    expect(
      decoded?.runtimeType,
      entry.runtimeType,
    );
  });

  test('RangeSliderValueIndicatorShape', () {
    expect(ThemeDecoder.decodeRangeSliderValueIndicatorShape(null), null);
    expect(ThemeEncoder.encodeRangeSliderValueIndicatorShape(null), null);

    var entry = PaddleRangeSliderValueIndicatorShape();

    var encoded = ThemeEncoder.encodeRangeSliderValueIndicatorShape(entry);
    var decoded = ThemeDecoder.decodeRangeSliderValueIndicatorShape(encoded);

    expect(
      encoded,
      'paddle',
    );

    expect(
      decoded.runtimeType,
      entry.runtimeType,
    );
  });

  test('Rect', () {
    expect(ThemeDecoder.decodeRect(null), null);
    expect(ThemeEncoder.encodeRect(null), null);

    var entry = Rect.fromLTRB(1.0, 2.0, 3.0, 4.0);

    var encoded = ThemeEncoder.encodeRect(entry);
    var decoded = ThemeDecoder.decodeRect(encoded);

    expect(encoded, {
      'bottom': 4.0,
      'left': 1.0,
      'right': 3.0,
      'top': 2.0,
      'type': 'ltrb',
    });

    expect(
      decoded,
      entry,
    );

    expect(
      ThemeDecoder.decodeRect({
        'center': {
          'dx': 1.0,
          'dy': 2.0,
        },
        'height': 3.0,
        'width': 4.0,
        'type': 'center',
      }),
      Rect.fromCenter(
        center: Offset(1.0, 2.0),
        height: 3.0,
        width: 4.0,
      ),
    );

    expect(
      ThemeDecoder.decodeRect({
        'center': {
          'dx': 1.0,
          'dy': 2.0,
        },
        'radius': 3.0,
        'type': 'circle',
      }),
      Rect.fromCircle(
        center: Offset(1.0, 2.0),
        radius: 3.0,
      ),
    );
    expect(
      ThemeDecoder.decodeRect({
        'type': 'largest',
      }),
      Rect.largest,
    );
    expect(
      ThemeDecoder.decodeRect({
        'bottom': 4.0,
        'left': 1.0,
        'right': 3.0,
        'top': 2.0,
        'type': 'ltrb',
      }),
      Rect.fromLTRB(
        1.0,
        2.0,
        3.0,
        4.0,
      ),
    );
    expect(
      ThemeDecoder.decodeRect({
        'height': 4.0,
        'left': 1.0,
        'top': 2.0,
        'type': 'ltwh',
        'width': 3.0,
      }),
      Rect.fromLTWH(
        1.0,
        2.0,
        3.0,
        4.0,
      ),
    );
    expect(
      ThemeDecoder.decodeRect({
        'a': {
          'dx': 1.0,
          'dy': 2.0,
        },
        'b': {
          'dx': 3.0,
          'dy': 4.0,
        },
        'type': 'points',
      }),
      Rect.fromPoints(
        Offset(
          1.0,
          2.0,
        ),
        Offset(
          3.0,
          4.0,
        ),
      ),
    );
    expect(
      ThemeDecoder.decodeRect({
        'type': 'zero',
      }),
      Rect.zero,
    );
  });

  test('ScrollPhysics', () {
    expect(ThemeDecoder.decodeScrollPhysics(null), null);
    expect(ThemeEncoder.encodeScrollPhysics(null), null);

    expect(
      ThemeDecoder.decodeScrollPhysics({'type': 'always'}).runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({'type': 'bouncing'}).runtimeType,
      BouncingScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({'type': 'clamping'}).runtimeType,
      ClampingScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({'type': 'fixedExtent'}).runtimeType,
      FixedExtentScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({'type': 'never'}).runtimeType,
      NeverScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({'type': 'page'}).runtimeType,
      PageScrollPhysics().runtimeType,
    );

    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'always'
      }).parent.runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'bouncing',
      }).parent.runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'clamping',
      }).parent.runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'fixedExtent',
      }).parent.runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'never',
      }).parent.runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'page',
      }).parent.runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );

    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          AlwaysScrollableScrollPhysics(),
        ),
      ),
      {
        'type': 'always',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(BouncingScrollPhysics()),
      ),
      {
        'type': 'bouncing',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(ClampingScrollPhysics()),
      ),
      {
        'type': 'clamping',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(FixedExtentScrollPhysics()),
      ),
      {
        'type': 'fixedExtent',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(NeverScrollableScrollPhysics()),
      ),
      {
        'type': 'never',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(PageScrollPhysics()),
      ),
      {
        'type': 'page',
      },
    );

    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          AlwaysScrollableScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'always'
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'bouncing',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          ClampingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'clamping',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          FixedExtentScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'fixedExtent',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          NeverScrollableScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'never',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          PageScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'page',
      },
    );
  });

  test('Shadow', () {
    expect(ThemeDecoder.decodeShadow(null), null);
    expect(ThemeEncoder.encodeShadow(null), null);

    var entry = Shadow(
      color: _kColor,
      blurRadius: 1.0,
      offset: Offset(
        2.0,
        3.0,
      ),
    );

    var encoded = ThemeEncoder.encodeShadow(entry);
    var decoded = ThemeDecoder.decodeShadow(encoded);

    expect(
      encoded,
      {
        'color': _kColorStr,
        'blurRadius': 1.0,
        'offset': {
          'dx': 2.0,
          'dy': 3.0,
        },
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('ShapeBorder', () {
    expect(ThemeDecoder.decodeShapeBorder(null), null);
    expect(ThemeEncoder.encodeShapeBorder(null), null);

    ShapeBorder entry = CircleBorder(
      side: BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    var encoded = ThemeEncoder.encodeShapeBorder(entry);
    var decoded = ThemeDecoder.decodeShapeBorder(encoded);

    expect(
      encoded,
      {
        'side': {
          'color': _kColorStr,
          'style': 'solid',
          'width': 1.0,
        },
        'type': 'circle',
      },
    );

    expect(
      decoded,
      entry,
    );

    entry = ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    encoded = ThemeEncoder.encodeShapeBorder(entry);
    decoded = ThemeDecoder.decodeShapeBorder(encoded);

    expect(
      encoded,
      {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
          'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
          'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
          'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
          'type': 'only'
        },
        'side': {
          'color': _kColorStr,
          'style': 'solid',
          'width': 1.0,
        },
        'type': 'rectangle',
      },
    );

    expect(
      decoded,
      entry,
    );
    entry = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    encoded = ThemeEncoder.encodeShapeBorder(entry);
    decoded = ThemeDecoder.decodeShapeBorder(encoded);

    expect(
      encoded,
      {
        'borderRadius': {
          'bottomLeft': {
            'type': 'elliptical',
            'x': 2.0,
            'y': 2.0,
          },
          'bottomRight': {
            'type': 'elliptical',
            'x': 2.0,
            'y': 2.0,
          },
          'topLeft': {
            'type': 'elliptical',
            'x': 2.0,
            'y': 2.0,
          },
          'topRight': {
            'type': 'elliptical',
            'x': 2.0,
            'y': 2.0,
          },
          'type': 'only'
        },
        'side': {
          'color': '#00123456',
          'style': 'solid',
          'width': 1.0,
        },
        'type': 'rounded'
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('ShowValueIndicator', () {
    expect(ThemeDecoder.decodeShowValueIndicator(null), null);
    expect(ThemeEncoder.encodeShowValueIndicator(null), null);

    expect(
      ThemeDecoder.decodeShowValueIndicator('always'),
      ShowValueIndicator.always,
    );
    expect(
      ThemeDecoder.decodeShowValueIndicator('never'),
      ShowValueIndicator.never,
    );
    expect(
      ThemeDecoder.decodeShowValueIndicator('onlyForContinuous'),
      ShowValueIndicator.onlyForContinuous,
    );
    expect(
      ThemeDecoder.decodeShowValueIndicator('onlyForDiscrete'),
      ShowValueIndicator.onlyForDiscrete,
    );

    expect(
      ThemeEncoder.encodeShowValueIndicator(ShowValueIndicator.always),
      'always',
    );
    expect(
      ThemeEncoder.encodeShowValueIndicator(ShowValueIndicator.never),
      'never',
    );
    expect(
      ThemeEncoder.encodeShowValueIndicator(
        ShowValueIndicator.onlyForContinuous,
      ),
      'onlyForContinuous',
    );
    expect(
      ThemeEncoder.encodeShowValueIndicator(ShowValueIndicator.onlyForDiscrete),
      'onlyForDiscrete',
    );
  });

  test('SliderComponentShape', () {
    expect(ThemeDecoder.decodeSliderComponentShape(null), null);
    expect(ThemeEncoder.encodeSliderComponentShape(null), null);

    expect(
      ThemeDecoder.decodeSliderComponentShape('noOverlay'),
      SliderComponentShape.noOverlay,
    );
    expect(
      ThemeDecoder.decodeSliderComponentShape('noThumb'),
      SliderComponentShape.noThumb,
    );

    expect(
      ThemeEncoder.encodeSliderComponentShape(SliderComponentShape.noOverlay),
      'noOverlay',
    );
    expect(
      ThemeEncoder.encodeSliderComponentShape(SliderComponentShape.noThumb),
      'noOverlay',
    );
  });

  test('SliderThemeData', () {
    expect(ThemeDecoder.decodeSliderThemeData(null), null);
    expect(ThemeEncoder.encodeSliderThemeData(null), null);

    var entry = SliderThemeData(
      activeTickMarkColor: Color(0xff111111),
      activeTrackColor: Color(0xff222222),
      disabledActiveTickMarkColor: Color(0xff333333),
      disabledActiveTrackColor: Color(0xff444444),
      disabledInactiveTickMarkColor: Color(0xff555555),
      disabledInactiveTrackColor: Color(0xff666666),
      disabledThumbColor: Color(0xff777777),
      inactiveTickMarkColor: Color(0xff888888),
      inactiveTrackColor: Color(0xff999999),
      minThumbSeparation: 5.0,
      overlappingShapeStrokeColor: Color(0xff000000),
      overlayColor: Color(0xffaaaaaa),
      overlayShape: SliderComponentShape.noOverlay,
      rangeThumbShape: RoundRangeSliderThumbShape(),
      rangeTrackShape: RectangularRangeSliderTrackShape(),
      rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
      showValueIndicator: ShowValueIndicator.always,
      thumbColor: Color(0xffbbbbbb),
      thumbShape: SliderComponentShape.noOverlay,
      trackHeight: 10.0,
      trackShape: RectangularSliderTrackShape(),
      valueIndicatorColor: Color(0xffcccccc),
      valueIndicatorShape: SliderComponentShape.noOverlay,
      valueIndicatorTextStyle: _kTextStyle,
    );

    var encoded = ThemeEncoder.encodeSliderThemeData(entry);
    var decoded = ThemeDecoder.decodeSliderThemeData(encoded);

    expect(
      encoded,
      {
        'activeTickMarkColor': '#ff111111',
        'activeTrackColor': '#ff222222',
        'disabledActiveTickMarkColor': '#ff333333',
        'disabledActiveTrackColor': '#ff444444',
        'disabledInactiveTickMarkColor': '#ff555555',
        'disabledInactiveTrackColor': '#ff666666',
        'disabledThumbColor': '#ff777777',
        'inactiveTickMarkColor': '#ff888888',
        'inactiveTrackColor': '#ff999999',
        'minThumbSeparation': 5.0,
        'overlappingShapeStrokeColor': '#ff000000',
        'overlayColor': '#ffaaaaaa',
        'overlayShape': 'noOverlay',
        'rangeThumbShape': {
          'enabledThumbRadius': 10.0,
          'type': 'round',
        },
        'rangeTrackShape': 'rectangular',
        'rangeValueIndicatorShape': 'paddle',
        'showValueIndicator': 'always',
        'thumbColor': '#ffbbbbbb',
        'thumbShape': 'noOverlay',
        'trackHeight': 10.0,
        'trackShape': {
          'disabledThumbGapWidth': 2.0,
          'type': 'rectangular',
        },
        'valueIndicatorColor': '#ffcccccc',
        'valueIndicatorShape': 'noOverlay',
        'valueIndicatorTextStyle': {
          'color': '#00123456',
          'inherit': true,
        },
      },
    );

    expect(
      ThemeEncoder.encodeSliderThemeData(decoded),
      encoded,
    );
  });

  test('SliderTrackShape', () {
    expect(ThemeDecoder.decodeSliderTrackShape(null), null);
    expect(ThemeEncoder.encodeSliderTrackShape(null), null);

    SliderTrackShape entry = RectangularSliderTrackShape(
      disabledThumbGapWidth: 1.0,
    );

    var encoded = ThemeEncoder.encodeSliderTrackShape(entry);
    var decoded = ThemeDecoder.decodeSliderTrackShape(encoded);

    expect(
      encoded,
      {
        'disabledThumbGapWidth': 1.0,
        'type': 'rectangular',
      },
    );

    expect(
      decoded?.runtimeType,
      entry.runtimeType,
    );

    entry = RoundedRectSliderTrackShape();

    encoded = ThemeEncoder.encodeSliderTrackShape(entry);
    decoded = ThemeDecoder.decodeSliderTrackShape(encoded);

    expect(
      encoded,
      {
        'type': 'rounded',
      },
    );

    expect(
      decoded?.runtimeType,
      entry.runtimeType,
    );
  });

  test('SnackBarBehavior', () {
    expect(ThemeDecoder.decodeSnackBarBehavior(null), null);
    expect(ThemeEncoder.encodeSnackBarBehavior(null), null);

    expect(
      ThemeDecoder.decodeSnackBarBehavior('fixed'),
      SnackBarBehavior.fixed,
    );
    expect(
      ThemeDecoder.decodeSnackBarBehavior('floating'),
      SnackBarBehavior.floating,
    );

    expect(
      ThemeEncoder.encodeSnackBarBehavior(SnackBarBehavior.fixed),
      'fixed',
    );
    expect(
      ThemeEncoder.encodeSnackBarBehavior(SnackBarBehavior.floating),
      'floating',
    );
  });

  test('SnackBarThemeData', () {
    expect(ThemeDecoder.decodeSnackBarThemeData(null), null);
    expect(ThemeEncoder.encodeSnackBarThemeData(null), null);

    var entry = SnackBarThemeData(
      actionTextColor: Color(0xff111111),
      backgroundColor: Color(0xff222222),
      behavior: SnackBarBehavior.fixed,
      contentTextStyle: TextStyle(color: Color(0xff333333)),
      disabledActionTextColor: Color(0xff444444),
      elevation: 1.0,
      shape: RoundedRectangleBorder(),
    );

    var encoded = ThemeEncoder.encodeSnackBarThemeData(entry);
    var decoded = ThemeDecoder.decodeSnackBarThemeData(encoded);

    expect(
      encoded,
      {
        'actionTextColor': '#ff111111',
        'backgroundColor': '#ff222222',
        'behavior': 'fixed',
        'contentTextStyle': {
          'color': '#ff333333',
          'inherit': true,
        },
        'disabledActionTextColor': '#ff444444',
        'elevation': 1.0,
        'shape': {
          'borderRadius': {
            'bottomLeft': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'bottomRight': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'topLeft': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'topRight': {
              'type': 'elliptical',
              'x': 0.0,
              'y': 0.0,
            },
            'type': 'only'
          },
          'side': {
            'color': '#ff000000',
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rounded'
        },
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('SmartDashesType', () {
    expect(ThemeDecoder.decodeSmartDashesType(null), null);
    expect(ThemeEncoder.encodeSmartDashesType(null), null);

    expect(
      ThemeDecoder.decodeSmartDashesType('disabled'),
      SmartDashesType.disabled,
    );
    expect(
      ThemeDecoder.decodeSmartDashesType('enabled'),
      SmartDashesType.enabled,
    );

    expect(ThemeEncoder.encodeSmartDashesType(SmartDashesType.disabled),
        'disabled');
    expect(
      ThemeEncoder.encodeSmartDashesType(SmartDashesType.enabled),
      'enabled',
    );
  });

  test('SmartQuotesType', () {
    expect(ThemeDecoder.decodeSmartQuotesType(null), null);
    expect(ThemeEncoder.encodeSmartQuotesType(null), null);

    expect(
      ThemeDecoder.decodeSmartQuotesType('disabled'),
      SmartQuotesType.disabled,
    );
    expect(
      ThemeDecoder.decodeSmartQuotesType('enabled'),
      SmartQuotesType.enabled,
    );

    expect(ThemeEncoder.encodeSmartQuotesType(SmartQuotesType.disabled),
        'disabled');
    expect(
      ThemeEncoder.encodeSmartQuotesType(SmartQuotesType.enabled),
      'enabled',
    );
  });
  test('StackFit', () {
    expect(ThemeDecoder.decodeStackFit(null), null);
    expect(ThemeEncoder.encodeStackFit(null), null);

    expect(ThemeDecoder.decodeStackFit('expand'), StackFit.expand);
    expect(ThemeDecoder.decodeStackFit('loose'), StackFit.loose);
    expect(ThemeDecoder.decodeStackFit('passthrough'), StackFit.passthrough);

    expect(ThemeEncoder.encodeStackFit(StackFit.expand), 'expand');
    expect(ThemeEncoder.encodeStackFit(StackFit.loose), 'loose');
    expect(ThemeEncoder.encodeStackFit(StackFit.passthrough), 'passthrough');
  });

  test('StrutStyle', () {
    expect(ThemeDecoder.decodeStrutStyle(null), null);
    expect(ThemeEncoder.encodeStrutStyle(null), null);

    var entry = StrutStyle(
        fontFamily: 'foo',
        fontFamilyFallback: ['a', 'b', 'c'],
        fontSize: 1.0,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w200,
        forceStrutHeight: true,
        height: 2.0,
        leading: 3.0,
        package: 'bar');

    var encoded = ThemeEncoder.encodeStrutStyle(entry);
    var decoded = ThemeDecoder.decodeStrutStyle(encoded);

    expect(
      encoded,
      {
        'fontFamily': 'packages/bar/foo',
        'fontFamilyFallback': [
          'packages/bar/a',
          'packages/bar/b',
          'packages/bar/c',
        ],
        'fontSize': 1.0,
        'fontStyle': 'italic',
        'fontWeight': 'w200',
        'forceStrutHeight': true,
        'height': 2.0,
        'leading': 3.0,
      },
    );

    expect(
      ThemeEncoder.encodeStrutStyle(decoded),
      encoded,
    );
  });

  test('TabBarIndicatorSize', () {
    expect(ThemeDecoder.decodeTabBarIndicatorSize(null), null);
    expect(ThemeEncoder.encodeTabBarIndicatorSize(null), null);

    expect(
      ThemeDecoder.decodeTabBarIndicatorSize('label'),
      TabBarIndicatorSize.label,
    );
    expect(
      ThemeDecoder.decodeTabBarIndicatorSize('tab'),
      TabBarIndicatorSize.tab,
    );

    expect(
      ThemeEncoder.encodeTabBarIndicatorSize(TabBarIndicatorSize.label),
      'label',
    );
    expect(
      ThemeEncoder.encodeTabBarIndicatorSize(TabBarIndicatorSize.tab),
      'tab',
    );
  });

  test('TabBarTheme', () {
    expect(ThemeDecoder.decodeTabBarTheme(null), null);
    expect(ThemeEncoder.encodeTabBarTheme(null), null);

    try {
      ThemeDecoder.decodeTabBarTheme({'indicator': 'foo'});
      fail('exception expected');
    } catch (e) {
      // pass
    }

    var entry = TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Color(0xff111111),
      labelPadding: EdgeInsets.all(1.0),
      labelStyle: _kTextStyle,
      unselectedLabelColor: Color(0xff222222),
      unselectedLabelStyle: TextStyle(color: Color(0xff333333)),
    );

    var encoded = ThemeEncoder.encodeTabBarTheme(entry);
    var decoded = ThemeDecoder.decodeTabBarTheme(encoded);

    expect(
      encoded,
      {
        'indicatorSize': 'label',
        'labelColor': '#ff111111',
        'labelPadding': {
          'bottom': 1.0,
          'left': 1.0,
          'right': 1.0,
          'top': 1.0,
        },
        'labelStyle': _kTextStyleJson,
        'unselectedLabelColor': '#ff222222',
        'unselectedLabelStyle': {
          'color': '#ff333333',
          'inherit': true,
        },
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('TargetPlatform', () {
    expect(ThemeDecoder.decodeTargetPlatform(null), null);
    expect(ThemeEncoder.encodeTargetPlatform(null), null);

    expect(
      ThemeDecoder.decodeTargetPlatform('android'),
      TargetPlatform.android,
    );
    expect(
      ThemeDecoder.decodeTargetPlatform('fuchsia'),
      TargetPlatform.fuchsia,
    );
    expect(
      ThemeDecoder.decodeTargetPlatform('iOS'),
      TargetPlatform.iOS,
    );
    expect(
      ThemeDecoder.decodeTargetPlatform('linux'),
      TargetPlatform.linux,
    );
    expect(
      ThemeDecoder.decodeTargetPlatform('macOS'),
      TargetPlatform.macOS,
    );
    expect(
      ThemeDecoder.decodeTargetPlatform('windows'),
      TargetPlatform.windows,
    );

    expect(
      ThemeEncoder.encodeTargetPlatform(TargetPlatform.android),
      'android',
    );
    expect(
      ThemeEncoder.encodeTargetPlatform(TargetPlatform.fuchsia),
      'fuchsia',
    );
    expect(
      ThemeEncoder.encodeTargetPlatform(TargetPlatform.iOS),
      'iOS',
    );
    expect(
      ThemeEncoder.encodeTargetPlatform(TargetPlatform.linux),
      'linux',
    );
    expect(
      ThemeEncoder.encodeTargetPlatform(TargetPlatform.macOS),
      'macOS',
    );
    expect(
      ThemeEncoder.encodeTargetPlatform(TargetPlatform.windows),
      'windows',
    );
  });

  test('TextAlign', () {
    expect(ThemeDecoder.decodeTextAlign(null), null);
    expect(ThemeEncoder.encodeTextAlign(null), null);

    expect(ThemeDecoder.decodeTextAlign('center'), TextAlign.center);
    expect(ThemeDecoder.decodeTextAlign('end'), TextAlign.end);
    expect(ThemeDecoder.decodeTextAlign('justify'), TextAlign.justify);
    expect(ThemeDecoder.decodeTextAlign('left'), TextAlign.left);
    expect(ThemeDecoder.decodeTextAlign('right'), TextAlign.right);
    expect(ThemeDecoder.decodeTextAlign('start'), TextAlign.start);

    expect(ThemeEncoder.encodeTextAlign(TextAlign.center), 'center');
    expect(ThemeEncoder.encodeTextAlign(TextAlign.end), 'end');
    expect(ThemeEncoder.encodeTextAlign(TextAlign.justify), 'justify');
    expect(ThemeEncoder.encodeTextAlign(TextAlign.left), 'left');
    expect(ThemeEncoder.encodeTextAlign(TextAlign.right), 'right');
    expect(ThemeEncoder.encodeTextAlign(TextAlign.start), 'start');
  });

  test('TextAlignVertical', () {
    expect(ThemeDecoder.decodeTextAlignVertical(null), null);
    expect(ThemeEncoder.encodeTextAlignVertical(null), null);

    expect(
      ThemeDecoder.decodeTextAlignVertical('bottom'),
      TextAlignVertical.bottom,
    );
    expect(
      ThemeDecoder.decodeTextAlignVertical('center'),
      TextAlignVertical.center,
    );
    expect(
      ThemeDecoder.decodeTextAlignVertical('top'),
      TextAlignVertical.top,
    );

    expect(
      ThemeEncoder.encodeTextAlignVertical(TextAlignVertical.bottom),
      'bottom',
    );
    expect(
      ThemeEncoder.encodeTextAlignVertical(TextAlignVertical.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeTextAlignVertical(TextAlignVertical.top),
      'top',
    );
  });

  test('TextBaseline', () {
    expect(ThemeDecoder.decodeTextBaseline(null), null);
    expect(ThemeEncoder.encodeTextBaseline(null), null);

    expect(
      ThemeDecoder.decodeTextBaseline('alphabetic'),
      TextBaseline.alphabetic,
    );
    expect(
      ThemeDecoder.decodeTextBaseline('ideographic'),
      TextBaseline.ideographic,
    );

    expect(
      ThemeEncoder.encodeTextBaseline(TextBaseline.alphabetic),
      'alphabetic',
    );
    expect(
      ThemeEncoder.encodeTextBaseline(TextBaseline.ideographic),
      'ideographic',
    );
  });

  test('TextCapitalization', () {
    expect(ThemeDecoder.decodeTextCapitalization(null), null);
    expect(ThemeEncoder.encodeTextCapitalization(null), null);

    expect(
      ThemeDecoder.decodeTextCapitalization('characters'),
      TextCapitalization.characters,
    );
    expect(
      ThemeDecoder.decodeTextCapitalization('none'),
      TextCapitalization.none,
    );
    expect(
      ThemeDecoder.decodeTextCapitalization('sentences'),
      TextCapitalization.sentences,
    );
    expect(
      ThemeDecoder.decodeTextCapitalization('words'),
      TextCapitalization.words,
    );

    expect(
      ThemeEncoder.encodeTextCapitalization(TextCapitalization.characters),
      'characters',
    );
    expect(
      ThemeEncoder.encodeTextCapitalization(TextCapitalization.none),
      'none',
    );
    expect(
      ThemeEncoder.encodeTextCapitalization(TextCapitalization.sentences),
      'sentences',
    );
    expect(
      ThemeEncoder.encodeTextCapitalization(TextCapitalization.words),
      'words',
    );
  });

  test('TextDecoration', () {
    expect(ThemeDecoder.decodeTextDecoration(null), null);
    expect(ThemeEncoder.encodeTextDecoration(null), null);

    expect(
      ThemeDecoder.decodeTextDecoration('lineThrough'),
      TextDecoration.lineThrough,
    );
    expect(
      ThemeDecoder.decodeTextDecoration('none'),
      TextDecoration.none,
    );
    expect(
      ThemeDecoder.decodeTextDecoration('overline'),
      TextDecoration.overline,
    );
    expect(
      ThemeDecoder.decodeTextDecoration('underline'),
      TextDecoration.underline,
    );

    expect(
      ThemeEncoder.encodeTextDecoration(TextDecoration.lineThrough),
      'lineThrough',
    );
    expect(
      ThemeEncoder.encodeTextDecoration(TextDecoration.none),
      'none',
    );
    expect(
      ThemeEncoder.encodeTextDecoration(TextDecoration.overline),
      'overline',
    );
    expect(
      ThemeEncoder.encodeTextDecoration(TextDecoration.underline),
      'underline',
    );
  });

  test('TextDecorationStyle', () {
    expect(ThemeDecoder.decodeTextDecorationStyle(null), null);
    expect(ThemeEncoder.encodeTextDecorationStyle(null), null);

    expect(
      ThemeDecoder.decodeTextDecorationStyle('dashed'),
      TextDecorationStyle.dashed,
    );
    expect(
      ThemeDecoder.decodeTextDecorationStyle('dotted'),
      TextDecorationStyle.dotted,
    );
    expect(
      ThemeDecoder.decodeTextDecorationStyle('double'),
      TextDecorationStyle.double,
    );
    expect(
      ThemeDecoder.decodeTextDecorationStyle('solid'),
      TextDecorationStyle.solid,
    );
    expect(
      ThemeDecoder.decodeTextDecorationStyle('wavy'),
      TextDecorationStyle.wavy,
    );

    expect(
      ThemeEncoder.encodeTextDecorationStyle(TextDecorationStyle.dashed),
      'dashed',
    );
    expect(
      ThemeEncoder.encodeTextDecorationStyle(TextDecorationStyle.dotted),
      'dotted',
    );
    expect(
      ThemeEncoder.encodeTextDecorationStyle(TextDecorationStyle.double),
      'double',
    );
    expect(
      ThemeEncoder.encodeTextDecorationStyle(TextDecorationStyle.solid),
      'solid',
    );
    expect(
      ThemeEncoder.encodeTextDecorationStyle(TextDecorationStyle.wavy),
      'wavy',
    );
  });

  test('TextDirection', () {
    expect(ThemeDecoder.decodeTextDirection(null), null);
    expect(ThemeEncoder.encodeTextDirection(null), null);

    expect(
      ThemeDecoder.decodeTextDirection('ltr'),
      TextDirection.ltr,
    );
    expect(
      ThemeDecoder.decodeTextDirection('rtl'),
      TextDirection.rtl,
    );

    expect(
      ThemeEncoder.encodeTextDirection(TextDirection.ltr),
      'ltr',
    );
    expect(
      ThemeEncoder.encodeTextDirection(TextDirection.rtl),
      'rtl',
    );
  });

  test('TextHeightBehavior', () {
    expect(ThemeDecoder.decodeTextHeightBehavior(null), null);
    expect(ThemeEncoder.encodeTextHeightBehavior(null), null);

    var entry = TextHeightBehavior(
      applyHeightToFirstAscent: true,
      applyHeightToLastDescent: true,
    );

    var encoded = ThemeEncoder.encodeTextHeightBehavior(entry);
    var decoded = ThemeDecoder.decodeTextHeightBehavior(encoded);

    expect(
      encoded,
      {
        'applyHeightToFirstAscent': true,
        'applyHeightToLastDescent': true,
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('TextInputAction', () {
    expect(ThemeDecoder.decodeTextInputAction(null), null);
    expect(ThemeEncoder.encodeTextInputAction(null), null);

    expect(
      ThemeDecoder.decodeTextInputAction('continueAction'),
      TextInputAction.continueAction,
    );
    expect(
      ThemeDecoder.decodeTextInputAction('done'),
      TextInputAction.done,
    );
    expect(
      ThemeDecoder.decodeTextInputAction('emergencyCall'),
      TextInputAction.emergencyCall,
    );
    expect(
      ThemeDecoder.decodeTextInputAction('go'),
      TextInputAction.go,
    );
    expect(
      ThemeDecoder.decodeTextInputAction('join'),
      TextInputAction.join,
    );
    expect(
      ThemeDecoder.decodeTextInputAction('newline'),
      TextInputAction.newline,
    );
    expect(
      ThemeDecoder.decodeTextInputAction('next'),
      TextInputAction.next,
    );
    expect(
      ThemeDecoder.decodeTextInputAction('none'),
      TextInputAction.none,
    );
    expect(
      ThemeDecoder.decodeTextInputAction('previous'),
      TextInputAction.previous,
    );
    expect(
      ThemeDecoder.decodeTextInputAction('route'),
      TextInputAction.route,
    );
    expect(
      ThemeDecoder.decodeTextInputAction('search'),
      TextInputAction.search,
    );
    expect(
      ThemeDecoder.decodeTextInputAction('send'),
      TextInputAction.send,
    );
    expect(
      ThemeDecoder.decodeTextInputAction('unspecified'),
      TextInputAction.unspecified,
    );

    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.continueAction),
      'continueAction',
    );
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.done),
      'done',
    );
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.emergencyCall),
      'emergencyCall',
    );
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.go),
      'go',
    );
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.join),
      'join',
    );
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.newline),
      'newline',
    );
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.next),
      'next',
    );
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.none),
      'none',
    );
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.previous),
      'previous',
    );
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.route),
      'route',
    );
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.search),
      'search',
    );
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.send),
      'send',
    );
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.unspecified),
      'unspecified',
    );
  });

  test('TextInnputType', () {
    expect(ThemeDecoder.decodeTextInputType(null), null);
    expect(ThemeEncoder.encodeTextInputType(null), null);

    expect(
      ThemeDecoder.decodeTextInputType('datetime'),
      TextInputType.datetime,
    );
    expect(
      ThemeDecoder.decodeTextInputType('emailAddress'),
      TextInputType.emailAddress,
    );
    expect(
      ThemeDecoder.decodeTextInputType('multiline'),
      TextInputType.multiline,
    );
    expect(
      ThemeDecoder.decodeTextInputType('number'),
      TextInputType.number,
    );
    expect(
      ThemeDecoder.decodeTextInputType('phone'),
      TextInputType.phone,
    );
    expect(
      ThemeDecoder.decodeTextInputType('text'),
      TextInputType.text,
    );
    expect(
      ThemeDecoder.decodeTextInputType('url'),
      TextInputType.url,
    );
    expect(
      ThemeDecoder.decodeTextInputType('visiblePassword'),
      TextInputType.visiblePassword,
    );

    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.datetime),
      'datetime',
    );
    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.emailAddress),
      'emailAddress',
    );
    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.multiline),
      'multiline',
    );
    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.number),
      'number',
    );
    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.phone),
      'phone',
    );
    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.text),
      'text',
    );
    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.url),
      'url',
    );
    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.visiblePassword),
      'visiblePassword',
    );
  });

  test('TextOverflow', () {
    expect(ThemeDecoder.decodeTextOverflow(null), null);
    expect(ThemeEncoder.encodeTextOverflow(null), null);

    expect(ThemeDecoder.decodeTextOverflow('clip'), TextOverflow.clip);
    expect(ThemeDecoder.decodeTextOverflow('ellipsis'), TextOverflow.ellipsis);
    expect(ThemeDecoder.decodeTextOverflow('fade'), TextOverflow.fade);
    expect(ThemeDecoder.decodeTextOverflow('visible'), TextOverflow.visible);

    expect(ThemeEncoder.encodeTextOverflow(TextOverflow.clip), 'clip');
    expect(ThemeEncoder.encodeTextOverflow(TextOverflow.ellipsis), 'ellipsis');
    expect(ThemeEncoder.encodeTextOverflow(TextOverflow.fade), 'fade');
    expect(ThemeEncoder.encodeTextOverflow(TextOverflow.visible), 'visible');
  });

  test('TextStyle', () {
    expect(ThemeDecoder.decodeTextStyle(null), null);
    expect(ThemeEncoder.encodeTextStyle(null), null);

    var entry = TextStyle(
      backgroundColor: Color(0xff111111),
      color: Color(0xff222222),
      decoration: TextDecoration.lineThrough,
      decorationColor: Color(0xff333333),
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 1.0,
      fontFamily: 'foo',
      fontFamilyFallback: ['bar'],
      fontFeatures: [FontFeature('fooo', 2)],
      fontSize: 3.0,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w100,
      height: 4.0,
      inherit: false,
      letterSpacing: 5.0,
      locale: Locale('en', 'US'),
      package: 'bar',
      shadows: [
        Shadow(
          blurRadius: 6.0,
          color: Color(0xff444444),
          offset: Offset(
            6.0,
            7.0,
          ),
        ),
      ],
      textBaseline: TextBaseline.alphabetic,
      wordSpacing: 8.0,
    );

    var encoded = ThemeEncoder.encodeTextStyle(entry);
    var decoded = ThemeDecoder.decodeTextStyle(encoded);

    expect(
      encoded,
      {
        'backgroundColor': '#ff111111',
        'color': '#ff222222',
        'decoration': 'lineThrough',
        'decorationColor': '#ff333333',
        'decorationStyle': 'solid',
        'decorationThickness': 1.0,
        'fontFamily': 'packages/bar/foo',
        'fontFamilyFallback': ['packages/bar/bar'],
        'fontFeatures': [
          {
            'feature': 'fooo',
            'value': 2,
          }
        ],
        'fontWeight': 'w100',
        'fontSize': 3.0,
        'fontStyle': 'italic',
        'height': 4.0,
        'inherit': false,
        'letterSpacing': 5.0,
        'locale': {
          'countryCode': 'US',
          'languageCode': 'en',
        },
        'shadows': [
          {
            'blurRadius': 6.0,
            'color': '#ff444444',
            'offset': {
              'dx': 6.0,
              'dy': 7.0,
            },
          }
        ],
        'textBaseline': 'alphabetic',
        'wordSpacing': 8.0
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('TextTheme', () {
    expect(ThemeDecoder.decodeTextTheme(null), null);
    expect(ThemeEncoder.encodeTextTheme(null), null);

    var entry = TextTheme(
      bodyText1: TextStyle(color: Color(0xff111111)),
      bodyText2: TextStyle(color: Color(0xff222222)),
      button: TextStyle(color: Color(0xff333333)),
      caption: TextStyle(color: Color(0xff444444)),
      headline1: TextStyle(color: Color(0xff555555)),
      headline2: TextStyle(color: Color(0xff666666)),
      headline3: TextStyle(color: Color(0xff777777)),
      headline4: TextStyle(color: Color(0xff888888)),
      headline5: TextStyle(color: Color(0xff999999)),
      headline6: TextStyle(color: Color(0xff000000)),
      overline: TextStyle(color: Color(0xffaaaaaa)),
      subtitle1: TextStyle(color: Color(0xffbbbbbb)),
      subtitle2: TextStyle(color: Color(0xffcccccc)),
    );

    var encoded = ThemeEncoder.encodeTextTheme(entry);
    var decoded = ThemeDecoder.decodeTextTheme(encoded);

    expect(
      encoded,
      {
        'bodyText1': {
          'color': '#ff111111',
          'inherit': true,
        },
        'bodyText2': {
          'color': '#ff222222',
          'inherit': true,
        },
        'button': {
          'color': '#ff333333',
          'inherit': true,
        },
        'caption': {
          'color': '#ff444444',
          'inherit': true,
        },
        'headline1': {
          'color': '#ff555555',
          'inherit': true,
        },
        'headline2': {
          'color': '#ff666666',
          'inherit': true,
        },
        'headline3': {
          'color': '#ff777777',
          'inherit': true,
        },
        'headline4': {
          'color': '#ff888888',
          'inherit': true,
        },
        'headline5': {
          'color': '#ff999999',
          'inherit': true,
        },
        'headline6': {
          'color': '#ff000000',
          'inherit': true,
        },
        'overline': {
          'color': '#ffaaaaaa',
          'inherit': true,
        },
        'subtitle1': {
          'color': '#ffbbbbbb',
          'inherit': true,
        },
        'subtitle2': {
          'color': '#ffcccccc',
          'inherit': true,
        },
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('TextWidthBasis', () {
    expect(ThemeDecoder.decodeTextWidthBasis(null), null);
    expect(ThemeEncoder.encodeTextWidthBasis(null), null);

    expect(
      ThemeDecoder.decodeTextWidthBasis('longestLine'),
      TextWidthBasis.longestLine,
    );
    expect(
      ThemeDecoder.decodeTextWidthBasis('parent'),
      TextWidthBasis.parent,
    );

    expect(
      ThemeEncoder.encodeTextWidthBasis(TextWidthBasis.longestLine),
      'longestLine',
    );
    expect(
      ThemeEncoder.encodeTextWidthBasis(TextWidthBasis.parent),
      'parent',
    );
  });

  test('ThemeData', () {
    expect(ThemeDecoder.decodeThemeData(null), null);
    expect(ThemeEncoder.encodeThemeData(null), null);

    var entry = ThemeData(
      accentColor: Color(0xff111111),
      accentColorBrightness: Brightness.light,
      accentIconTheme: IconThemeData(
        color: Color(0xff222222),
        opacity: 1.0,
        size: 2.0,
      ),
      accentTextTheme: TextTheme(
        bodyText1: TextStyle(
          color: Color(0xff333333),
        ),
      ),
      appBarTheme: AppBarTheme(color: Color(0xff444444)),
      applyElevationOverlayColor: true,
      backgroundColor: Color(0xff555555),
      bannerTheme: MaterialBannerThemeData(backgroundColor: Color(0xff666666)),
      bottomAppBarColor: Color(0xff777777),
      bottomAppBarTheme: BottomAppBarTheme(
        color: Color(0xff888888),
        shape: CircularNotchedRectangle(),
      ),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   backgroundColor: Color(0xff999999),
      // ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Color(0xff000000),
      ),
      buttonBarTheme: ButtonBarThemeData(buttonHeight: 3.0),
      buttonColor: Color(0xffaaaaaa),
      buttonTheme: ButtonThemeData(buttonColor: Color(0xffbbbbbb)),
      canvasColor: Color(0xffcccccc),
      cardColor: Color(0xffdddddd),
      cardTheme: CardTheme(color: Color(0xffeeeeee)),
      chipTheme: ChipThemeData(
        backgroundColor: Color(0xff111111),
        brightness: Brightness.light,
        checkmarkColor: Color(0xff222222),
        deleteIconColor: Color(0xff333333),
        disabledColor: Color(0xff444444),
        elevation: 2.0,
        labelPadding: EdgeInsets.all(4.0),
        labelStyle: TextStyle(color: Color(0xff555555)),
        padding: EdgeInsets.all(8.0),
        pressElevation: 1.0,
        secondaryLabelStyle: TextStyle(
          color: _kColor,
        ),
        secondarySelectedColor: Color(0xff666666),
        selectedColor: _kColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        selectedShadowColor: Color(0xff777777),
        shadowColor: Color(0xff888888),
        showCheckmark: true,
      ),
      colorScheme: ColorScheme.dark(),
      cupertinoOverrideTheme: CupertinoThemeData(
        barBackgroundColor: Color(0xee111111),
      ),
      cursorColor: Color(0xee777777),
      dialogBackgroundColor: Color(0xee888888),
      dialogTheme: DialogTheme(backgroundColor: Color(0xee999999)),
      disabledColor: Color(0xee000000),
      dividerColor: Color(0xeeaaaaaa),
      dividerTheme: DividerThemeData(color: Color(0xeebbbbbb)),
      errorColor: Color(0xeecccccc),
      // fixTextFieldOutlineLabel: true,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xeedddddd),
      ),
      focusColor: Color(0xee333333),
      fontFamily: 'foo',
      highlightColor: Color(0xdd111111),
      hintColor: Color(0xdd222222),
      hoverColor: Color(0xee222222),
      iconTheme: IconThemeData(color: Color(0xdd333333)),
      indicatorColor: Color(0xdd444444),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: Color(0xdd555555),
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: Color(0xdd666666),
      ),
      platform: TargetPlatform.android,
      popupMenuTheme: PopupMenuThemeData(color: Color(0xdd777777)),
      primaryColor: Color(0xdd888888),
      primaryColorBrightness: Brightness.light,
      primaryColorDark: Color(0xdd999999),
      primaryColorLight: Color(0xdd000000),
      primaryIconTheme: IconThemeData(color: Color(0xddaaaaaa)),
      primarySwatch: MaterialColor(
        0xcc000000,
        {
          50: Color(0xcc111111),
          100: Color(0xcc222222),
          200: Color(0xcc333333),
          300: Color(0xcc444444),
          400: Color(0xcc555555),
          500: Color(0xcc666666),
          600: Color(0xcc777777),
          700: Color(0xcc888888),
          800: Color(0xcc999999),
          900: Color(0xcc000000),
        },
      ),
      primaryTextTheme: TextTheme(
        bodyText1: TextStyle(color: Color(0xccaaaaaa)),
      ),
      scaffoldBackgroundColor: Color(0xee666666),
      secondaryHeaderColor: Color(0xccbbbbbb),
      selectedRowColor: Color(0xcccccccc),
      sliderTheme: SliderThemeData(activeTickMarkColor: Color(0xccdddddd)),
      snackBarTheme: SnackBarThemeData(actionTextColor: Color(0xcceeeeee)),
      splashColor: Color(0xee444444),
      splashFactory: InkSplash.splashFactory,
      tabBarTheme: TabBarTheme(labelColor: Color(0xccffffff)),
      textSelectionColor: Color(0xbb000000),
      textSelectionHandleColor: Color(0xbb111111),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Color(0xee555555),
        ),
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(color: Color(0xbb222222)),
      toggleableActiveColor: Color(0xbb333333),
      tooltipTheme: TooltipThemeData(height: 19.0),
      typography: Typography.material2018(),
      unselectedWidgetColor: Color(0xbb444444),
      visualDensity: VisualDensity.comfortable,
    );

    var encoded = ThemeEncoder.encodeThemeData(entry);
    var decoded = ThemeDecoder.decodeThemeData(encoded);

    var jsonMap = {
      'accentColor': '#ff111111',
      'accentColorBrightness': 'light',
      'accentIconTheme': {
        'color': '#ff222222',
        'opacity': 1.0,
        'size': 2.0,
      },
      'accentTextTheme': {
        'bodyText1': {
          'color': '#ff333333',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'bodyText2': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'button': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'caption': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline1': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline2': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline3': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline4': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline5': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline6': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'overline': {
          'color': '#ff000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'subtitle1': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'subtitle2': {
          'color': '#ff000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        }
      },
      'appBarTheme': {'color': '#ff444444'},
      'applyElevationOverlayColor': true,
      'bannerTheme': {'backgroundColor': '#ff666666'},
      'backgroundColor': '#ff555555',
      'bottomAppBarColor': '#ff777777',
      'bottomAppBarTheme': {'color': '#ff888888', 'shape': 'circular'},
      'brightness': 'light',
      'bottomSheetTheme': {'backgroundColor': '#ff000000'},
      'buttonColor': '#ffaaaaaa',
      'buttonBarTheme': {'buttonHeight': 3.0},
      'buttonTheme': {
        'alignedDropdown': false,
        'height': 36.0,
        'layoutBehavior': 'padded',
        'minWidth': 88.0,
        'padding': {'bottom': 0.0, 'left': 16.0, 'right': 16.0, 'top': 0.0},
        'shape': {
          'borderRadius': {
            'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
            'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
            'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
            'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
            'type': 'only'
          },
          'side': {'color': '#ff000000', 'style': 'none', 'width': 0.0},
          'type': 'rounded'
        },
        'textTheme': 'normal'
      },
      'canvasColor': '#ffcccccc',
      'cardColor': '#ffdddddd',
      'cardTheme': {'color': '#ffeeeeee'},
      'chipTheme': {
        'backgroundColor': '#ff111111',
        'brightness': 'light',
        'checkmarkColor': '#ff222222',
        'deleteIconColor': '#ff333333',
        'disabledColor': '#ff444444',
        'elevation': 2.0,
        'labelPadding': {'bottom': 4.0, 'left': 4.0, 'right': 4.0, 'top': 4.0},
        'labelStyle': {'color': '#ff555555', 'inherit': true},
        'padding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
        'pressElevation': 1.0,
        'secondaryLabelStyle': {'color': '#00123456', 'inherit': true},
        'secondarySelectedColor': '#ff666666',
        'selectedColor': '#00123456',
        'shape': {
          'borderRadius': {
            'bottomLeft': {'type': 'elliptical', 'x': 10.0, 'y': 10.0},
            'bottomRight': {'type': 'elliptical', 'x': 10.0, 'y': 10.0},
            'topLeft': {'type': 'elliptical', 'x': 10.0, 'y': 10.0},
            'topRight': {'type': 'elliptical', 'x': 10.0, 'y': 10.0},
            'type': 'only'
          },
          'side': {'color': '#ff000000', 'style': 'none', 'width': 0.0},
          'type': 'rounded'
        },
        'selectedShadowColor': '#ff777777',
        'shadowColor': '#ff888888',
        'showCheckmark': true
      },
      'colorScheme': {
        'background': '#ff121212',
        'brightness': 'dark',
        'error': '#ffcf6679',
        'onBackground': '#ffffffff',
        'onError': '#ff000000',
        'onPrimary': '#ff000000',
        'onSecondary': '#ff000000',
        'onSurface': '#ffffffff',
        'primary': '#ffbb86fc',
        'primaryVariant': '#ff3700b3',
        'secondary': '#ff03dac6',
        'secondaryVariant': '#ff03dac6',
        'surface': '#ff121212'
      },
      'cupertinoOverrideTheme': {'barBackgroundColor': '#ee111111'},
      'cursorColor': '#ee777777',
      'dialogBackgroundColor': '#ee888888',
      'dialogTheme': {'backgroundColor': '#ee999999'},
      'disabledColor': '#ee000000',
      'dividerColor': '#eeaaaaaa',
      'dividerTheme': {'color': '#eebbbbbb'},
      'errorColor': '#eecccccc',
      'floatingActionButtonTheme': {'backgroundColor': '#eedddddd'},
      'focusColor': '#ee333333',
      'highlightColor': '#dd111111',
      'hintColor': '#dd222222',
      'hoverColor': '#ee222222',
      'iconTheme': {'color': '#dd333333'},
      'indicatorColor': '#dd444444',
      'inputDecorationTheme': {
        'alignLabelWithHint': false,
        'filled': false,
        'floatingLabelBehavior': 'auto',
        'focusColor': '#dd555555',
        'isCollapsed': false,
        'isDense': false
      },
      'materialTapTargetSize': 'padded',
      'navigationRailTheme': {'backgroundColor': '#dd666666'},
      'platform': 'android',
      'popupMenuTheme': {'color': '#dd777777'},
      'primaryColor': '#dd888888',
      'primaryColorBrightness': 'light',
      'primaryColorDark': '#dd999999',
      'primaryColorLight': '#dd000000',
      'primaryIconTheme': {'color': '#ddaaaaaa'},
      'primaryTextTheme': {
        'bodyText1': {
          'color': '#ccaaaaaa',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'bodyText2': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'button': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'caption': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline1': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline2': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline3': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline4': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline5': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline6': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'overline': {
          'color': '#ff000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'subtitle1': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'subtitle2': {
          'color': '#ff000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        }
      },
      'scaffoldBackgroundColor': '#ee666666',
      'secondaryHeaderColor': '#ccbbbbbb',
      'selectedRowColor': '#cccccccc',
      'sliderTheme': {'activeTickMarkColor': '#ccdddddd'},
      'snackBarTheme': {'actionTextColor': '#cceeeeee'},
      'splashColor': '#ee444444',
      'splashFactory': 'splash',
      'tabBarTheme': {'labelColor': '#ccffffff'},
      'textSelectionColor': '#bb000000',
      'textSelectionHandleColor': '#bb111111',
      'textTheme': {
        'bodyText1': {
          'color': '#ee555555',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'bodyText2': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'button': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'caption': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline1': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline2': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline3': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline4': {
          'color': '#8a000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline5': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headline6': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'overline': {
          'color': '#ff000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'subtitle1': {
          'color': '#dd000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'subtitle2': {
          'color': '#ff000000',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        }
      },
      'toggleButtonsTheme': {'color': '#bb222222'},
      'toggleableActiveColor': '#bb333333',
      'tooltipTheme': {'height': 19.0},
      'typography': {
        'black': {
          'bodyText1': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'bodyText2': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'button': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'caption': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headline1': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headline2': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headline3': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headline4': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headline5': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headline6': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'overline': {
            'color': '#ff000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'subtitle1': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'subtitle2': {
            'color': '#ff000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          }
        },
        'dense': {
          'bodyText1': {
            'fontWeight': 'w400',
            'fontSize': 17.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'bodyText2': {
            'fontWeight': 'w400',
            'fontSize': 15.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'button': {
            'fontWeight': 'w500',
            'fontSize': 15.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'caption': {
            'fontWeight': 'w400',
            'fontSize': 13.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'headline1': {
            'fontWeight': 'w100',
            'fontSize': 96.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'headline2': {
            'fontWeight': 'w100',
            'fontSize': 60.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'headline3': {
            'fontWeight': 'w400',
            'fontSize': 48.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'headline4': {
            'fontWeight': 'w400',
            'fontSize': 34.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'headline5': {
            'fontWeight': 'w400',
            'fontSize': 24.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'headline6': {
            'fontWeight': 'w500',
            'fontSize': 21.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'overline': {
            'fontWeight': 'w400',
            'fontSize': 11.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'subtitle1': {
            'fontWeight': 'w400',
            'fontSize': 17.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'subtitle2': {
            'fontWeight': 'w500',
            'fontSize': 15.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          }
        },
        'englishLike': {
          'bodyText1': {
            'fontWeight': 'w400',
            'fontSize': 16.0,
            'inherit': true,
            'letterSpacing': 0.5,
            'textBaseline': 'alphabetic'
          },
          'bodyText2': {
            'fontWeight': 'w400',
            'fontSize': 14.0,
            'inherit': true,
            'letterSpacing': 0.25,
            'textBaseline': 'alphabetic'
          },
          'button': {
            'fontWeight': 'w500',
            'fontSize': 14.0,
            'inherit': true,
            'letterSpacing': 0.75,
            'textBaseline': 'alphabetic'
          },
          'caption': {
            'fontWeight': 'w400',
            'fontSize': 12.0,
            'inherit': true,
            'letterSpacing': 0.4,
            'textBaseline': 'alphabetic'
          },
          'headline1': {
            'fontWeight': 'w300',
            'fontSize': 96.0,
            'inherit': true,
            'letterSpacing': -1.5,
            'textBaseline': 'alphabetic'
          },
          'headline2': {
            'fontWeight': 'w300',
            'fontSize': 60.0,
            'inherit': true,
            'letterSpacing': -0.5,
            'textBaseline': 'alphabetic'
          },
          'headline3': {
            'fontWeight': 'w400',
            'fontSize': 48.0,
            'inherit': true,
            'letterSpacing': 0.0,
            'textBaseline': 'alphabetic'
          },
          'headline4': {
            'fontWeight': 'w400',
            'fontSize': 34.0,
            'inherit': true,
            'letterSpacing': 0.25,
            'textBaseline': 'alphabetic'
          },
          'headline5': {
            'fontWeight': 'w400',
            'fontSize': 24.0,
            'inherit': true,
            'letterSpacing': 0.0,
            'textBaseline': 'alphabetic'
          },
          'headline6': {
            'fontWeight': 'w500',
            'fontSize': 20.0,
            'inherit': true,
            'letterSpacing': 0.15,
            'textBaseline': 'alphabetic'
          },
          'overline': {
            'fontWeight': 'w400',
            'fontSize': 10.0,
            'inherit': true,
            'letterSpacing': 1.5,
            'textBaseline': 'alphabetic'
          },
          'subtitle1': {
            'fontWeight': 'w400',
            'fontSize': 16.0,
            'inherit': true,
            'letterSpacing': 0.15,
            'textBaseline': 'alphabetic'
          },
          'subtitle2': {
            'fontWeight': 'w500',
            'fontSize': 14.0,
            'inherit': true,
            'letterSpacing': 0.1,
            'textBaseline': 'alphabetic'
          }
        },
        'tall': {
          'bodyText1': {
            'fontWeight': 'w700',
            'fontSize': 17.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'bodyText2': {
            'fontWeight': 'w400',
            'fontSize': 15.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'button': {
            'fontWeight': 'w700',
            'fontSize': 15.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'caption': {
            'fontWeight': 'w400',
            'fontSize': 13.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'headline1': {
            'fontWeight': 'w400',
            'fontSize': 96.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'headline2': {
            'fontWeight': 'w400',
            'fontSize': 60.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'headline3': {
            'fontWeight': 'w400',
            'fontSize': 48.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'headline4': {
            'fontWeight': 'w400',
            'fontSize': 34.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'headline5': {
            'fontWeight': 'w400',
            'fontSize': 24.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'headline6': {
            'fontWeight': 'w700',
            'fontSize': 21.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'overline': {
            'fontWeight': 'w400',
            'fontSize': 11.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'subtitle1': {
            'fontWeight': 'w400',
            'fontSize': 17.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'subtitle2': {
            'fontWeight': 'w500',
            'fontSize': 15.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          }
        },
        'white': {
          'bodyText1': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'bodyText2': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'button': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'caption': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headline1': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headline2': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headline3': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headline4': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headline5': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headline6': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'overline': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'subtitle1': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'subtitle2': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          }
        }
      },
      'unselectedWidgetColor': '#bb444444',
      'visualDensity': 'comfortable'
    };

    expect(encoded, jsonMap);
    expect(ThemeEncoder.encodeThemeData(decoded), jsonMap);

    expect(
      decoded.accentColor,
      entry.accentColor,
    );
  });

  test('TileMode', () {
    expect(ThemeDecoder.decodeTileMode(null), null);
    expect(ThemeEncoder.encodeTileMode(null), null);

    expect(ThemeDecoder.decodeTileMode('clamp'), TileMode.clamp);
    expect(ThemeDecoder.decodeTileMode('mirror'), TileMode.mirror);
    expect(ThemeDecoder.decodeTileMode('repeated'), TileMode.repeated);

    expect(ThemeEncoder.encodeTileMode(TileMode.clamp), 'clamp');
    expect(ThemeEncoder.encodeTileMode(TileMode.mirror), 'mirror');
    expect(ThemeEncoder.encodeTileMode(TileMode.repeated), 'repeated');
  });

  test('ToggleButtonsThemeData', () {
    expect(ThemeDecoder.decodeToggleButtonsThemeData(null), null);
    expect(ThemeEncoder.encodeToggleButtonsThemeData(null), null);

    var entry = ToggleButtonsThemeData(
      borderColor: Color(0xff111111),
      borderRadius: BorderRadius.circular(1.0),
      borderWidth: 2.0,
      color: Color(0xff222222),
      constraints: BoxConstraints(
        maxHeight: 30.0,
        maxWidth: 40.0,
        minHeight: 5.0,
        minWidth: 6.0,
      ),
      disabledBorderColor: Color(0xff333333),
      disabledColor: Color(0xff444444),
      fillColor: Color(0xff555555),
      focusColor: Color(0xff666666),
      highlightColor: Color(0xff777777),
      hoverColor: Color(0xff888888),
      selectedBorderColor: Color(0xff999999),
      selectedColor: Color(0xff000000),
      splashColor: Color(0xffaaaaaa),
      textStyle: TextStyle(color: Color(0xffbbbbbb)),
    );

    var encoded = ThemeEncoder.encodeToggleButtonsThemeData(entry);
    var decoded = ThemeDecoder.decodeToggleButtonsThemeData(encoded);

    expect(
      encoded,
      {
        'borderColor': '#ff111111',
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
          'bottomRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
          'topLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
          'topRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
          'type': 'only'
        },
        'borderWidth': 2.0,
        'color': '#ff222222',
        'constraints': {
          'maxHeight': 30.0,
          'maxWidth': 40.0,
          'minHeight': 5.0,
          'minWidth': 6.0
        },
        'disabledBorderColor': '#ff333333',
        'disabledColor': '#ff444444',
        'fillColor': '#ff555555',
        'focusColor': '#ff666666',
        'highlightColor': '#ff777777',
        'hoverColor': '#ff888888',
        'selectedBorderColor': '#ff999999',
        'selectedColor': '#ff000000',
        'splashColor': '#ffaaaaaa',
        'textStyle': {'color': '#ffbbbbbb', 'inherit': true}
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('ToolbarOptions', () {
    expect(ThemeDecoder.decodeToolbarOptions(null), null);
    expect(ThemeEncoder.encodeToolbarOptions(null), null);

    var entry = ToolbarOptions(
      copy: true,
      cut: true,
      paste: true,
      selectAll: true,
    );

    var encoded = ThemeEncoder.encodeToolbarOptions(entry);
    var decoded = ThemeDecoder.decodeToolbarOptions(encoded);

    expect(encoded, {
      'copy': true,
      'cut': true,
      'paste': true,
      'selectAll': true,
    });

    expect(
      decoded.copy,
      entry.copy,
    );
    expect(
      decoded.cut,
      entry.cut,
    );
    expect(
      decoded.paste,
      entry.paste,
    );
    expect(
      decoded.selectAll,
      entry.selectAll,
    );
  });

  test('TooltipThemeData', () {
    expect(ThemeDecoder.decodeTooltipThemeData(null), null);
    expect(ThemeEncoder.encodeTooltipThemeData(null), null);

    var entry = TooltipThemeData(
      excludeFromSemantics: true,
      height: 1.0,
      margin: EdgeInsets.all(2.0),
      padding: EdgeInsets.all(3.0),
      preferBelow: true,
      showDuration: Duration(milliseconds: 4),
      textStyle: _kTextStyle,
      verticalOffset: 5.0,
      waitDuration: Duration(milliseconds: 6),
    );

    var encoded = ThemeEncoder.encodeTooltipThemeData(entry);
    var decoded = ThemeDecoder.decodeTooltipThemeData(encoded);

    expect(
      encoded,
      {
        'excludeFromSemantics': true,
        'height': 1.0,
        'margin': {
          'bottom': 2.0,
          'left': 2.0,
          'right': 2.0,
          'top': 2.0,
        },
        'padding': {
          'bottom': 3.0,
          'left': 3.0,
          'right': 3.0,
          'top': 3.0,
        },
        'preferBelow': true,
        'showDuration': 4,
        'textStyle': {'color': '#00123456', 'inherit': true},
        'verticalOffset': 5.0,
        'waitDuration': 6
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('Typography', () {
    expect(ThemeDecoder.decodeTypography(null), null);
    expect(ThemeEncoder.encodeTypography(null), null);

    var entry = Typography.material2018(
      black: TextTheme(bodyText1: TextStyle(color: Color(0xff111111))),
      dense: TextTheme(bodyText1: TextStyle(color: Color(0xff222222))),
      englishLike: TextTheme(bodyText1: TextStyle(color: Color(0xff333333))),
      tall: TextTheme(bodyText1: TextStyle(color: Color(0xff444444))),
      white: TextTheme(bodyText1: TextStyle(color: Color(0xff555555))),
    );

    var encoded = ThemeEncoder.encodeTypography(entry);
    var decoded = ThemeDecoder.decodeTypography(encoded);

    expect(
      encoded,
      {
        'black': {
          'bodyText1': {
            'color': '#ff111111',
            'inherit': true,
          }
        },
        'dense': {
          'bodyText1': {
            'color': '#ff222222',
            'inherit': true,
          }
        },
        'englishLike': {
          'bodyText1': {
            'color': '#ff333333',
            'inherit': true,
          }
        },
        'tall': {
          'bodyText1': {
            'color': '#ff444444',
            'inherit': true,
          }
        },
        'white': {
          'bodyText1': {
            'color': '#ff555555',
            'inherit': true,
          }
        }
      },
    );

    expect(
      decoded,
      entry,
    );
  });
  test('VerticalDirection', () {
    expect(ThemeDecoder.decodeVerticalDirection(null), null);
    expect(ThemeEncoder.encodeVerticalDirection(null), null);

    expect(
      ThemeDecoder.decodeVerticalDirection('down'),
      VerticalDirection.down,
    );
    expect(
      ThemeDecoder.decodeVerticalDirection('up'),
      VerticalDirection.up,
    );

    expect(
      ThemeEncoder.encodeVerticalDirection(VerticalDirection.down),
      'down',
    );
    expect(
      ThemeEncoder.encodeVerticalDirection(VerticalDirection.up),
      'up',
    );
  });

  test('VisualDensity', () {
    expect(ThemeDecoder.decodeVisualDensity(null), null);
    expect(ThemeEncoder.encodeVisualDensity(null), null);

    expect(
      ThemeDecoder.decodeVisualDensity('adaptivePlatformDensity'),
      VisualDensity.adaptivePlatformDensity,
    );
    expect(
      ThemeDecoder.decodeVisualDensity('comfortable'),
      VisualDensity.comfortable,
    );
    expect(
      ThemeDecoder.decodeVisualDensity('compact'),
      VisualDensity.compact,
    );
    expect(
      ThemeDecoder.decodeVisualDensity('standard'),
      VisualDensity.standard,
    );

    expect(
      ThemeEncoder.encodeVisualDensity(VisualDensity.comfortable),
      'comfortable',
    );
    expect(
      ThemeEncoder.encodeVisualDensity(VisualDensity.compact),
      'compact',
    );
    expect(
      ThemeEncoder.encodeVisualDensity(VisualDensity.standard),
      'standard',
    );
  });
}
