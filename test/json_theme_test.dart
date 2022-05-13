// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_class/json_class.dart';
import 'package:json_theme/json_theme.dart';

import 'base64_image.dart';

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
      ThemeDecoder.decodeAlignment(
        Alignment.bottomCenter,
      ),
      Alignment.bottomCenter,
    );

    expect(
      ThemeDecoder.decodeAlignment(
        {
          'x': 0.2,
          'y': 0.4,
        },
      ),
      Alignment(0.2, 0.4),
    );
    expect(
      ThemeEncoder.encodeAlignment(
        Alignment(0.2, 0.4),
      ),
      {
        'x': 0.2,
        'y': 0.4,
      },
    );

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

  test('AndroidOverscrollIndicator', () {
    expect(ThemeDecoder.decodeAndroidOverscrollIndicator(null), null);
    expect(ThemeEncoder.encodeAndroidOverscrollIndicator(null), null);

    expect(
      ThemeDecoder.decodeAndroidOverscrollIndicator(
        AndroidOverscrollIndicator.glow,
      ),
      AndroidOverscrollIndicator.glow,
    );

    expect(
      ThemeDecoder.decodeAndroidOverscrollIndicator('glow'),
      AndroidOverscrollIndicator.glow,
    );
    expect(
      ThemeDecoder.decodeAndroidOverscrollIndicator('stretch'),
      AndroidOverscrollIndicator.stretch,
    );

    expect(
      ThemeEncoder.encodeAndroidOverscrollIndicator(
          AndroidOverscrollIndicator.glow),
      'glow',
    );
    expect(
      ThemeEncoder.encodeAndroidOverscrollIndicator(
          AndroidOverscrollIndicator.stretch),
      'stretch',
    );
  });

  test('AppBarTheme', () {
    expect(ThemeDecoder.decodeAppBarTheme(null), null);
    expect(ThemeEncoder.encodeAppBarTheme(null), null);

    var entry = AppBarTheme(
      color: _kColor,
      centerTitle: true,
      elevation: 6.0,
      foregroundColor: _kColor,
      shadowColor: _kColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarHeight: 64.0,
    );

    expect(ThemeDecoder.decodeAppBarTheme(entry), entry);

    var encoded = ThemeEncoder.encodeAppBarTheme(entry);
    var decoded = ThemeDecoder.decodeAppBarTheme(encoded);

    expect(
      json.encode(encoded),
      json.encode(
        {
          'backgroundColor': _kColorStr,
          'centerTitle': true,
          'elevation': 6.0,
          'foregroundColor': _kColorStr,
          'shadowColor': _kColorStr,
          'systemOverlayStyle': 'dark',
          'toolbarHeight': 64.0,
        },
      ),
    );

    expect(
      decoded,
      entry,
    );
  });

  test('AutovalidateMode', () {
    expect(ThemeDecoder.decodeAutovalidateMode(null), null);
    expect(ThemeEncoder.encodeAutovalidateMode(null), null);

    expect(
      ThemeDecoder.decodeAutovalidateMode(
        AutovalidateMode.always,
      ),
      AutovalidateMode.always,
    );

    expect(
      ThemeDecoder.decodeAutovalidateMode('always'),
      AutovalidateMode.always,
    );
    expect(
      ThemeDecoder.decodeAutovalidateMode('disabled'),
      AutovalidateMode.disabled,
    );
    expect(
      ThemeDecoder.decodeAutovalidateMode('onUserInteraction'),
      AutovalidateMode.onUserInteraction,
    );

    expect(
      ThemeEncoder.encodeAutovalidateMode(AutovalidateMode.always),
      'always',
    );
    expect(
      ThemeEncoder.encodeAutovalidateMode(AutovalidateMode.disabled),
      'disabled',
    );
    expect(
      ThemeEncoder.encodeAutovalidateMode(AutovalidateMode.onUserInteraction),
      'onUserInteraction',
    );
  });

  test('Axis', () {
    expect(ThemeDecoder.decodeAxis(null), null);
    expect(ThemeEncoder.encodeAxis(null), null);

    expect(
      ThemeDecoder.decodeAxis(
        Axis.horizontal,
      ),
      Axis.horizontal,
    );

    expect(ThemeDecoder.decodeAxis('horizontal'), Axis.horizontal);
    expect(ThemeDecoder.decodeAxis('vertical'), Axis.vertical);

    expect(ThemeEncoder.encodeAxis(Axis.horizontal), 'horizontal');
    expect(ThemeEncoder.encodeAxis(Axis.vertical), 'vertical');
  });

  test('BlendMode', () {
    expect(ThemeDecoder.decodeBlendMode(null), null);
    expect(ThemeEncoder.encodeBlendMode(null), null);

    expect(
      ThemeDecoder.decodeBlendMode(
        BlendMode.clear,
      ),
      BlendMode.clear,
    );

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

  test('BlurStyle', () {
    expect(ThemeDecoder.decodeBlurStyle(null), null);
    expect(ThemeEncoder.encodeBlurStyle(null), null);

    expect(ThemeDecoder.decodeBlurStyle('inner'), BlurStyle.inner);
    expect(ThemeDecoder.decodeBlurStyle('normal'), BlurStyle.normal);
    expect(ThemeDecoder.decodeBlurStyle('inner'), BlurStyle.inner);
    expect(ThemeDecoder.decodeBlurStyle('outer'), BlurStyle.outer);

    expect(ThemeEncoder.encodeBlurStyle(BlurStyle.inner), 'inner');
    expect(ThemeEncoder.encodeBlurStyle(BlurStyle.normal), 'normal');
    expect(ThemeEncoder.encodeBlurStyle(BlurStyle.inner), 'inner');
    expect(ThemeEncoder.encodeBlurStyle(BlurStyle.outer), 'outer');
  });

  test('BorderRadius', () {
    expect(ThemeDecoder.decodeBorderRadius(null), null);
    expect(ThemeEncoder.encodeBorderRadius(null), null);

    var entry = BorderRadius.circular(16.0);

    expect(ThemeDecoder.decodeBorderRadius(entry), entry);

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

    expect(ThemeDecoder.decodeBorderSide(entry), entry);

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

    expect(
      ThemeDecoder.decodeBorderStyle(
        BorderStyle.none,
      ),
      BorderStyle.none,
    );

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

    expect(ThemeDecoder.decodeBottomAppBarTheme(entry), entry);

    var encoded = ThemeEncoder.encodeBottomAppBarTheme(entry);
    var decoded = ThemeDecoder.decodeBottomAppBarTheme(encoded)!;

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

  test('BottomNavigationBarLandscapeLayout', () {
    expect(ThemeDecoder.decodeBottomNavigationBarLandscapeLayout(null), null);
    expect(ThemeEncoder.encodeBottomNavigationBarLandscapeLayout(null), null);

    expect(
      ThemeDecoder.decodeBottomNavigationBarLandscapeLayout(
        BottomNavigationBarLandscapeLayout.centered,
      ),
      BottomNavigationBarLandscapeLayout.centered,
    );

    expect(
      ThemeDecoder.decodeBottomNavigationBarLandscapeLayout('centered'),
      BottomNavigationBarLandscapeLayout.centered,
    );
    expect(
      ThemeDecoder.decodeBottomNavigationBarLandscapeLayout('linear'),
      BottomNavigationBarLandscapeLayout.linear,
    );
    expect(
      ThemeDecoder.decodeBottomNavigationBarLandscapeLayout('spread'),
      BottomNavigationBarLandscapeLayout.spread,
    );

    expect(
      ThemeEncoder.encodeBottomNavigationBarLandscapeLayout(
        BottomNavigationBarLandscapeLayout.centered,
      ),
      'centered',
    );
    expect(
      ThemeEncoder.encodeBottomNavigationBarLandscapeLayout(
        BottomNavigationBarLandscapeLayout.linear,
      ),
      'linear',
    );
    expect(
      ThemeEncoder.encodeBottomNavigationBarLandscapeLayout(
        BottomNavigationBarLandscapeLayout.spread,
      ),
      'spread',
    );
  });

  test('BottomNavigationBarThemeData', () {
    expect(ThemeDecoder.decodeBottomNavigationBarThemeData(null), null);
    expect(ThemeEncoder.encodeBottomNavigationBarThemeData(null), null);

    var entry = BottomNavigationBarThemeData(
      backgroundColor: Color(0xff111111),
      elevation: 1.0,
      selectedIconTheme: IconThemeData(opacity: 0.2),
      selectedItemColor: Color(0xff222222),
      selectedLabelStyle: TextStyle(fontSize: 3.0),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(opacity: 0.4),
      unselectedItemColor: Color(0xff333333),
      unselectedLabelStyle: TextStyle(fontSize: 5.0),
    );

    expect(ThemeDecoder.decodeBottomNavigationBarThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeBottomNavigationBarThemeData(entry);
    var decoded = ThemeDecoder.decodeBottomNavigationBarThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'elevation': 1.0,
      'selectedIconTheme': {
        'opacity': 0.2,
      },
      'selectedItemColor': '#ff222222',
      'selectedLabelStyle': {
        'fontSize': 3.0,
        'inherit': true,
      },
      'showSelectedLabels': true,
      'showUnselectedLabels': true,
      'type': 'fixed',
      'unselectedIconTheme': {
        'opacity': 0.4,
      },
      'unselectedItemColor': '#ff333333',
      'unselectedLabelStyle': {
        'fontSize': 5.0,
        'inherit': true,
      },
    });

    expect(
      decoded,
      entry,
    );
  });

  test('BottomNavigationBarType', () {
    expect(ThemeDecoder.decodeBottomNavigationBarType(null), null);
    expect(ThemeEncoder.encodeBottomNavigationBarType(null), null);

    expect(
      ThemeDecoder.decodeBottomNavigationBarType(
        BottomNavigationBarType.fixed,
      ),
      BottomNavigationBarType.fixed,
    );

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
      constraints: BoxConstraints(maxHeight: 40.0),
      elevation: 12.0,
      modalBackgroundColor: Color(0xff222222),
      modalElevation: 18.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
    );

    expect(ThemeDecoder.decodeBottomSheetThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeBottomSheetThemeData(entry);
    var decoded = ThemeDecoder.decodeBottomSheetThemeData(encoded);

    expect(
      encoded,
      {
        'backgroundColor': '#ff111111',
        'clipBehavior': 'antiAlias',
        'constraints': {
          'maxHeight': 40.0,
          'minHeight': 0.0,
          'minWidth': 0.0,
        },
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

    expect(ThemeDecoder.decodeBoxBorder(entry), entry);

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

    expect(ThemeDecoder.decodeBoxConstraints(entry), entry);

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
          blurStyle: BlurStyle.inner,
          color: Color(0xff111111),
        ),
        BoxShadow(
          blurStyle: BlurStyle.normal,
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
      image: DecorationImage(
        image: MemoryImage(base64Decode(base64Image)),
      ),
      shape: BoxShape.circle,
    );

    expect(ThemeDecoder.decodeBoxDecoration(entry), entry);

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
            'blurStyle': 'inner',
            'blurRadius': 0.0,
            'color': '#ff111111',
            'offset': {
              'dx': 0.0,
              'dy': 0.0,
            },
            'spreadRadius': 0.0,
          },
          {
            'blurStyle': 'normal',
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
          'focalRadius': 0.0,
          'radius': 0.5,
          'tileMode': 'clamp',
          'type': 'radial'
        },
        'image': {
          'alignment': 'center',
          'filterQuality': 'low',
          'image': {
            'bytes': base64Image,
            'scale': 1.0,
            'type': 'memory',
          },
          'invertColors': false,
          'isAntiAlias': false,
          'matchTextDirection': false,
          'opacity': 1.0,
          'repeat': 'noRepeat',
          'scale': 1.0,
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

    expect(
      ThemeDecoder.decodeBoxFit(
        BoxFit.contain,
      ),
      BoxFit.contain,
    );

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
      blurStyle: BlurStyle.outer,
      color: _kColor,
      offset: Offset(2.0, 3.0),
      spreadRadius: 4.0,
    );

    expect(ThemeDecoder.decodeBoxShadow(entry), entry);

    var encoded = ThemeEncoder.encodeBoxShadow(entry);
    var decoded = ThemeDecoder.decodeBoxShadow(encoded);

    expect(
      encoded,
      {
        'blurRadius': entry.blurRadius,
        'blurStyle': 'outer',
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

    expect(
      ThemeDecoder.decodeBoxShape(
        BoxShape.circle,
      ),
      BoxShape.circle,
    );

    expect(ThemeDecoder.decodeBoxShape('circle'), BoxShape.circle);
    expect(ThemeDecoder.decodeBoxShape('rectangle'), BoxShape.rectangle);

    expect(ThemeEncoder.encodeBoxShape(BoxShape.circle), 'circle');
    expect(ThemeEncoder.encodeBoxShape(BoxShape.rectangle), 'rectangle');
  });

  test('Brightness', () {
    expect(ThemeDecoder.decodeBrightness(null), null);
    expect(ThemeEncoder.encodeBrightness(null), null);

    expect(
      ThemeDecoder.decodeBrightness(
        Brightness.dark,
      ),
      Brightness.dark,
    );

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

    expect(ThemeDecoder.decodeButtonBarThemeData(entry), entry);

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
      ThemeDecoder.decodeButtonBarLayoutBehavior(
        ButtonBarLayoutBehavior.constrained,
      ),
      ButtonBarLayoutBehavior.constrained,
    );

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

  test('ButtonStyle', () {
    expect(ThemeDecoder.decodeButtonStyle(null), null);
    expect(ThemeEncoder.encodeButtonStyle(null), null);

    var entry = ButtonStyle(
      alignment: Alignment.bottomCenter,
      animationDuration: Duration(milliseconds: 1000),
      backgroundColor: MaterialStateProperty.all(
        Color(0xff555555),
      ),
      elevation: MaterialStateProperty.all(1.0),
      enableFeedback: false,
      fixedSize: MaterialStateProperty.all(
        Size(50.0, 50.0),
      ),
      foregroundColor: MaterialStateProperty.all(
        Color(0xff555555),
      ),
      maximumSize: MaterialStateProperty.all(
        Size(10.0, 10.0),
      ),
      minimumSize: MaterialStateProperty.all(
        Size(100.0, 100.0),
      ),
      mouseCursor: MaterialStateProperty.all(
        MouseCursor.defer,
      ),
      overlayColor: MaterialStateProperty.all(
        Color(0xff555555),
      ),
      padding: MaterialStateProperty.all(
        EdgeInsets.zero,
      ),
      shadowColor: MaterialStateProperty.all(
        Color(0xff555555),
      ),
      shape: MaterialStateProperty.all(
        CircleBorder(),
      ),
      side: MaterialStateProperty.all(
        BorderSide(),
      ),
      tapTargetSize: MaterialTapTargetSize.padded,
      textStyle: MaterialStateProperty.all(
        TextStyle(),
      ),
      visualDensity: VisualDensity.standard,
    );

    expect(ThemeDecoder.decodeButtonStyle(entry), entry);

    var encoded = ThemeEncoder.encodeButtonStyle(entry);
    var decoded = ThemeDecoder.decodeButtonStyle(encoded);

    expect(
      encoded,
      {
        'alignment': 'bottomCenter',
        'animationDuration': 1000,
        'backgroundColor': _materializeState('#ff555555'),
        'elevation': _materializeState(1.0),
        'enableFeedback': false,
        'fixedSize': _materializeState({
          'height': 50.0,
          'width': 50.0,
        }),
        'foregroundColor': _materializeState('#ff555555'),
        'maximumSize': _materializeState({
          'height': 10.0,
          'width': 10.0,
        }),
        'minimumSize': _materializeState({
          'height': 100.0,
          'width': 100.0,
        }),
        'mouseCursor': _materializeState({
          'type': 'defer',
        }),
        'overlayColor': _materializeState('#ff555555'),
        'padding': _materializeState({
          'bottom': 0.0,
          'left': 0.0,
          'right': 0.0,
          'top': 0.0,
        }),
        'shadowColor': _materializeState('#ff555555'),
        'shape': _materializeState({
          'side': {
            'color': '#ff000000',
            'style': 'none',
            'width': 0.0,
          },
          'type': 'circle'
        }),
        'side': _materializeState({
          'color': '#ff000000',
          'style': 'solid',
          'width': 1.0,
        }),
        'tapTargetSize': 'padded',
        'textStyle': _materializeState({
          'inherit': true,
        }),
        'visualDensity': 'standard',
      },
    );

    expect(
      _buttonStylesAreEqual(decoded, entry),
      true,
    );

    expect(
      _buttonStylesAreEqual(
        ThemeDecoder.decodeButtonStyle({
          'padding': [1, 2],
        }),
        ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 1, vertical: 2)),
        ),
      ),
      true,
    );

    expect(
      _buttonStylesAreEqual(
        ThemeDecoder.decodeButtonStyle({
          'padding': [1, 2, 3, 4],
        }),
        ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(1, 2, 3, 4)),
        ),
      ),
      true,
    );

    expect(
      _buttonStylesAreEqual(
        ThemeDecoder.decodeButtonStyle({'padding': 1}),
        ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(1)),
        ),
      ),
      true,
    );

    expect(
      _buttonStylesAreEqual(
        ThemeDecoder.decodeButtonStyle({
          'padding': {'left': 1, 'top': 2, 'right': 3, 'bottom': 4},
        }),
        ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(1, 2, 3, 4)),
        ),
      ),
      true,
    );
  });

  test('ButtonTextTheme', () {
    expect(ThemeDecoder.decodeButtonTextTheme(null), null);
    expect(ThemeEncoder.encodeButtonTextTheme(null), null);

    expect(
      ThemeDecoder.decodeButtonTextTheme(
        ButtonTextTheme.accent,
      ),
      ButtonTextTheme.accent,
    );

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

    expect(ThemeDecoder.decodeButtonThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeButtonThemeData(entry);
    var decoded = ThemeDecoder.decodeButtonThemeData({
      'alignedDropdown': true,
      'buttonColor': '#ff111111',
      'colorScheme': {
        'background': '#ff121212',
        'brightness': 'dark',
        'error': '#ffcf6679',
        'errorContainer': '#ffcf6679',
        'inversePrimary': '#ff000000',
        'inverseSurface': '#ffffffff',
        'onBackground': '#ffffffff',
        'onError': '#ff000000',
        'onErrorContainer': '#ff000000',
        'onInverseSurface': '#ff121212',
        'onPrimary': '#ff000000',
        'onPrimaryContainer': '#ff000000',
        'onSecondary': '#ff000000',
        'onSecondaryContainer': '#ff000000',
        'onSurface': '#ffffffff',
        'onSurfaceVariant': '#ffffffff',
        'onTertiary': '#ff000000',
        'onTertiaryContainer': '#ff000000',
        'outline': '#ffffffff',
        'primary': '#ffbb86fc',
        'primaryContainer': '#ffbb86fc',
        'secondary': '#ff03dac6',
        'secondaryContainer': '#ff03dac6',
        'shadow': '#ff000000',
        'surface': '#ff121212',
        'tertiary': '#ff03dac6',
        'tertiaryContainer': '#ff03dac6',
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
          'errorContainer': '#ffcf6679',
          'inversePrimary': '#ff000000',
          'inverseSurface': '#ffffffff',
          'onBackground': '#ffffffff',
          'onError': '#ff000000',
          'onErrorContainer': '#ff000000',
          'onInverseSurface': '#ff121212',
          'onPrimary': '#ff000000',
          'onPrimaryContainer': '#ff000000',
          'onSecondary': '#ff000000',
          'onSecondaryContainer': '#ff000000',
          'onSurface': '#ffffffff',
          'onSurfaceVariant': '#ffffffff',
          'onTertiary': '#ff000000',
          'onTertiaryContainer': '#ff000000',
          'outline': '#ffffffff',
          'primary': '#ffbb86fc',
          'primaryContainer': '#ffbb86fc',
          'secondary': '#ff03dac6',
          'secondaryContainer': '#ff03dac6',
          'shadow': '#ff000000',
          'surface': '#ff121212',
          'tertiary': '#ff03dac6',
          'tertiaryContainer': '#ff03dac6',
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
      decoded!.alignedDropdown,
      entry.alignedDropdown,
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

    expect(ThemeDecoder.decodeCardTheme(entry), entry);

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
  test('CheckboxThemeData', () {
    expect(ThemeDecoder.decodeCheckboxThemeData(null), null);
    expect(ThemeEncoder.encodeCheckboxThemeData(null), null);

    var entry = CheckboxThemeData(
      checkColor: MaterialStateProperty.all(_kColor),
      fillColor: MaterialStateProperty.all(_kColor),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      mouseCursor: MaterialStateProperty.all(MouseCursor.uncontrolled),
      overlayColor: MaterialStateProperty.all(_kColor),
      splashRadius: 2.0,
      visualDensity: VisualDensity.comfortable,
    );

    expect(ThemeDecoder.decodeCheckboxThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeCheckboxThemeData(entry);
    var decoded = ThemeDecoder.decodeCheckboxThemeData(encoded);

    expect(
      decoded!.checkColor!.resolve({MaterialState.error}),
      entry.checkColor!.resolve({MaterialState.error}),
    );
    expect(
      decoded.fillColor!.resolve({MaterialState.error}),
      entry.fillColor!.resolve({MaterialState.error}),
    );
    expect(
      decoded.materialTapTargetSize,
      entry.materialTapTargetSize,
    );
    expect(
      decoded.mouseCursor!.resolve({MaterialState.error}),
      entry.mouseCursor!.resolve({MaterialState.error}),
    );
    expect(
      decoded.overlayColor!.resolve({MaterialState.error}),
      entry.overlayColor!.resolve({MaterialState.error}),
    );
    expect(
      decoded.splashRadius,
      entry.splashRadius,
    );
    expect(
      decoded.visualDensity,
      entry.visualDensity,
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
      side: BorderSide(width: 2.0),
    );

    expect(ThemeDecoder.decodeChipThemeData(entry), entry);

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
        'showCheckmark': true,
        'side': {
          'color': '#ff000000',
          'style': 'solid',
          'width': 2.0,
        },
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

    expect(
      ThemeDecoder.decodeClip(
        Clip.antiAlias,
      ),
      Clip.antiAlias,
    );

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

    expect(ThemeDecoder.decodeColor(entry), entry);

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

    expect(ThemeDecoder.decodeColorScheme(entry), entry);

    var encoded = ThemeEncoder.encodeColorScheme(entry);
    var decoded = ThemeDecoder.decodeColorScheme(encoded);

    expect(
      encoded,
      {
        'background': '#ff121212',
        'brightness': 'dark',
        'error': '#ffcf6679',
        'errorContainer': '#ffcf6679',
        'inversePrimary': '#ff000000',
        'inverseSurface': '#ffffffff',
        'onBackground': '#ffffffff',
        'onError': '#ff000000',
        'onErrorContainer': '#ff000000',
        'onInverseSurface': '#ff121212',
        'onPrimary': '#ff000000',
        'onPrimaryContainer': '#ff000000',
        'onSecondary': '#ff000000',
        'onSecondaryContainer': '#ff000000',
        'onSurface': '#ffffffff',
        'onSurfaceVariant': '#ffffffff',
        'onTertiary': '#ff000000',
        'onTertiaryContainer': '#ff000000',
        'outline': '#ffffffff',
        'primary': '#ffbb86fc',
        'primaryContainer': '#ffbb86fc',
        'secondary': '#ff03dac6',
        'secondaryContainer': '#ff03dac6',
        'shadow': '#ff000000',
        'surface': '#ff121212',
        'tertiary': '#ff03dac6',
        'tertiaryContainer': '#ff03dac6',
      },
    );
    expect(
      decoded!.background,
      entry.background,
    );
  });

  test('CrossAxisAlignment', () {
    expect(ThemeDecoder.decodeCrossAxisAlignment(null), null);
    expect(ThemeEncoder.encodeCrossAxisAlignment(null), null);

    expect(
      ThemeDecoder.decodeCrossAxisAlignment(
        CrossAxisAlignment.baseline,
      ),
      CrossAxisAlignment.baseline,
    );

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

  test('CrossFadeState', () {
    expect(ThemeDecoder.decodeCrossFadeState(null), null);
    expect(ThemeEncoder.encodeCrossFadeState(null), null);

    expect(
      ThemeDecoder.decodeCrossFadeState(
        CrossFadeState.showFirst,
      ),
      CrossFadeState.showFirst,
    );

    expect(
      ThemeDecoder.decodeCrossFadeState('showFirst'),
      CrossFadeState.showFirst,
    );
    expect(
      ThemeDecoder.decodeCrossFadeState('showSecond'),
      CrossFadeState.showSecond,
    );

    expect(
      ThemeEncoder.encodeCrossFadeState(CrossFadeState.showFirst),
      'showFirst',
    );
    expect(
      ThemeEncoder.encodeCrossFadeState(CrossFadeState.showSecond),
      'showSecond',
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

    expect(ThemeDecoder.decodeCupertinoTextThemeData(entry), entry);

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
    )!;

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

    expect(ThemeDecoder.decodeCupertinoThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeCupertinoThemeData(entry);
    var decoded = ThemeDecoder.decodeCupertinoThemeData(encoded)!;

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

  test('DataTableThemeData', () {
    expect(ThemeDecoder.decodeDataTableThemeData(null), null);
    expect(ThemeEncoder.encodeDataTableThemeData(null), null);

    var entry = DataTableThemeData(
      checkboxHorizontalMargin: 24.0,
      columnSpacing: 1.0,
      dataRowColor: MaterialStateProperty.all(
        Color(0xff555555),
      ),
      dataRowHeight: 1.0,
      dataTextStyle: TextStyle(),
      decoration: BoxDecoration(color: _kColor),
      dividerThickness: 1.0,
      headingRowColor: MaterialStateProperty.all(
        Color(0xff555555),
      ),
      headingRowHeight: 1.0,
      headingTextStyle: TextStyle(),
      horizontalMargin: 1.0,
    );

    expect(ThemeDecoder.decodeDataTableThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeDataTableThemeData(entry);
    var decoded = ThemeDecoder.decodeDataTableThemeData(encoded);

    expect(
      encoded,
      {
        'checkboxHorizontalMargin': 24.0,
        'columnSpacing': 1.0,
        'dataRowColor': _materializeState('#ff555555'),
        'dataRowHeight': 1.0,
        'dataTextStyle': {
          'inherit': true,
        },
        'decoration': {
          'color': _kColorStr,
          'shape': 'rectangle',
        },
        'dividerThickness': 1.0,
        'headingRowColor': _materializeState('#ff555555'),
        'headingRowHeight': 1.0,
        'headingTextStyle': {
          'inherit': true,
        },
        'horizontalMargin': 1.0,
      },
    );

    bool? dataTableThemeDataAreEqual(Object? first, Object second) {
      bool? result;

      if (first.runtimeType != second.runtimeType) {
        result = false;
      } else if (first is! DataTableThemeData) {
        result = false;
      } else if (second is DataTableThemeData) {
        result = first.columnSpacing == second.columnSpacing &&
            first.dataRowColor?.resolve({}) ==
                second.dataRowColor?.resolve({}) &&
            first.dataRowHeight == second.dataRowHeight &&
            first.dataTextStyle == second.dataTextStyle &&
            first.dividerThickness == second.dividerThickness &&
            first.headingRowColor?.resolve({}) ==
                second.headingRowColor?.resolve({}) &&
            first.headingRowHeight == second.headingRowHeight &&
            first.headingTextStyle == second.headingTextStyle &&
            first.horizontalMargin == second.horizontalMargin;
      }

      return result;
    }

    expect(
      dataTableThemeDataAreEqual(decoded, entry),
      true,
    );
  });

  test('DecorationImage', () {
    expect(ThemeDecoder.decodeDecorationImage(null), null);
    expect(ThemeEncoder.encodeDecorationImage(null), null);

    var entry = DecorationImage(
      alignment: Alignment.bottomCenter,
      centerSlice: Rect.zero,
      filterQuality: FilterQuality.high,
      fit: BoxFit.contain,
      image: MemoryImage(base64Decode(base64Image)),
      invertColors: true,
      isAntiAlias: true,
      matchTextDirection: true,
      opacity: 0.5,
      repeat: ImageRepeat.repeat,
      scale: 2.0,
    );

    expect(ThemeDecoder.decodeDecorationImage(entry), entry);

    var encoded = ThemeEncoder.encodeDecorationImage(entry);
    var decoded = ThemeDecoder.decodeDecorationImage(encoded);

    expect(encoded, {
      'alignment': 'bottomCenter',
      'centerSlice': {
        'bottom': 0.0,
        'left': 0.0,
        'right': 0.0,
        'top': 0.0,
        'type': 'ltrb',
      },
      'filterQuality': 'high',
      'fit': 'contain',
      'image': {
        'bytes': base64Image,
        'scale': 1.0,
        'type': 'memory',
      },
      'invertColors': true,
      'isAntiAlias': true,
      'matchTextDirection': true,
      'opacity': 0.5,
      'repeat': 'repeat',
      'scale': 2.0,
    });

    expect(
      ThemeEncoder.encodeDecorationImage(decoded),
      {
        'alignment': 'bottomCenter',
        'centerSlice': {
          'bottom': 0.0,
          'left': 0.0,
          'right': 0.0,
          'top': 0.0,
          'type': 'ltrb',
        },
        'filterQuality': 'high',
        'fit': 'contain',
        'image': {
          'bytes': base64Image,
          'scale': 1.0,
          'type': 'memory',
        },
        'invertColors': true,
        'matchTextDirection': true,
        'isAntiAlias': true,
        'opacity': 0.5,
        'repeat': 'repeat',
        'scale': 2.0,
      },
    );
  });

  test('DecorationPosition', () {
    expect(
      ThemeDecoder.decodeDecorationPosition(null),
      null,
    );
    expect(
      ThemeEncoder.encodeDecorationPosition(null),
      null,
    );

    expect(
      ThemeDecoder.decodeDecorationPosition(
        DecorationPosition.background,
      ),
      DecorationPosition.background,
    );

    expect(
      ThemeDecoder.decodeDecorationPosition('background'),
      DecorationPosition.background,
    );
    expect(
      ThemeDecoder.decodeDecorationPosition('foreground'),
      DecorationPosition.foreground,
    );

    expect(
      ThemeEncoder.encodeDecorationPosition(DecorationPosition.background),
      'background',
    );
    expect(
      ThemeEncoder.encodeDecorationPosition(DecorationPosition.foreground),
      'foreground',
    );
  });

  test('DialogTheme', () {
    expect(ThemeDecoder.decodeDialogTheme(null), null);
    expect(ThemeEncoder.encodeDialogTheme(null), null);

    var entry = DialogTheme(
      alignment: Alignment.bottomLeft,
      backgroundColor: _kColor,
      contentTextStyle: _kTextStyle,
      elevation: 1.0,
      shape: RoundedRectangleBorder(),
    );

    expect(ThemeDecoder.decodeDialogTheme(entry), entry);

    var encoded = ThemeEncoder.encodeDialogTheme(entry);
    var decoded = ThemeDecoder.decodeDialogTheme(encoded);

    expect(
      encoded,
      {
        'alignment': 'bottomLeft',
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

    expect(ThemeDecoder.decodeDividerThemeData(entry), entry);

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
      ThemeDecoder.decodeDragStartBehavior(
        DragStartBehavior.down,
      ),
      DragStartBehavior.down,
    );

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

  test('DrawerThemeData', () {
    expect(ThemeDecoder.decodeDrawerThemeData(null), null);
    expect(ThemeEncoder.encodeDrawerThemeData(null), null);

    var entry = DrawerThemeData(
      backgroundColor: Color(0xff111111),
      elevation: 5,
      scrimColor: Color(0xff222222),
      shape: CircleBorder(
        side: BorderSide.none,
      ),
    );

    expect(ThemeDecoder.decodeDrawerThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeDrawerThemeData(entry);
    var decoded = ThemeDecoder.decodeDrawerThemeData(encoded);

    expect(
      encoded,
      {
        'backgroundColor': '#ff111111',
        'elevation': 5.0,
        'scrimColor': '#ff222222',
        'shape': {
          'side': {
            'color': '#ff000000',
            'style': 'none',
            'width': 0.0,
          },
          'type': 'circle'
        }
      },
    );
    expect(decoded, entry);
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

    expect(ThemeDecoder.decodeEdgeInsetsGeometry(entry), entry);

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

  test('ElevatedButtonThemeData', () {
    expect(ThemeDecoder.decodeElevatedButtonThemeData(null), null);
    expect(ThemeEncoder.encodeElevatedButtonThemeData(null), null);

    var entry = ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(0xff222222),
        ),
      ),
    );

    expect(ThemeDecoder.decodeElevatedButtonThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeElevatedButtonThemeData(entry);
    var decoded = ThemeDecoder.decodeElevatedButtonThemeData(encoded);

    expect(
      encoded,
      {
        'style': {
          'backgroundColor': _materializeState('#ff222222'),
        },
      },
    );

    bool? elevatedButtonThemeDatasAreEqual(Object? first, Object second) {
      bool? result;

      if (first.runtimeType != second.runtimeType) {
        result = false;
      } else if (first is! ElevatedButtonThemeData) {
        result = false;
      } else if (second is ElevatedButtonThemeData) {
        result = _buttonStylesAreEqual(first.style, second.style);
      }

      return result;
    }

    expect(
      elevatedButtonThemeDatasAreEqual(decoded, entry),
      true,
    );
  });

  test('FilterQuality', () {
    expect(ThemeDecoder.decodeFilterQuality(null), null);
    expect(ThemeEncoder.encodeFilterQuality(null), null);

    expect(
      ThemeDecoder.decodeFilterQuality(
        FilterQuality.high,
      ),
      FilterQuality.high,
    );

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

    expect(
      ThemeDecoder.decodeFlexFit(
        FlexFit.loose,
      ),
      FlexFit.loose,
    );

    expect(ThemeDecoder.decodeFlexFit('loose'), FlexFit.loose);
    expect(ThemeDecoder.decodeFlexFit('tight'), FlexFit.tight);

    expect(ThemeEncoder.encodeFlexFit(FlexFit.loose), 'loose');
    expect(ThemeEncoder.encodeFlexFit(FlexFit.tight), 'tight');
  });

  test('FloatingActionButtonAnimator', () {
    expect(ThemeDecoder.decodeFloatingActionButtonAnimator(null), null);
    expect(ThemeEncoder.encodeFloatingActionButtonAnimator(null), null);

    expect(
      ThemeDecoder.decodeFloatingActionButtonAnimator(
        FloatingActionButtonAnimator.scaling,
      ),
      FloatingActionButtonAnimator.scaling,
    );

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
      'centerTop': FloatingActionButtonLocation.centerTop,
      'endDocked': FloatingActionButtonLocation.endDocked,
      'endFloat': FloatingActionButtonLocation.endFloat,
      'endTop': FloatingActionButtonLocation.endTop,
      'miniCenterDocked': FloatingActionButtonLocation.miniCenterDocked,
      'miniCenterFloat': FloatingActionButtonLocation.miniCenterFloat,
      'miniCenterTop': FloatingActionButtonLocation.miniCenterTop,
      'miniEndDocked': FloatingActionButtonLocation.miniEndDocked,
      'miniEndFloat': FloatingActionButtonLocation.miniEndFloat,
      'miniEndTop': FloatingActionButtonLocation.miniEndTop,
      'miniStartDocked': FloatingActionButtonLocation.miniStartDocked,
      'miniStartFloat': FloatingActionButtonLocation.miniStartFloat,
      'miniStartTop': FloatingActionButtonLocation.miniStartTop,
      'startDocked': FloatingActionButtonLocation.startDocked,
      'startFloat': FloatingActionButtonLocation.startFloat,
      'startTop': FloatingActionButtonLocation.startTop,
    };

    values.forEach((key, value) {
      expect(ThemeDecoder.decodeFloatingActionButtonLocation(value), value);

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
      enableFeedback: true,
      extendedIconLabelSpacing: 1.0,
      extendedPadding: EdgeInsets.only(top: 2.0),
      extendedSizeConstraints: BoxConstraints(
        minHeight: 3.0,
        minWidth: 4.0,
      ),
      extendedTextStyle: TextStyle(color: _kColor),
      focusColor: Color(0xff222222),
      focusElevation: 3.0,
      foregroundColor: Color(0xff333333),
      highlightElevation: 4.0,
      hoverColor: Color(0xff444444),
      hoverElevation: 5.0,
      largeSizeConstraints: BoxConstraints(
        minHeight: 5.0,
        minWidth: 6.0,
      ),
      shape: RoundedRectangleBorder(),
      sizeConstraints: BoxConstraints(
        minHeight: 7.0,
        minWidth: 8.0,
      ),
      smallSizeConstraints: BoxConstraints(
        minHeight: 9.0,
        minWidth: 10.0,
      ),
      splashColor: Color(0xff555555),
    );

    expect(ThemeDecoder.decodeFloatingActionButtonThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeFloatingActionButtonThemeData(entry);
    var decoded = ThemeDecoder.decodeFloatingActionButtonThemeData(encoded);

    expect(
      encoded,
      {
        'backgroundColor': '#ff111111',
        'disabledElevation': 1.0,
        'elevation': 2.0,
        'enableFeedback': true,
        'extendedIconLabelSpacing': 1.0,
        'extendedPadding': {
          'bottom': 0.0,
          'left': 0.0,
          'right': 0.0,
          'top': 2.0,
        },
        'extendedSizeConstraints': {
          'minHeight': 3.0,
          'minWidth': 4.0,
        },
        'extendedTextStyle': {
          'color': _kColorStr,
          'inherit': true,
        },
        'focusColor': '#ff222222',
        'focusElevation': 3.0,
        'foregroundColor': '#ff333333',
        'highlightElevation': 4.0,
        'hoverColor': '#ff444444',
        'hoverElevation': 5.0,
        'largeSizeConstraints': {
          'minHeight': 5.0,
          'minWidth': 6.0,
        },
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
        'sizeConstraints': {
          'minHeight': 7.0,
          'minWidth': 8.0,
        },
        'smallSizeConstraints': {
          'minHeight': 9.0,
          'minWidth': 10.0,
        },
        'splashColor': '#ff555555'
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('FloatingLabelAlignment', () {
    expect(ThemeDecoder.decodeFloatingLabelAlignment(null), null);
    expect(ThemeEncoder.encodeFloatingLabelAlignment(null), null);

    expect(
      ThemeDecoder.decodeFloatingLabelAlignment(
        FloatingLabelAlignment.center,
      ),
      FloatingLabelAlignment.center,
    );

    expect(
      ThemeDecoder.decodeFloatingLabelAlignment('center'),
      FloatingLabelAlignment.center,
    );
    expect(
      ThemeDecoder.decodeFloatingLabelAlignment('start'),
      FloatingLabelAlignment.start,
    );

    expect(
      ThemeEncoder.encodeFloatingLabelAlignment(FloatingLabelAlignment.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeFloatingLabelAlignment(FloatingLabelAlignment.start),
      'start',
    );
  });

  test('FloatingLabelBehavior', () {
    expect(ThemeDecoder.decodeFloatingLabelBehavior(null), null);
    expect(ThemeEncoder.encodeFloatingLabelBehavior(null), null);

    expect(
      ThemeDecoder.decodeFloatingLabelBehavior(
        FloatingLabelBehavior.always,
      ),
      FloatingLabelBehavior.always,
    );

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

    expect(ThemeDecoder.decodeFontFeature(entry), entry);

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
      expect(ThemeDecoder.decodeFontWeight(value), value);

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

    expect(
      ThemeDecoder.decodeFontStyle(
        FontStyle.italic,
      ),
      FontStyle.italic,
    );

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

    expect(ThemeDecoder.decodeGradient(entry), entry);

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

    expect(ThemeDecoder.decodeGradientTransform(entry), entry);

    var encoded = ThemeEncoder.encodeGradientTransform(entry);
    var decoded = ThemeDecoder.decodeGradientTransform(encoded)!;

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
      ThemeDecoder.decodeHitTestBehavior(
        HitTestBehavior.deferToChild,
      ),
      HitTestBehavior.deferToChild,
    );

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

    expect(ThemeDecoder.decodeIconData(entry), entry);

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

    expect(ThemeDecoder.decodeIconThemeData(entry), entry);

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

  test('ImageProvider', () {
    expect(ThemeDecoder.decodeImageProvider(null), null);
    expect(ThemeEncoder.encodeImageProvider(null), null);

    var images = [
      {
        'assetName': 'asset',
        'package': 'package',
        'type': 'asset',
      },
      {
        'bytes': base64Image,
        'scale': 2.0,
        'type': 'memory',
      },
      {
        'headers': {'foo': 'bar'},
        'scale': 3.0,
        'type': 'network',
        'url': 'network',
      },
    ];

    for (var image in images) {
      var decoded = ThemeDecoder.decodeImageProvider(image);
      expect(ThemeDecoder.decodeImageProvider(decoded), decoded);
      expect(ThemeEncoder.encodeImageProvider(decoded), image);
    }
  });

  test('ImageRepeat', () {
    expect(ThemeDecoder.decodeImageRepeat(null), null);
    expect(ThemeEncoder.encodeImageRepeat(null), null);

    expect(
      ThemeDecoder.decodeImageRepeat(
        ImageRepeat.noRepeat,
      ),
      ImageRepeat.noRepeat,
    );

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

    expect(ThemeDecoder.decodeInputBorder(entry), entry);

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
      constraints: BoxConstraints(
        minHeight: 2.0,
        minWidth: 1.0,
      ),
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
      floatingLabelAlignment: FloatingLabelAlignment.center,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: TextStyle(color: Color(0x00000000)),
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
      iconColor: Color(0xff223322),
      isCollapsed: true,
      isDense: true,
      labelStyle: TextStyle(color: Color(0xff888888)),
      prefixIconColor: Color(0xff334433),
      prefixStyle: TextStyle(color: Color(0xff999999)),
      suffixIconColor: Color(0xff445544),
      suffixStyle: TextStyle(color: Color(0xff000000)),
    );

    expect(ThemeDecoder.decodeInputDecorationTheme(entry), entry);

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
        'constraints': {
          'minHeight': 2.0,
          'minWidth': 1.0,
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
        'floatingLabelAlignment': 'center',
        'floatingLabelBehavior': 'always',
        'floatingLabelStyle': {
          'color': '#00000000',
          'inherit': true,
        },
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
        'iconColor': '#ff223322',
        'isCollapsed': true,
        'isDense': true,
        'labelStyle': {
          'color': '#ff888888',
          'inherit': true,
        },
        'prefixIconColor': '#ff334433',
        'prefixStyle': {
          'color': '#ff999999',
          'inherit': true,
        },
        'suffixIconColor': '#ff445544',
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
      ThemeDecoder.decodeInteractiveInkFeatureFactory(
        InkSplash.splashFactory,
      ),
      InkSplash.splashFactory,
    );

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

  test('ListTileStyle', () {
    expect(ThemeDecoder.decodeListTileStyle(null), null);
    expect(ThemeEncoder.encodeListTileStyle(null), null);

    expect(
      ThemeDecoder.decodeListTileStyle(
        ListTileStyle.drawer,
      ),
      ListTileStyle.drawer,
    );

    expect(ThemeDecoder.decodeListTileStyle('drawer'), ListTileStyle.drawer);
    expect(ThemeDecoder.decodeListTileStyle('list'), ListTileStyle.list);

    expect(ThemeEncoder.encodeListTileStyle(ListTileStyle.drawer), 'drawer');
    expect(ThemeEncoder.encodeListTileStyle(ListTileStyle.list), 'list');
  });

  test('ListTileThemeData', () {
    expect(ThemeDecoder.decodeListTileThemeData(null), null);
    expect(ThemeEncoder.encodeListTileThemeData(null), null);

    var entry = ListTileThemeData(
      contentPadding: EdgeInsets.fromLTRB(
        1,
        2,
        3,
        4,
      ),
      dense: true,
      enableFeedback: false,
      horizontalTitleGap: 5,
      iconColor: Color(0xff111111),
      minLeadingWidth: 6,
      minVerticalPadding: 7,
      selectedColor: Color(0xff222222),
      selectedTileColor: Color(0xff333333),
      shape: ContinuousRectangleBorder(),
      style: ListTileStyle.drawer,
      textColor: Color(0xff444444),
      tileColor: Color(0xff555555),
    );

    var decoded = ThemeDecoder.decodeListTileThemeData(entry);
    var encoded = ThemeEncoder.encodeListTileThemeData(decoded);

    expect(
      encoded,
      {
        'contentPadding': {
          'left': 1,
          'top': 2,
          'right': 3,
          'bottom': 4,
        },
        'dense': true,
        'enableFeedback': false,
        'horizontalTitleGap': 5,
        'iconColor': '#ff111111',
        'minLeadingWidth': 6,
        'minVerticalPadding': 7,
        'selectedColor': '#ff222222',
        'selectedTileColor': '#ff333333',
        'shape': {
          'borderRadius': {
            'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'type': 'only'
          },
          'side': {'color': '#ff000000', 'style': 'none', 'width': 0.0},
          'type': 'rectangle',
        },
        'style': 'drawer',
        'textColor': '#ff444444',
        'tileColor': '#ff555555',
      },
    );

    expect(decoded, entry);
  });

  test('Locale', () {
    expect(ThemeDecoder.decodeLocale(null), null);
    expect(ThemeEncoder.encodeLocale(null), null);

    var entry = Locale('en', 'US');

    expect(ThemeDecoder.decodeLocale(entry), entry);

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
      ThemeDecoder.decodeMainAxisAlignment(
        MainAxisAlignment.center,
      ),
      MainAxisAlignment.center,
    );

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

    expect(
      ThemeDecoder.decodeMainAxisSize(
        MainAxisSize.max,
      ),
      MainAxisSize.max,
    );

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
      elevation: 5.5,
      leadingPadding: EdgeInsets.all(1.0),
      padding: EdgeInsets.all(2.0),
    );

    expect(ThemeDecoder.decodeMaterialBannerThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeMaterialBannerThemeData(entry);
    var decoded = ThemeDecoder.decodeMaterialBannerThemeData(encoded);

    expect(
      encoded,
      {
        'backgroundColor': _kColorStr,
        'contentTextStyle': _kTextStyleJson,
        'elevation': 5.5,
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
      100: _kColor,
      200: _kColor,
      300: _kColor,
      400: _kColor,
      500: _kColor,
      600: _kColor,
      700: _kColor,
      800: _kColor,
      900: _kColor,
    });

    expect(ThemeDecoder.decodeMaterialColor(entry), entry);

    var encoded = ThemeEncoder.encodeMaterialColor(entry);
    var decoded = ThemeDecoder.decodeMaterialColor(encoded);

    expect(
      encoded,
      {
        'primary': _kColorStr,
        'swatches': {
          '50': _kColorStr,
          '100': _kColorStr,
          '200': _kColorStr,
          '300': _kColorStr,
          '400': _kColorStr,
          '500': _kColorStr,
          '600': _kColorStr,
          '700': _kColorStr,
          '800': _kColorStr,
          '900': _kColorStr,
        }
      },
    );

    expect(ThemeEncoder.encodeMaterialColor(decoded), encoded);
  });

  test('MaterialStatePropertyBool', () {
    expect(ThemeDecoder.decodeMaterialStatePropertyBool(null), null);
    expect(ThemeEncoder.encodeMaterialStatePropertyBool(null), null);

    var states = {
      'disabled': MaterialState.disabled,
      'dragged': MaterialState.dragged,
      'error': MaterialState.error,
      'focused': MaterialState.focused,
      'hovered': MaterialState.hovered,
      'pressed': MaterialState.pressed,
      'scrolledUnder': MaterialState.scrolledUnder,
      'selected': MaterialState.selected,
    };

    var values = {
      'disabled': true,
      'dragged': true,
      'error': true,
      'focused': true,
      'hovered': false,
      'pressed': true,
      'scrolledUnder': false,
      'selected': false,
    };

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var value = values[stateKey];

      var decoded = ThemeDecoder.decodeMaterialStatePropertyBool(value);
      expect(decoded?.resolve({state}), value);

      decoded = ThemeDecoder.decodeMaterialStatePropertyBool(value.toString());
      expect(decoded?.resolve({state}), value);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyBool(decoded);
      expect(encoded![stateKey], value);
    }

    var func = (Set<MaterialState> states) =>
        states.isEmpty ? null : values[states.first];

    var prop = MaterialStateProperty.resolveWith(func);
    var decoded = ThemeDecoder.decodeMaterialStatePropertyBool(prop);
    for (var entry in states.entries) {
      var value = values[entry.value];

      expect(decoded!.resolve({entry.value}), value);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyBool(decoded);

      expect(encoded?[entry.key], value);
    }

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var value = values[stateKey];

      var decoded = ThemeDecoder.decodeMaterialStatePropertyBool(value);

      expect(decoded!.resolve({state}), value);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyBool(decoded);

      expect(encoded![stateKey], value);
    }
  });

  test('MaterialStatePropertyBorderSide', () {
    expect(ThemeDecoder.decodeMaterialStatePropertyBorderSide(null), null);
    expect(ThemeEncoder.encodeMaterialStatePropertyBorderSide(null), null);

    var states = {
      'disabled': MaterialState.disabled,
      'dragged': MaterialState.dragged,
      'error': MaterialState.error,
      'focused': MaterialState.focused,
      'hovered': MaterialState.hovered,
      'pressed': MaterialState.pressed,
      'scrolledUnder': MaterialState.scrolledUnder,
      'selected': MaterialState.selected,
    };

    var count = 1.0;
    var sides = <MaterialState, BorderSide>{};

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var side = BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: ++count,
      );
      sides[state] = side;

      var decoded = ThemeDecoder.decodeMaterialStatePropertyBorderSide(side);

      expect(decoded!.resolve({state}), side);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyBorderSide(decoded);

      expect(encoded![stateKey]['width'], side.width);
    }

    var func = (Set<MaterialState> states) =>
        states.isEmpty ? null : sides[states.first];

    var prop = MaterialStateProperty.resolveWith(func);
    var decoded = ThemeDecoder.decodeMaterialStatePropertyBorderSide(prop);
    for (var entry in states.entries) {
      var side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyBorderSide(decoded);

      expect(encoded![entry.key]['width'], side!.width);
    }

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var side = BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: ++count,
      );
      var encodedSide = ThemeEncoder.encodeBorderSide(side);

      var decoded = ThemeDecoder.decodeMaterialStatePropertyBorderSide(
        encodedSide,
      );

      expect(decoded!.resolve({state}), side);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyBorderSide(decoded);

      expect(encoded![stateKey]['width'], side.width);
    }
  });

  test('MaterialStatePropertyColor', () {
    expect(ThemeDecoder.decodeMaterialStatePropertyColor(null), null);
    expect(ThemeEncoder.encodeMaterialStatePropertyColor(null), null);

    var states = {
      'disabled': MaterialState.disabled,
      'dragged': MaterialState.dragged,
      'error': MaterialState.error,
      'focused': MaterialState.focused,
      'hovered': MaterialState.hovered,
      'pressed': MaterialState.pressed,
      'scrolledUnder': MaterialState.scrolledUnder,
      'selected': MaterialState.selected,
    };

    var colors = {
      'disabled': '#ff111111',
      'dragged': '#ff222222',
      'error': '#ff333333',
      'focused': '#ff444444',
      'hovered': '#ff555555',
      'pressed': '#ff666666',
      'scrolledUnder': '#ff888888',
      'selected': '#ff777777',
    };

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var colorStr = colors[stateKey];
      var color = ThemeDecoder.decodeColor(colorStr);

      var decoded = ThemeDecoder.decodeMaterialStatePropertyColor(color);
      expect(decoded!.resolve({state}), color);

      decoded = ThemeDecoder.decodeMaterialStatePropertyColor(colorStr);
      expect(decoded!.resolve({state}), color);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyColor(decoded);
      expect(encoded![stateKey], colorStr);
    }

    var func = (Set<MaterialState> states) =>
        states.isEmpty ? null : ThemeDecoder.decodeColor(colors[states.first]);

    var prop = MaterialStateProperty.resolveWith(func);
    var decoded = ThemeDecoder.decodeMaterialStatePropertyColor(prop);
    for (var entry in states.entries) {
      var colorStr = colors[entry.value];
      var color = ThemeDecoder.decodeColor(colorStr);

      expect(decoded!.resolve({entry.value}), color);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyColor(decoded);

      expect(encoded?[entry.key], colorStr);
    }

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var colorStr = colors[stateKey];
      var color = ThemeDecoder.decodeColor(colorStr);
      var encodedColor = ThemeEncoder.encodeColor(color);

      var decoded = ThemeDecoder.decodeMaterialStatePropertyColor(
        encodedColor,
      );

      expect(decoded!.resolve({state}), color);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyColor(decoded);

      expect(encoded![stateKey], colorStr);
    }
  });

  test('MaterialStatePropertyDouble', () {
    expect(ThemeDecoder.decodeMaterialStatePropertyDouble(null), null);
    expect(ThemeEncoder.encodeMaterialStatePropertyDouble(null), null);

    var states = {
      'disabled': MaterialState.disabled,
      'dragged': MaterialState.dragged,
      'error': MaterialState.error,
      'focused': MaterialState.focused,
      'hovered': MaterialState.hovered,
      'pressed': MaterialState.pressed,
      'scrolledUnder': MaterialState.scrolledUnder,
      'selected': MaterialState.selected,
    };

    var values = {
      'disabled': 1.0,
      'dragged': 2.0,
      'error': 3.0,
      'focused': 4.0,
      'hovered': 5.0,
      'pressed': 6.0,
      'scrolledUnder': 8.0,
      'selected': 7.0,
    };

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var value = values[stateKey];

      var decoded = ThemeDecoder.decodeMaterialStatePropertyDouble(value);
      expect(decoded!.resolve({state}), value);

      decoded =
          ThemeDecoder.decodeMaterialStatePropertyDouble(value.toString());
      expect(decoded!.resolve({state}), value);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyDouble(decoded);
      expect(encoded![stateKey], value);
    }

    var func = (Set<MaterialState> states) =>
        states.isEmpty ? null : values[states.first];

    var prop = MaterialStateProperty.resolveWith(func);
    var decoded = ThemeDecoder.decodeMaterialStatePropertyDouble(prop);
    for (var entry in states.entries) {
      var value = values[entry.value];

      expect(decoded!.resolve({entry.value}), value);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyDouble(decoded);

      expect(encoded?[entry.key], value);
    }

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var value = values[stateKey];

      var decoded = ThemeDecoder.decodeMaterialStatePropertyDouble(value);

      expect(decoded!.resolve({state}), value);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyDouble(decoded);

      expect(encoded![stateKey], value);
    }
  });

  test('MaterialStatePropertyEdgeInsetsGeometry', () {
    expect(
        ThemeDecoder.decodeMaterialStatePropertyEdgeInsetsGeometry(null), null);
    expect(
        ThemeEncoder.encodeMaterialStatePropertyEdgeInsetsGeometry(null), null);

    var states = {
      'disabled': MaterialState.disabled,
      'dragged': MaterialState.dragged,
      'error': MaterialState.error,
      'focused': MaterialState.focused,
      'hovered': MaterialState.hovered,
      'pressed': MaterialState.pressed,
      'scrolledUnder': MaterialState.scrolledUnder,
      'selected': MaterialState.selected,
    };

    var count = 1.0;
    var sides = <MaterialState, EdgeInsetsGeometry>{};

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var side = EdgeInsets.all(++count);
      sides[state] = side;

      var decoded =
          ThemeDecoder.decodeMaterialStatePropertyEdgeInsetsGeometry(side);

      expect(decoded!.resolve({state}), side);

      var encoded =
          ThemeEncoder.encodeMaterialStatePropertyEdgeInsetsGeometry(decoded);

      expect(encoded![stateKey]['bottom'], side.bottom);
    }

    var func = (Set<MaterialState> states) =>
        states.isEmpty ? null : sides[states.first];

    var prop = MaterialStateProperty.resolveWith(func);
    var decoded =
        ThemeDecoder.decodeMaterialStatePropertyEdgeInsetsGeometry(prop);
    for (var entry in states.entries) {
      var side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      var encoded =
          ThemeEncoder.encodeMaterialStatePropertyEdgeInsetsGeometry(decoded);

      expect(encoded![entry.key]['bottom'], (side as EdgeInsets).bottom);
    }

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var side = EdgeInsets.all(++count);
      var encodedSide = ThemeEncoder.encodeEdgeInsetsGeometry(side);

      var decoded = ThemeDecoder.decodeMaterialStatePropertyEdgeInsetsGeometry(
        encodedSide,
      );

      expect(decoded!.resolve({state}), side);

      var encoded =
          ThemeEncoder.encodeMaterialStatePropertyEdgeInsetsGeometry(decoded);

      expect(encoded![stateKey]['bottom'], side.bottom);
    }

    final symmetricDecoded =
        ThemeDecoder.decodeMaterialStatePropertyEdgeInsetsGeometry([1, 2]);
    for (var state in states.values) {
      expect(symmetricDecoded!.resolve({state}),
          EdgeInsets.symmetric(horizontal: 1, vertical: 2));
    }

    final ltrbDecoded =
        ThemeDecoder.decodeMaterialStatePropertyEdgeInsetsGeometry(
            [1, 2, 3, 4]);
    for (var state in states.values) {
      expect(ltrbDecoded!.resolve({state}), EdgeInsets.fromLTRB(1, 2, 3, 4));
    }

    final allDecoded =
        ThemeDecoder.decodeMaterialStatePropertyEdgeInsetsGeometry(1);
    for (var state in states.values) {
      expect(allDecoded!.resolve({state}), EdgeInsets.all(1));
    }
  });

  test('MaterialStatePropertyIconThemeData', () {
    expect(ThemeDecoder.decodeMaterialStatePropertyIconThemeData(null), null);
    expect(ThemeEncoder.encodeMaterialStatePropertyIconThemeData(null), null);

    var states = {
      'disabled': MaterialState.disabled,
      'dragged': MaterialState.dragged,
      'error': MaterialState.error,
      'focused': MaterialState.focused,
      'hovered': MaterialState.hovered,
      'pressed': MaterialState.pressed,
      'scrolledUnder': MaterialState.scrolledUnder,
      'selected': MaterialState.selected,
    };

    var icons = <MaterialState, IconThemeData>{};

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var icon = IconThemeData(
        color: _kColor,
        opacity: 0.5,
        size: 12.0,
      );
      icons[state] = icon;

      var decoded = ThemeDecoder.decodeMaterialStatePropertyIconThemeData(icon);

      expect(decoded!.resolve({state}), icon);

      var encoded =
          ThemeEncoder.encodeMaterialStatePropertyIconThemeData(decoded);

      expect(encoded![stateKey]['color'], _kColorStr);
    }

    var func = (Set<MaterialState> states) =>
        states.isEmpty ? null : icons[states.first];

    var prop = MaterialStateProperty.resolveWith(func);
    var decoded = ThemeDecoder.decodeMaterialStatePropertyIconThemeData(prop);
    for (var entry in states.entries) {
      var icon = icons[entry.value];

      expect(decoded!.resolve({entry.value}), icon);

      var encoded =
          ThemeEncoder.encodeMaterialStatePropertyIconThemeData(decoded);

      expect(encoded![entry.key]['color'], _kColorStr);
    }

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var icon = icons[state];
      var encodedSide = ThemeEncoder.encodeIconThemeData(icon);

      var decoded = ThemeDecoder.decodeMaterialStatePropertyIconThemeData(
        encodedSide,
      );

      expect(decoded!.resolve({state}), icon);

      var encoded =
          ThemeEncoder.encodeMaterialStatePropertyIconThemeData(decoded);

      expect(encoded![stateKey]['color'], _kColorStr);
    }
  });

  test('MaterialStatePropertyMouseCursor', () {
    expect(ThemeDecoder.decodeMaterialStatePropertyColor(null), null);
    expect(ThemeEncoder.encodeMaterialStatePropertyColor(null), null);

    var states = {
      'disabled': MaterialState.disabled,
      'dragged': MaterialState.dragged,
      'error': MaterialState.error,
      'focused': MaterialState.focused,
      'hovered': MaterialState.hovered,
      'pressed': MaterialState.pressed,
      'scrolledUnder': MaterialState.scrolledUnder,
      'selected': MaterialState.selected,
    };

    var cursors = {
      'disabled': {'type': 'system', 'cursor': 'alias'},
      'dragged': {'type': 'system', 'cursor': 'allScroll'},
      'error': {'type': 'system', 'cursor': 'basic'},
      'focused': {'type': 'system', 'cursor': 'cell'},
      'hovered': {'type': 'system', 'cursor': 'click'},
      'pressed': {'type': 'system', 'cursor': 'contextMenu'},
      'scrolledUnder': {'type': 'system', 'cursor': 'grab'},
      'selected': {'type': 'system', 'cursor': 'copy'},
    };

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var cursorStr = cursors[stateKey];
      var cursor = ThemeDecoder.decodeMouseCursor(cursorStr);

      var decoded = ThemeDecoder.decodeMaterialStatePropertyMouseCursor(cursor);
      expect(decoded!.resolve({state}), cursor);

      decoded = ThemeDecoder.decodeMaterialStatePropertyMouseCursor(cursorStr);
      expect(decoded!.resolve({state}), cursor);

      var encoded =
          ThemeEncoder.encodeMaterialStatePropertyMouseCursor(decoded);
      expect(encoded![stateKey], cursorStr);
    }

    var func = (Set<MaterialState> states) => states.isEmpty
        ? null
        : ThemeDecoder.decodeMouseCursor(cursors[states.first]);

    var prop = MaterialStateProperty.resolveWith(func);
    var decoded = ThemeDecoder.decodeMaterialStatePropertyMouseCursor(prop);
    for (var entry in states.entries) {
      var cursorStr = cursors[entry.value];
      var cursor = ThemeDecoder.decodeColor(cursorStr);

      expect(decoded!.resolve({entry.value}), cursor);

      var encoded =
          ThemeEncoder.encodeMaterialStatePropertyMouseCursor(decoded);

      expect(encoded?[entry.key], cursorStr);
    }

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var cursorStr = cursors[stateKey];
      var cursor = ThemeDecoder.decodeMouseCursor(cursorStr);
      var encodedCursor = ThemeEncoder.encodeMouseCursor(cursor);

      var decoded = ThemeDecoder.decodeMaterialStatePropertyMouseCursor(
        encodedCursor,
      );

      expect(decoded!.resolve({state}), cursor);

      var encoded =
          ThemeEncoder.encodeMaterialStatePropertyMouseCursor(decoded);

      expect(encoded![stateKey], cursorStr);
    }
  });

  test('MaterialStatePropertyOutlinedBorder', () {
    expect(ThemeDecoder.decodeMaterialStatePropertyOutlinedBorder(null), null);
    expect(ThemeEncoder.encodeMaterialStatePropertyOutlinedBorder(null), null);

    var states = {
      'disabled': MaterialState.disabled,
      'dragged': MaterialState.dragged,
      'error': MaterialState.error,
      'focused': MaterialState.focused,
      'hovered': MaterialState.hovered,
      'pressed': MaterialState.pressed,
      'scrolledUnder': MaterialState.scrolledUnder,
      'selected': MaterialState.selected,
    };

    var count = 1.0;
    var sides = <MaterialState, OutlinedBorder>{};

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var side = RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: ++count,
        ),
      );
      sides[state] = side;

      var decoded =
          ThemeDecoder.decodeMaterialStatePropertyOutlinedBorder(side);

      expect(decoded!.resolve({state}), side);

      var encoded =
          ThemeEncoder.encodeMaterialStatePropertyOutlinedBorder(decoded);

      expect(encoded![stateKey]['side']['width'], side.side.width);
    }

    var func = (Set<MaterialState> states) =>
        states.isEmpty ? null : sides[states.first];

    var prop = MaterialStateProperty.resolveWith(func);
    var decoded = ThemeDecoder.decodeMaterialStatePropertyOutlinedBorder(prop);
    for (var entry in states.entries) {
      var side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      var encoded =
          ThemeEncoder.encodeMaterialStatePropertyOutlinedBorder(decoded);

      expect(encoded![entry.key]['side']['width'], side!.side.width);
    }

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var side = sides[state];
      var encodedSide = ThemeEncoder.encodeOutlinedBorder(side);

      var decoded = ThemeDecoder.decodeMaterialStatePropertyOutlinedBorder(
        encodedSide,
      );

      expect(decoded!.resolve({state}), side);

      var encoded =
          ThemeEncoder.encodeMaterialStatePropertyOutlinedBorder(decoded);

      expect(encoded![stateKey]['side']['width'], side!.side.width);
    }
  });

  test('MaterialStatePropertySize', () {
    expect(
      ThemeDecoder.decodeMaterialStatePropertySize(null),
      null,
    );
    expect(
      ThemeEncoder.encodeMaterialStatePropertySize(null),
      null,
    );

    var states = {
      'disabled': MaterialState.disabled,
      'dragged': MaterialState.dragged,
      'error': MaterialState.error,
      'focused': MaterialState.focused,
      'hovered': MaterialState.hovered,
      'pressed': MaterialState.pressed,
      'scrolledUnder': MaterialState.scrolledUnder,
      'selected': MaterialState.selected,
    };

    var count = 1.0;
    var sides = <MaterialState, Size>{};

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var side = Size(
        ++count,
        ++count,
      );
      sides[state] = side;

      var decoded = ThemeDecoder.decodeMaterialStatePropertySize(side);

      expect(decoded!.resolve({state}), side);

      var encoded = ThemeEncoder.encodeMaterialStatePropertySize(decoded);

      expect(encoded![stateKey]['width'], side.width);
    }

    var func = (Set<MaterialState> states) =>
        states.isEmpty ? null : sides[states.first];

    var prop = MaterialStateProperty.resolveWith(func);
    var decoded = ThemeDecoder.decodeMaterialStatePropertySize(prop);
    for (var entry in states.entries) {
      var side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      var encoded = ThemeEncoder.encodeMaterialStatePropertySize(decoded);

      expect(encoded![entry.key]['width'], side!.width);
    }

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var side = sides[state];
      var encodedSide = ThemeEncoder.encodeSize(side);

      var decoded = ThemeDecoder.decodeMaterialStatePropertySize(
        encodedSide,
      );

      expect(decoded!.resolve({state}), side);

      var encoded = ThemeEncoder.encodeMaterialStatePropertySize(decoded);

      expect(encoded![stateKey]['width'], side!.width);
    }
  });

  test('MaterialStatePropertyTextStyle', () {
    expect(ThemeDecoder.decodeMaterialStatePropertyTextStyle(null), null);
    expect(ThemeEncoder.encodeMaterialStatePropertyTextStyle(null), null);

    var states = {
      'disabled': MaterialState.disabled,
      'dragged': MaterialState.dragged,
      'error': MaterialState.error,
      'focused': MaterialState.focused,
      'hovered': MaterialState.hovered,
      'pressed': MaterialState.pressed,
      'scrolledUnder': MaterialState.scrolledUnder,
      'selected': MaterialState.selected,
    };

    var count = 1.0;
    var sides = <MaterialState, TextStyle>{};

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var side = TextStyle(fontSize: ++count);
      sides[state] = side;

      var decoded = ThemeDecoder.decodeMaterialStatePropertyTextStyle(side);

      expect(decoded!.resolve({state}), side);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyTextStyle(decoded);

      expect(encoded![stateKey]['fontSize'], side.fontSize);
    }

    var func = (Set<MaterialState> states) =>
        states.isEmpty ? null : sides[states.first];

    var prop = MaterialStateProperty.resolveWith(func);
    var decoded = ThemeDecoder.decodeMaterialStatePropertyTextStyle(prop);
    for (var entry in states.entries) {
      var side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyTextStyle(decoded);

      expect(encoded![entry.key]['fontSize'], side!.fontSize);
    }

    for (var entry in states.entries) {
      var stateKey = entry.key;
      var state = entry.value;

      var side = sides[state];
      var encodedSide = ThemeEncoder.encodeTextStyle(side);

      var decoded = ThemeDecoder.decodeMaterialStatePropertyTextStyle(
        encodedSide,
      );

      expect(decoded!.resolve({state}), side);

      var encoded = ThemeEncoder.encodeMaterialStatePropertyTextStyle(decoded);

      expect(encoded![stateKey]['fontSize'], side!.fontSize);
    }
  });

  test('MaterialTapTargetSize', () {
    expect(ThemeDecoder.decodeMaterialTapTargetSize(null), null);
    expect(ThemeEncoder.encodeMaterialTapTargetSize(null), null);

    expect(
      ThemeDecoder.decodeMaterialTapTargetSize(
        MaterialTapTargetSize.padded,
      ),
      MaterialTapTargetSize.padded,
    );

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

    expect(
      ThemeDecoder.decodeMaterialType(
        MaterialType.button,
      ),
      MaterialType.button,
    );

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

    expect(ThemeDecoder.decodeMatrix4(entry), entry);

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

  test('MaxLengthEnforcement', () {
    expect(ThemeDecoder.decodeMaxLengthEnforcement(null), null);
    expect(ThemeEncoder.encodeMaxLengthEnforcement(null), null);

    expect(
      ThemeDecoder.decodeMaxLengthEnforcement('enforced'),
      MaxLengthEnforcement.enforced,
    );
    expect(
      ThemeDecoder.decodeMaxLengthEnforcement('none'),
      MaxLengthEnforcement.none,
    );
    expect(
      ThemeDecoder.decodeMaxLengthEnforcement('truncateAfterCompositionEnds'),
      MaxLengthEnforcement.truncateAfterCompositionEnds,
    );

    expect(
        ThemeEncoder.encodeMaxLengthEnforcement(MaxLengthEnforcement.enforced),
        'enforced');
    expect(
      ThemeEncoder.encodeMaxLengthEnforcement(MaxLengthEnforcement.none),
      'none',
    );
    expect(
      ThemeEncoder.encodeMaxLengthEnforcement(
          MaxLengthEnforcement.truncateAfterCompositionEnds),
      'truncateAfterCompositionEnds',
    );
  });

  test('MouseCursor', () {
    expect(ThemeDecoder.decodeMouseCursor(null), null);
    expect(ThemeEncoder.encodeMouseCursor(null), null);

    expect(
      ThemeDecoder.decodeMouseCursor(
        MouseCursor.defer,
      ),
      MouseCursor.defer,
    );

    expect(
      ThemeDecoder.decodeMouseCursor({'type': 'defer'}),
      MouseCursor.defer,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'clickable',
        'type': 'material',
      }),
      MaterialStateMouseCursor.clickable,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'textable',
        'type': 'material',
      }),
      MaterialStateMouseCursor.textable,
    );

    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'alias',
        'type': 'system',
      }),
      SystemMouseCursors.alias,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'allScroll',
        'type': 'system',
      }),
      SystemMouseCursors.allScroll,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'basic',
        'type': 'system',
      }),
      SystemMouseCursors.basic,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'cell',
        'type': 'system',
      }),
      SystemMouseCursors.cell,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'click',
        'type': 'system',
      }),
      SystemMouseCursors.click,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'contextMenu',
        'type': 'system',
      }),
      SystemMouseCursors.contextMenu,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'copy',
        'type': 'system',
      }),
      SystemMouseCursors.copy,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'disappearing',
        'type': 'system',
      }),
      SystemMouseCursors.disappearing,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'forbidden',
        'type': 'system',
      }),
      SystemMouseCursors.forbidden,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'grab',
        'type': 'system',
      }),
      SystemMouseCursors.grab,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'grabbing',
        'type': 'system',
      }),
      SystemMouseCursors.grabbing,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'help',
        'type': 'system',
      }),
      SystemMouseCursors.help,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'move',
        'type': 'system',
      }),
      SystemMouseCursors.move,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'noDrop',
        'type': 'system',
      }),
      SystemMouseCursors.noDrop,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'none',
        'type': 'system',
      }),
      SystemMouseCursors.none,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'precise',
        'type': 'system',
      }),
      SystemMouseCursors.precise,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'progress',
        'type': 'system',
      }),
      SystemMouseCursors.progress,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeColumn',
        'type': 'system',
      }),
      SystemMouseCursors.resizeColumn,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeDown',
        'type': 'system',
      }),
      SystemMouseCursors.resizeDown,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeDownLeft',
        'type': 'system',
      }),
      SystemMouseCursors.resizeDownLeft,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeDownRight',
        'type': 'system',
      }),
      SystemMouseCursors.resizeDownRight,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeLeft',
        'type': 'system',
      }),
      SystemMouseCursors.resizeLeft,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeRight',
        'type': 'system',
      }),
      SystemMouseCursors.resizeRight,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeRow',
        'type': 'system',
      }),
      SystemMouseCursors.resizeRow,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeUp',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUp,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeUpDown',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpDown,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeUpLeft',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpLeft,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeUpLeftDownRight',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpLeftDownRight,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeUpRight',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpRight,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeUpRightDownLeft',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpRightDownLeft,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'text',
        'type': 'system',
      }),
      SystemMouseCursors.text,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'verticalText',
        'type': 'system',
      }),
      SystemMouseCursors.verticalText,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'wait',
        'type': 'system',
      }),
      SystemMouseCursors.wait,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'zoomIn',
        'type': 'system',
      }),
      SystemMouseCursors.zoomIn,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'zoomOut',
        'type': 'system',
      }),
      SystemMouseCursors.zoomOut,
    );

    expect(
      ThemeDecoder.decodeMouseCursor({'type': 'uncontrolled'}),
      MouseCursor.uncontrolled,
    );

    expect(
      ThemeEncoder.encodeMouseCursor(
        MouseCursor.defer,
      ),
      {'type': 'defer'},
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        MaterialStateMouseCursor.clickable,
      ),
      {
        'cursor': 'clickable',
        'type': 'material',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        MaterialStateMouseCursor.textable,
      ),
      {
        'cursor': 'textable',
        'type': 'material',
      },
    );

    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.alias,
      ),
      {
        'cursor': 'alias',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.allScroll,
      ),
      {
        'cursor': 'allScroll',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.basic,
      ),
      {
        'cursor': 'basic',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.cell,
      ),
      {
        'cursor': 'cell',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.click,
      ),
      {
        'cursor': 'click',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.contextMenu,
      ),
      {
        'cursor': 'contextMenu',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.copy,
      ),
      {
        'cursor': 'copy',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.disappearing,
      ),
      {
        'cursor': 'disappearing',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.forbidden,
      ),
      {
        'cursor': 'forbidden',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.grab,
      ),
      {
        'cursor': 'grab',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.grabbing,
      ),
      {
        'cursor': 'grabbing',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.help,
      ),
      {
        'cursor': 'help',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.move,
      ),
      {
        'cursor': 'move',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.noDrop,
      ),
      {
        'cursor': 'noDrop',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.none,
      ),
      {
        'cursor': 'none',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.precise,
      ),
      {
        'cursor': 'precise',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.progress,
      ),
      {
        'cursor': 'progress',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeColumn,
      ),
      {
        'cursor': 'resizeColumn',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeDown,
      ),
      {
        'cursor': 'resizeDown',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeDownLeft,
      ),
      {
        'cursor': 'resizeDownLeft',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeDownRight,
      ),
      {
        'cursor': 'resizeDownRight',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeLeft,
      ),
      {
        'cursor': 'resizeLeft',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeRight,
      ),
      {
        'cursor': 'resizeRight',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeRow,
      ),
      {
        'cursor': 'resizeRow',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeUp,
      ),
      {
        'cursor': 'resizeUp',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeUpDown,
      ),
      {
        'cursor': 'resizeUpDown',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeUpLeft,
      ),
      {
        'cursor': 'resizeUpLeft',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeUpLeftDownRight,
      ),
      {
        'cursor': 'resizeUpLeftDownRight',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeUpRight,
      ),
      {
        'cursor': 'resizeUpRight',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.resizeUpRightDownLeft,
      ),
      {
        'cursor': 'resizeUpRightDownLeft',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.text,
      ),
      {
        'cursor': 'text',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.verticalText,
      ),
      {
        'cursor': 'verticalText',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.wait,
      ),
      {
        'cursor': 'wait',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.zoomIn,
      ),
      {
        'cursor': 'zoomIn',
        'type': 'system',
      },
    );
    expect(
      ThemeEncoder.encodeMouseCursor(
        SystemMouseCursors.zoomOut,
      ),
      {
        'cursor': 'zoomOut',
        'type': 'system',
      },
    );

    expect(
      ThemeEncoder.encodeMouseCursor(
        MouseCursor.uncontrolled,
      ),
      {'type': 'uncontrolled'},
    );
  });

  test('NavigationDestinationLabelBehavior', () {
    expect(ThemeDecoder.decodeNavigationDestinationLabelBehavior(null), null);
    expect(ThemeEncoder.encodeNavigationDestinationLabelBehavior(null), null);

    expect(
      ThemeDecoder.decodeNavigationDestinationLabelBehavior(
        NavigationDestinationLabelBehavior.alwaysHide,
      ),
      NavigationDestinationLabelBehavior.alwaysHide,
    );

    expect(
      ThemeDecoder.decodeNavigationDestinationLabelBehavior(
        'alwaysHide',
      ),
      NavigationDestinationLabelBehavior.alwaysHide,
    );
    expect(
      ThemeDecoder.decodeNavigationDestinationLabelBehavior(
        'alwaysShow',
      ),
      NavigationDestinationLabelBehavior.alwaysShow,
    );
    expect(
      ThemeDecoder.decodeNavigationDestinationLabelBehavior(
        'onlyShowSelected',
      ),
      NavigationDestinationLabelBehavior.onlyShowSelected,
    );

    expect(
      ThemeEncoder.encodeNavigationDestinationLabelBehavior(
        NavigationDestinationLabelBehavior.alwaysHide,
      ),
      'alwaysHide',
    );
    expect(
      ThemeEncoder.encodeNavigationDestinationLabelBehavior(
        NavigationDestinationLabelBehavior.alwaysShow,
      ),
      'alwaysShow',
    );
    expect(
      ThemeEncoder.encodeNavigationDestinationLabelBehavior(
          NavigationDestinationLabelBehavior.onlyShowSelected),
      'onlyShowSelected',
    );
  });

  test('NavigationRailLabelType', () {
    expect(ThemeDecoder.decodeNavigationRailLabelType(null), null);
    expect(ThemeEncoder.encodeNavigationRailLabelType(null), null);

    expect(
      ThemeDecoder.decodeNavigationRailLabelType(
        NavigationRailLabelType.all,
      ),
      NavigationRailLabelType.all,
    );

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

  test('NavigationBarThemeData', () {
    expect(ThemeDecoder.decodeNavigationBarThemeData(null), null);
    expect(ThemeEncoder.encodeNavigationBarThemeData(null), null);

    var entry = NavigationBarThemeData(
      backgroundColor: Color(0xff111111),
      height: 12.0,
      indicatorColor: Color(0xff222222),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    );

    var encoded = ThemeEncoder.encodeNavigationBarThemeData(entry);
    var decoded = ThemeDecoder.decodeNavigationBarThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'height': 12.0,
      'indicatorColor': '#ff222222',
      'labelBehavior': 'onlyShowSelected',
    });
    expect(ThemeEncoder.encodeNavigationBarThemeData(decoded), encoded);
  });

  test('NavigationRailThemeData', () {
    expect(ThemeDecoder.decodeNavigationRailThemeData(null), null);
    expect(ThemeEncoder.encodeNavigationRailThemeData(null), null);

    var entry = NavigationRailThemeData(
      backgroundColor: Color(0xff111111),
      elevation: 1.0,
      groupAlignment: 2.0,
      indicatorColor: Color(0xff666666),
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
      useIndicator: true,
    );

    expect(ThemeDecoder.decodeNavigationRailThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeNavigationRailThemeData(entry);
    var decoded = ThemeDecoder.decodeNavigationRailThemeData(encoded);

    expect(
      encoded,
      {
        'backgroundColor': '#ff111111',
        'elevation': 1.0,
        'groupAlignment': 2.0,
        'indicatorColor': '#ff666666',
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
        'useIndicator': true,
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

    var entry = CircularNotchedRectangle();
    expect(
      ThemeDecoder.decodeNotchedShape(entry),
      entry,
    );
    expect(
      ThemeDecoder.decodeNotchedShape('circular')?.runtimeType,
      CircularNotchedRectangle().runtimeType,
    );
    expect(
      ThemeEncoder.encodeNotchedShape(CircularNotchedRectangle()),
      'circular',
    );
  });

  test('OrdinalSortKey', () {
    expect(ThemeDecoder.decodeOrdinalSortKey(null), null);
    expect(ThemeEncoder.encodeOrdinalSortKey(null), null);

    var entry = OrdinalSortKey(
      1.0,
      name: 'foo',
    );

    expect(ThemeDecoder.decodeOrdinalSortKey(entry), entry);

    var encoded = ThemeEncoder.encodeOrdinalSortKey(entry);
    var decoded = ThemeDecoder.decodeOrdinalSortKey(encoded);

    expect(
      encoded,
      {
        'name': 'foo',
        'order': 1.0,
      },
    );

    expect(
      decoded!.name,
      entry.name,
    );
    expect(
      decoded.order,
      entry.order,
    );
  });

  test('Offset', () {
    expect(ThemeDecoder.decodeOffset(null), null);
    expect(ThemeEncoder.encodeOffset(null), null);

    var entry = Offset(
      1.0,
      2.0,
    );

    expect(ThemeDecoder.decodeOffset(entry), entry);

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

  test('OutlinedBorder', () {
    expect(ThemeDecoder.decodeOutlinedBorder(null), null);
    expect(ThemeEncoder.encodeOutlinedBorder(null), null);

    OutlinedBorder entry = BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    expect(ThemeDecoder.decodeOutlinedBorder(entry), entry);

    var encoded = ThemeEncoder.encodeOutlinedBorder(entry);
    var decoded = ThemeDecoder.decodeOutlinedBorder(encoded);

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
        'type': 'beveled',
      },
    );

    expect(
      decoded,
      entry,
    );

    entry = CircleBorder(
      side: BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    encoded = ThemeEncoder.encodeOutlinedBorder(entry);
    decoded = ThemeDecoder.decodeOutlinedBorder(encoded);

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

    encoded = ThemeEncoder.encodeOutlinedBorder(entry);
    decoded = ThemeDecoder.decodeOutlinedBorder(encoded);

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

    encoded = ThemeEncoder.encodeOutlinedBorder(entry);
    decoded = ThemeDecoder.decodeOutlinedBorder(encoded);

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

    entry = StadiumBorder(
      side: BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    encoded = ThemeEncoder.encodeOutlinedBorder(entry);
    decoded = ThemeDecoder.decodeOutlinedBorder(encoded);

    expect(
      encoded,
      {
        'side': {
          'color': _kColorStr,
          'style': 'solid',
          'width': 1.0,
        },
        'type': 'stadium',
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('OutlinedButtonThemeData', () {
    expect(ThemeDecoder.decodeOutlinedButtonThemeData(null), null);
    expect(ThemeEncoder.encodeOutlinedButtonThemeData(null), null);

    var entry = OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(0xff222222),
        ),
      ),
    );

    expect(ThemeDecoder.decodeOutlinedButtonThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeOutlinedButtonThemeData(entry);
    var decoded = ThemeDecoder.decodeOutlinedButtonThemeData(encoded);

    expect(
      encoded,
      {
        'style': {
          'backgroundColor': _materializeState('#ff222222'),
        },
      },
    );

    bool? outlinedButtonThemeDatasAreEqual(Object? first, Object second) {
      bool? result;

      if (first.runtimeType != second.runtimeType) {
        result = false;
      } else if (first is! OutlinedButtonThemeData) {
        result = false;
      } else if (second is OutlinedButtonThemeData) {
        result = _buttonStylesAreEqual(first.style, second.style);
      }

      return result;
    }

    expect(
      outlinedButtonThemeDatasAreEqual(decoded, entry),
      true,
    );
  });

  test('PageTransitionsBuilder', () {
    expect(ThemeDecoder.decodePageTransitionsBuilder(null), null);
    expect(ThemeEncoder.encodePageTransitionsBuilder(null), null);

    expect(
      ThemeDecoder.decodePageTransitionsBuilder('cupertino').runtimeType,
      CupertinoPageTransitionsBuilder,
    );
    expect(
      ThemeDecoder.decodePageTransitionsBuilder('fadeUpwards').runtimeType,
      FadeUpwardsPageTransitionsBuilder,
    );
    expect(
      ThemeDecoder.decodePageTransitionsBuilder('openUpwards').runtimeType,
      OpenUpwardsPageTransitionsBuilder,
    );
    expect(
      ThemeDecoder.decodePageTransitionsBuilder('zoom').runtimeType,
      ZoomPageTransitionsBuilder,
    );

    expect(
      ThemeEncoder.encodePageTransitionsBuilder(
        CupertinoPageTransitionsBuilder(),
      ),
      'cupertino',
    );
    expect(
      ThemeEncoder.encodePageTransitionsBuilder(
        FadeUpwardsPageTransitionsBuilder(),
      ),
      'fadeUpwards',
    );
    expect(
      ThemeEncoder.encodePageTransitionsBuilder(
        OpenUpwardsPageTransitionsBuilder(),
      ),
      'openUpwards',
    );
    expect(
      ThemeEncoder.encodePageTransitionsBuilder(
        ZoomPageTransitionsBuilder(),
      ),
      'zoom',
    );
  });

  test('PageTransitionsTheme', () {
    expect(ThemeDecoder.decodePageTransitionsTheme(null), null);
    expect(ThemeEncoder.encodePageTransitionsTheme(null), null);

    var builders = {
      TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.windows: ZoomPageTransitionsBuilder(),
    };

    var encoded = ThemeEncoder.encodePageTransitionsTheme(
      PageTransitionsTheme(builders: builders),
    );

    expect(
      encoded,
      {
        'builders': {
          'fuchsia': 'cupertino',
          'linux': 'fadeUpwards',
          'macOS': 'openUpwards',
          'windows': 'zoom',
        },
      },
    );

    var decoded = ThemeDecoder.decodePageTransitionsTheme(encoded);
    for (var entry in builders.entries) {
      expect(
        decoded?.builders[entry.key]?.runtimeType,
        entry.value.runtimeType,
      );
    }
  });

  test('PopupMenuThemeData', () {
    expect(ThemeDecoder.decodePopupMenuThemeData(null), null);
    expect(ThemeEncoder.encodePopupMenuThemeData(null), null);

    var entry = PopupMenuThemeData(
      color: _kColor,
      elevation: 1.0,
      enableFeedback: true,
      shape: RoundedRectangleBorder(),
      textStyle: _kTextStyle,
    );

    expect(ThemeDecoder.decodePopupMenuThemeData(entry), entry);

    var encoded = ThemeEncoder.encodePopupMenuThemeData(entry);
    var decoded = ThemeDecoder.decodePopupMenuThemeData(encoded);

    expect(
      encoded,
      {
        'color': '#00123456',
        'elevation': 1.0,
        'enableFeedback': true,
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

  test('ProgressIndicatorThemeData', () {
    expect(ThemeDecoder.decodeProgressIndicatorThemeData(null), null);
    expect(ThemeEncoder.encodeProgressIndicatorThemeData(null), null);

    var entry = ProgressIndicatorThemeData(
      circularTrackColor: _kColor,
      color: _kColor,
      linearMinHeight: 16.0,
      linearTrackColor: _kColor,
      refreshBackgroundColor: _kColor,
    );

    expect(ThemeDecoder.decodeProgressIndicatorThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeProgressIndicatorThemeData(entry);
    var decoded = ThemeDecoder.decodeProgressIndicatorThemeData(encoded);

    expect(
      encoded,
      {
        'circularTrackColor': _kColorStr,
        'color': _kColorStr,
        'linearMinHeight': 16.0,
        'linearTrackColor': _kColorStr,
        'refreshBackgroundColor': _kColorStr,
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('RadioThemeData', () {
    expect(ThemeDecoder.decodeRadioThemeData(null), null);
    expect(ThemeEncoder.encodeRadioThemeData(null), null);

    var entry = RadioThemeData(
      fillColor: MaterialStateProperty.all(_kColor),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      mouseCursor: MaterialStateProperty.all(MouseCursor.uncontrolled),
      overlayColor: MaterialStateProperty.all(_kColor),
      splashRadius: 2.0,
      visualDensity: VisualDensity.comfortable,
    );

    expect(ThemeDecoder.decodeRadioThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeRadioThemeData(entry);
    var decoded = ThemeDecoder.decodeRadioThemeData(encoded);

    expect(
      decoded!.fillColor!.resolve({MaterialState.error}),
      entry.fillColor!.resolve({MaterialState.error}),
    );
    expect(
      decoded.materialTapTargetSize,
      entry.materialTapTargetSize,
    );
    expect(
      decoded.mouseCursor!.resolve({MaterialState.error}),
      entry.mouseCursor!.resolve({MaterialState.error}),
    );
    expect(
      decoded.overlayColor!.resolve({MaterialState.error}),
      entry.overlayColor!.resolve({MaterialState.error}),
    );
    expect(
      decoded.splashRadius,
      entry.splashRadius,
    );
    expect(
      decoded.visualDensity,
      entry.visualDensity,
    );
  });
  test('Radius', () {
    expect(ThemeDecoder.decodeRadius(null), null);
    expect(ThemeEncoder.encodeRadius(null), null);

    var entry = Radius.circular(1.0);

    expect(ThemeDecoder.decodeRadius(entry), entry);

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
      elevation: 3.0,
      enabledThumbRadius: 2.0,
      pressedElevation: 4.0,
    );

    expect(ThemeDecoder.decodeRangeSliderThumbShape(entry), entry);

    var encoded = ThemeEncoder.encodeRangeSliderThumbShape(entry);
    var decoded = ThemeDecoder.decodeRangeSliderThumbShape(encoded)
        as RoundRangeSliderThumbShape;

    expect(
      encoded,
      {
        'disabledThumbRadius': 1.0,
        'elevation': 3.0,
        'enabledThumbRadius': 2.0,
        'pressedElevation': 4.0,
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

    expect(ThemeDecoder.decodeRangeSliderTickMarkShape(entry), entry);

    var encoded = ThemeEncoder.encodeRangeSliderTickMarkShape(entry);
    var decoded = ThemeDecoder.decodeRangeSliderTickMarkShape(encoded)
        as RoundRangeSliderTickMarkShape;

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

    expect(ThemeDecoder.decodeRangeSliderTrackShape(entry), entry);

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

    expect(ThemeDecoder.decodeRangeSliderValueIndicatorShape(entry), entry);

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

    var entry2 = RectangularRangeSliderValueIndicatorShape();

    var encoded2 = ThemeEncoder.encodeRangeSliderValueIndicatorShape(entry2);
    var decoded2 = ThemeDecoder.decodeRangeSliderValueIndicatorShape(encoded2);

    expect(
      encoded2,
      'rectangular',
    );

    expect(
      decoded2.runtimeType,
      entry2.runtimeType,
    );
  });

  test('Rect', () {
    expect(ThemeDecoder.decodeRect(null), null);
    expect(ThemeEncoder.encodeRect(null), null);

    var entry = Rect.fromLTRB(1.0, 2.0, 3.0, 4.0);

    expect(ThemeDecoder.decodeRect(entry), entry);

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

  test('ScrollBehavior', () {
    expect(ThemeDecoder.decodeScrollBehavior(null), null);
    expect(ThemeEncoder.encodeScrollBehavior(null), null);

    var entry = ScrollBehavior(
      androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    );

    expect(ThemeDecoder.decodeScrollBehavior(entry), entry);

    var encoded = ThemeEncoder.encodeScrollBehavior(entry);
    expect(encoded, {'androidOverscrollIndicator': 'stretch'});

    expect(
      ThemeDecoder.decodeScrollBehavior(encoded)?.androidOverscrollIndicator,
      entry.androidOverscrollIndicator,
    );
  });

  test('ScrollPhysics', () {
    expect(ThemeDecoder.decodeScrollPhysics(null), null);
    expect(ThemeEncoder.encodeScrollPhysics(null), null);

    var entry = AlwaysScrollableScrollPhysics();
    expect(
      ThemeDecoder.decodeScrollPhysics(entry),
      entry,
    );
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
      ThemeDecoder.decodeScrollPhysics({'type': 'rangeMaintaining'})
          .runtimeType,
      RangeMaintainingScrollPhysics().runtimeType,
    );

    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'always'
      })!
          .parent
          .runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'bouncing',
      })!
          .parent
          .runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'clamping',
      })!
          .parent
          .runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'fixedExtent',
      })!
          .parent
          .runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'never',
      })!
          .parent
          .runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'page',
      })!
          .parent
          .runtimeType,
      AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'rangeMaintaining',
      })!
          .parent
          .runtimeType,
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
        ThemeEncoder.encodeScrollPhysics(RangeMaintainingScrollPhysics()),
      ),
      {
        'type': 'rangeMaintaining',
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
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          RangeMaintainingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'rangeMaintaining',
      },
    );
  });

  test('ScrollViewKeyboardDismissBehavior', () {
    expect(ThemeDecoder.decodeScrollViewKeyboardDismissBehavior(null), null);
    expect(ThemeEncoder.encodeScrollViewKeyboardDismissBehavior(null), null);

    expect(
      ThemeDecoder.decodeScrollViewKeyboardDismissBehavior(
        ScrollViewKeyboardDismissBehavior.manual,
      ),
      ScrollViewKeyboardDismissBehavior.manual,
    );

    expect(
      ThemeDecoder.decodeScrollViewKeyboardDismissBehavior(
        'manual',
      ),
      ScrollViewKeyboardDismissBehavior.manual,
    );
    expect(
      ThemeDecoder.decodeScrollViewKeyboardDismissBehavior(
        'onDrag',
      ),
      ScrollViewKeyboardDismissBehavior.onDrag,
    );

    expect(
      ThemeEncoder.encodeScrollViewKeyboardDismissBehavior(
        ScrollViewKeyboardDismissBehavior.manual,
      ),
      'manual',
    );
    expect(
      ThemeEncoder.encodeScrollViewKeyboardDismissBehavior(
        ScrollViewKeyboardDismissBehavior.onDrag,
      ),
      'onDrag',
    );
  });

  test('ScrollbarOrientation', () {
    expect(ThemeDecoder.decodeScrollbarOrientation(null), null);
    expect(ThemeEncoder.encodeScrollbarOrientation(null), null);

    expect(
      ThemeDecoder.decodeScrollbarOrientation(ScrollbarOrientation.top),
      ScrollbarOrientation.top,
    );

    expect(
      ThemeDecoder.decodeScrollbarOrientation('bottom'),
      ScrollbarOrientation.bottom,
    );
    expect(
      ThemeDecoder.decodeScrollbarOrientation('left'),
      ScrollbarOrientation.left,
    );
    expect(
      ThemeDecoder.decodeScrollbarOrientation('right'),
      ScrollbarOrientation.right,
    );
    expect(
      ThemeDecoder.decodeScrollbarOrientation('top'),
      ScrollbarOrientation.top,
    );

    expect(
      ThemeEncoder.encodeScrollbarOrientation(ScrollbarOrientation.bottom),
      'bottom',
    );
    expect(
      ThemeEncoder.encodeScrollbarOrientation(ScrollbarOrientation.left),
      'left',
    );
    expect(
      ThemeEncoder.encodeScrollbarOrientation(ScrollbarOrientation.right),
      'right',
    );
    expect(
      ThemeEncoder.encodeScrollbarOrientation(ScrollbarOrientation.top),
      'top',
    );
  });

  test('ScrollbarThemeData', () {
    expect(ThemeDecoder.decodeScrollbarThemeData(null), null);
    expect(ThemeEncoder.encodeScrollbarThemeData(null), null);

    var entry = ScrollbarThemeData(
      crossAxisMargin: 1.0,
      interactive: true,
      isAlwaysShown: true,
      mainAxisMargin: 2.0,
      minThumbLength: 3.0,
      radius: Radius.circular(4.0),
      showTrackOnHover: true,
      thickness: MaterialStateProperty.all(5.0),
    );

    expect(ThemeDecoder.decodeScrollbarThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeScrollbarThemeData(entry);
    expect(
      encoded!['crossAxisMargin'],
      entry.crossAxisMargin,
    );

    expect(
      encoded['interactive'],
      entry.interactive,
    );

    expect(
      encoded['isAlwaysShown'],
      entry.isAlwaysShown,
    );

    expect(
      encoded['mainAxisMargin'],
      entry.mainAxisMargin,
    );

    expect(
      encoded['minThumbLength'],
      entry.minThumbLength,
    );

    expect(
      encoded['radius'],
      ThemeEncoder.encodeRadius(entry.radius),
    );

    expect(
      encoded['showTrackOnHover'],
      entry.showTrackOnHover,
    );

    expect(
      encoded['thickness']['error'],
      entry.thickness!.resolve({MaterialState.error}),
    );

    var decoded = ThemeDecoder.decodeScrollbarThemeData(encoded);
    expect(
      decoded!.crossAxisMargin,
      entry.crossAxisMargin,
    );

    expect(
      decoded.interactive,
      entry.interactive,
    );

    expect(
      decoded.isAlwaysShown,
      entry.isAlwaysShown,
    );

    expect(
      decoded.mainAxisMargin,
      entry.mainAxisMargin,
    );

    expect(
      decoded.minThumbLength,
      entry.minThumbLength,
    );

    expect(
      decoded.radius,
      entry.radius,
    );

    expect(
      decoded.showTrackOnHover,
      entry.showTrackOnHover,
    );

    expect(
      decoded.thickness!.resolve({MaterialState.error}),
      entry.thickness!.resolve({MaterialState.error}),
    );
  });

  test('SemanticsTag', () {
    expect(ThemeDecoder.decodeSemanticsTag(null), null);
    expect(ThemeEncoder.encodeSemanticsTag(null), null);

    var entry = SemanticsTag('foo');

    expect(ThemeDecoder.decodeSemanticsTag(entry), entry);

    var encoded = ThemeEncoder.encodeSemanticsTag(entry);
    var decoded = ThemeDecoder.decodeSemanticsTag(encoded);

    expect(
      encoded,
      {
        'name': 'foo',
      },
    );

    expect(
      decoded!.name,
      entry.name,
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

    expect(ThemeDecoder.decodeShadow(entry), entry);

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

    expect(ThemeDecoder.decodeShapeBorder(entry), entry);

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

    entry = StadiumBorder(
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
        'side': {
          'color': '#00123456',
          'style': 'solid',
          'width': 1.0,
        },
        'type': 'stadium'
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
      ThemeDecoder.decodeShowValueIndicator(
        ShowValueIndicator.always,
      ),
      ShowValueIndicator.always,
    );

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

  test('Size', () {
    expect(ThemeDecoder.decodeSize(null), null);
    expect(ThemeEncoder.encodeSize(null), null);

    var entry = Size(0.0, 0.0);

    expect(ThemeDecoder.decodeSize(entry), entry);

    var encoded = ThemeEncoder.encodeSize(entry);
    var decoded = ThemeDecoder.decodeSize(encoded);

    expect(
      encoded,
      {
        'height': 0.0,
        'width': 0.0,
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('SliderComponentShape', () {
    expect(ThemeDecoder.decodeSliderComponentShape(null), null);
    expect(ThemeEncoder.encodeSliderComponentShape(null), null);

    expect(
      ThemeDecoder.decodeSliderComponentShape(
        SliderComponentShape.noOverlay,
      ),
      SliderComponentShape.noOverlay,
    );

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

  test('SliderTickMarkShape', () {
    expect(ThemeDecoder.decodeSliderTickMarkShape(null), null);
    expect(ThemeEncoder.encodeSliderTickMarkShape(null), null);

    expect(
      ThemeDecoder.decodeSliderTickMarkShape(
        SliderTickMarkShape.noTickMark,
      ),
      SliderTickMarkShape.noTickMark,
    );

    expect(
      ThemeDecoder.decodeSliderTickMarkShape('noTickMark'),
      SliderTickMarkShape.noTickMark,
    );

    expect(
      ThemeEncoder.encodeSliderTickMarkShape(SliderTickMarkShape.noTickMark),
      'noTickMark',
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

    expect(ThemeDecoder.decodeSliderThemeData(entry), entry);

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
          'elevation': 1.0,
          'enabledThumbRadius': 10.0,
          'pressedElevation': 6.0,
          'type': 'round',
        },
        'rangeTrackShape': 'rectangular',
        'rangeValueIndicatorShape': 'paddle',
        'showValueIndicator': 'always',
        'thumbColor': '#ffbbbbbb',
        'thumbShape': 'noOverlay',
        'trackHeight': 10.0,
        'trackShape': {
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

    SliderTrackShape entry = RectangularSliderTrackShape();

    expect(ThemeDecoder.decodeSliderTrackShape(entry), entry);

    var encoded = ThemeEncoder.encodeSliderTrackShape(entry);
    var decoded = ThemeDecoder.decodeSliderTrackShape(encoded);

    expect(
      encoded,
      {
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
      ThemeDecoder.decodeSnackBarBehavior(
        SnackBarBehavior.fixed,
      ),
      SnackBarBehavior.fixed,
    );

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

    expect(ThemeDecoder.decodeSnackBarThemeData(entry), entry);

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
      ThemeDecoder.decodeSmartDashesType(
        SmartDashesType.disabled,
      ),
      SmartDashesType.disabled,
    );

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
      ThemeDecoder.decodeSmartQuotesType(
        SmartQuotesType.disabled,
      ),
      SmartQuotesType.disabled,
    );

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

    expect(
      ThemeDecoder.decodeStackFit(
        StackFit.expand,
      ),
      StackFit.expand,
    );

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
      leadingDistribution: TextLeadingDistribution.even,
      package: 'bar',
    );

    expect(ThemeDecoder.decodeStrutStyle(entry), entry);

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
        'leadingDistribution': 'even',
      },
    );

    expect(
      ThemeEncoder.encodeStrutStyle(decoded),
      encoded,
    );
  });

  test('SwitchThemeData', () {
    expect(ThemeDecoder.decodeSwitchThemeData(null), null);
    expect(ThemeEncoder.encodeSwitchThemeData(null), null);

    var entry = SwitchThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
      overlayColor: MaterialStateProperty.all(_kColor),
      splashRadius: 20.0,
      thumbColor: MaterialStateProperty.all(_kColor),
      trackColor: MaterialStateProperty.all(_kColor),
    );

    var encoded = {
      'materialTapTargetSize': 'shrinkWrap',
      'mouseCursor': {
        'disabled': {'type': 'defer'},
        'dragged': {'type': 'defer'},
        'empty': {'type': 'defer'},
        'error': {'type': 'defer'},
        'focused': {'type': 'defer'},
        'hovered': {'type': 'defer'},
        'pressed': {'type': 'defer'},
        'scrolledUnder': {'type': 'defer'},
        'selected': {'type': 'defer'},
      },
      'overlayColor': {
        'disabled': _kColorStr,
        'dragged': _kColorStr,
        'empty': _kColorStr,
        'error': _kColorStr,
        'focused': _kColorStr,
        'hovered': _kColorStr,
        'pressed': _kColorStr,
        'scrolledUnder': _kColorStr,
        'selected': _kColorStr,
      },
      'splashRadius': 20.0,
      'thumbColor': {
        'disabled': _kColorStr,
        'dragged': _kColorStr,
        'empty': _kColorStr,
        'error': _kColorStr,
        'focused': _kColorStr,
        'hovered': _kColorStr,
        'pressed': _kColorStr,
        'scrolledUnder': _kColorStr,
        'selected': _kColorStr,
      },
      'trackColor': {
        'disabled': _kColorStr,
        'dragged': _kColorStr,
        'empty': _kColorStr,
        'error': _kColorStr,
        'focused': _kColorStr,
        'hovered': _kColorStr,
        'pressed': _kColorStr,
        'scrolledUnder': _kColorStr,
        'selected': _kColorStr,
      },
    };

    expect(ThemeDecoder.decodeSwitchThemeData(entry), entry);
    expect(ThemeEncoder.encodeSwitchThemeData(entry), encoded);

    final theme = ThemeDecoder.decodeSwitchThemeData({
      'thumbColor': {
        'disabled': '#ff9e9e9e',
        'dragged': '#fff44336',
        'empty': '#fff44336',
        'error': '#fff44336',
        'focused': '#fff44336',
        'hovered': '#fff44336',
        'pressed': '#fff44336',
        'selected': '#ff2196f3'
      }
    });

    expect(
      theme!.thumbColor!.resolve({MaterialState.selected}),
      Color(0xff2196f3),
    );
  });

  test('SystemUiOverlayStyle', () {
    expect(ThemeDecoder.decodeSystemUiOverlayStyle(null), null);
    expect(ThemeEncoder.encodeSystemUiOverlayStyle(null), null);

    expect(
      ThemeDecoder.decodeSystemUiOverlayStyle(
        SystemUiOverlayStyle.dark,
      ),
      SystemUiOverlayStyle.dark,
    );

    expect(
      ThemeDecoder.decodeSystemUiOverlayStyle('dark'),
      SystemUiOverlayStyle.dark,
    );
    expect(
      ThemeDecoder.decodeSystemUiOverlayStyle('light'),
      SystemUiOverlayStyle.light,
    );

    expect(
      ThemeEncoder.encodeSystemUiOverlayStyle(SystemUiOverlayStyle.dark),
      'dark',
    );
    expect(
      ThemeEncoder.encodeSystemUiOverlayStyle(SystemUiOverlayStyle.light),
      'light',
    );
  });

  test('TabBarIndicatorSize', () {
    expect(ThemeDecoder.decodeTabBarIndicatorSize(null), null);
    expect(ThemeEncoder.encodeTabBarIndicatorSize(null), null);

    expect(
      ThemeDecoder.decodeTabBarIndicatorSize(
        TabBarIndicatorSize.label,
      ),
      TabBarIndicatorSize.label,
    );

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

    expect(ThemeDecoder.decodeTabBarTheme(entry), entry);

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

  test('TableBorder', () {
    expect(ThemeDecoder.decodeTableBorder(null), null);
    expect(ThemeEncoder.encodeTableBorder(null), null);

    var entry = TableBorder(
      borderRadius: BorderRadius.circular(1.0),
      bottom: BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      horizontalInside: BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 3.0,
      ),
      left: BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 4.0,
      ),
      right: BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 5.0,
      ),
      top: BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 6.0,
      ),
      verticalInside: BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 7.0,
      ),
    );

    expect(ThemeDecoder.decodeTableBorder(entry), entry);

    var encoded = ThemeEncoder.encodeTableBorder(entry);
    var decoded = ThemeDecoder.decodeTableBorder(encoded);

    expect(
      encoded,
      {
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
        'bottom': {
          'color': _kColorStr,
          'style': 'solid',
          'width': 2.0,
        },
        'horizontalInside': {
          'color': _kColorStr,
          'style': 'solid',
          'width': 3.0,
        },
        'left': {
          'color': _kColorStr,
          'style': 'solid',
          'width': 4.0,
        },
        'right': {
          'color': _kColorStr,
          'style': 'solid',
          'width': 5.0,
        },
        'top': {
          'color': _kColorStr,
          'style': 'solid',
          'width': 6.0,
        },
        'verticalInside': {
          'color': _kColorStr,
          'style': 'solid',
          'width': 7.0,
        },
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('TableColumnWidth', () {
    expect(ThemeDecoder.decodeTableColumnWidth(null), null);
    expect(ThemeEncoder.encodeTableColumnWidth(null), null);

    var entry = FlexColumnWidth();

    expect(ThemeDecoder.decodeTableColumnWidth(entry), entry);

    expect(
      ThemeDecoder.decodeTableColumnWidth({
        'type': 'fixed',
        'value': 1.0,
      }).toString(),
      FixedColumnWidth(
        1.0,
      ).toString(),
    );
    expect(
      ThemeDecoder.decodeTableColumnWidth({
        'type': 'flex',
        'value': 2.0,
      }).toString(),
      FlexColumnWidth(
        2.0,
      ).toString(),
    );
    expect(
      ThemeDecoder.decodeTableColumnWidth({
        'type': 'fraction',
        'value': 3.0,
      }).toString(),
      FractionColumnWidth(
        3.0,
      ).toString(),
    );
    expect(
      ThemeDecoder.decodeTableColumnWidth({
        'type': 'intrinsic',
        'value': 4.0,
      }).toString(),
      IntrinsicColumnWidth(
        flex: 4.0,
      ).toString(),
    );
    expect(
      ThemeDecoder.decodeTableColumnWidth({
        'a': {
          'type': 'fixed',
          'value': 5.0,
        },
        'b': {
          'type': 'fixed',
          'value': 6.0,
        },
        'type': 'max',
      }).toString(),
      MaxColumnWidth(
        FixedColumnWidth(5.0),
        FixedColumnWidth(6.0),
      ).toString(),
    );
    expect(
      ThemeDecoder.decodeTableColumnWidth({
        'a': {
          'type': 'fixed',
          'value': 5.0,
        },
        'b': {
          'type': 'fixed',
          'value': 6.0,
        },
        'type': 'min',
      }).toString(),
      MinColumnWidth(
        FixedColumnWidth(5.0),
        FixedColumnWidth(6.0),
      ).toString(),
    );

    expect(
      ThemeEncoder.encodeTableColumnWidth(
        FixedColumnWidth(1.0),
      ),
      {
        'type': 'fixed',
        'value': 1.0,
      },
    );
    expect(
      ThemeEncoder.encodeTableColumnWidth(
        FlexColumnWidth(2.0),
      ),
      {
        'type': 'flex',
        'value': 2.0,
      },
    );
    expect(
      ThemeEncoder.encodeTableColumnWidth(
        FractionColumnWidth(3.0),
      ),
      {
        'type': 'fraction',
        'value': 3.0,
      },
    );
    expect(
      ThemeEncoder.encodeTableColumnWidth(
        IntrinsicColumnWidth(flex: 4.0),
      ),
      {
        'type': 'intrinsic',
        'value': 4.0,
      },
    );
    expect(
      ThemeEncoder.encodeTableColumnWidth(
        MaxColumnWidth(
          FixedColumnWidth(5.0),
          FixedColumnWidth(6.0),
        ),
      ),
      {
        'a': {
          'type': 'fixed',
          'value': 5.0,
        },
        'b': {
          'type': 'fixed',
          'value': 6.0,
        },
        'type': 'max',
      },
    );
    expect(
      ThemeEncoder.encodeTableColumnWidth(
        MinColumnWidth(
          FixedColumnWidth(5.0),
          FixedColumnWidth(6.0),
        ),
      ),
      {
        'a': {
          'type': 'fixed',
          'value': 5.0,
        },
        'b': {
          'type': 'fixed',
          'value': 6.0,
        },
        'type': 'min',
      },
    );
  });

  test('TargetPlatform', () {
    expect(ThemeDecoder.decodeTargetPlatform(null), null);
    expect(ThemeEncoder.encodeTargetPlatform(null), null);

    expect(
      ThemeDecoder.decodeTargetPlatform(
        TargetPlatform.android,
      ),
      TargetPlatform.android,
    );

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

    expect(
      ThemeDecoder.decodeTextAlign(
        TextAlign.center,
      ),
      TextAlign.center,
    );

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
      ThemeDecoder.decodeTextAlignVertical(
        TextAlignVertical.bottom,
      ),
      TextAlignVertical.bottom,
    );

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
      ThemeDecoder.decodeTextBaseline(
        TextBaseline.alphabetic,
      ),
      TextBaseline.alphabetic,
    );

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

  test('TextButtonThemeData', () {
    expect(ThemeDecoder.decodeTextButtonThemeData(null), null);
    expect(ThemeEncoder.encodeTextButtonThemeData(null), null);

    var entry = TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(0xff222222),
        ),
      ),
    );

    expect(ThemeDecoder.decodeTextButtonThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeTextButtonThemeData(entry);
    var decoded = ThemeDecoder.decodeTextButtonThemeData(encoded);

    expect(
      encoded,
      {
        'style': {
          'backgroundColor': _materializeState('#ff222222'),
        },
      },
    );

    bool? textButtonThemeDatasAreEqual(Object? first, Object second) {
      bool? result;

      if (first.runtimeType != second.runtimeType) {
        result = false;
      } else if (first is! TextButtonThemeData) {
        result = false;
      } else if (second is TextButtonThemeData) {
        result = _buttonStylesAreEqual(first.style, second.style);
      }

      return result;
    }

    expect(
      textButtonThemeDatasAreEqual(decoded, entry),
      true,
    );
  });

  test('TextCapitalization', () {
    expect(ThemeDecoder.decodeTextCapitalization(null), null);
    expect(ThemeEncoder.encodeTextCapitalization(null), null);

    expect(
      ThemeDecoder.decodeTextCapitalization(
        TextCapitalization.characters,
      ),
      TextCapitalization.characters,
    );

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
      ThemeDecoder.decodeTextDecoration(
        TextDecoration.lineThrough,
      ),
      TextDecoration.lineThrough,
    );

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
      ThemeDecoder.decodeTextDecorationStyle(
        TextDecorationStyle.dashed,
      ),
      TextDecorationStyle.dashed,
    );

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
      ThemeDecoder.decodeTextDirection(
        TextDirection.ltr,
      ),
      TextDirection.ltr,
    );

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
      leadingDistribution: TextLeadingDistribution.even,
    );

    expect(ThemeDecoder.decodeTextHeightBehavior(entry), entry);

    var encoded = ThemeEncoder.encodeTextHeightBehavior(entry);
    var decoded = ThemeDecoder.decodeTextHeightBehavior(encoded);

    expect(
      encoded,
      {
        'applyHeightToFirstAscent': true,
        'applyHeightToLastDescent': true,
        'leadingDistribution': 'even',
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
      ThemeDecoder.decodeTextInputAction(
        TextInputAction.continueAction,
      ),
      TextInputAction.continueAction,
    );

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

  test('TextInputType', () {
    expect(ThemeDecoder.decodeTextInputType(null), null);
    expect(ThemeEncoder.encodeTextInputType(null), null);

    expect(
      ThemeDecoder.decodeTextInputType(
        TextInputType.datetime,
      ),
      TextInputType.datetime,
    );

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
      ThemeDecoder.decodeTextInputType('name'),
      TextInputType.name,
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
      ThemeDecoder.decodeTextInputType('streetAddress'),
      TextInputType.streetAddress,
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
      ThemeEncoder.encodeTextInputType(TextInputType.name),
      'name',
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
      ThemeEncoder.encodeTextInputType(TextInputType.streetAddress),
      'streetAddress',
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

  test('TextLeadingDistribution', () {
    expect(ThemeDecoder.decodeTextLeadingDistribution(null), null);
    expect(ThemeEncoder.encodeTextLeadingDistribution(null), null);

    expect(
      ThemeDecoder.decodeTextLeadingDistribution(
        TextLeadingDistribution.even,
      ),
      TextLeadingDistribution.even,
    );

    expect(
      ThemeDecoder.decodeTextLeadingDistribution('even'),
      TextLeadingDistribution.even,
    );
    expect(
      ThemeDecoder.decodeTextLeadingDistribution('proportional'),
      TextLeadingDistribution.proportional,
    );

    expect(
      ThemeEncoder.encodeTextLeadingDistribution(TextLeadingDistribution.even),
      'even',
    );
    expect(
      ThemeEncoder.encodeTextLeadingDistribution(
        TextLeadingDistribution.proportional,
      ),
      'proportional',
    );
  });

  test('TextOverflow', () {
    expect(ThemeDecoder.decodeTextOverflow(null), null);
    expect(ThemeEncoder.encodeTextOverflow(null), null);

    expect(
      ThemeDecoder.decodeTextOverflow(
        TextOverflow.clip,
      ),
      TextOverflow.clip,
    );

    expect(ThemeDecoder.decodeTextOverflow('clip'), TextOverflow.clip);
    expect(ThemeDecoder.decodeTextOverflow('ellipsis'), TextOverflow.ellipsis);
    expect(ThemeDecoder.decodeTextOverflow('fade'), TextOverflow.fade);
    expect(ThemeDecoder.decodeTextOverflow('visible'), TextOverflow.visible);

    expect(ThemeEncoder.encodeTextOverflow(TextOverflow.clip), 'clip');
    expect(ThemeEncoder.encodeTextOverflow(TextOverflow.ellipsis), 'ellipsis');
    expect(ThemeEncoder.encodeTextOverflow(TextOverflow.fade), 'fade');
    expect(ThemeEncoder.encodeTextOverflow(TextOverflow.visible), 'visible');
  });

  test('TextSelectionThemeData', () {
    expect(ThemeDecoder.decodeTextSelectionThemeData(null), null);
    expect(ThemeEncoder.encodeTextSelectionThemeData(null), null);

    var entry = TextSelectionThemeData(
      cursorColor: Color(0xff222222),
      selectionColor: Color(0xff222222),
      selectionHandleColor: Color(0xff222222),
    );

    expect(ThemeDecoder.decodeTextSelectionThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeTextSelectionThemeData(entry);
    var decoded = ThemeDecoder.decodeTextSelectionThemeData(encoded);

    expect(
      encoded,
      {
        'cursorColor': '#ff222222',
        'selectionColor': '#ff222222',
        'selectionHandleColor': '#ff222222',
      },
    );

    expect(
      decoded,
      entry,
    );
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
      leadingDistribution: TextLeadingDistribution.even,
      letterSpacing: 5.0,
      locale: Locale('en', 'US'),
      overflow: TextOverflow.ellipsis,
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

    expect(ThemeDecoder.decodeTextStyle(entry), entry);

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
        'leadingDistribution': 'even',
        'letterSpacing': 5.0,
        'locale': {
          'countryCode': 'US',
          'languageCode': 'en',
        },
        'overflow': 'ellipsis',
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

    expect(decoded!.color, entry.color);
  });

  test('TextTheme', () {
    expect(ThemeDecoder.decodeTextTheme(null), null);
    expect(ThemeEncoder.encodeTextTheme(null), null);

    var entry = TextTheme(
      bodyLarge: TextStyle(color: Color(0xff111111)),
      bodyMedium: TextStyle(color: Color(0xff222222)),
      bodySmall: TextStyle(color: Color(0xff333333)),
      displayLarge: TextStyle(color: Color(0xff444444)),
      displayMedium: TextStyle(color: Color(0xff555555)),
      displaySmall: TextStyle(color: Color(0xff666666)),
      headlineLarge: TextStyle(color: Color(0xff777777)),
      headlineMedium: TextStyle(color: Color(0xff888888)),
      headlineSmall: TextStyle(color: Color(0xff999999)),
      labelLarge: TextStyle(color: Color(0xff000000)),
      labelMedium: TextStyle(color: Color(0xffaaaaaa)),
      labelSmall: TextStyle(color: Color(0xffbbbbbb)),
      titleLarge: TextStyle(color: Color(0xffcccccc)),
      titleMedium: TextStyle(color: Color(0xffdddddd)),
      titleSmall: TextStyle(color: Color(0xffeeeeee)),
    );

    expect(ThemeDecoder.decodeTextTheme(entry), entry);

    var encoded = ThemeEncoder.encodeTextTheme(entry);
    var decoded = ThemeDecoder.decodeTextTheme(encoded);

    expect(
      encoded,
      {
        'bodyLarge': {
          'color': '#ff111111',
          'inherit': true,
        },
        'bodyMedium': {
          'color': '#ff222222',
          'inherit': true,
        },
        'bodySmall': {
          'color': '#ff333333',
          'inherit': true,
        },
        'displayLarge': {
          'color': '#ff444444',
          'inherit': true,
        },
        'displayMedium': {
          'color': '#ff555555',
          'inherit': true,
        },
        'displaySmall': {
          'color': '#ff666666',
          'inherit': true,
        },
        'headlineLarge': {
          'color': '#ff777777',
          'inherit': true,
        },
        'headlineMedium': {
          'color': '#ff888888',
          'inherit': true,
        },
        'headlineSmall': {
          'color': '#ff999999',
          'inherit': true,
        },
        'labelLarge': {
          'color': '#ff000000',
          'inherit': true,
        },
        'labelMedium': {
          'color': '#ffaaaaaa',
          'inherit': true,
        },
        'labelSmall': {
          'color': '#ffbbbbbb',
          'inherit': true,
        },
        'titleLarge': {
          'color': '#ffcccccc',
          'inherit': true,
        },
        'titleMedium': {
          'color': '#ffdddddd',
          'inherit': true,
        },
        'titleSmall': {
          'color': '#ffeeeeee',
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
      ThemeDecoder.decodeTextWidthBasis(
        TextWidthBasis.longestLine,
      ),
      TextWidthBasis.longestLine,
    );

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
      androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      appBarTheme: AppBarTheme(color: Color(0xff444444)),
      applyElevationOverlayColor: true,
      backgroundColor: Color(0xff555555),
      bannerTheme: MaterialBannerThemeData(backgroundColor: Color(0xff666666)),
      bottomAppBarColor: Color(0xff777777),
      bottomAppBarTheme: BottomAppBarTheme(
        color: Color(0xff888888),
        shape: CircularNotchedRectangle(),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xff999999),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Color(0xff000000),
      ),
      buttonBarTheme: ButtonBarThemeData(buttonHeight: 3.0),
      buttonTheme: ButtonThemeData(buttonColor: Color(0xffbbbbbb)),
      canvasColor: Color(0xffcccccc),
      cardColor: Color(0xffdddddd),
      cardTheme: CardTheme(color: Color(0xffeeeeee)),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Color(0xff123456)),
      ),
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
      dataTableTheme: DataTableThemeData(
        columnSpacing: 1.0,
        dataRowColor: MaterialStateProperty.all(
          Color(0xff555555),
        ),
        dataRowHeight: 1.0,
        dataTextStyle: TextStyle(),
        dividerThickness: 1.0,
        headingRowColor: MaterialStateProperty.all(
          Color(0xff555555),
        ),
        headingRowHeight: 1.0,
        headingTextStyle: TextStyle(),
        horizontalMargin: 1.0,
      ),
      dialogBackgroundColor: Color(0xee888888),
      dialogTheme: DialogTheme(backgroundColor: Color(0xee999999)),
      disabledColor: Color(0xee000000),
      dividerColor: Color(0xeeaaaaaa),
      dividerTheme: DividerThemeData(color: Color(0xeebbbbbb)),
      drawerTheme: DrawerThemeData(
        backgroundColor: Color(0xff111111),
        elevation: 5,
        scrimColor: Color(0xff222222),
        shape: CircleBorder(
          side: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color(0xff222222),
          ),
        ),
      ),
      errorColor: Color(0xeecccccc),
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
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.fromLTRB(
          1,
          2,
          3,
          4,
        ),
        dense: true,
        enableFeedback: false,
        horizontalTitleGap: 5,
        iconColor: Color(0xff111111),
        minLeadingWidth: 6,
        minVerticalPadding: 7,
        selectedColor: Color(0xff222222),
        selectedTileColor: Color(0xff333333),
        shape: ContinuousRectangleBorder(),
        style: ListTileStyle.drawer,
        textColor: Color(0xff444444),
        tileColor: Color(0xff555555),
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Color(0xff111111),
        height: 12.0,
        indicatorColor: Color(0xff222222),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: Color(0xdd666666),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color(0xff222222),
          ),
        ),
      ),
      platform: TargetPlatform.android,
      popupMenuTheme: PopupMenuThemeData(color: Color(0xdd777777)),
      primaryColor: Color(0xdd888888),
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
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(Color(0xff123456)),
      ),
      scaffoldBackgroundColor: Color(0xee666666),
      secondaryHeaderColor: Color(0xccbbbbbb),
      selectedRowColor: Color(0xcccccccc),
      shadowColor: Color(0xcccccccc),
      sliderTheme: SliderThemeData(activeTickMarkColor: Color(0xccdddddd)),
      snackBarTheme: SnackBarThemeData(actionTextColor: Color(0xcceeeeee)),
      splashColor: Color(0xee444444),
      splashFactory: InkSplash.splashFactory,
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Color(0xff123456)),
      ),
      tabBarTheme: TabBarTheme(labelColor: Color(0xccffffff)),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color(0xff222222),
          ),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Color(0xff222222),
        selectionColor: Color(0xff222222),
        selectionHandleColor: Color(0xff222222),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Color(0xee555555),
        ),
      ),
      timePickerTheme: TimePickerThemeData(backgroundColor: Color(0x11111111)),
      toggleButtonsTheme: ToggleButtonsThemeData(color: Color(0xbb222222)),
      toggleableActiveColor: Color(0xbb333333),
      tooltipTheme: TooltipThemeData(height: 19.0),
      typography: Typography.material2018(),
      unselectedWidgetColor: Color(0xbb444444),
      useMaterial3: true,
      visualDensity: VisualDensity.comfortable,
    );

    expect(ThemeDecoder.decodeThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeThemeData(entry);
    var decoded = ThemeDecoder.decodeThemeData(encoded)!;

    var jsonMap = {
      'androidOverscrollIndicator': 'stretch',
      'appBarTheme': {
        'backgroundColor': '#ff444444',
      },
      'applyElevationOverlayColor': true,
      'bannerTheme': {'backgroundColor': '#ff666666'},
      'backgroundColor': '#ff555555',
      'bottomAppBarColor': '#ff777777',
      'bottomAppBarTheme': {
        'color': '#ff888888',
        'shape': 'circular',
      },
      'bottomNavigationBarTheme': {
        'backgroundColor': '#ff999999',
      },
      'brightness': 'dark',
      'bottomSheetTheme': {
        'backgroundColor': '#ff000000',
      },
      'buttonBarTheme': {
        'buttonHeight': 3.0,
      },
      'buttonTheme': {
        'alignedDropdown': false,
        'height': 36.0,
        'layoutBehavior': 'padded',
        'minWidth': 88.0,
        'padding': {
          'bottom': 0.0,
          'left': 16.0,
          'right': 16.0,
          'top': 0.0,
        },
        'shape': {
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
            'type': 'only',
          },
          'side': {
            'color': '#ff000000',
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rounded',
        },
        'textTheme': 'normal',
      },
      'canvasColor': '#ffcccccc',
      'cardColor': '#ffdddddd',
      'cardTheme': {
        'color': '#ffeeeeee',
      },
      'checkboxTheme': {'fillColor': _materializeState('#ff123456')},
      'chipTheme': {
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
        'labelStyle': {
          'color': '#ff555555',
          'inherit': true,
        },
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
            'type': 'only',
          },
          'side': {
            'color': '#ff000000',
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rounded',
        },
        'selectedShadowColor': '#ff777777',
        'shadowColor': '#ff888888',
        'showCheckmark': true,
      },
      'colorScheme': {
        'background': '#ff121212',
        'brightness': 'dark',
        'error': '#ffcf6679',
        'errorContainer': '#ffcf6679',
        'inversePrimary': '#ff000000',
        'inverseSurface': '#ffffffff',
        'onBackground': '#ffffffff',
        'onError': '#ff000000',
        'onErrorContainer': '#ff000000',
        'onInverseSurface': '#ff121212',
        'onPrimary': '#ff000000',
        'onPrimaryContainer': '#ff000000',
        'onSecondary': '#ff000000',
        'onSecondaryContainer': '#ff000000',
        'onSurface': '#ffffffff',
        'onSurfaceVariant': '#ffffffff',
        'onTertiary': '#ff000000',
        'onTertiaryContainer': '#ff000000',
        'outline': '#ffffffff',
        'primary': '#ffbb86fc',
        'primaryContainer': '#ffbb86fc',
        'secondary': '#ff03dac6',
        'secondaryContainer': '#ff03dac6',
        'shadow': '#ff000000',
        'surface': '#ff121212',
        'tertiary': '#ff03dac6',
        'tertiaryContainer': '#ff03dac6',
      },
      'cupertinoOverrideTheme': {
        'barBackgroundColor': '#ee111111',
      },
      'dataTableTheme': {
        'columnSpacing': 1.0,
        'dataRowColor': _materializeState('#ff555555'),
        'dataRowHeight': 1.0,
        'dataTextStyle': {
          'inherit': true,
        },
        'dividerThickness': 1.0,
        'headingRowColor': _materializeState('#ff555555'),
        'headingRowHeight': 1.0,
        'headingTextStyle': {
          'inherit': true,
        },
        'horizontalMargin': 1.0,
      },
      'dialogBackgroundColor': '#ee888888',
      'dialogTheme': {
        'backgroundColor': '#ee999999',
      },
      'disabledColor': '#ee000000',
      'dividerColor': '#eeaaaaaa',
      'dividerTheme': {
        'color': '#eebbbbbb',
      },
      'drawerTheme': {
        'backgroundColor': '#ff111111',
        'elevation': 5.0,
        'scrimColor': '#ff222222',
        'shape': {
          'side': {
            'color': '#ff000000',
            'style': 'none',
            'width': 0.0,
          },
          'type': 'circle'
        }
      },
      'elevatedButtonTheme': {
        'style': {
          'backgroundColor': _materializeState('#ff222222'),
        },
      },
      'errorColor': '#eecccccc',
      'floatingActionButtonTheme': {
        'backgroundColor': '#eedddddd',
      },
      'focusColor': '#ee333333',
      'highlightColor': '#dd111111',
      'hintColor': '#dd222222',
      'hoverColor': '#ee222222',
      'iconTheme': {
        'color': '#dd333333',
      },
      'indicatorColor': '#dd444444',
      'inputDecorationTheme': {
        'alignLabelWithHint': false,
        'filled': false,
        'floatingLabelAlignment': 'start',
        'floatingLabelBehavior': 'auto',
        'focusColor': '#dd555555',
        'isCollapsed': false,
        'isDense': false,
      },
      'listTileTheme': {
        'contentPadding': {
          'left': 1,
          'top': 2,
          'right': 3,
          'bottom': 4,
        },
        'dense': true,
        'enableFeedback': false,
        'horizontalTitleGap': 5,
        'iconColor': '#ff111111',
        'minLeadingWidth': 6,
        'minVerticalPadding': 7,
        'selectedColor': '#ff222222',
        'selectedTileColor': '#ff333333',
        'shape': {
          'borderRadius': {
            'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'type': 'only'
          },
          'side': {'color': '#ff000000', 'style': 'none', 'width': 0.0},
          'type': 'rectangle',
        },
        'style': 'drawer',
        'textColor': '#ff444444',
        'tileColor': '#ff555555',
      },
      'materialTapTargetSize': 'padded',
      'navigationBarTheme': {
        'backgroundColor': '#ff111111',
        'height': 12.0,
        'indicatorColor': '#ff222222',
        'labelBehavior': 'onlyShowSelected',
      },
      'navigationRailTheme': {
        'backgroundColor': '#dd666666',
      },
      'outlinedButtonTheme': {
        'style': {
          'backgroundColor': _materializeState('#ff222222'),
        },
      },
      'platform': 'android',
      'popupMenuTheme': {
        'color': '#dd777777',
      },
      'primaryColor': '#dd888888',
      'primaryColorDark': '#dd999999',
      'primaryColorLight': '#dd000000',
      'primaryIconTheme': {
        'color': '#ddaaaaaa',
      },
      'primaryTextTheme': {
        'bodyLarge': {
          'color': '#ccaaaaaa',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'bodyMedium': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'bodySmall': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'displayLarge': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'displayMedium': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'displaySmall': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headlineLarge': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headlineMedium': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headlineSmall': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'labelLarge': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'labelMedium': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'labelSmall': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'titleLarge': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'titleMedium': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'titleSmall': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        }
      },
      'radioTheme': {'fillColor': _materializeState('#ff123456')},
      'scaffoldBackgroundColor': '#ee666666',
      'secondaryHeaderColor': '#ccbbbbbb',
      'selectedRowColor': '#cccccccc',
      'shadowColor': '#cccccccc',
      'sliderTheme': {
        'activeTickMarkColor': '#ccdddddd',
      },
      'snackBarTheme': {
        'actionTextColor': '#cceeeeee',
      },
      'splashColor': '#ee444444',
      'splashFactory': 'splash',
      'switchTheme': {'thumbColor': _materializeState('#ff123456')},
      'tabBarTheme': {
        'labelColor': '#ccffffff',
      },
      'textButtonTheme': {
        'style': {
          'backgroundColor': _materializeState('#ff222222'),
        },
      },
      'textSelectionTheme': {
        'cursorColor': '#ff222222',
        'selectionColor': '#ff222222',
        'selectionHandleColor': '#ff222222',
      },
      'textTheme': {
        'bodyLarge': {
          'color': '#ee555555',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'bodyMedium': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'bodySmall': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'displayLarge': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'displayMedium': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'displaySmall': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headlineLarge': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headlineMedium': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'headlineSmall': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'labelLarge': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'labelMedium': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'labelSmall': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'titleLarge': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'titleMedium': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        },
        'titleSmall': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true
        }
      },
      'toggleButtonsTheme': {
        'color': '#bb222222',
      },
      'toggleableActiveColor': '#bb333333',
      'tooltipTheme': {
        'height': 19.0,
      },
      'typography': {
        'black': {
          'bodyLarge': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'bodyMedium': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'bodySmall': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'displayLarge': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'displayMedium': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'displaySmall': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headlineLarge': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headlineMedium': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headlineSmall': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'labelLarge': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'labelMedium': {
            'color': '#ff000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'labelSmall': {
            'color': '#ff000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'titleLarge': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'titleMedium': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'titleSmall': {
            'color': '#ff000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
        },
        'dense': {
          'bodyLarge': {
            'fontWeight': 'w400',
            'fontSize': 17.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'bodyMedium': {
            'fontWeight': 'w400',
            'fontSize': 15.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'bodySmall': {
            'fontWeight': 'w400',
            'fontSize': 13.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'displayLarge': {
            'fontWeight': 'w100',
            'fontSize': 96.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'displayMedium': {
            'fontWeight': 'w100',
            'fontSize': 60.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'displaySmall': {
            'fontWeight': 'w400',
            'fontSize': 48.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'headlineLarge': {
            'fontWeight': 'w400',
            'fontSize': 40.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'headlineMedium': {
            'fontWeight': 'w400',
            'fontSize': 34.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'headlineSmall': {
            'fontWeight': 'w400',
            'fontSize': 24.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'labelLarge': {
            'fontWeight': 'w500',
            'fontSize': 15.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'labelMedium': {
            'fontWeight': 'w400',
            'fontSize': 12.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'labelSmall': {
            'fontWeight': 'w400',
            'fontSize': 11.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'titleLarge': {
            'fontWeight': 'w500',
            'fontSize': 21.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'titleMedium': {
            'fontWeight': 'w400',
            'fontSize': 17.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
          'titleSmall': {
            'fontWeight': 'w500',
            'fontSize': 15.0,
            'inherit': true,
            'textBaseline': 'ideographic'
          },
        },
        'englishLike': {
          'bodyLarge': {
            'fontWeight': 'w400',
            'fontSize': 16.0,
            'inherit': true,
            'letterSpacing': 0.5,
            'textBaseline': 'alphabetic'
          },
          'bodyMedium': {
            'fontWeight': 'w400',
            'fontSize': 14.0,
            'inherit': true,
            'letterSpacing': 0.25,
            'textBaseline': 'alphabetic'
          },
          'bodySmall': {
            'fontWeight': 'w400',
            'fontSize': 12.0,
            'inherit': true,
            'letterSpacing': 0.4,
            'textBaseline': 'alphabetic'
          },
          'displayLarge': {
            'fontWeight': 'w300',
            'fontSize': 96.0,
            'inherit': true,
            'letterSpacing': -1.5,
            'textBaseline': 'alphabetic'
          },
          'displayMedium': {
            'fontWeight': 'w300',
            'fontSize': 60.0,
            'inherit': true,
            'letterSpacing': -0.5,
            'textBaseline': 'alphabetic'
          },
          'displaySmall': {
            'fontWeight': 'w400',
            'fontSize': 48.0,
            'inherit': true,
            'letterSpacing': 0.0,
            'textBaseline': 'alphabetic'
          },
          'headlineLarge': {
            'fontWeight': 'w400',
            'fontSize': 40.0,
            'inherit': true,
            'letterSpacing': 0.25,
            'textBaseline': 'alphabetic'
          },
          'headlineMedium': {
            'fontWeight': 'w400',
            'fontSize': 34.0,
            'inherit': true,
            'letterSpacing': 0.25,
            'textBaseline': 'alphabetic'
          },
          'headlineSmall': {
            'fontWeight': 'w400',
            'fontSize': 24.0,
            'inherit': true,
            'letterSpacing': 0.0,
            'textBaseline': 'alphabetic'
          },
          'labelLarge': {
            'fontWeight': 'w500',
            'fontSize': 14.0,
            'inherit': true,
            'letterSpacing': 1.25,
            'textBaseline': 'alphabetic'
          },
          'labelMedium': {
            'fontWeight': 'w400',
            'fontSize': 11.0,
            'inherit': true,
            'letterSpacing': 1.5,
            'textBaseline': 'alphabetic'
          },
          'labelSmall': {
            'fontWeight': 'w400',
            'fontSize': 10.0,
            'inherit': true,
            'letterSpacing': 1.5,
            'textBaseline': 'alphabetic'
          },
          'titleLarge': {
            'fontWeight': 'w500',
            'fontSize': 20.0,
            'inherit': true,
            'letterSpacing': 0.15,
            'textBaseline': 'alphabetic'
          },
          'titleMedium': {
            'fontWeight': 'w400',
            'fontSize': 16.0,
            'inherit': true,
            'letterSpacing': 0.15,
            'textBaseline': 'alphabetic'
          },
          'titleSmall': {
            'fontWeight': 'w500',
            'fontSize': 14.0,
            'inherit': true,
            'letterSpacing': 0.1,
            'textBaseline': 'alphabetic'
          },
        },
        'tall': {
          'bodyLarge': {
            'fontWeight': 'w700',
            'fontSize': 17.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'bodyMedium': {
            'fontWeight': 'w400',
            'fontSize': 15.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'bodySmall': {
            'fontWeight': 'w400',
            'fontSize': 13.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'displayLarge': {
            'fontWeight': 'w400',
            'fontSize': 96.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'displayMedium': {
            'fontWeight': 'w400',
            'fontSize': 60.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'displaySmall': {
            'fontWeight': 'w400',
            'fontSize': 48.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'headlineLarge': {
            'fontWeight': 'w400',
            'fontSize': 40.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'headlineMedium': {
            'fontWeight': 'w400',
            'fontSize': 34.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'headlineSmall': {
            'fontWeight': 'w400',
            'fontSize': 24.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'labelLarge': {
            'fontWeight': 'w700',
            'fontSize': 15.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'labelMedium': {
            'fontWeight': 'w400',
            'fontSize': 12.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'labelSmall': {
            'fontWeight': 'w400',
            'fontSize': 11.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'titleLarge': {
            'fontWeight': 'w700',
            'fontSize': 21.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'titleMedium': {
            'fontWeight': 'w400',
            'fontSize': 17.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
          'titleSmall': {
            'fontWeight': 'w500',
            'fontSize': 15.0,
            'inherit': true,
            'textBaseline': 'alphabetic'
          },
        },
        'white': {
          'bodyLarge': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'bodyMedium': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'bodySmall': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'displayLarge': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'displayMedium': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'displaySmall': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headlineLarge': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headlineMedium': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'headlineSmall': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'labelLarge': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'labelMedium': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'labelSmall': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'titleLarge': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'titleMedium': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
          'titleSmall': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true
          },
        },
      },
      'unselectedWidgetColor': '#bb444444',
      'useMaterial3': true,
      'visualDensity': 'comfortable',
    };

    expect(encoded, jsonMap);
    expect(ThemeEncoder.encodeThemeData(decoded), jsonMap);
  });

  test('TileMode', () {
    expect(ThemeDecoder.decodeTileMode(null), null);
    expect(ThemeEncoder.encodeTileMode(null), null);

    expect(
      ThemeDecoder.decodeTileMode(
        TileMode.clamp,
      ),
      TileMode.clamp,
    );

    expect(ThemeDecoder.decodeTileMode('clamp'), TileMode.clamp);
    expect(ThemeDecoder.decodeTileMode('mirror'), TileMode.mirror);
    expect(ThemeDecoder.decodeTileMode('repeated'), TileMode.repeated);

    expect(ThemeEncoder.encodeTileMode(TileMode.clamp), 'clamp');
    expect(ThemeEncoder.encodeTileMode(TileMode.mirror), 'mirror');
    expect(ThemeEncoder.encodeTileMode(TileMode.repeated), 'repeated');
  });

  test('TimePickerThemeData', () {
    expect(ThemeDecoder.decodeTimePickerThemeData(null), null);
    expect(ThemeEncoder.encodeTimePickerThemeData(null), null);

    var entry = TimePickerThemeData(
      backgroundColor: Color(0xff000001),
      dayPeriodBorderSide: BorderSide(
        color: Color(0xff000002),
        style: BorderStyle.solid,
        width: 1.0,
      ),
      dayPeriodColor: Color(0xff000003),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      dayPeriodTextColor: Color(0xff000004),
      dayPeriodTextStyle: TextStyle(fontSize: 1.0),
      dialBackgroundColor: Color(0xff000005),
      dialHandColor: Color(0xff000006),
      dialTextColor: Color(0xff000007),
      entryModeIconColor: Color(0xff000008),
      helpTextStyle: TextStyle(fontSize: 2.0),
      hourMinuteColor: Color(0xff000009),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      hourMinuteTextColor: Color(0xff000010),
      hourMinuteTextStyle: TextStyle(fontSize: 3.0),
      inputDecorationTheme: InputDecorationTheme(fillColor: Color(0xff000011)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
    );

    expect(ThemeDecoder.decodeTimePickerThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeTimePickerThemeData(entry);
    var decoded = ThemeDecoder.decodeTimePickerThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff000001',
      'dayPeriodBorderSide': {
        'color': '#ff000002',
        'style': 'solid',
        'width': 1.0,
      },
      'dayPeriodColor': '#ff000003',
      'dayPeriodShape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'bottomRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'topLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'topRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'type': 'only'
        },
        'side': {'color': '#ff000000', 'style': 'none', 'width': 0.0},
        'type': 'rounded',
      },
      'dayPeriodTextColor': '#ff000004',
      'dayPeriodTextStyle': {
        'fontSize': 1.0,
        'inherit': true,
      },
      'dialBackgroundColor': '#ff000005',
      'dialHandColor': '#ff000006',
      'dialTextColor': '#ff000007',
      'entryModeIconColor': '#ff000008',
      'helpTextStyle': {
        'fontSize': 2.0,
        'inherit': true,
      },
      'hourMinuteColor': '#ff000009',
      'hourMinuteShape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 5.0, 'y': 5.0},
          'bottomRight': {'type': 'elliptical', 'x': 5.0, 'y': 5.0},
          'topLeft': {'type': 'elliptical', 'x': 5.0, 'y': 5.0},
          'topRight': {'type': 'elliptical', 'x': 5.0, 'y': 5.0},
          'type': 'only'
        },
        'side': {'color': '#ff000000', 'style': 'none', 'width': 0.0},
        'type': 'rounded',
      },
      'hourMinuteTextColor': '#ff000010',
      'hourMinuteTextStyle': {
        'fontSize': 3.0,
        'inherit': true,
      },
      'inputDecorationTheme': {
        'alignLabelWithHint': false,
        'fillColor': '#ff000011',
        'filled': false,
        'floatingLabelAlignment': 'start',
        'floatingLabelBehavior': 'auto',
        'isCollapsed': false,
        'isDense': false,
      },
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 6.0, 'y': 6.0},
          'bottomRight': {'type': 'elliptical', 'x': 6.0, 'y': 6.0},
          'topLeft': {'type': 'elliptical', 'x': 6.0, 'y': 6.0},
          'topRight': {'type': 'elliptical', 'x': 6.0, 'y': 6.0},
          'type': 'only'
        },
        'side': {'color': '#ff000000', 'style': 'none', 'width': 0.0},
        'type': 'rounded',
      },
    });

    expect(
      decoded,
      entry,
    );
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

    expect(ThemeDecoder.decodeToggleButtonsThemeData(entry), entry);

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

    expect(ThemeDecoder.decodeToolbarOptions(entry), entry);

    var encoded = ThemeEncoder.encodeToolbarOptions(entry);
    var decoded = ThemeDecoder.decodeToolbarOptions(encoded)!;

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
      enableFeedback: true,
      excludeFromSemantics: true,
      height: 1.0,
      margin: EdgeInsets.all(2.0),
      padding: EdgeInsets.all(3.0),
      preferBelow: true,
      showDuration: Duration(milliseconds: 4),
      textStyle: _kTextStyle,
      triggerMode: TooltipTriggerMode.longPress,
      verticalOffset: 5.0,
      waitDuration: Duration(milliseconds: 6),
    );

    expect(ThemeDecoder.decodeTooltipThemeData(entry), entry);

    var encoded = ThemeEncoder.encodeTooltipThemeData(entry);
    var decoded = ThemeDecoder.decodeTooltipThemeData(encoded);

    expect(
      encoded,
      {
        'enableFeedback': true,
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
        'triggerMode': 'longPress',
        'verticalOffset': 5.0,
        'waitDuration': 6
      },
    );

    expect(
      decoded,
      entry,
    );
  });

  test('TooltipTriggerMode', () {
    expect(ThemeDecoder.decodeTooltipTriggerMode(null), null);
    expect(ThemeEncoder.encodeTooltipTriggerMode(null), null);

    expect(
      ThemeDecoder.decodeTooltipTriggerMode(TooltipTriggerMode.longPress),
      TooltipTriggerMode.longPress,
    );

    expect(
      ThemeDecoder.decodeTooltipTriggerMode('longPress'),
      TooltipTriggerMode.longPress,
    );
    expect(
      ThemeDecoder.decodeTooltipTriggerMode('manual'),
      TooltipTriggerMode.manual,
    );
    expect(
      ThemeDecoder.decodeTooltipTriggerMode('tap'),
      TooltipTriggerMode.tap,
    );

    expect(
      ThemeEncoder.encodeTooltipTriggerMode(TooltipTriggerMode.longPress),
      'longPress',
    );
    expect(
      ThemeEncoder.encodeTooltipTriggerMode(TooltipTriggerMode.manual),
      'manual',
    );
    expect(
      ThemeEncoder.encodeTooltipTriggerMode(TooltipTriggerMode.tap),
      'tap',
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

    expect(ThemeDecoder.decodeTypography(entry), entry);

    var encoded = ThemeEncoder.encodeTypography(entry);
    var decoded = ThemeDecoder.decodeTypography(encoded);

    expect(
      encoded,
      {
        'black': {
          'bodyLarge': {'color': '#ff111111', 'inherit': true}
        },
        'dense': {
          'bodyLarge': {'color': '#ff222222', 'inherit': true}
        },
        'englishLike': {
          'bodyLarge': {'color': '#ff333333', 'inherit': true}
        },
        'tall': {
          'bodyLarge': {'color': '#ff444444', 'inherit': true}
        },
        'white': {
          'bodyLarge': {'color': '#ff555555', 'inherit': true}
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
      ThemeDecoder.decodeVerticalDirection(
        VerticalDirection.down,
      ),
      VerticalDirection.down,
    );

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
      ThemeDecoder.decodeVisualDensity(
        VisualDensity.adaptivePlatformDensity,
      ),
      VisualDensity.adaptivePlatformDensity,
    );

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

  test('WrapAlignment', () {
    expect(ThemeDecoder.decodeWrapAlignment(null), null);
    expect(ThemeEncoder.encodeWrapAlignment(null), null);

    expect(
      ThemeDecoder.decodeWrapAlignment(
        WrapAlignment.start,
      ),
      WrapAlignment.start,
    );

    expect(
      ThemeDecoder.decodeWrapAlignment('center'),
      WrapAlignment.center,
    );
    expect(
      ThemeDecoder.decodeWrapAlignment('end'),
      WrapAlignment.end,
    );
    expect(
      ThemeDecoder.decodeWrapAlignment('spaceAround'),
      WrapAlignment.spaceAround,
    );
    expect(
      ThemeDecoder.decodeWrapAlignment('spaceBetween'),
      WrapAlignment.spaceBetween,
    );
    expect(
      ThemeDecoder.decodeWrapAlignment('spaceEvenly'),
      WrapAlignment.spaceEvenly,
    );
    expect(
      ThemeDecoder.decodeWrapAlignment('start'),
      WrapAlignment.start,
    );

    expect(
      ThemeEncoder.encodeWrapAlignment(WrapAlignment.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeWrapAlignment(WrapAlignment.end),
      'end',
    );
    expect(
      ThemeEncoder.encodeWrapAlignment(WrapAlignment.spaceAround),
      'spaceAround',
    );
    expect(
      ThemeEncoder.encodeWrapAlignment(WrapAlignment.spaceBetween),
      'spaceBetween',
    );
    expect(
      ThemeEncoder.encodeWrapAlignment(WrapAlignment.spaceEvenly),
      'spaceEvenly',
    );
    expect(
      ThemeEncoder.encodeWrapAlignment(WrapAlignment.start),
      'start',
    );
  });

  test('WrapCrossAlignment', () {
    expect(ThemeDecoder.decodeWrapCrossAlignment(null), null);
    expect(ThemeEncoder.encodeWrapCrossAlignment(null), null);

    expect(
      ThemeDecoder.decodeWrapAlignment(
        WrapAlignment.start,
      ),
      WrapAlignment.start,
    );

    expect(
      ThemeDecoder.decodeWrapCrossAlignment('center'),
      WrapCrossAlignment.center,
    );
    expect(
      ThemeDecoder.decodeWrapCrossAlignment('end'),
      WrapCrossAlignment.end,
    );
    expect(
      ThemeDecoder.decodeWrapCrossAlignment('start'),
      WrapCrossAlignment.start,
    );

    expect(
      ThemeEncoder.encodeWrapCrossAlignment(WrapCrossAlignment.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeWrapCrossAlignment(WrapCrossAlignment.end),
      'end',
    );
    expect(
      ThemeEncoder.encodeWrapCrossAlignment(WrapCrossAlignment.start),
      'start',
    );
  });
}

bool? _buttonStylesAreEqual(ButtonStyle? first, ButtonStyle? second) {
  bool? result;

  if (first.runtimeType != second.runtimeType) {
    result = false;
  } else if (first is! ButtonStyle) {
    result = false;
  } else if (second is ButtonStyle) {
    result = first.alignment == second.alignment &&
        first.animationDuration == second.animationDuration &&
        first.backgroundColor?.resolve({}) ==
            second.backgroundColor?.resolve({}) &&
        first.elevation?.resolve({}) == second.elevation?.resolve({}) &&
        first.enableFeedback == second.enableFeedback &&
        first.foregroundColor?.resolve({}) ==
            second.foregroundColor?.resolve({}) &&
        first.minimumSize?.resolve({}) == second.minimumSize?.resolve({}) &&
        first.mouseCursor?.resolve({}) == second.mouseCursor?.resolve({}) &&
        first.overlayColor?.resolve({}) == second.overlayColor?.resolve({}) &&
        first.padding?.resolve({}) == second.padding?.resolve({}) &&
        first.shadowColor?.resolve({}) == second.shadowColor?.resolve({}) &&
        first.shape?.resolve({}) == second.shape?.resolve({}) &&
        first.side?.resolve({}) == second.side?.resolve({}) &&
        first.tapTargetSize == second.tapTargetSize &&
        first.textStyle?.resolve({}) == second.textStyle?.resolve({}) &&
        first.visualDensity == second.visualDensity;
  }

  return result;
}

Map<String, dynamic> _materializeState(value) => {
      'disabled': value,
      'dragged': value,
      'empty': value,
      'error': value,
      'focused': value,
      'hovered': value,
      'pressed': value,
      'scrolledUnder': value,
      'selected': value,
    };
