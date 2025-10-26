import 'dart:convert';
import 'dart:ui' hide Size;

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_class/json_class.dart';
import 'package:json_theme/json_theme.dart';
import 'package:logging/logging.dart';

import 'base64_image.dart';

const _kColor = Color(0x00123456);
const _kColorStr = '#00123456';
const _kTextStyle = TextStyle(color: _kColor);
const _kTextStyleJson = {'color': _kColorStr, 'inherit': true};

void main() {
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
    if (record.error != null) {
      debugPrint('${record.error}');
    }
    if (record.stackTrace != null) {
      debugPrint('${record.stackTrace}');
    }
  });

  test('Alignment', () {
    expect(ThemeDecoder.instance.decodeAlignment(null), null);
    expect(ThemeEncoder.instance.encodeAlignment(null), null);

    expect(
      ThemeDecoder.instance.decodeAlignment(Alignment.bottomCenter),
      Alignment.bottomCenter,
    );

    expect(
      ThemeDecoder.instance.decodeAlignment({'x': 0.2, 'y': 0.4}),
      const Alignment(0.2, 0.4),
    );
    expect(ThemeEncoder.instance.encodeAlignment(const Alignment(0.2, 0.4)), {
      'x': 0.2,
      'y': 0.4,
    });

    expect(
      ThemeDecoder.instance.decodeAlignment('bottomCenter'),
      Alignment.bottomCenter,
    );
    expect(
      ThemeDecoder.instance.decodeAlignment('bottomLeft'),
      Alignment.bottomLeft,
    );
    expect(
      ThemeDecoder.instance.decodeAlignment('bottomRight'),
      Alignment.bottomRight,
    );

    expect(ThemeDecoder.instance.decodeAlignment('center'), Alignment.center);
    expect(
      ThemeDecoder.instance.decodeAlignment('centerLeft'),
      Alignment.centerLeft,
    );
    expect(
      ThemeDecoder.instance.decodeAlignment('centerRight'),
      Alignment.centerRight,
    );

    expect(
      ThemeDecoder.instance.decodeAlignment('topCenter'),
      Alignment.topCenter,
    );
    expect(ThemeDecoder.instance.decodeAlignment('topLeft'), Alignment.topLeft);
    expect(
      ThemeDecoder.instance.decodeAlignment('topRight'),
      Alignment.topRight,
    );

    expect(
      ThemeEncoder.instance.encodeAlignment(Alignment.bottomCenter),
      'bottomCenter',
    );
    expect(
      ThemeEncoder.instance.encodeAlignment(Alignment.bottomLeft),
      'bottomLeft',
    );
    expect(
      ThemeEncoder.instance.encodeAlignment(Alignment.bottomRight),
      'bottomRight',
    );

    expect(ThemeEncoder.instance.encodeAlignment(Alignment.center), 'center');
    expect(
      ThemeEncoder.instance.encodeAlignment(Alignment.centerLeft),
      'centerLeft',
    );
    expect(
      ThemeEncoder.instance.encodeAlignment(Alignment.centerRight),
      'centerRight',
    );

    expect(
      ThemeEncoder.instance.encodeAlignment(Alignment.topCenter),
      'topCenter',
    );
    expect(ThemeEncoder.instance.encodeAlignment(Alignment.topLeft), 'topLeft');
    expect(
      ThemeEncoder.instance.encodeAlignment(Alignment.topRight),
      'topRight',
    );
  });

  test('AlignmentDirectional', () {
    expect(ThemeDecoder.instance.decodeAlignmentDirectional(null), null);
    expect(ThemeEncoder.instance.encodeAlignmentDirectional(null), null);

    expect(
      ThemeDecoder.instance.decodeAlignmentDirectional(
        AlignmentDirectional.bottomCenter,
      ),
      AlignmentDirectional.bottomCenter,
    );

    expect(
      ThemeDecoder.instance.decodeAlignmentDirectional('bottomCenter'),
      AlignmentDirectional.bottomCenter,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentDirectional('bottomEnd'),
      AlignmentDirectional.bottomEnd,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentDirectional('bottomStart'),
      AlignmentDirectional.bottomStart,
    );

    expect(
      ThemeDecoder.instance.decodeAlignmentDirectional('center'),
      AlignmentDirectional.center,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentDirectional('centerEnd'),
      AlignmentDirectional.centerEnd,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentDirectional('centerStart'),
      AlignmentDirectional.centerStart,
    );

    expect(
      ThemeDecoder.instance.decodeAlignmentDirectional('topCenter'),
      AlignmentDirectional.topCenter,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentDirectional('topEnd'),
      AlignmentDirectional.topEnd,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentDirectional('topStart'),
      AlignmentDirectional.topStart,
    );

    expect(
      ThemeEncoder.instance.encodeAlignmentDirectional(
        AlignmentDirectional.bottomCenter,
      ),
      'bottomCenter',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentDirectional(
        AlignmentDirectional.bottomEnd,
      ),
      'bottomEnd',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentDirectional(
        AlignmentDirectional.bottomStart,
      ),
      'bottomStart',
    );

    expect(
      ThemeEncoder.instance.encodeAlignmentDirectional(
        AlignmentDirectional.center,
      ),
      'center',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentDirectional(
        AlignmentDirectional.centerEnd,
      ),
      'centerEnd',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentDirectional(
        AlignmentDirectional.centerStart,
      ),
      'centerStart',
    );

    expect(
      ThemeEncoder.instance.encodeAlignmentDirectional(
        AlignmentDirectional.topCenter,
      ),
      'topCenter',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentDirectional(
        AlignmentDirectional.topEnd,
      ),
      'topEnd',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentDirectional(
        AlignmentDirectional.topStart,
      ),
      'topStart',
    );
  });

  test('AlignmentGeometry', () {
    expect(ThemeDecoder.instance.decodeAlignmentGeometry(null), null);
    expect(ThemeEncoder.instance.encodeAlignmentGeometry(null), null);

    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry(Alignment.bottomCenter),
      Alignment.bottomCenter,
    );

    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry({'x': 0.2, 'y': 0.4}),
      const Alignment(0.2, 0.4),
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(const Alignment(0.2, 0.4)),
      {'x': 0.2, 'y': 0.4},
    );

    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('bottomCenter'),
      Alignment.bottomCenter,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('bottomLeft'),
      Alignment.bottomLeft,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('bottomRight'),
      Alignment.bottomRight,
    );

    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('center'),
      Alignment.center,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('centerLeft'),
      Alignment.centerLeft,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('centerRight'),
      Alignment.centerRight,
    );

    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('topCenter'),
      Alignment.topCenter,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('topLeft'),
      Alignment.topLeft,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('topRight'),
      Alignment.topRight,
    );

    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(Alignment.bottomCenter),
      'bottomCenter',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(Alignment.bottomLeft),
      'bottomLeft',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(Alignment.bottomRight),
      'bottomRight',
    );

    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(Alignment.center),
      'center',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(Alignment.centerLeft),
      'centerLeft',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(Alignment.centerRight),
      'centerRight',
    );

    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(Alignment.topCenter),
      'topCenter',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(Alignment.topLeft),
      'topLeft',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(Alignment.topRight),
      'topRight',
    );

    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry(
        AlignmentDirectional.bottomCenter,
      ),
      AlignmentDirectional.bottomCenter,
    );

    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('bottomEnd'),
      AlignmentDirectional.bottomEnd,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('bottomStart'),
      AlignmentDirectional.bottomStart,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('centerEnd'),
      AlignmentDirectional.centerEnd,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('centerStart'),
      AlignmentDirectional.centerStart,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('topEnd'),
      AlignmentDirectional.topEnd,
    );
    expect(
      ThemeDecoder.instance.decodeAlignmentGeometry('topStart'),
      AlignmentDirectional.topStart,
    );

    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(
        AlignmentDirectional.bottomCenter,
      ),
      'bottomCenter',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(
        AlignmentDirectional.bottomEnd,
      ),
      'bottomEnd',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(
        AlignmentDirectional.bottomStart,
      ),
      'bottomStart',
    );

    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(
        AlignmentDirectional.center,
      ),
      'center',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(
        AlignmentDirectional.centerEnd,
      ),
      'centerEnd',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(
        AlignmentDirectional.centerStart,
      ),
      'centerStart',
    );

    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(
        AlignmentDirectional.topCenter,
      ),
      'topCenter',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(
        AlignmentDirectional.topEnd,
      ),
      'topEnd',
    );
    expect(
      ThemeEncoder.instance.encodeAlignmentGeometry(
        AlignmentDirectional.topStart,
      ),
      'topStart',
    );
  });

  test('AndroidOverscrollIndicator', () {
    expect(ThemeDecoder.instance.decodeAndroidOverscrollIndicator(null), null);
    expect(ThemeEncoder.instance.encodeAndroidOverscrollIndicator(null), null);

    expect(
      ThemeDecoder.instance.decodeAndroidOverscrollIndicator(
        AndroidOverscrollIndicator.glow,
      ),
      AndroidOverscrollIndicator.glow,
    );

    expect(
      ThemeDecoder.instance.decodeAndroidOverscrollIndicator('glow'),
      AndroidOverscrollIndicator.glow,
    );
    expect(
      ThemeDecoder.instance.decodeAndroidOverscrollIndicator('stretch'),
      AndroidOverscrollIndicator.stretch,
    );

    expect(
      ThemeEncoder.instance.encodeAndroidOverscrollIndicator(
        AndroidOverscrollIndicator.glow,
      ),
      'glow',
    );
    expect(
      ThemeEncoder.instance.encodeAndroidOverscrollIndicator(
        AndroidOverscrollIndicator.stretch,
      ),
      'stretch',
    );
  });

  test('AnimationStyle', () {
    expect(ThemeDecoder.instance.decodeAnimationStyle(null), null);
    expect(ThemeEncoder.instance.encodeAnimationStyle(null), null);

    expect(
      ThemeDecoder.instance.decodeAnimationStyle(AnimationStyle.noAnimation),
      AnimationStyle.noAnimation,
    );

    expect(
      ThemeDecoder.instance.decodeAnimationStyle('noAnimation'),
      AnimationStyle.noAnimation,
    );

    expect(
      ThemeEncoder.instance.encodeAnimationStyle(AnimationStyle.noAnimation),
      'noAnimation',
    );
  });

  test('AppBarThemeData', () {
    expect(ThemeDecoder.instance.decodeAppBarThemeData(null), null);
    expect(ThemeEncoder.instance.encodeAppBarThemeData(null), null);

    const entry = AppBarThemeData(
      actionsPadding: EdgeInsets.all(8.0),
      backgroundColor: _kColor,
      centerTitle: true,
      elevation: 6.0,
      foregroundColor: _kColor,
      shadowColor: _kColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarHeight: 64.0,
    );

    expect(ThemeDecoder.instance.decodeAppBarThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeAppBarThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeAppBarThemeData(encoded);

    expect(
      json.encode(encoded),
      json.encode({
        'actionsPadding': {
          'bottom': 8.0,
          'left': 8.0,
          'right': 8.0,
          'top': 8.0,
        },
        'backgroundColor': _kColorStr,
        'centerTitle': true,
        'elevation': 6.0,
        'foregroundColor': _kColorStr,
        'shadowColor': _kColorStr,
        'systemOverlayStyle': 'dark',
        'toolbarHeight': 64.0,
      }),
    );

    expect(decoded, entry);
  });

  test('AutovalidateMode', () {
    expect(ThemeDecoder.instance.decodeAutovalidateMode(null), null);
    expect(ThemeEncoder.instance.encodeAutovalidateMode(null), null);

    expect(
      ThemeDecoder.instance.decodeAutovalidateMode(AutovalidateMode.always),
      AutovalidateMode.always,
    );

    // Test each values from AutovalidateMode enum
    for (var value in AutovalidateMode.values) {
      expect(ThemeDecoder.instance.decodeAutovalidateMode(value.name), value);
      expect(ThemeEncoder.instance.encodeAutovalidateMode(value), value.name);
    }
  });

  test('Axis', () {
    expect(ThemeDecoder.instance.decodeAxis(null), null);
    expect(ThemeEncoder.instance.encodeAxis(null), null);

    expect(ThemeDecoder.instance.decodeAxis(Axis.horizontal), Axis.horizontal);

    expect(ThemeDecoder.instance.decodeAxis('horizontal'), Axis.horizontal);
    expect(ThemeDecoder.instance.decodeAxis('vertical'), Axis.vertical);

    expect(ThemeEncoder.instance.encodeAxis(Axis.horizontal), 'horizontal');
    expect(ThemeEncoder.instance.encodeAxis(Axis.vertical), 'vertical');
  });

  test('BadgeThemeData', () {
    expect(ThemeDecoder.instance.decodeBadgeThemeData(null), null);
    expect(ThemeEncoder.instance.encodeBadgeThemeData(null), null);

    const entry = BadgeThemeData(
      alignment: Alignment.bottomCenter,
      backgroundColor: _kColor,
      largeSize: 20.0,
      offset: Offset(10.0, 20.0),
      padding: EdgeInsets.all(16.0),
      smallSize: 10.0,
      textColor: _kColor,
      textStyle: TextStyle(fontWeight: FontWeight.w400),
    );

    expect(ThemeDecoder.instance.decodeBadgeThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeBadgeThemeData(entry);

    expect(encoded, {
      'alignment': 'bottomCenter',
      'backgroundColor': _kColorStr,
      'largeSize': 20.0,
      'offset': {'dx': 10.0, 'dy': 20.0},
      'padding': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
      'smallSize': 10.0,
      'textColor': _kColorStr,
      'textStyle': {'fontWeight': 'w400', 'inherit': true},
    });
  });
  test('BlendMode', () {
    expect(ThemeDecoder.instance.decodeBlendMode(null), null);
    expect(ThemeEncoder.instance.encodeBlendMode(null), null);

    expect(
      ThemeDecoder.instance.decodeBlendMode(BlendMode.clear),
      BlendMode.clear,
    );

    expect(ThemeDecoder.instance.decodeBlendMode('clear'), BlendMode.clear);
    expect(ThemeDecoder.instance.decodeBlendMode('color'), BlendMode.color);
    expect(
      ThemeDecoder.instance.decodeBlendMode('colorBurn'),
      BlendMode.colorBurn,
    );
    expect(
      ThemeDecoder.instance.decodeBlendMode('colorDodge'),
      BlendMode.colorDodge,
    );
    expect(ThemeDecoder.instance.decodeBlendMode('darken'), BlendMode.darken);
    expect(
      ThemeDecoder.instance.decodeBlendMode('difference'),
      BlendMode.difference,
    );
    expect(ThemeDecoder.instance.decodeBlendMode('dst'), BlendMode.dst);
    expect(ThemeDecoder.instance.decodeBlendMode('dstATop'), BlendMode.dstATop);
    expect(ThemeDecoder.instance.decodeBlendMode('dstIn'), BlendMode.dstIn);
    expect(ThemeDecoder.instance.decodeBlendMode('dstOut'), BlendMode.dstOut);
    expect(ThemeDecoder.instance.decodeBlendMode('dstOver'), BlendMode.dstOver);
    expect(
      ThemeDecoder.instance.decodeBlendMode('exclusion'),
      BlendMode.exclusion,
    );
    expect(
      ThemeDecoder.instance.decodeBlendMode('hardLight'),
      BlendMode.hardLight,
    );
    expect(ThemeDecoder.instance.decodeBlendMode('hue'), BlendMode.hue);
    expect(ThemeDecoder.instance.decodeBlendMode('lighten'), BlendMode.lighten);
    expect(
      ThemeDecoder.instance.decodeBlendMode('luminosity'),
      BlendMode.luminosity,
    );
    expect(
      ThemeDecoder.instance.decodeBlendMode('modulate'),
      BlendMode.modulate,
    );
    expect(
      ThemeDecoder.instance.decodeBlendMode('multiply'),
      BlendMode.multiply,
    );
    expect(ThemeDecoder.instance.decodeBlendMode('overlay'), BlendMode.overlay);
    expect(ThemeDecoder.instance.decodeBlendMode('plus'), BlendMode.plus);
    expect(
      ThemeDecoder.instance.decodeBlendMode('saturation'),
      BlendMode.saturation,
    );
    expect(ThemeDecoder.instance.decodeBlendMode('screen'), BlendMode.screen);
    expect(
      ThemeDecoder.instance.decodeBlendMode('softLight'),
      BlendMode.softLight,
    );
    expect(ThemeDecoder.instance.decodeBlendMode('src'), BlendMode.src);
    expect(ThemeDecoder.instance.decodeBlendMode('srcATop'), BlendMode.srcATop);
    expect(ThemeDecoder.instance.decodeBlendMode('srcIn'), BlendMode.srcIn);
    expect(ThemeDecoder.instance.decodeBlendMode('srcOut'), BlendMode.srcOut);
    expect(ThemeDecoder.instance.decodeBlendMode('srcOver'), BlendMode.srcOver);
    expect(ThemeDecoder.instance.decodeBlendMode('xor'), BlendMode.xor);

    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.clear), 'clear');
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.color), 'color');
    expect(
      ThemeEncoder.instance.encodeBlendMode(BlendMode.colorBurn),
      'colorBurn',
    );
    expect(
      ThemeEncoder.instance.encodeBlendMode(BlendMode.colorDodge),
      'colorDodge',
    );
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.darken), 'darken');
    expect(
      ThemeEncoder.instance.encodeBlendMode(BlendMode.difference),
      'difference',
    );
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.dst), 'dst');
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.dstATop), 'dstATop');
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.dstIn), 'dstIn');
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.dstOut), 'dstOut');
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.dstOver), 'dstOver');
    expect(
      ThemeEncoder.instance.encodeBlendMode(BlendMode.exclusion),
      'exclusion',
    );
    expect(
      ThemeEncoder.instance.encodeBlendMode(BlendMode.hardLight),
      'hardLight',
    );
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.hue), 'hue');
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.lighten), 'lighten');
    expect(
      ThemeEncoder.instance.encodeBlendMode(BlendMode.luminosity),
      'luminosity',
    );
    expect(
      ThemeEncoder.instance.encodeBlendMode(BlendMode.modulate),
      'modulate',
    );
    expect(
      ThemeEncoder.instance.encodeBlendMode(BlendMode.multiply),
      'multiply',
    );
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.overlay), 'overlay');
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.plus), 'plus');
    expect(
      ThemeEncoder.instance.encodeBlendMode(BlendMode.saturation),
      'saturation',
    );
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.screen), 'screen');
    expect(
      ThemeEncoder.instance.encodeBlendMode(BlendMode.softLight),
      'softLight',
    );
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.src), 'src');
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.srcATop), 'srcATop');
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.srcIn), 'srcIn');
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.srcOut), 'srcOut');
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.srcOver), 'srcOver');
    expect(ThemeEncoder.instance.encodeBlendMode(BlendMode.xor), 'xor');
  });

  test('BlurStyle', () {
    expect(ThemeDecoder.instance.decodeBlurStyle(null), null);
    expect(ThemeEncoder.instance.encodeBlurStyle(null), null);

    expect(ThemeDecoder.instance.decodeBlurStyle('inner'), BlurStyle.inner);
    expect(ThemeDecoder.instance.decodeBlurStyle('normal'), BlurStyle.normal);
    expect(ThemeDecoder.instance.decodeBlurStyle('inner'), BlurStyle.inner);
    expect(ThemeDecoder.instance.decodeBlurStyle('outer'), BlurStyle.outer);

    expect(ThemeEncoder.instance.encodeBlurStyle(BlurStyle.inner), 'inner');
    expect(ThemeEncoder.instance.encodeBlurStyle(BlurStyle.normal), 'normal');
    expect(ThemeEncoder.instance.encodeBlurStyle(BlurStyle.inner), 'inner');
    expect(ThemeEncoder.instance.encodeBlurStyle(BlurStyle.outer), 'outer');
  });

  test('BorderRadius', () {
    expect(ThemeDecoder.instance.decodeBorderRadius(null), null);
    expect(ThemeEncoder.instance.encodeBorderRadius(null), null);

    final entry = BorderRadius.circular(16.0);

    expect(ThemeDecoder.instance.decodeBorderRadius(entry), entry);

    final encoded = ThemeEncoder.instance.encodeBorderRadius(entry);
    final decoded = ThemeDecoder.instance.decodeBorderRadius(encoded);

    const corner = {'type': 'elliptical', 'x': 16.0, 'y': 16.0};

    expect(encoded, {
      'bottomLeft': corner,
      'bottomRight': corner,
      'topLeft': corner,
      'topRight': corner,
      'type': 'only',
    });

    expect(entry, decoded);

    expect(
      ThemeDecoder.instance.decodeBorderRadius(16),
      BorderRadius.circular(16),
    );
  });

  test('BorderSide', () {
    expect(ThemeDecoder.instance.decodeBorderSide(null), null);
    expect(ThemeEncoder.instance.encodeBorderSide(null), null);

    const entry = BorderSide(
      color: _kColor,
      strokeAlign: 3.0,
      style: BorderStyle.solid,
      width: 5.0,
    );

    expect(ThemeDecoder.instance.decodeBorderSide(entry), entry);

    final encoded = ThemeEncoder.instance.encodeBorderSide(entry);
    final decoded = ThemeDecoder.instance.decodeBorderSide(encoded);

    expect(encoded, {
      'color': _kColorStr,
      'strokeAlign': 3.0,
      'style': 'solid',
      'width': 5.0,
    });

    expect(decoded, entry);
  });

  test('BorderStyle', () {
    expect(ThemeDecoder.instance.decodeBorderStyle(null), null);
    expect(ThemeEncoder.instance.encodeBorderStyle(null), null);

    expect(
      ThemeDecoder.instance.decodeBorderStyle(BorderStyle.none),
      BorderStyle.none,
    );

    expect(ThemeDecoder.instance.decodeBorderStyle('none'), BorderStyle.none);
    expect(ThemeDecoder.instance.decodeBorderStyle('solid'), BorderStyle.solid);

    expect(ThemeEncoder.instance.encodeBorderStyle(BorderStyle.none), 'none');
    expect(ThemeEncoder.instance.encodeBorderStyle(BorderStyle.solid), 'solid');
  });

  test('BottomAppBarThemeData', () {
    expect(ThemeDecoder.instance.decodeBottomAppBarThemeData(null), null);
    expect(ThemeEncoder.instance.encodeBottomAppBarThemeData(null), null);

    const entry = BottomAppBarThemeData(
      color: _kColor,
      elevation: 8.0,
      height: 20.0,
      padding: EdgeInsets.all(16.0),
      shadowColor: _kColor,
      shape: CircularNotchedRectangle(),
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.instance.decodeBottomAppBarThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeBottomAppBarThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeBottomAppBarThemeData(encoded)!;

    expect(encoded, {
      'color': _kColorStr,
      'elevation': 8.0,
      'height': 20.0,
      'padding': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
      'shadowColor': _kColorStr,
      'shape': 'circular',
      'surfaceTintColor': _kColorStr,
    });

    expect(decoded.color, entry.color);

    expect(decoded.elevation, entry.elevation);

    expect(decoded.shape?.runtimeType, entry.shape?.runtimeType);
  });

  test('BottomNavigationBarLandscapeLayout', () {
    expect(
      ThemeDecoder.instance.decodeBottomNavigationBarLandscapeLayout(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeBottomNavigationBarLandscapeLayout(null),
      null,
    );

    expect(
      ThemeDecoder.instance.decodeBottomNavigationBarLandscapeLayout(
        BottomNavigationBarLandscapeLayout.centered,
      ),
      BottomNavigationBarLandscapeLayout.centered,
    );

    expect(
      ThemeDecoder.instance.decodeBottomNavigationBarLandscapeLayout(
        'centered',
      ),
      BottomNavigationBarLandscapeLayout.centered,
    );
    expect(
      ThemeDecoder.instance.decodeBottomNavigationBarLandscapeLayout('linear'),
      BottomNavigationBarLandscapeLayout.linear,
    );
    expect(
      ThemeDecoder.instance.decodeBottomNavigationBarLandscapeLayout('spread'),
      BottomNavigationBarLandscapeLayout.spread,
    );

    expect(
      ThemeEncoder.instance.encodeBottomNavigationBarLandscapeLayout(
        BottomNavigationBarLandscapeLayout.centered,
      ),
      'centered',
    );
    expect(
      ThemeEncoder.instance.encodeBottomNavigationBarLandscapeLayout(
        BottomNavigationBarLandscapeLayout.linear,
      ),
      'linear',
    );
    expect(
      ThemeEncoder.instance.encodeBottomNavigationBarLandscapeLayout(
        BottomNavigationBarLandscapeLayout.spread,
      ),
      'spread',
    );
  });

  test('BottomNavigationBarThemeData', () {
    expect(
      ThemeDecoder.instance.decodeBottomNavigationBarThemeData(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeBottomNavigationBarThemeData(null),
      null,
    );

    const entry = BottomNavigationBarThemeData(
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

    expect(
      ThemeDecoder.instance.decodeBottomNavigationBarThemeData(entry),
      entry,
    );

    final encoded = ThemeEncoder.instance.encodeBottomNavigationBarThemeData(
      entry,
    );
    final decoded = ThemeDecoder.instance.decodeBottomNavigationBarThemeData(
      encoded,
    );

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'elevation': 1.0,
      'selectedIconTheme': {'opacity': 0.2},
      'selectedItemColor': '#ff222222',
      'selectedLabelStyle': {'fontSize': 3.0, 'inherit': true},
      'showSelectedLabels': true,
      'showUnselectedLabels': true,
      'type': 'fixed',
      'unselectedIconTheme': {'opacity': 0.4},
      'unselectedItemColor': '#ff333333',
      'unselectedLabelStyle': {'fontSize': 5.0, 'inherit': true},
    });

    expect(decoded, entry);
  });

  test('BottomNavigationBarType', () {
    expect(ThemeDecoder.instance.decodeBottomNavigationBarType(null), null);
    expect(ThemeEncoder.instance.encodeBottomNavigationBarType(null), null);

    expect(
      ThemeDecoder.instance.decodeBottomNavigationBarType(
        BottomNavigationBarType.fixed,
      ),
      BottomNavigationBarType.fixed,
    );

    expect(
      ThemeDecoder.instance.decodeBottomNavigationBarType('fixed'),
      BottomNavigationBarType.fixed,
    );
    expect(
      ThemeDecoder.instance.decodeBottomNavigationBarType('shifting'),
      BottomNavigationBarType.shifting,
    );

    expect(
      ThemeEncoder.instance.encodeBottomNavigationBarType(
        BottomNavigationBarType.fixed,
      ),
      'fixed',
    );
    expect(
      ThemeEncoder.instance.encodeBottomNavigationBarType(
        BottomNavigationBarType.shifting,
      ),
      'shifting',
    );
  });

  test('BottomSheetThemeData', () {
    expect(ThemeDecoder.instance.decodeBottomSheetThemeData(null), null);
    expect(ThemeEncoder.instance.encodeBottomSheetThemeData(null), null);

    const entry = BottomSheetThemeData(
      backgroundColor: Color(0xff111111),
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints(maxHeight: 40.0),
      dragHandleColor: _kColor,
      dragHandleSize: Size(20.0, 2.0),
      elevation: 12.0,
      modalBackgroundColor: Color(0xff222222),
      modalBarrierColor: Color(0xff333333),
      modalElevation: 18.0,
      shadowColor: _kColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      showDragHandle: true,
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.instance.decodeBottomSheetThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeBottomSheetThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeBottomSheetThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'clipBehavior': 'antiAlias',
      'constraints': {'maxHeight': 40.0, 'minHeight': 0.0, 'minWidth': 0.0},
      'dragHandleColor': _kColorStr,
      'dragHandleSize': {'height': 2.0, 'width': 20.0},
      'elevation': 12.0,
      'modalBackgroundColor': '#ff222222',
      'modalBarrierColor': '#ff333333',
      'modalElevation': 18.0,
      'shadowColor': _kColorStr,
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 16.0, 'y': 16.0},
          'bottomRight': {'type': 'elliptical', 'x': 16.0, 'y': 16.0},
          'topLeft': {'type': 'elliptical', 'x': 16.0, 'y': 16.0},
          'topRight': {'type': 'elliptical', 'x': 16.0, 'y': 16.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'showDragHandle': true,
      'surfaceTintColor': _kColorStr,
    });

    expect(
      ThemeEncoder.instance.encodeBottomSheetThemeData(decoded),
      ThemeEncoder.instance.encodeBottomSheetThemeData(entry),
    );
  });

  test('BoxBorder', () {
    expect(ThemeDecoder.instance.decodeBoxBorder(null), null);
    expect(ThemeEncoder.instance.encodeBoxBorder(null), null);

    const entry = Border(
      bottom: BorderSide(color: Color(0xff111111)),
      left: BorderSide(color: Color(0xff222222)),
      right: BorderSide(color: Color(0xff333333)),
      top: BorderSide(color: Color(0xff444444)),
    );

    expect(ThemeDecoder.instance.decodeBoxBorder(entry), entry);

    final encoded = ThemeEncoder.instance.encodeBoxBorder(entry);
    final decoded = ThemeDecoder.instance.decodeBoxBorder(encoded);

    expect(encoded, {
      'bottom': {
        'color': '#ff111111',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'left': {
        'color': '#ff222222',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'right': {
        'color': '#ff333333',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'top': {
        'color': '#ff444444',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
    });

    expect(decoded, entry);

    expect(
      ThemeDecoder.instance.decodeBoxBorder({
        'color': '#000',
        'style': 'solid',
        'width': 1,
      }),
      Border.all(
        color: const Color(0xff000000),
        style: BorderStyle.solid,
        width: 1.0,
      ),
    );
  });

  test('BoxConstraints', () {
    expect(ThemeDecoder.instance.decodeBoxConstraints(null), null);
    expect(ThemeEncoder.instance.encodeBoxConstraints(null), null);

    const entry = BoxConstraints(
      maxHeight: 1000.0,
      maxWidth: 1001.0,
      minHeight: 100.0,
      minWidth: 101.0,
    );

    expect(ThemeDecoder.instance.decodeBoxConstraints(entry), entry);

    final encoded = ThemeEncoder.instance.encodeBoxConstraints(entry);
    final decoded = ThemeDecoder.instance.decodeBoxConstraints(encoded);

    expect(encoded, {
      'maxHeight': 1000.0,
      'maxWidth': 1001.0,
      'minHeight': 100.0,
      'minWidth': 101.0,
    });

    expect(ThemeEncoder.instance.encodeBoxConstraints(const BoxConstraints()), {
      'minHeight': 0.0,
      'minWidth': 0.0,
    });

    expect(decoded, entry);
  });

  test('BoxDecoration', () {
    expect(ThemeDecoder.instance.decodeBoxDecoration(null), null);
    expect(ThemeEncoder.instance.encodeBoxDecoration(null), null);

    final entry = BoxDecoration(
      backgroundBlendMode: BlendMode.colorBurn,
      border: Border.all(color: _kColor),
      borderRadius: BorderRadius.circular(1.0),
      boxShadow: const [
        BoxShadow(blurStyle: BlurStyle.inner, color: Color(0xff111111)),
        BoxShadow(blurStyle: BlurStyle.normal, color: Color(0xff222222)),
      ],
      color: const Color(0xff333333),
      gradient: const RadialGradient(
        colors: [Color(0xff444444), Color(0xff555555)],
      ),
      image: DecorationImage(image: MemoryImage(base64Decode(base64Image))),
      shape: BoxShape.circle,
    );

    expect(ThemeDecoder.instance.decodeBoxDecoration(entry), entry);

    final encoded = ThemeEncoder.instance.encodeBoxDecoration(entry);
    final decoded = ThemeDecoder.instance.decodeBoxDecoration(encoded);

    expect(encoded, {
      'backgroundBlendMode': 'colorBurn',
      'border': {
        'bottom': {
          'color': _kColorStr,
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'left': {
          'color': _kColorStr,
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'right': {
          'color': _kColorStr,
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'top': {
          'color': _kColorStr,
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
      },
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'bottomRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'topLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'topRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'type': 'only',
      },
      'boxShadow': [
        {
          'blurStyle': 'inner',
          'blurRadius': 0.0,
          'color': '#ff111111',
          'offset': {'dx': 0.0, 'dy': 0.0},
          'spreadRadius': 0.0,
        },
        {
          'blurStyle': 'normal',
          'blurRadius': 0.0,
          'color': '#ff222222',
          'offset': {'dx': 0.0, 'dy': 0.0},
          'spreadRadius': 0.0,
        },
      ],
      'color': '#ff333333',
      'gradient': {
        'center': 'center',
        'colors': ['#ff444444', '#ff555555'],
        'focalRadius': 0.0,
        'radius': 0.5,
        'tileMode': 'clamp',
        'type': 'radial',
      },
      'image': {
        'alignment': 'center',
        'filterQuality': 'medium',
        'image': {'bytes': base64Image, 'scale': 1.0, 'type': 'memory'},
        'invertColors': false,
        'isAntiAlias': false,
        'matchTextDirection': false,
        'opacity': 1.0,
        'repeat': 'noRepeat',
        'scale': 1.0,
      },
      'shape': 'circle',
    });

    expect(ThemeEncoder.instance.encodeBoxDecoration(decoded), encoded);
  });

  test('BoxFit', () {
    expect(ThemeDecoder.instance.decodeBoxFit(null), null);
    expect(ThemeEncoder.instance.encodeBoxFit(null), null);

    expect(ThemeDecoder.instance.decodeBoxFit(BoxFit.contain), BoxFit.contain);

    expect(ThemeDecoder.instance.decodeBoxFit('contain'), BoxFit.contain);
    expect(ThemeDecoder.instance.decodeBoxFit('cover'), BoxFit.cover);
    expect(ThemeDecoder.instance.decodeBoxFit('fill'), BoxFit.fill);
    expect(ThemeDecoder.instance.decodeBoxFit('fitHeight'), BoxFit.fitHeight);
    expect(ThemeDecoder.instance.decodeBoxFit('fitWidth'), BoxFit.fitWidth);
    expect(ThemeDecoder.instance.decodeBoxFit('none'), BoxFit.none);
    expect(ThemeDecoder.instance.decodeBoxFit('scaleDown'), BoxFit.scaleDown);

    expect(ThemeEncoder.instance.encodeBoxFit(BoxFit.contain), 'contain');
    expect(ThemeEncoder.instance.encodeBoxFit(BoxFit.cover), 'cover');
    expect(ThemeEncoder.instance.encodeBoxFit(BoxFit.fill), 'fill');
    expect(ThemeEncoder.instance.encodeBoxFit(BoxFit.fitHeight), 'fitHeight');
    expect(ThemeEncoder.instance.encodeBoxFit(BoxFit.fitWidth), 'fitWidth');
    expect(ThemeEncoder.instance.encodeBoxFit(BoxFit.none), 'none');
    expect(ThemeEncoder.instance.encodeBoxFit(BoxFit.scaleDown), 'scaleDown');
  });

  test('BoxHeightStyle', () {
    expect(ThemeDecoder.instance.decodeBoxHeightStyle(null), null);
    expect(ThemeEncoder.instance.encodeBoxHeightStyle(null), null);

    expect(
      ThemeDecoder.instance.decodeBoxHeightStyle(BoxHeightStyle.max),
      BoxHeightStyle.max,
    );

    expect(
      ThemeDecoder.instance.decodeBoxHeightStyle('includeLineSpacingBottom'),
      BoxHeightStyle.includeLineSpacingBottom,
    );
    expect(
      ThemeDecoder.instance.decodeBoxHeightStyle('includeLineSpacingMiddle'),
      BoxHeightStyle.includeLineSpacingMiddle,
    );
    expect(
      ThemeDecoder.instance.decodeBoxHeightStyle('includeLineSpacingTop'),
      BoxHeightStyle.includeLineSpacingTop,
    );
    expect(
      ThemeDecoder.instance.decodeBoxHeightStyle('max'),
      BoxHeightStyle.max,
    );
    expect(
      ThemeDecoder.instance.decodeBoxHeightStyle('strut'),
      BoxHeightStyle.strut,
    );
    expect(
      ThemeDecoder.instance.decodeBoxHeightStyle('tight'),
      BoxHeightStyle.tight,
    );

    expect(
      ThemeEncoder.instance.encodeBoxHeightStyle(
        BoxHeightStyle.includeLineSpacingBottom,
      ),
      'includeLineSpacingBottom',
    );
    expect(
      ThemeEncoder.instance.encodeBoxHeightStyle(
        BoxHeightStyle.includeLineSpacingMiddle,
      ),
      'includeLineSpacingMiddle',
    );
    expect(
      ThemeEncoder.instance.encodeBoxHeightStyle(
        BoxHeightStyle.includeLineSpacingTop,
      ),
      'includeLineSpacingTop',
    );
    expect(
      ThemeEncoder.instance.encodeBoxHeightStyle(BoxHeightStyle.max),
      'max',
    );
    expect(
      ThemeEncoder.instance.encodeBoxHeightStyle(BoxHeightStyle.strut),
      'strut',
    );
    expect(
      ThemeEncoder.instance.encodeBoxHeightStyle(BoxHeightStyle.tight),
      'tight',
    );
  });

  test('BoxShadow', () {
    expect(ThemeDecoder.instance.decodeBoxShadow(null), null);
    expect(ThemeEncoder.instance.encodeBoxShadow(null), null);

    const entry = BoxShadow(
      blurRadius: 1.0,
      blurStyle: BlurStyle.outer,
      color: _kColor,
      offset: Offset(2.0, 3.0),
      spreadRadius: 4.0,
    );

    expect(ThemeDecoder.instance.decodeBoxShadow(entry), entry);

    final encoded = ThemeEncoder.instance.encodeBoxShadow(entry);
    final decoded = ThemeDecoder.instance.decodeBoxShadow(encoded);

    expect(encoded, {
      'blurRadius': entry.blurRadius,
      'blurStyle': 'outer',
      'color': _kColorStr,
      'offset': {'dx': 2.0, 'dy': 3.0},
      'spreadRadius': entry.spreadRadius,
    });

    expect(decoded, entry);
  });

  test('BoxShape', () {
    expect(ThemeDecoder.instance.decodeBoxShape(null), null);
    expect(ThemeEncoder.instance.encodeBoxShape(null), null);

    expect(
      ThemeDecoder.instance.decodeBoxShape(BoxShape.circle),
      BoxShape.circle,
    );

    expect(ThemeDecoder.instance.decodeBoxShape('circle'), BoxShape.circle);
    expect(
      ThemeDecoder.instance.decodeBoxShape('rectangle'),
      BoxShape.rectangle,
    );

    expect(ThemeEncoder.instance.encodeBoxShape(BoxShape.circle), 'circle');
    expect(
      ThemeEncoder.instance.encodeBoxShape(BoxShape.rectangle),
      'rectangle',
    );
  });

  test('BoxWidthStyle', () {
    expect(ThemeDecoder.instance.decodeBoxWidthStyle(null), null);
    expect(ThemeEncoder.instance.encodeBoxWidthStyle(null), null);

    expect(
      ThemeDecoder.instance.decodeBoxWidthStyle(BoxWidthStyle.max),
      BoxWidthStyle.max,
    );

    expect(ThemeDecoder.instance.decodeBoxWidthStyle('max'), BoxWidthStyle.max);
    expect(
      ThemeDecoder.instance.decodeBoxWidthStyle('tight'),
      BoxWidthStyle.tight,
    );

    expect(ThemeEncoder.instance.encodeBoxWidthStyle(BoxWidthStyle.max), 'max');
    expect(
      ThemeEncoder.instance.encodeBoxWidthStyle(BoxWidthStyle.tight),
      'tight',
    );
  });

  test('Brightness', () {
    expect(ThemeDecoder.instance.decodeBrightness(null), null);
    expect(ThemeEncoder.instance.encodeBrightness(null), null);

    expect(
      ThemeDecoder.instance.decodeBrightness(Brightness.dark),
      Brightness.dark,
    );

    expect(ThemeEncoder.instance.encodeBrightness(Brightness.dark), 'dark');
    expect(ThemeEncoder.instance.encodeBrightness(Brightness.light), 'light');

    expect(ThemeDecoder.instance.decodeBrightness('dark'), Brightness.dark);
    expect(ThemeDecoder.instance.decodeBrightness('light'), Brightness.light);
  });

  test('ButtonBarLayoutBehavior', () {
    expect(ThemeDecoder.instance.decodeButtonBarLayoutBehavior(null), null);
    expect(ThemeEncoder.instance.encodeButtonBarLayoutBehavior(null), null);

    expect(
      ThemeDecoder.instance.decodeButtonBarLayoutBehavior(
        ButtonBarLayoutBehavior.constrained,
      ),
      ButtonBarLayoutBehavior.constrained,
    );

    expect(
      ThemeDecoder.instance.decodeButtonBarLayoutBehavior('constrained'),
      ButtonBarLayoutBehavior.constrained,
    );
    expect(
      ThemeDecoder.instance.decodeButtonBarLayoutBehavior('padded'),
      ButtonBarLayoutBehavior.padded,
    );

    expect(
      ThemeEncoder.instance.encodeButtonBarLayoutBehavior(
        ButtonBarLayoutBehavior.constrained,
      ),
      'constrained',
    );
    expect(
      ThemeEncoder.instance.encodeButtonBarLayoutBehavior(
        ButtonBarLayoutBehavior.padded,
      ),
      'padded',
    );
  });

  test('ButtonStyle', () {
    expect(ThemeDecoder.instance.decodeButtonStyle(null), null);
    expect(ThemeEncoder.instance.encodeButtonStyle(null), null);

    final entry = ButtonStyle(
      alignment: Alignment.bottomCenter,
      animationDuration: const Duration(milliseconds: 1000),
      backgroundColor: WidgetStateProperty.all(const Color(0xff555555)),
      elevation: WidgetStateProperty.all(1.0),
      enableFeedback: false,
      fixedSize: WidgetStateProperty.all(const Size(50.0, 50.0)),
      foregroundColor: WidgetStateProperty.all(const Color(0xff555555)),
      iconAlignment: IconAlignment.start,
      iconColor: WidgetStateProperty.all(const Color(0xff555555)),
      iconSize: WidgetStateProperty.all(12.0),
      maximumSize: WidgetStateProperty.all(const Size(10.0, 10.0)),
      minimumSize: WidgetStateProperty.all(const Size(100.0, 100.0)),
      mouseCursor: WidgetStateProperty.all(MouseCursor.defer),
      overlayColor: WidgetStateProperty.all(const Color(0xff555555)),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      shadowColor: WidgetStateProperty.all(const Color(0xff555555)),
      shape: WidgetStateProperty.all(const CircleBorder()),
      side: WidgetStateProperty.all(const BorderSide()),
      tapTargetSize: MaterialTapTargetSize.padded,
      textStyle: WidgetStateProperty.all(const TextStyle()),
      visualDensity: VisualDensity.standard,
    );

    expect(ThemeDecoder.instance.decodeButtonStyle(entry), entry);

    final encoded = ThemeEncoder.instance.encodeButtonStyle(entry);
    final decoded = ThemeDecoder.instance.decodeButtonStyle(encoded);

    expect(encoded, {
      'alignment': 'bottomCenter',
      'animationDuration': 1000,
      'backgroundColor': _materializeState('#ff555555'),
      'elevation': _materializeState(1.0),
      'enableFeedback': false,
      'fixedSize': _materializeState({'height': 50.0, 'width': 50.0}),
      'foregroundColor': _materializeState('#ff555555'),
      'iconAlignment': 'start',
      'iconColor': _materializeState('#ff555555'),
      'iconSize': _materializeState(12.0),
      'maximumSize': _materializeState({'height': 10.0, 'width': 10.0}),
      'minimumSize': _materializeState({'height': 100.0, 'width': 100.0}),
      'mouseCursor': _materializeState({'type': 'defer'}),
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
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'circle',
      }),
      'side': _materializeState({
        'color': '#ff000000',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      }),
      'tapTargetSize': 'padded',
      'textStyle': _materializeState({'inherit': true}),
      'visualDensity': 'standard',
    });

    expect(_buttonStylesAreEqual(decoded, entry), true);

    expect(
      _buttonStylesAreEqual(
        ThemeDecoder.instance.decodeButtonStyle({
          'padding': [1, 2],
        }),
        ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
          ),
        ),
      ),
      true,
    );

    expect(
      _buttonStylesAreEqual(
        ThemeDecoder.instance.decodeButtonStyle({
          'padding': [1, 2, 3, 4],
        }),
        ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.fromLTRB(1, 2, 3, 4),
          ),
        ),
      ),
      true,
    );

    expect(
      _buttonStylesAreEqual(
        ThemeDecoder.instance.decodeButtonStyle({'padding': 1}),
        ButtonStyle(padding: WidgetStateProperty.all(const EdgeInsets.all(1))),
      ),
      true,
    );

    expect(
      _buttonStylesAreEqual(
        ThemeDecoder.instance.decodeButtonStyle({
          'padding': {'left': 1, 'top': 2, 'right': 3, 'bottom': 4},
        }),
        ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.fromLTRB(1, 2, 3, 4),
          ),
        ),
      ),
      true,
    );
  });

  test('ButtonTextTheme', () {
    expect(ThemeDecoder.instance.decodeButtonTextTheme(null), null);
    expect(ThemeEncoder.instance.encodeButtonTextTheme(null), null);

    expect(
      ThemeDecoder.instance.decodeButtonTextTheme(ButtonTextTheme.accent),
      ButtonTextTheme.accent,
    );

    expect(
      ThemeDecoder.instance.decodeButtonTextTheme('accent'),
      ButtonTextTheme.accent,
    );
    expect(
      ThemeDecoder.instance.decodeButtonTextTheme('normal'),
      ButtonTextTheme.normal,
    );
    expect(
      ThemeDecoder.instance.decodeButtonTextTheme('primary'),
      ButtonTextTheme.primary,
    );

    expect(
      ThemeEncoder.instance.encodeButtonTextTheme(ButtonTextTheme.accent),
      'accent',
    );
    expect(
      ThemeEncoder.instance.encodeButtonTextTheme(ButtonTextTheme.normal),
      'normal',
    );
    expect(
      ThemeEncoder.instance.encodeButtonTextTheme(ButtonTextTheme.primary),
      'primary',
    );
  });

  test('ButtonThemeData', () {
    expect(ThemeDecoder.instance.decodeButtonThemeData(null), null);
    expect(ThemeEncoder.instance.encodeButtonThemeData(null), null);

    final entry = ButtonThemeData(
      alignedDropdown: true,
      buttonColor: const Color(0xff111111),
      colorScheme: const ColorScheme.dark(),
      disabledColor: const Color(0xff222222),
      focusColor: const Color(0xff333333),
      height: 16.0,
      highlightColor: const Color(0xff444444),
      hoverColor: const Color(0xff555555),
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      minWidth: 10.0,
      padding: const EdgeInsets.all(18.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
          color: Color(0xff666666),
          width: 2.0,
          style: BorderStyle.solid,
        ),
      ),
      splashColor: const Color(0xff777777),
      textTheme: ButtonTextTheme.accent,
    );

    expect(ThemeDecoder.instance.decodeButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeButtonThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeButtonThemeData({
      'alignedDropdown': true,
      'buttonColor': '#ff111111',
      'colorScheme': {
        'brightness': 'dark',
        'error': '#ffcf6679',
        'errorContainer': '#ffcf6679',
        'inversePrimary': '#ff000000',
        'inverseSurface': '#ffffffff',
        'onError': '#ff000000',
        'onErrorContainer': '#ff000000',
        'onInverseSurface': '#ff121212',
        'onPrimaryFixed': '#ff000000',
        'onPrimary': '#ff000000',
        'onPrimaryContainer': '#ff000000',
        'onPrimaryFixedVariant': '#ff000000',
        'onSecondary': '#ff000000',
        'onSecondaryContainer': '#ff000000',
        'onSecondaryFixed': '#ff000000',
        'onSecondaryFixedVariant': '#ff000000',
        'onSurface': '#ffffffff',
        'onSurfaceVariant': '#ffffffff',
        'onTertiary': '#ff000000',
        'onTertiaryContainer': '#ff000000',
        'onTertiaryFixed': '#ff000000',
        'onTertiaryFixedVariant': '#ff000000',
        'outline': '#ffffffff',
        'outlineVariant': '#ffffffff',
        'primary': '#ffbb86fc',
        'primaryContainer': '#ffbb86fc',
        'primaryFixed': '#ffbb86fc',
        'primaryFixedDim': '#ffbb86fc',
        'scrim': '#ff000000',
        'secondary': '#ff03dac6',
        'secondaryContainer': '#ff03dac6',
        'surfaceBright': '#ff121212',
        'surfaceContainer': '#ff121212',
        'surfaceContainerHigh': '#ff121212',
        'surfaceContainerHighest': '#ff121212',
        'secondaryFixed': '#ff03dac6',
        'secondaryFixedDim': '#ff03dac6',
        'shadow': '#ff000000',
        'surface': '#ff121212',
        'surfaceContainerLow': '#ff121212',
        'surfaceContainerLowest': '#ff121212',
        'surfaceDim': '#ff121212',
        'tertiary': '#ff03dac6',
        'tertiaryContainer': '#ff03dac6',
        'tertiaryFixed': '#ff03dac6',
        'tertiaryFixedDim': '#ff03dac6',
      },
      'disabledColor': '#ff222222',
      'focusColor': '#ff333333',
      'height': 16.0,
      'highlightColor': '#ff444444',
      'hoverColor': '#ff555555',
      'layoutBehavior': 'padded',
      'materialTapTargetSize': 'padded',
      'minWidth': 10.0,
      'padding': {'bottom': 18.0, 'left': 18.0, 'right': 18.0, 'top': 18.0},
      'shape': {
        'borderRadius': {'radius': 20.0, 'type': 'circular'},
        'side': {
          'color': '#ff666666',
          'strokeAlign': -1.0,
          'width': 2.0,
          'style': 'solid',
        },
        'type': 'rounded',
      },
      'splashColor': '#ff777777',
      'textTheme': 'accent',
    });

    expect(encoded, {
      'alignedDropdown': true,
      'colorScheme': {
        'brightness': 'dark',
        'error': '#ffcf6679',
        'errorContainer': '#ffcf6679',
        'inversePrimary': '#ff000000',
        'inverseSurface': '#ffffffff',
        'onError': '#ff000000',
        'onErrorContainer': '#ff000000',
        'onInverseSurface': '#ff121212',
        'onPrimaryFixed': '#ff000000',
        'onPrimary': '#ff000000',
        'onPrimaryContainer': '#ff000000',
        'onPrimaryFixedVariant': '#ff000000',
        'onSecondary': '#ff000000',
        'onSecondaryContainer': '#ff000000',
        'onSecondaryFixed': '#ff000000',
        'onSecondaryFixedVariant': '#ff000000',
        'onSurface': '#ffffffff',
        'onSurfaceVariant': '#ffffffff',
        'onTertiary': '#ff000000',
        'onTertiaryContainer': '#ff000000',
        'onTertiaryFixed': '#ff000000',
        'onTertiaryFixedVariant': '#ff000000',
        'outline': '#ffffffff',
        'outlineVariant': '#ffffffff',
        'primary': '#ffbb86fc',
        'primaryContainer': '#ffbb86fc',
        'primaryFixed': '#ffbb86fc',
        'primaryFixedDim': '#ffbb86fc',
        'scrim': '#ff000000',
        'secondary': '#ff03dac6',
        'secondaryContainer': '#ff03dac6',
        'surfaceBright': '#ff121212',
        'surfaceContainer': '#ff121212',
        'surfaceContainerHigh': '#ff121212',
        'surfaceContainerHighest': '#ff121212',
        'secondaryFixed': '#ff03dac6',
        'secondaryFixedDim': '#ff03dac6',
        'shadow': '#ff000000',
        'surface': '#ff121212',
        'surfaceContainerLow': '#ff121212',
        'surfaceContainerLowest': '#ff121212',
        'surfaceDim': '#ff121212',
        'tertiary': '#ff03dac6',
        'tertiaryContainer': '#ff03dac6',
        'tertiaryFixed': '#ff03dac6',
        'tertiaryFixedDim': '#ff03dac6',
      },
      'height': 16.0,
      'layoutBehavior': 'padded',
      'minWidth': 10.0,
      'padding': {'bottom': 18.0, 'left': 18.0, 'right': 18.0, 'top': 18.0},
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 20.0, 'y': 20.0},
          'bottomRight': {'type': 'elliptical', 'x': 20.0, 'y': 20.0},
          'topLeft': {'type': 'elliptical', 'x': 20.0, 'y': 20.0},
          'topRight': {'type': 'elliptical', 'x': 20.0, 'y': 20.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff666666',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 2.0,
        },
        'type': 'rounded',
      },
      'textTheme': 'accent',
    });

    expect(decoded!.alignedDropdown, entry.alignedDropdown);
  });

  test('CardThemeData', () {
    expect(ThemeDecoder.instance.decodeCardThemeData(null), null);
    expect(ThemeEncoder.instance.encodeCardThemeData(null), null);

    final entry = CardThemeData(
      clipBehavior: Clip.hardEdge,
      color: const Color(0xff111111),
      elevation: 3.0,
      margin: const EdgeInsets.all(10.0),
      shadowColor: const Color(0xff222222),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide.none,
      ),
    );

    expect(ThemeDecoder.instance.decodeCardThemeData(entry), entry);

    const corner = {'type': 'elliptical', 'x': 12.0, 'y': 12.0};

    final encoded = ThemeEncoder.instance.encodeCardThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeCardThemeData(encoded);

    expect(encoded, {
      'clipBehavior': 'hardEdge',
      'color': '#ff111111',
      'elevation': 3.0,
      'margin': {'bottom': 10.0, 'left': 10.0, 'right': 10.0, 'top': 10.0},
      'shadowColor': '#ff222222',
      'shape': {
        'borderRadius': {
          'bottomLeft': corner,
          'bottomRight': corner,
          'topLeft': corner,
          'topRight': corner,
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
    });

    expect(decoded, entry);
  });
  test('CheckboxThemeData', () {
    expect(ThemeDecoder.instance.decodeCheckboxThemeData(null), null);
    expect(ThemeEncoder.instance.encodeCheckboxThemeData(null), null);

    final entry = CheckboxThemeData(
      checkColor: WidgetStateProperty.all(_kColor),
      fillColor: WidgetStateProperty.all(_kColor),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      mouseCursor: WidgetStateProperty.all(MouseCursor.uncontrolled),
      overlayColor: WidgetStateProperty.all(_kColor),
      splashRadius: 2.0,
      visualDensity: VisualDensity.comfortable,
    );

    expect(ThemeDecoder.instance.decodeCheckboxThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeCheckboxThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeCheckboxThemeData(encoded);

    expect(
      decoded!.checkColor!.resolve({WidgetState.error}),
      entry.checkColor!.resolve({WidgetState.error}),
    );
    expect(
      decoded.fillColor!.resolve({WidgetState.error}),
      entry.fillColor!.resolve({WidgetState.error}),
    );
    expect(decoded.materialTapTargetSize, entry.materialTapTargetSize);
    expect(
      decoded.mouseCursor!.resolve({WidgetState.error}),
      entry.mouseCursor!.resolve({WidgetState.error}),
    );
    expect(
      decoded.overlayColor!.resolve({WidgetState.error}),
      entry.overlayColor!.resolve({WidgetState.error}),
    );
    expect(decoded.splashRadius, entry.splashRadius);
    expect(decoded.visualDensity, entry.visualDensity);
  });

  test('ChipThemeData', () {
    expect(ThemeDecoder.instance.decodeChipThemeData(null), null);
    expect(ThemeEncoder.instance.encodeChipThemeData(null), null);

    final entry = ChipThemeData(
      avatarBoxConstraints: BoxConstraints(minWidth: 10),
      backgroundColor: const Color(0xff111111),
      brightness: Brightness.light,
      checkmarkColor: const Color(0xff222222),
      color: WidgetStateProperty.all(const Color(0xff555555)),
      deleteIconBoxConstraints: BoxConstraints(minWidth: 20),
      deleteIconColor: const Color(0xff333333),
      disabledColor: const Color(0xff444444),
      elevation: 2.0,
      iconTheme: const IconThemeData(color: _kColor),
      labelPadding: const EdgeInsets.all(4.0),
      labelStyle: const TextStyle(color: Color(0xff555555)),
      padding: const EdgeInsets.all(8.0),
      pressElevation: 1.0,
      secondaryLabelStyle: const TextStyle(color: _kColor),
      secondarySelectedColor: const Color(0xff666666),
      selectedColor: _kColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      selectedShadowColor: const Color(0xff777777),
      shadowColor: const Color(0xff888888),
      showCheckmark: true,
      side: const BorderSide(width: 2.0),
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.instance.decodeChipThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeChipThemeData(entry);

    expect(encoded, {
      'avatarBoxConstraints': {'minHeight': 0.0, 'minWidth': 10.0},
      'backgroundColor': '#ff111111',
      'brightness': 'light',
      'checkmarkColor': '#ff222222',
      'color': _materializeState('#ff555555'),
      'deleteIconBoxConstraints': {'minHeight': 0.0, 'minWidth': 20.0},
      'deleteIconColor': '#ff333333',
      'disabledColor': '#ff444444',
      'elevation': 2.0,
      'iconTheme': {'color': _kColorStr},
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
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'selectedShadowColor': '#ff777777',
      'shadowColor': '#ff888888',
      'showCheckmark': true,
      'side': {
        'color': '#ff000000',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 2.0,
      },
      'surfaceTintColor': _kColorStr,
    });

    // The equality on these doesn't work because they aren't fully identical
    // in the framework as of Flutter 3.16
    //
    // expect(
    //   decoded,
    //   entry,
    // );
  });

  test('Clip', () {
    expect(ThemeDecoder.instance.decodeClip(null), null);
    expect(ThemeEncoder.instance.encodeClip(null), null);

    expect(ThemeDecoder.instance.decodeClip(Clip.antiAlias), Clip.antiAlias);

    expect(ThemeDecoder.instance.decodeClip('antiAlias'), Clip.antiAlias);
    expect(
      ThemeDecoder.instance.decodeClip('antiAliasWithSaveLayer'),
      Clip.antiAliasWithSaveLayer,
    );
    expect(ThemeDecoder.instance.decodeClip('hardEdge'), Clip.hardEdge);
    expect(ThemeDecoder.instance.decodeClip('none'), Clip.none);

    expect(ThemeEncoder.instance.encodeClip(Clip.antiAlias), 'antiAlias');
    expect(
      ThemeEncoder.instance.encodeClip(Clip.antiAliasWithSaveLayer),
      'antiAliasWithSaveLayer',
    );
    expect(ThemeEncoder.instance.encodeClip(Clip.hardEdge), 'hardEdge');
    expect(ThemeEncoder.instance.encodeClip(Clip.none), 'none');
  });

  test('Color', () {
    expect(ThemeDecoder.instance.decodeColor(null), null);
    expect(ThemeEncoder.instance.encodeColor(null), null);

    const entry = _kColor;

    expect(ThemeDecoder.instance.decodeColor(entry), entry);

    final encoded = ThemeEncoder.instance.encodeColor(entry);
    final decoded = ThemeDecoder.instance.decodeColor(encoded);

    expect(encoded, _kColorStr);

    expect(decoded, entry);

    expect(ThemeDecoder.instance.decodeColor('ddd'), const Color(0xffdddddd));
    expect(ThemeDecoder.instance.decodeColor('#ddd'), const Color(0xffdddddd));
    expect(ThemeDecoder.instance.decodeColor('DDD'), const Color(0xffdddddd));
    expect(ThemeDecoder.instance.decodeColor('#DDD'), const Color(0xffdddddd));

    expect(
      ThemeDecoder.instance.decodeColor('dadada'),
      const Color(0xffdadada),
    );
    expect(
      ThemeDecoder.instance.decodeColor('#dadada'),
      const Color(0xffdadada),
    );
    expect(
      ThemeDecoder.instance.decodeColor('DADADA'),
      const Color(0xffdadada),
    );
    expect(
      ThemeDecoder.instance.decodeColor('#DADADA'),
      const Color(0xffdadada),
    );

    expect(
      ThemeDecoder.instance.decodeColor('dadadada'),
      const Color(0xdadadada),
    );
    expect(
      ThemeDecoder.instance.decodeColor('#dadadada'),
      const Color(0xdadadada),
    );
    expect(
      ThemeDecoder.instance.decodeColor('DADADADA'),
      const Color(0xdadadada),
    );
    expect(
      ThemeDecoder.instance.decodeColor('#DADADADA'),
      const Color(0xdadadada),
    );
  });

  test('ColorScheme', () {
    expect(ThemeDecoder.instance.decodeColorScheme(null), null);
    expect(ThemeEncoder.instance.encodeColorScheme(null), null);

    const entry = ColorScheme.dark();

    expect(ThemeDecoder.instance.decodeColorScheme(entry), entry);

    final encoded = ThemeEncoder.instance.encodeColorScheme(entry);
    final decoded = ThemeDecoder.instance.decodeColorScheme(encoded);

    expect(encoded, {
      'brightness': 'dark',
      'error': '#ffcf6679',
      'errorContainer': '#ffcf6679',
      'inversePrimary': '#ff000000',
      'inverseSurface': '#ffffffff',
      'onError': '#ff000000',
      'onErrorContainer': '#ff000000',
      'onInverseSurface': '#ff121212',
      'onPrimaryFixed': '#ff000000',
      'onPrimary': '#ff000000',
      'onPrimaryContainer': '#ff000000',
      'onPrimaryFixedVariant': '#ff000000',
      'onSecondary': '#ff000000',
      'onSecondaryContainer': '#ff000000',
      'onSecondaryFixed': '#ff000000',
      'onSecondaryFixedVariant': '#ff000000',
      'onSurface': '#ffffffff',
      'onSurfaceVariant': '#ffffffff',
      'onTertiary': '#ff000000',
      'onTertiaryContainer': '#ff000000',
      'onTertiaryFixed': '#ff000000',
      'onTertiaryFixedVariant': '#ff000000',
      'outline': '#ffffffff',
      'outlineVariant': '#ffffffff',
      'primary': '#ffbb86fc',
      'primaryContainer': '#ffbb86fc',
      'primaryFixed': '#ffbb86fc',
      'primaryFixedDim': '#ffbb86fc',
      'scrim': '#ff000000',
      'secondary': '#ff03dac6',
      'secondaryContainer': '#ff03dac6',
      'surfaceBright': '#ff121212',
      'surfaceContainer': '#ff121212',
      'surfaceContainerHigh': '#ff121212',
      'surfaceContainerHighest': '#ff121212',
      'secondaryFixed': '#ff03dac6',
      'secondaryFixedDim': '#ff03dac6',
      'shadow': '#ff000000',
      'surface': '#ff121212',
      'surfaceContainerLow': '#ff121212',
      'surfaceContainerLowest': '#ff121212',
      'surfaceDim': '#ff121212',
      'tertiary': '#ff03dac6',
      'tertiaryContainer': '#ff03dac6',
      'tertiaryFixed': '#ff03dac6',
      'tertiaryFixedDim': '#ff03dac6',
    });
    expect(decoded!.surface, entry.surface);
  });

  test('CrossAxisAlignment', () {
    expect(ThemeDecoder.instance.decodeCrossAxisAlignment(null), null);
    expect(ThemeEncoder.instance.encodeCrossAxisAlignment(null), null);

    expect(
      ThemeDecoder.instance.decodeCrossAxisAlignment(
        CrossAxisAlignment.baseline,
      ),
      CrossAxisAlignment.baseline,
    );

    expect(
      ThemeDecoder.instance.decodeCrossAxisAlignment('baseline'),
      CrossAxisAlignment.baseline,
    );
    expect(
      ThemeDecoder.instance.decodeCrossAxisAlignment('center'),
      CrossAxisAlignment.center,
    );
    expect(
      ThemeDecoder.instance.decodeCrossAxisAlignment('end'),
      CrossAxisAlignment.end,
    );
    expect(
      ThemeDecoder.instance.decodeCrossAxisAlignment('start'),
      CrossAxisAlignment.start,
    );
    expect(
      ThemeDecoder.instance.decodeCrossAxisAlignment('stretch'),
      CrossAxisAlignment.stretch,
    );

    expect(
      ThemeEncoder.instance.encodeCrossAxisAlignment(
        CrossAxisAlignment.baseline,
      ),
      'baseline',
    );
    expect(
      ThemeEncoder.instance.encodeCrossAxisAlignment(CrossAxisAlignment.center),
      'center',
    );
    expect(
      ThemeEncoder.instance.encodeCrossAxisAlignment(CrossAxisAlignment.end),
      'end',
    );
    expect(
      ThemeEncoder.instance.encodeCrossAxisAlignment(CrossAxisAlignment.start),
      'start',
    );
    expect(
      ThemeEncoder.instance.encodeCrossAxisAlignment(
        CrossAxisAlignment.stretch,
      ),
      'stretch',
    );
  });

  test('CrossFadeState', () {
    expect(ThemeDecoder.instance.decodeCrossFadeState(null), null);
    expect(ThemeEncoder.instance.encodeCrossFadeState(null), null);

    expect(
      ThemeDecoder.instance.decodeCrossFadeState(CrossFadeState.showFirst),
      CrossFadeState.showFirst,
    );

    expect(
      ThemeDecoder.instance.decodeCrossFadeState('showFirst'),
      CrossFadeState.showFirst,
    );
    expect(
      ThemeDecoder.instance.decodeCrossFadeState('showSecond'),
      CrossFadeState.showSecond,
    );

    expect(
      ThemeEncoder.instance.encodeCrossFadeState(CrossFadeState.showFirst),
      'showFirst',
    );
    expect(
      ThemeEncoder.instance.encodeCrossFadeState(CrossFadeState.showSecond),
      'showSecond',
    );
  });

  test('CupertinoTextThemeData', () {
    expect(ThemeDecoder.instance.decodeCupertinoTextThemeData(null), null);
    expect(ThemeEncoder.instance.encodeCupertinoTextThemeData(null), null);

    const entry = CupertinoTextThemeData(
      actionSmallTextStyle: _kTextStyle,
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

    expect(ThemeDecoder.instance.decodeCupertinoTextThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeCupertinoTextThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeCupertinoTextThemeData({
      'actionSmallTextStyle': _kTextStyleJson,
      'actionTextStyle': _kTextStyleJson,
      'dateTimePickerTextStyle': _kTextStyleJson,
      'navActionTextStyle': _kTextStyleJson,
      'navLargeTitleTextStyle': _kTextStyleJson,
      'navTitleTextStyle': _kTextStyleJson,
      'pickerTextStyle': _kTextStyleJson,
      'primaryColor': _kColorStr,
      'tabLabelTextStyle': _kTextStyleJson,
      'textStyle': _kTextStyleJson,
    })!;

    expect(encoded, {
      'actionSmallTextStyle': _kTextStyleJson,
      'actionTextStyle': _kTextStyleJson,
      'dateTimePickerTextStyle': _kTextStyleJson,
      'navActionTextStyle': _kTextStyleJson,
      'navLargeTitleTextStyle': _kTextStyleJson,
      'navTitleTextStyle': _kTextStyleJson,
      'pickerTextStyle': _kTextStyleJson,
      'tabLabelTextStyle': _kTextStyleJson,
      'textStyle': _kTextStyleJson,
    });

    expect(decoded.actionSmallTextStyle, entry.actionSmallTextStyle);
    expect(decoded.actionTextStyle, entry.actionTextStyle);
    expect(decoded.dateTimePickerTextStyle, entry.dateTimePickerTextStyle);
    expect(decoded.navActionTextStyle, entry.navActionTextStyle);
    expect(decoded.navLargeTitleTextStyle, entry.navLargeTitleTextStyle);
    expect(decoded.navTitleTextStyle, entry.navTitleTextStyle);
    expect(decoded.pickerTextStyle, entry.pickerTextStyle);
    expect(decoded.tabLabelTextStyle, entry.tabLabelTextStyle);
    expect(decoded.textStyle, entry.textStyle);
  });

  test('CupertinoThemeData', () {
    expect(ThemeDecoder.instance.decodeCupertinoThemeData(null), null);
    expect(ThemeEncoder.instance.encodeCupertinoThemeData(null), null);

    const entry = CupertinoThemeData(
      applyThemeToAll: true,
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

    expect(ThemeDecoder.instance.decodeCupertinoThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeCupertinoThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeCupertinoThemeData(encoded)!;

    expect(encoded, {
      'applyThemeToAll': true,
      'barBackgroundColor': '#ff111111',
      'brightness': 'light',
      'primaryColor': '#ff222222',
      'primaryContrastingColor': '#ff333333',
      'scaffoldBackgroundColor': '#ff444444',
      'textTheme': {
        'actionSmallTextStyle': {
          'color': '#ff555555',
          'decoration': 'none',
          'fontFamily': 'CupertinoSystemText',
          'fontSize': 15.0,
          'inherit': false,
          'letterSpacing': -0.23,
        },
        'actionTextStyle': {'color': '#11111111', 'inherit': true},
        'dateTimePickerTextStyle': {'color': '#22222222', 'inherit': true},
        'navActionTextStyle': {'color': '#33333333', 'inherit': true},
        'navLargeTitleTextStyle': {'color': '#44444444', 'inherit': true},
        'navTitleTextStyle': {'color': '#55555555', 'inherit': true},
        'pickerTextStyle': {'color': '#66666666', 'inherit': true},
        'tabLabelTextStyle': {'color': '#77777777', 'inherit': true},
        'textStyle': {'color': '#88888888', 'inherit': true},
      },
    });

    expect(decoded.barBackgroundColor, entry.barBackgroundColor);

    expect(decoded.brightness, entry.brightness);

    expect(decoded.primaryColor, entry.primaryColor);

    expect(decoded.primaryContrastingColor, entry.primaryContrastingColor);

    expect(decoded.scaffoldBackgroundColor, entry.scaffoldBackgroundColor);

    expect(decoded.textTheme.actionTextStyle, entry.textTheme.actionTextStyle);

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
    expect(decoded.textTheme.pickerTextStyle, entry.textTheme.pickerTextStyle);
    expect(
      decoded.textTheme.tabLabelTextStyle,
      entry.textTheme.tabLabelTextStyle,
    );
    expect(decoded.textTheme.textStyle, entry.textTheme.textStyle);
  });

  test('DatePickerThemeData', () {
    expect(ThemeDecoder.instance.decodeDatePickerThemeData(null), null);
    expect(ThemeEncoder.instance.encodeDatePickerThemeData(null), null);

    const entry = DatePickerThemeData(backgroundColor: _kColor);

    expect(ThemeDecoder.instance.decodeDatePickerThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeDatePickerThemeData(entry);

    expect(encoded, {'backgroundColor': _kColorStr});
  });

  test('DataTableThemeData', () {
    expect(ThemeDecoder.instance.decodeDataTableThemeData(null), null);
    expect(ThemeEncoder.instance.encodeDataTableThemeData(null), null);

    final entry = DataTableThemeData(
      checkboxHorizontalMargin: 24.0,
      columnSpacing: 1.0,
      dataRowColor: WidgetStateProperty.all(const Color(0xff555555)),
      dataRowCursor: const WidgetStatePropertyAll(SystemMouseCursors.basic),
      dataRowMaxHeight: 1.0,
      dataRowMinHeight: 1.0,
      dataTextStyle: const TextStyle(),
      decoration: const BoxDecoration(color: _kColor),
      dividerThickness: 1.0,
      headingCellCursor: const WidgetStatePropertyAll(SystemMouseCursors.click),
      headingRowAlignment: MainAxisAlignment.center,
      headingRowColor: WidgetStateProperty.all(const Color(0xff555555)),
      headingRowHeight: 1.0,
      headingTextStyle: const TextStyle(),
      horizontalMargin: 1.0,
    );

    expect(ThemeDecoder.instance.decodeDataTableThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeDataTableThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeDataTableThemeData(encoded);

    expect(encoded, {
      'checkboxHorizontalMargin': 24.0,
      'columnSpacing': 1.0,
      'dataRowColor': _materializeState('#ff555555'),
      'dataRowCursor': {
        'disabled': {'cursor': 'basic', 'type': 'system'},
        'dragged': {'cursor': 'basic', 'type': 'system'},
        'empty': {'cursor': 'basic', 'type': 'system'},
        'error': {'cursor': 'basic', 'type': 'system'},
        'focused': {'cursor': 'basic', 'type': 'system'},
        'hovered': {'cursor': 'basic', 'type': 'system'},
        'pressed': {'cursor': 'basic', 'type': 'system'},
        'scrolledUnder': {'cursor': 'basic', 'type': 'system'},
        'selected': {'cursor': 'basic', 'type': 'system'},
      },
      'dataRowMaxHeight': 1.0,
      'dataRowMinHeight': 1.0,
      'dataTextStyle': {'inherit': true},
      'decoration': {'color': _kColorStr, 'shape': 'rectangle'},
      'dividerThickness': 1.0,
      'headingCellCursor': {
        'disabled': {'cursor': 'click', 'type': 'system'},
        'dragged': {'cursor': 'click', 'type': 'system'},
        'empty': {'cursor': 'click', 'type': 'system'},
        'error': {'cursor': 'click', 'type': 'system'},
        'focused': {'cursor': 'click', 'type': 'system'},
        'hovered': {'cursor': 'click', 'type': 'system'},
        'pressed': {'cursor': 'click', 'type': 'system'},
        'scrolledUnder': {'cursor': 'click', 'type': 'system'},
        'selected': {'cursor': 'click', 'type': 'system'},
      },
      'headingRowAlignment': 'center',
      'headingRowColor': _materializeState('#ff555555'),
      'headingRowHeight': 1.0,
      'headingTextStyle': {'inherit': true},
      'horizontalMargin': 1.0,
    });

    bool? dataTableThemeDataAreEqual(Object? first, Object second) {
      bool? result;

      if (first.runtimeType != second.runtimeType) {
        result = false;
      } else if (first is! DataTableThemeData) {
        result = false;
      } else if (second is DataTableThemeData) {
        result =
            first.columnSpacing == second.columnSpacing &&
            first.dataRowColor?.resolve({}) ==
                second.dataRowColor?.resolve({}) &&
            first.dataRowMaxHeight == second.dataRowMaxHeight &&
            first.dataRowMinHeight == second.dataRowMinHeight &&
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

    expect(dataTableThemeDataAreEqual(decoded, entry), true);
  });

  test('DecorationImage', () {
    expect(ThemeDecoder.instance.decodeDecorationImage(null), null);
    expect(ThemeEncoder.instance.encodeDecorationImage(null), null);

    final entry = DecorationImage(
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

    expect(ThemeDecoder.instance.decodeDecorationImage(entry), entry);

    final encoded = ThemeEncoder.instance.encodeDecorationImage(entry);
    final decoded = ThemeDecoder.instance.decodeDecorationImage(encoded);

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
      'image': {'bytes': base64Image, 'scale': 1.0, 'type': 'memory'},
      'invertColors': true,
      'isAntiAlias': true,
      'matchTextDirection': true,
      'opacity': 0.5,
      'repeat': 'repeat',
      'scale': 2.0,
    });

    expect(ThemeEncoder.instance.encodeDecorationImage(decoded), {
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
      'image': {'bytes': base64Image, 'scale': 1.0, 'type': 'memory'},
      'invertColors': true,
      'matchTextDirection': true,
      'isAntiAlias': true,
      'opacity': 0.5,
      'repeat': 'repeat',
      'scale': 2.0,
    });
  });

  test('DecorationPosition', () {
    expect(ThemeDecoder.instance.decodeDecorationPosition(null), null);
    expect(ThemeEncoder.instance.encodeDecorationPosition(null), null);

    expect(
      ThemeDecoder.instance.decodeDecorationPosition(
        DecorationPosition.background,
      ),
      DecorationPosition.background,
    );

    expect(
      ThemeDecoder.instance.decodeDecorationPosition('background'),
      DecorationPosition.background,
    );
    expect(
      ThemeDecoder.instance.decodeDecorationPosition('foreground'),
      DecorationPosition.foreground,
    );

    expect(
      ThemeEncoder.instance.encodeDecorationPosition(
        DecorationPosition.background,
      ),
      'background',
    );
    expect(
      ThemeEncoder.instance.encodeDecorationPosition(
        DecorationPosition.foreground,
      ),
      'foreground',
    );
  });

  test('DialogThemeData', () {
    expect(ThemeDecoder.instance.decodeDialogThemeData(null), null);
    expect(ThemeEncoder.instance.encodeDialogThemeData(null), null);

    const entry = DialogThemeData(
      actionsPadding: EdgeInsets.all(8.0),
      alignment: Alignment.bottomLeft,
      backgroundColor: _kColor,
      clipBehavior: Clip.hardEdge,
      contentTextStyle: _kTextStyle,
      elevation: 1.0,
      shadowColor: _kColor,
      shape: RoundedRectangleBorder(),
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.instance.decodeDialogThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeDialogThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeDialogThemeData(encoded);

    expect(encoded, {
      'actionsPadding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
      'alignment': 'bottomLeft',
      'backgroundColor': _kColorStr,
      'clipBehavior': 'hardEdge',
      'contentTextStyle': _kTextStyleJson,
      'elevation': 1.0,
      'shadowColor': _kColorStr,
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'surfaceTintColor': _kColorStr,
    });

    expect(decoded, entry);
  });

  test('DismissDirection', () {
    expect(ThemeDecoder.instance.decodeDismissDirection(null), null);
    expect(ThemeEncoder.instance.encodeDismissDirection(null), null);

    expect(
      ThemeDecoder.instance.decodeDismissDirection(DismissDirection.down),
      DismissDirection.down,
    );

    expect(
      ThemeDecoder.instance.decodeDismissDirection('down'),
      DismissDirection.down,
    );
    expect(
      ThemeDecoder.instance.decodeDismissDirection('endToStart'),
      DismissDirection.endToStart,
    );
    expect(
      ThemeDecoder.instance.decodeDismissDirection('horizontal'),
      DismissDirection.horizontal,
    );
    expect(
      ThemeDecoder.instance.decodeDismissDirection('none'),
      DismissDirection.none,
    );
    expect(
      ThemeDecoder.instance.decodeDismissDirection('startToEnd'),
      DismissDirection.startToEnd,
    );
    expect(
      ThemeDecoder.instance.decodeDismissDirection('up'),
      DismissDirection.up,
    );
    expect(
      ThemeDecoder.instance.decodeDismissDirection('vertical'),
      DismissDirection.vertical,
    );

    expect(
      ThemeEncoder.instance.encodeDismissDirection(DismissDirection.down),
      'down',
    );
    expect(
      ThemeEncoder.instance.encodeDismissDirection(DismissDirection.endToStart),
      'endToStart',
    );
    expect(
      ThemeEncoder.instance.encodeDismissDirection(DismissDirection.horizontal),
      'horizontal',
    );
    expect(
      ThemeEncoder.instance.encodeDismissDirection(DismissDirection.none),
      'none',
    );
    expect(
      ThemeEncoder.instance.encodeDismissDirection(DismissDirection.startToEnd),
      'startToEnd',
    );
    expect(
      ThemeEncoder.instance.encodeDismissDirection(DismissDirection.up),
      'up',
    );
    expect(
      ThemeEncoder.instance.encodeDismissDirection(DismissDirection.vertical),
      'vertical',
    );
  });

  test('DividerThemeData', () {
    expect(ThemeDecoder.instance.decodeDividerThemeData(null), null);
    expect(ThemeEncoder.instance.encodeDividerThemeData(null), null);

    const entry = DividerThemeData(
      color: _kColor,
      endIndent: 1.0,
      indent: 2.0,
      space: 3.0,
      thickness: 4.0,
    );

    expect(ThemeDecoder.instance.decodeDividerThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeDividerThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeDividerThemeData(encoded);

    expect(encoded, {
      'color': _kColorStr,
      'endIndent': 1.0,
      'indent': 2.0,
      'space': 3.0,
      'thickness': 4.0,
    });

    expect(decoded, entry);
  });

  test('DragStartBehavior', () {
    expect(ThemeDecoder.instance.decodeDragStartBehavior(null), null);
    expect(ThemeEncoder.instance.encodeDragStartBehavior(null), null);

    expect(
      ThemeDecoder.instance.decodeDragStartBehavior(DragStartBehavior.down),
      DragStartBehavior.down,
    );

    expect(
      ThemeDecoder.instance.decodeDragStartBehavior('down'),
      DragStartBehavior.down,
    );
    expect(
      ThemeDecoder.instance.decodeDragStartBehavior('start'),
      DragStartBehavior.start,
    );

    expect(
      ThemeEncoder.instance.encodeDragStartBehavior(DragStartBehavior.down),
      'down',
    );
    expect(
      ThemeEncoder.instance.encodeDragStartBehavior(DragStartBehavior.start),
      'start',
    );
  });

  test('DrawerThemeData', () {
    expect(ThemeDecoder.instance.decodeDrawerThemeData(null), null);
    expect(ThemeEncoder.instance.encodeDrawerThemeData(null), null);

    const entry = DrawerThemeData(
      backgroundColor: Color(0xff111111),
      elevation: 5,
      endShape: CircleBorder(side: BorderSide.none),
      scrimColor: Color(0xff222222),
      shadowColor: _kColor,
      shape: CircleBorder(side: BorderSide.none),
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.instance.decodeDrawerThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeDrawerThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeDrawerThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'elevation': 5.0,
      'endShape': {
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'circle',
      },
      'scrimColor': '#ff222222',
      'shadowColor': _kColorStr,
      'shape': {
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'circle',
      },
      'surfaceTintColor': _kColorStr,
    });
    expect(decoded, entry);
  });

  test('DropdownMenuThemeData', () {
    expect(ThemeDecoder.instance.decodeDropdownMenuThemeData(null), null);
    expect(ThemeEncoder.instance.encodeDropdownMenuThemeData(null), null);
  });

  test('EdgeInsets', () {
    expect(ThemeDecoder.instance.decodeEdgeInsets(null), null);
    expect(ThemeEncoder.instance.encodeEdgeInsets(null), null);

    const entry = EdgeInsets.fromLTRB(1.0, 2.0, 3.0, 4.0);

    expect(ThemeDecoder.instance.decodeEdgeInsets(entry), entry);

    final encoded = ThemeEncoder.instance.encodeEdgeInsets(entry);
    final decoded = ThemeDecoder.instance.decodeEdgeInsets(encoded);

    expect(encoded, {'bottom': 4.0, 'left': 1.0, 'right': 3.0, 'top': 2.0});

    expect(decoded, entry);

    expect(
      ThemeDecoder.instance.decodeEdgeInsets('16'),
      const EdgeInsets.all(16.0),
    );
    expect(
      ThemeDecoder.instance.decodeEdgeInsets(16),
      const EdgeInsets.all(16.0),
    );
    expect(
      ThemeDecoder.instance.decodeEdgeInsets(['1', 2]),
      const EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
    );
    expect(
      ThemeDecoder.instance.decodeEdgeInsets(['1', 2, 3.0, '4.0']),
      const EdgeInsets.fromLTRB(1.0, 2.0, 3.0, 4.0),
    );
  });

  test('EdgeInsetsDirectional', () {
    expect(ThemeDecoder.instance.decodeEdgeInsetsDirectional(null), null);
    expect(ThemeEncoder.instance.encodeEdgeInsetsDirectional(null), null);

    const entry = EdgeInsetsDirectional.fromSTEB(1.0, 2.0, 3.0, 4.0);

    expect(ThemeDecoder.instance.decodeEdgeInsetsDirectional(entry), entry);

    final encoded = ThemeEncoder.instance.encodeEdgeInsetsDirectional(entry);
    final decoded = ThemeDecoder.instance.decodeEdgeInsetsDirectional(encoded);

    expect(encoded, {'bottom': 4.0, 'end': 3.0, 'start': 1.0, 'top': 2.0});

    expect(decoded, entry);

    expect(
      ThemeDecoder.instance.decodeEdgeInsetsDirectional('16'),
      const EdgeInsetsDirectional.all(16.0),
    );
    expect(
      ThemeDecoder.instance.decodeEdgeInsetsDirectional(16),
      const EdgeInsetsDirectional.all(16.0),
    );
    expect(
      ThemeDecoder.instance.decodeEdgeInsetsDirectional(['1', 2]),
      const EdgeInsetsDirectional.symmetric(horizontal: 1.0, vertical: 2.0),
    );
    expect(
      ThemeDecoder.instance.decodeEdgeInsetsDirectional(['1', 2, 3.0, '4.0']),
      const EdgeInsetsDirectional.fromSTEB(1.0, 2.0, 3.0, 4.0),
    );

    expect(
      ThemeDecoder.instance.decodeEdgeInsetsDirectional([
        '1',
        2,
        3.0,
        '4.0',
      ], ltr: false),
      const EdgeInsetsDirectional.fromSTEB(3.0, 2.0, 1.0, 4.0),
    );
  });

  test('EdgeInsetsGeometry', () {
    expect(ThemeDecoder.instance.decodeEdgeInsetsGeometry(null), null);
    expect(ThemeEncoder.instance.encodeEdgeInsetsGeometry(null), null);

    const entry = EdgeInsets.fromLTRB(1.0, 2.0, 3.0, 4.0);

    expect(ThemeDecoder.instance.decodeEdgeInsetsGeometry(entry), entry);

    final encoded = ThemeEncoder.instance.encodeEdgeInsetsGeometry(entry);
    final decoded = ThemeDecoder.instance.decodeEdgeInsetsGeometry(encoded);

    expect(encoded, {'bottom': 4.0, 'left': 1.0, 'right': 3.0, 'top': 2.0});

    expect(decoded, entry);

    expect(
      ThemeDecoder.instance.decodeEdgeInsetsGeometry('16'),
      const EdgeInsets.all(16.0),
    );
    expect(
      ThemeDecoder.instance.decodeEdgeInsetsGeometry(16),
      const EdgeInsets.all(16.0),
    );
    expect(
      ThemeDecoder.instance.decodeEdgeInsetsGeometry(['1', 2]),
      const EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
    );
    expect(
      ThemeDecoder.instance.decodeEdgeInsetsGeometry(['1', 2, 3.0, '4.0']),
      const EdgeInsets.fromLTRB(1.0, 2.0, 3.0, 4.0),
    );
  });

  test('ElevatedButtonThemeData', () {
    expect(ThemeDecoder.instance.decodeElevatedButtonThemeData(null), null);
    expect(ThemeEncoder.instance.encodeElevatedButtonThemeData(null), null);

    final entry = ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xff222222)),
      ),
    );

    expect(ThemeDecoder.instance.decodeElevatedButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeElevatedButtonThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeElevatedButtonThemeData(
      encoded,
    );

    expect(encoded, {
      'style': {'backgroundColor': _materializeState('#ff222222')},
    });

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

    expect(elevatedButtonThemeDatasAreEqual(decoded, entry), true);
  });

  test('ExpansionTileThemeData', () {
    expect(ThemeDecoder.instance.decodeExpansionTileThemeData(null), null);
    expect(ThemeEncoder.instance.encodeExpansionTileThemeData(null), null);

    final entry = ExpansionTileThemeData(
      backgroundColor: Color(0xff111111),
      childrenPadding: EdgeInsets.all(8.0),
      collapsedBackgroundColor: Color(0xff222222),
      collapsedIconColor: Color(0xff333333),
      expandedAlignment: Alignment.bottomCenter,
      expansionAnimationStyle: AnimationStyle.noAnimation,
      iconColor: Color(0xff444444),
      textColor: Color(0xff555555),
      tilePadding: EdgeInsets.all(8.0),
    );

    expect(ThemeDecoder.instance.decodeExpansionTileThemeData(entry), entry);

    final encoded = JsonClass.removeNull(
      ThemeEncoder.instance.encodeExpansionTileThemeData(entry),
    );
    final decoded = ThemeDecoder.instance.decodeExpansionTileThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'childrenPadding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
      'collapsedBackgroundColor': '#ff222222',
      'collapsedIconColor': '#ff333333',
      'expandedAlignment': 'bottomCenter',
      'expansionAnimationStyle': 'noAnimation',
      'iconColor': '#ff444444',
      'textColor': '#ff555555',
      'tilePadding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
    });

    expect(entry, decoded);
  });

  test('FilledButtonThemeData', () {
    expect(ThemeDecoder.instance.decodeFilledButtonThemeData(null), null);
    expect(ThemeEncoder.instance.encodeFilledButtonThemeData(null), null);

    final entry = FilledButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.bottomCenter,
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: WidgetStateProperty.all(const Color(0xff555555)),
        elevation: WidgetStateProperty.all(1.0),
        enableFeedback: false,
        fixedSize: WidgetStateProperty.all(const Size(50.0, 50.0)),
        foregroundColor: WidgetStateProperty.all(const Color(0xff555555)),
        iconColor: WidgetStateProperty.all(const Color(0xff555555)),
        iconSize: WidgetStateProperty.all(12.0),
        maximumSize: WidgetStateProperty.all(const Size(10.0, 10.0)),
        minimumSize: WidgetStateProperty.all(const Size(100.0, 100.0)),
        mouseCursor: WidgetStateProperty.all(MouseCursor.defer),
        overlayColor: WidgetStateProperty.all(const Color(0xff555555)),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        shadowColor: WidgetStateProperty.all(const Color(0xff555555)),
        shape: WidgetStateProperty.all(const CircleBorder()),
        side: WidgetStateProperty.all(const BorderSide()),
        tapTargetSize: MaterialTapTargetSize.padded,
        textStyle: WidgetStateProperty.all(const TextStyle()),
        visualDensity: VisualDensity.standard,
      ),
    );

    expect(ThemeDecoder.instance.decodeFilledButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeFilledButtonThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeFilledButtonThemeData(encoded);

    expect(encoded, {
      'style': {
        'alignment': 'bottomCenter',
        'animationDuration': 1000,
        'backgroundColor': _materializeState('#ff555555'),
        'elevation': _materializeState(1.0),
        'enableFeedback': false,
        'fixedSize': _materializeState({'height': 50.0, 'width': 50.0}),
        'foregroundColor': _materializeState('#ff555555'),
        'iconColor': _materializeState('#ff555555'),
        'iconSize': _materializeState(12.0),
        'maximumSize': _materializeState({'height': 10.0, 'width': 10.0}),
        'minimumSize': _materializeState({'height': 100.0, 'width': 100.0}),
        'mouseCursor': _materializeState({'type': 'defer'}),
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
            'strokeAlign': -1.0,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'circle',
        }),
        'side': _materializeState({
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        }),
        'tapTargetSize': 'padded',
        'textStyle': _materializeState({'inherit': true}),
        'visualDensity': 'standard',
      },
    });

    expect(_buttonStylesAreEqual(decoded!.style, entry.style), true);
  });

  test('FilterQuality', () {
    expect(ThemeDecoder.instance.decodeFilterQuality(null), null);
    expect(ThemeEncoder.instance.encodeFilterQuality(null), null);

    expect(
      ThemeDecoder.instance.decodeFilterQuality(FilterQuality.high),
      FilterQuality.high,
    );

    expect(
      ThemeDecoder.instance.decodeFilterQuality('high'),
      FilterQuality.high,
    );
    expect(ThemeDecoder.instance.decodeFilterQuality('low'), FilterQuality.low);
    expect(
      ThemeDecoder.instance.decodeFilterQuality('medium'),
      FilterQuality.medium,
    );
    expect(
      ThemeDecoder.instance.decodeFilterQuality('none'),
      FilterQuality.none,
    );

    expect(
      ThemeEncoder.instance.encodeFilterQuality(FilterQuality.high),
      'high',
    );
    expect(ThemeEncoder.instance.encodeFilterQuality(FilterQuality.low), 'low');
    expect(
      ThemeEncoder.instance.encodeFilterQuality(FilterQuality.medium),
      'medium',
    );
    expect(
      ThemeEncoder.instance.encodeFilterQuality(FilterQuality.none),
      'none',
    );
  });

  test('FlexFit', () {
    expect(ThemeDecoder.instance.decodeFlexFit(null), null);
    expect(ThemeEncoder.instance.encodeFlexFit(null), null);

    expect(ThemeDecoder.instance.decodeFlexFit(FlexFit.loose), FlexFit.loose);

    expect(ThemeDecoder.instance.decodeFlexFit('loose'), FlexFit.loose);
    expect(ThemeDecoder.instance.decodeFlexFit('tight'), FlexFit.tight);

    expect(ThemeEncoder.instance.encodeFlexFit(FlexFit.loose), 'loose');
    expect(ThemeEncoder.instance.encodeFlexFit(FlexFit.tight), 'tight');
  });

  test('FloatingActionButtonAnimator', () {
    expect(
      ThemeDecoder.instance.decodeFloatingActionButtonAnimator(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeFloatingActionButtonAnimator(null),
      null,
    );

    expect(
      ThemeDecoder.instance.decodeFloatingActionButtonAnimator(
        FloatingActionButtonAnimator.scaling,
      ),
      FloatingActionButtonAnimator.scaling,
    );

    expect(
      ThemeDecoder.instance.decodeFloatingActionButtonAnimator('noAnimation'),
      FloatingActionButtonAnimator.noAnimation,
    );
    expect(
      ThemeDecoder.instance.decodeFloatingActionButtonAnimator('scaling'),
      FloatingActionButtonAnimator.scaling,
    );
    expect(
      ThemeEncoder.instance.encodeFloatingActionButtonAnimator(
        FloatingActionButtonAnimator.noAnimation,
      ),
      'noAnimation',
    );
    expect(
      ThemeEncoder.instance.encodeFloatingActionButtonAnimator(
        FloatingActionButtonAnimator.scaling,
      ),
      'scaling',
    );
  });

  test('FloatingActionButtonLocation', () {
    expect(
      ThemeDecoder.instance.decodeFloatingActionButtonLocation(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeFloatingActionButtonLocation(null),
      null,
    );

    final values = <String, FloatingActionButtonLocation>{
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
      expect(
        ThemeDecoder.instance.decodeFloatingActionButtonLocation(value),
        value,
      );

      expect(
        ThemeDecoder.instance.decodeFloatingActionButtonLocation(key),
        value,
      );

      expect(
        ThemeEncoder.instance.encodeFloatingActionButtonLocation(value),
        key,
      );
    });
  });

  test('FloatingActionButtonThemeData', () {
    expect(
      ThemeDecoder.instance.decodeFloatingActionButtonThemeData(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeFloatingActionButtonThemeData(null),
      null,
    );

    expect(
      ThemeEncoder.instance.encodeFloatingActionButtonThemeData(
        FloatingActionButtonThemeData(
          mouseCursor: WidgetStateProperty.all(SystemMouseCursors.basic),
        ),
      ),
      {
        'mouseCursor': {
          'disabled': {'cursor': 'basic', 'type': 'system'},
          'dragged': {'cursor': 'basic', 'type': 'system'},
          'empty': {'cursor': 'basic', 'type': 'system'},
          'error': {'cursor': 'basic', 'type': 'system'},
          'focused': {'cursor': 'basic', 'type': 'system'},
          'hovered': {'cursor': 'basic', 'type': 'system'},
          'pressed': {'cursor': 'basic', 'type': 'system'},
          'scrolledUnder': {'cursor': 'basic', 'type': 'system'},
          'selected': {'cursor': 'basic', 'type': 'system'},
        },
      },
    );

    const entry = FloatingActionButtonThemeData(
      backgroundColor: Color(0xff111111),
      disabledElevation: 1.0,
      elevation: 2.0,
      enableFeedback: true,
      extendedIconLabelSpacing: 1.0,
      extendedPadding: EdgeInsets.only(top: 2.0),
      extendedSizeConstraints: BoxConstraints(minHeight: 3.0, minWidth: 4.0),
      extendedTextStyle: TextStyle(color: _kColor),
      focusColor: Color(0xff222222),
      focusElevation: 3.0,
      foregroundColor: Color(0xff333333),
      highlightElevation: 4.0,
      hoverColor: Color(0xff444444),
      hoverElevation: 5.0,
      largeSizeConstraints: BoxConstraints(minHeight: 5.0, minWidth: 6.0),
      shape: RoundedRectangleBorder(),
      sizeConstraints: BoxConstraints(minHeight: 7.0, minWidth: 8.0),
      smallSizeConstraints: BoxConstraints(minHeight: 9.0, minWidth: 10.0),
      splashColor: Color(0xff555555),
    );

    expect(
      ThemeDecoder.instance.decodeFloatingActionButtonThemeData(entry),
      entry,
    );

    final encoded = ThemeEncoder.instance.encodeFloatingActionButtonThemeData(
      entry,
    );
    final decoded = ThemeDecoder.instance.decodeFloatingActionButtonThemeData(
      encoded,
    );

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'disabledElevation': 1.0,
      'elevation': 2.0,
      'enableFeedback': true,
      'extendedIconLabelSpacing': 1.0,
      'extendedPadding': {'bottom': 0.0, 'left': 0.0, 'right': 0.0, 'top': 2.0},
      'extendedSizeConstraints': {'minHeight': 3.0, 'minWidth': 4.0},
      'extendedTextStyle': {'color': _kColorStr, 'inherit': true},
      'focusColor': '#ff222222',
      'focusElevation': 3.0,
      'foregroundColor': '#ff333333',
      'highlightElevation': 4.0,
      'hoverColor': '#ff444444',
      'hoverElevation': 5.0,
      'largeSizeConstraints': {'minHeight': 5.0, 'minWidth': 6.0},
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'sizeConstraints': {'minHeight': 7.0, 'minWidth': 8.0},
      'smallSizeConstraints': {'minHeight': 9.0, 'minWidth': 10.0},
      'splashColor': '#ff555555',
    });

    expect(decoded, entry);
  });

  test('FloatingLabelAlignment', () {
    expect(ThemeDecoder.instance.decodeFloatingLabelAlignment(null), null);
    expect(ThemeEncoder.instance.encodeFloatingLabelAlignment(null), null);

    expect(
      ThemeDecoder.instance.decodeFloatingLabelAlignment(
        FloatingLabelAlignment.center,
      ),
      FloatingLabelAlignment.center,
    );

    expect(
      ThemeDecoder.instance.decodeFloatingLabelAlignment('center'),
      FloatingLabelAlignment.center,
    );
    expect(
      ThemeDecoder.instance.decodeFloatingLabelAlignment('start'),
      FloatingLabelAlignment.start,
    );

    expect(
      ThemeEncoder.instance.encodeFloatingLabelAlignment(
        FloatingLabelAlignment.center,
      ),
      'center',
    );
    expect(
      ThemeEncoder.instance.encodeFloatingLabelAlignment(
        FloatingLabelAlignment.start,
      ),
      'start',
    );
  });

  test('FloatingLabelBehavior', () {
    expect(ThemeDecoder.instance.decodeFloatingLabelBehavior(null), null);
    expect(ThemeEncoder.instance.encodeFloatingLabelBehavior(null), null);

    expect(
      ThemeDecoder.instance.decodeFloatingLabelBehavior(
        FloatingLabelBehavior.always,
      ),
      FloatingLabelBehavior.always,
    );

    expect(
      ThemeDecoder.instance.decodeFloatingLabelBehavior('always'),
      FloatingLabelBehavior.always,
    );
    expect(
      ThemeDecoder.instance.decodeFloatingLabelBehavior('auto'),
      FloatingLabelBehavior.auto,
    );
    expect(
      ThemeDecoder.instance.decodeFloatingLabelBehavior('never'),
      FloatingLabelBehavior.never,
    );

    expect(
      ThemeEncoder.instance.encodeFloatingLabelBehavior(
        FloatingLabelBehavior.always,
      ),
      'always',
    );
    expect(
      ThemeEncoder.instance.encodeFloatingLabelBehavior(
        FloatingLabelBehavior.auto,
      ),
      'auto',
    );
    expect(
      ThemeEncoder.instance.encodeFloatingLabelBehavior(
        FloatingLabelBehavior.never,
      ),
      'never',
    );
  });

  test('FontFeature', () {
    expect(ThemeDecoder.instance.decodeFontFeature(null), null);
    expect(ThemeEncoder.instance.encodeFontFeature(null), null);

    const entry = FontFeature('fooo', 2);

    expect(ThemeDecoder.instance.decodeFontFeature(entry), entry);

    final encoded = ThemeEncoder.instance.encodeFontFeature(entry);
    final decoded = ThemeDecoder.instance.decodeFontFeature(encoded);

    expect(encoded, {'feature': 'fooo', 'value': 2});

    expect(decoded, entry);
  });

  test('FontStyle', () {
    expect(ThemeDecoder.instance.decodeFontStyle(null), null);
    expect(ThemeEncoder.instance.encodeFontStyle(null), null);

    expect(
      ThemeDecoder.instance.decodeFontStyle(FontStyle.italic),
      FontStyle.italic,
    );

    expect(ThemeDecoder.instance.decodeFontStyle('italic'), FontStyle.italic);
    expect(ThemeDecoder.instance.decodeFontStyle('normal'), FontStyle.normal);

    expect(ThemeEncoder.instance.encodeFontStyle(FontStyle.italic), 'italic');
    expect(ThemeEncoder.instance.encodeFontStyle(FontStyle.normal), 'normal');
  });

  test('FontWeight', () {
    expect(ThemeDecoder.instance.decodeFontWeight(null), null);
    expect(ThemeEncoder.instance.encodeFontWeight(null), null);

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
      expect(ThemeDecoder.instance.decodeFontWeight(value), value);

      expect(ThemeDecoder.instance.decodeFontWeight(key), value);

      // 'bold' and 'normal' are convenience keys that map to a w* value.  They
      // don't actually exist.
      if ('bold' != key && 'normal' != key) {
        expect(ThemeEncoder.instance.encodeFontWeight(value), key);
      }
    });
  });

  test('FontVariation', () {
    expect(ThemeDecoder.instance.decodeFontVariation(null), null);
    expect(ThemeEncoder.instance.encodeFontVariation(null), null);

    const entry = FontVariation('slnt', 20.0);
    final encoded = ThemeEncoder.instance.encodeFontVariation(entry);
    final decoded = ThemeDecoder.instance.decodeFontVariation(encoded);

    expect(encoded, {'axis': 'slnt', 'value': 20.0});

    expect(entry, decoded);
  });

  test('Gradient', () {
    expect(ThemeDecoder.instance.decodeGradient(null), null);
    expect(ThemeEncoder.instance.encodeGradient(null), null);

    Gradient entry = const LinearGradient(
      colors: <Color>[Color(0xff111111), Color(0xff222222)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [1.0, 2.0, 3.0],
      tileMode: TileMode.clamp,
      transform: GradientRotation(4.0),
    );

    expect(ThemeDecoder.instance.decodeGradient(entry), entry);

    var encoded = ThemeEncoder.instance.encodeGradient(entry);
    var decoded = ThemeDecoder.instance.decodeGradient(encoded);

    expect(encoded, {
      'colors': ['#ff111111', '#ff222222'],
      'begin': 'topLeft',
      'end': 'bottomRight',
      'stops': [1.0, 2.0, 3.0],
      'tileMode': 'clamp',
      'transform': {'radians': 4.0},
      'type': 'linear',
    });

    expect(decoded, entry);

    entry = const RadialGradient(
      center: Alignment.bottomCenter,
      colors: <Color>[Color(0xff111111), Color(0xff222222)],
      focal: Alignment.topCenter,
      focalRadius: 5.0,
      radius: 6.0,
      stops: [1.0, 2.0, 3.0],
      tileMode: TileMode.clamp,
      transform: GradientRotation(4.0),
    );

    encoded = ThemeEncoder.instance.encodeGradient(entry);
    decoded = ThemeDecoder.instance.decodeGradient(encoded);

    expect(encoded, {
      'center': 'bottomCenter',
      'colors': ['#ff111111', '#ff222222'],
      'focal': 'topCenter',
      'focalRadius': 5.0,
      'radius': 6.0,
      'stops': [1.0, 2.0, 3.0],
      'tileMode': 'clamp',
      'transform': {'radians': 4.0},
      'type': 'radial',
    });

    expect(decoded, entry);

    entry = const SweepGradient(
      center: Alignment.bottomCenter,
      colors: <Color>[Color(0xff111111), Color(0xff222222)],
      endAngle: 5.0,
      startAngle: 6.0,
      stops: [1.0, 2.0, 3.0],
      tileMode: TileMode.clamp,
      transform: GradientRotation(4.0),
    );

    encoded = ThemeEncoder.instance.encodeGradient(entry);
    decoded = ThemeDecoder.instance.decodeGradient(encoded);

    expect(encoded, {
      'center': 'bottomCenter',
      'colors': ['#ff111111', '#ff222222'],
      'endAngle': 5.0,
      'startAngle': 6.0,
      'stops': [1.0, 2.0, 3.0],
      'tileMode': 'clamp',
      'transform': {'radians': 4.0},
      'type': 'sweep',
    });

    expect(decoded, entry);
  });

  test('GradientTransform', () {
    expect(ThemeDecoder.instance.decodeGradientTransform(null), null);
    expect(ThemeEncoder.instance.encodeGradientTransform(null), null);

    const entry = GradientRotation(10.0);

    expect(ThemeDecoder.instance.decodeGradientTransform(entry), entry);

    final encoded = ThemeEncoder.instance.encodeGradientTransform(entry);
    final decoded = ThemeDecoder.instance.decodeGradientTransform(encoded)!;

    expect(encoded, {'radians': 10.0});

    expect(decoded.runtimeType, entry.runtimeType);

    expect((decoded as GradientRotation).radians, entry.radians);
  });

  test('HitTestBehavior', () {
    expect(ThemeDecoder.instance.decodeHitTestBehavior(null), null);
    expect(ThemeEncoder.instance.encodeHitTestBehavior(null), null);

    expect(
      ThemeDecoder.instance.decodeHitTestBehavior(HitTestBehavior.deferToChild),
      HitTestBehavior.deferToChild,
    );

    expect(
      ThemeDecoder.instance.decodeHitTestBehavior('deferToChild'),
      HitTestBehavior.deferToChild,
    );
    expect(
      ThemeDecoder.instance.decodeHitTestBehavior('opaque'),
      HitTestBehavior.opaque,
    );
    expect(
      ThemeDecoder.instance.decodeHitTestBehavior('translucent'),
      HitTestBehavior.translucent,
    );

    expect(
      ThemeEncoder.instance.encodeHitTestBehavior(HitTestBehavior.deferToChild),
      'deferToChild',
    );
    expect(
      ThemeEncoder.instance.encodeHitTestBehavior(HitTestBehavior.opaque),
      'opaque',
    );
    expect(
      ThemeEncoder.instance.encodeHitTestBehavior(HitTestBehavior.translucent),
      'translucent',
    );
  });

  test('Icon', () {
    expect(ThemeDecoder.instance.decodeIcon(null), null);
    expect(ThemeEncoder.instance.encodeIcon(null), null);

    const data = IconData(
      2,
      fontFamily: 'foo',
      fontPackage: 'bar',
      matchTextDirection: true,
    );

    expect({
      'icon': {
        'codePoint': 2,
        'fontFamily': 'foo',
        'fontPackage': 'bar',
        'matchTextDirection': true,
      },
    }, ThemeEncoder.instance.encodeIcon(const Icon(data)));
    const entry = Icon(
      data,
      applyTextScaling: false,
      blendMode: BlendMode.colorBurn,
      color: _kColor,
      fill: 0.1,
      grade: 0.2,
      opticalSize: 0.3,
      size: 12.0,
      textDirection: TextDirection.ltr,
      weight: 400.0,
    );

    expect(ThemeDecoder.instance.decodeIcon(entry), entry);

    final encoded = ThemeEncoder.instance.encodeIcon(entry);
    final decoded = ThemeDecoder.instance.decodeIcon(encoded);

    expect(encoded, {
      'applyTextScaling': false,
      'blendMode': 'colorBurn',
      'color': _kColorStr,
      'fill': 0.1,
      'grade': 0.2,
      'icon': {
        'codePoint': 2,
        'fontFamily': 'foo',
        'fontPackage': 'bar',
        'matchTextDirection': true,
      },
      'opticalSize': 0.3,
      'size': 12.0,
      'textDirection': 'ltr',
      'weight': 400.0,
    });

    expect(decoded.toString(), entry.toString());
  });

  test('IconAlignment', () {
    expect(ThemeDecoder.instance.decodeIconAlignment(null), null);
    expect(ThemeEncoder.instance.encodeIconAlignment(null), null);

    expect(
      ThemeDecoder.instance.decodeIconAlignment(IconAlignment.end),
      IconAlignment.end,
    );
    expect(ThemeDecoder.instance.decodeIconAlignment('end'), IconAlignment.end);
    expect(
      ThemeDecoder.instance.decodeIconAlignment('start'),
      IconAlignment.start,
    );

    expect(ThemeEncoder.instance.encodeIconAlignment(IconAlignment.end), 'end');
    expect(
      ThemeEncoder.instance.encodeIconAlignment(IconAlignment.start),
      'start',
    );
  });

  test('IconButtonThemeData', () {
    expect(ThemeDecoder.instance.decodeIconButtonThemeData(null), null);
    expect(ThemeEncoder.instance.encodeIconButtonThemeData(null), null);

    final entry = IconButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.bottomCenter,
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: WidgetStateProperty.all(const Color(0xff555555)),
        elevation: WidgetStateProperty.all(1.0),
        enableFeedback: false,
        fixedSize: WidgetStateProperty.all(const Size(50.0, 50.0)),
        foregroundColor: WidgetStateProperty.all(const Color(0xff555555)),
        iconColor: WidgetStateProperty.all(const Color(0xff555555)),
        iconSize: WidgetStateProperty.all(12.0),
        maximumSize: WidgetStateProperty.all(const Size(10.0, 10.0)),
        minimumSize: WidgetStateProperty.all(const Size(100.0, 100.0)),
        mouseCursor: WidgetStateProperty.all(MouseCursor.defer),
        overlayColor: WidgetStateProperty.all(const Color(0xff555555)),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        shadowColor: WidgetStateProperty.all(const Color(0xff555555)),
        shape: WidgetStateProperty.all(const CircleBorder()),
        side: WidgetStateProperty.all(const BorderSide()),
        tapTargetSize: MaterialTapTargetSize.padded,
        textStyle: WidgetStateProperty.all(const TextStyle()),
        visualDensity: VisualDensity.standard,
      ),
    );

    expect(ThemeDecoder.instance.decodeIconButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeIconButtonThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeIconButtonThemeData(encoded);

    expect(encoded, {
      'style': {
        'alignment': 'bottomCenter',
        'animationDuration': 1000,
        'backgroundColor': _materializeState('#ff555555'),
        'elevation': _materializeState(1.0),
        'enableFeedback': false,
        'fixedSize': _materializeState({'height': 50.0, 'width': 50.0}),
        'foregroundColor': _materializeState('#ff555555'),
        'iconColor': _materializeState('#ff555555'),
        'iconSize': _materializeState(12.0),
        'maximumSize': _materializeState({'height': 10.0, 'width': 10.0}),
        'minimumSize': _materializeState({'height': 100.0, 'width': 100.0}),
        'mouseCursor': _materializeState({'type': 'defer'}),
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
            'strokeAlign': -1.0,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'circle',
        }),
        'side': _materializeState({
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        }),
        'tapTargetSize': 'padded',
        'textStyle': _materializeState({'inherit': true}),
        'visualDensity': 'standard',
      },
    });

    expect(_buttonStylesAreEqual(decoded!.style, entry.style), true);
  });

  test('IconData', () {
    expect(ThemeDecoder.instance.decodeIconData(null), null);
    expect(ThemeEncoder.instance.encodeIconData(null), null);

    const entry = IconData(
      2,
      fontFamily: 'foo',
      fontFamilyFallback: ['baz', 'baaaz'],
      fontPackage: 'bar',
      matchTextDirection: true,
    );

    expect(ThemeDecoder.instance.decodeIconData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeIconData(entry);
    final decoded = ThemeDecoder.instance.decodeIconData(encoded);

    expect(encoded, {
      'codePoint': 2,
      'fontFamily': 'foo',
      'fontFamilyFallback': ['baz', 'baaaz'],
      'fontPackage': 'bar',
      'matchTextDirection': true,
    });

    expect(decoded, entry);
  });

  test('IconThemeData', () {
    expect(ThemeDecoder.instance.decodeIconThemeData(null), null);
    expect(ThemeEncoder.instance.encodeIconThemeData(null), null);

    const entry = IconThemeData(
      applyTextScaling: false,
      color: _kColor,
      fill: 0.5,
      grade: 3.0,
      opacity: 1.0,
      opticalSize: 4.0,
      size: 10.0,
      weight: 5.0,
    );

    expect(ThemeDecoder.instance.decodeIconThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeIconThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeIconThemeData(encoded);

    expect(encoded, {
      'applyTextScaling': false,
      'color': _kColorStr,
      'fill': 0.5,
      'grade': 3.0,
      'opacity': 1.0,
      'opticalSize': 4.0,
      'size': 10.0,
      'weight': 5.0,
    });

    expect(decoded, entry);
  });

  test('ImageProvider', () {
    expect(ThemeDecoder.instance.decodeImageProvider(null), null);
    expect(ThemeEncoder.instance.encodeImageProvider(null), null);

    final images = [
      {'assetName': 'asset', 'package': 'package', 'type': 'asset'},
      {'bytes': base64Image, 'scale': 2.0, 'type': 'memory'},
      {
        'headers': {'foo': 'bar'},
        'scale': 3.0,
        'type': 'network',
        'url': 'network',
      },
    ];

    for (var image in images) {
      final decoded = ThemeDecoder.instance.decodeImageProvider(image);
      expect(ThemeDecoder.instance.decodeImageProvider(decoded), decoded);
      expect(ThemeEncoder.instance.encodeImageProvider(decoded), image);
    }
  });

  test('ImageRepeat', () {
    expect(ThemeDecoder.instance.decodeImageRepeat(null), null);
    expect(ThemeEncoder.instance.encodeImageRepeat(null), null);

    expect(
      ThemeDecoder.instance.decodeImageRepeat(ImageRepeat.noRepeat),
      ImageRepeat.noRepeat,
    );

    expect(
      ThemeDecoder.instance.decodeImageRepeat('noRepeat'),
      ImageRepeat.noRepeat,
    );
    expect(
      ThemeDecoder.instance.decodeImageRepeat('repeat'),
      ImageRepeat.repeat,
    );
    expect(
      ThemeDecoder.instance.decodeImageRepeat('repeatX'),
      ImageRepeat.repeatX,
    );
    expect(
      ThemeDecoder.instance.decodeImageRepeat('repeatY'),
      ImageRepeat.repeatY,
    );

    expect(
      ThemeEncoder.instance.encodeImageRepeat(ImageRepeat.noRepeat),
      'noRepeat',
    );
    expect(
      ThemeEncoder.instance.encodeImageRepeat(ImageRepeat.repeat),
      'repeat',
    );
    expect(
      ThemeEncoder.instance.encodeImageRepeat(ImageRepeat.repeatX),
      'repeatX',
    );
    expect(
      ThemeEncoder.instance.encodeImageRepeat(ImageRepeat.repeatY),
      'repeatY',
    );
  });

  test('InputBorder', () {
    expect(ThemeDecoder.instance.decodeInputBorder(null), null);
    expect(ThemeEncoder.instance.encodeInputBorder(null), null);

    const entry = OutlineInputBorder(
      borderSide: BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 3.0,
      ),
      gapPadding: 1.0,
    );

    expect(ThemeDecoder.instance.decodeInputBorder(entry), entry);

    final encoded = ThemeEncoder.instance.encodeInputBorder(entry);
    final decoded = ThemeDecoder.instance.decodeInputBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'bottomRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'topLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'topRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'type': 'only',
      },
      'borderSide': {
        'color': '#00123456',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 3.0,
      },
      'gapPadding': 1.0,
      'type': 'outline',
    });

    expect(decoded, entry);

    const entry2 = UnderlineInputBorder(
      borderSide: BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 3.0,
      ),
    );

    final encoded2 = ThemeEncoder.instance.encodeInputBorder(entry2);
    final decoded2 = ThemeDecoder.instance.decodeInputBorder(encoded2);

    expect(encoded2, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
        'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
        'topLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'topRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'type': 'only',
      },
      'borderSide': {
        'color': '#00123456',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 3.0,
      },
      'type': 'underline',
    });

    expect(decoded2, entry2);
  });

  test('InputDecorationThemeData', () {
    expect(ThemeDecoder.instance.decodeInputDecorationThemeData(null), null);
    expect(ThemeEncoder.instance.encodeInputDecorationThemeData(null), null);

    final entry = InputDecorationThemeData(
      activeIndicatorBorder: const BorderSide(
        color: _kColor,
        strokeAlign: -2.0,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      alignLabelWithHint: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
      constraints: const BoxConstraints(minHeight: 2.0, minWidth: 1.0),
      contentPadding: const EdgeInsets.all(10.0),
      counterStyle: const TextStyle(color: Color(0xff111111)),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
      errorMaxLines: 1,
      errorStyle: const TextStyle(color: Color(0xff222222)),
      fillColor: const Color(0xff333333),
      filled: true,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: const TextStyle(color: Color(0x00000000)),
      focusColor: const Color(0xff444444),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      helperMaxLines: 2,
      helperStyle: const TextStyle(color: Color(0xff555555)),
      hintFadeDuration: const Duration(milliseconds: 500),
      hintStyle: const TextStyle(color: Color(0xff666666)),
      hoverColor: const Color(0xff777777),
      iconColor: const Color(0xff223322),
      isCollapsed: true,
      isDense: true,
      labelStyle: const TextStyle(color: Color(0xff888888)),
      outlineBorder: const BorderSide(
        color: _kColor,
        strokeAlign: -3.0,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      prefixIconConstraints: BoxConstraints(minHeight: 1.0, minWidth: 2.0),
      prefixIconColor: const Color(0xff334433),
      prefixStyle: const TextStyle(color: Color(0xff999999)),
      suffixIconColor: const Color(0xff445544),
      suffixIconConstraints: BoxConstraints(minHeight: 10.0, minWidth: 20.0),
      suffixStyle: const TextStyle(color: Color(0xff000000)),
    );

    expect(ThemeDecoder.instance.decodeInputDecorationThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeInputDecorationThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeInputDecorationThemeData(
      encoded,
    );

    expect(encoded, {
      'activeIndicatorBorder': {
        'color': _kColorStr,
        'strokeAlign': -2.0,
        'style': 'solid',
        'width': 2.0,
      },
      'alignLabelWithHint': true,
      'border': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
          'bottomRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
          'topLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
          'topRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
          'type': 'only',
        },
        'borderSide': {
          'color': '#ff000000',
          'style': 'solid',
          'strokeAlign': -1.0,
          'width': 1.0,
        },
        'gapPadding': 4.0,
        'type': 'outline',
      },
      'constraints': {'minHeight': 2.0, 'minWidth': 1.0},
      'contentPadding': {
        'bottom': 10.0,
        'left': 10.0,
        'right': 10.0,
        'top': 10.0,
      },
      'counterStyle': {'color': '#ff111111', 'inherit': true},
      'disabledBorder': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
          'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
          'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
          'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
          'type': 'only',
        },
        'borderSide': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'gapPadding': 4.0,
        'type': 'outline',
      },
      'enabledBorder': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'bottomRight': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'topLeft': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'topRight': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'type': 'only',
        },
        'borderSide': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'gapPadding': 4.0,
        'type': 'outline',
      },
      'errorBorder': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'bottomRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'topLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'topRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'type': 'only',
        },
        'borderSide': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'gapPadding': 4.0,
        'type': 'outline',
      },
      'errorMaxLines': 1,
      'errorStyle': {'color': '#ff222222', 'inherit': true},
      'fillColor': '#ff333333',
      'filled': true,
      'floatingLabelAlignment': 'center',
      'floatingLabelBehavior': 'always',
      'floatingLabelStyle': {'color': '#00000000', 'inherit': true},
      'focusColor': '#ff444444',
      'focusedBorder': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'bottomRight': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'topLeft': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'topRight': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'type': 'only',
        },
        'borderSide': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'gapPadding': 4.0,
        'type': 'outline',
      },
      'focusedErrorBorder': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'bottomRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'topLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'topRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'type': 'only',
        },
        'borderSide': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'gapPadding': 4.0,
        'type': 'outline',
      },
      'helperMaxLines': 2,
      'helperStyle': {'color': '#ff555555', 'inherit': true},
      'hintFadeDuration': 500,
      'hintStyle': {'color': '#ff666666', 'inherit': true},
      'hoverColor': '#ff777777',
      'iconColor': '#ff223322',
      'isCollapsed': true,
      'isDense': true,
      'labelStyle': {'color': '#ff888888', 'inherit': true},
      'outlineBorder': {
        'color': _kColorStr,
        'strokeAlign': -3.0,
        'style': 'solid',
        'width': 2.0,
      },
      'prefixIconColor': '#ff334433',
      'prefixIconConstraints': {'minHeight': 1.0, 'minWidth': 2.0},
      'prefixStyle': {'color': '#ff999999', 'inherit': true},
      'suffixIconColor': '#ff445544',
      'suffixIconConstraints': {'minHeight': 10.0, 'minWidth': 20.0},
      'suffixStyle': {'color': '#ff000000', 'inherit': true},
    });

    expect(decoded, entry);
  });

  test('InteractiveInkFeatureFactory', () {
    expect(
      ThemeDecoder.instance.decodeInteractiveInkFeatureFactory(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeInteractiveInkFeatureFactory(null),
      null,
    );

    expect(
      ThemeDecoder.instance.decodeInteractiveInkFeatureFactory(
        InkSplash.splashFactory,
      ),
      InkSplash.splashFactory,
    );

    expect(
      ThemeDecoder.instance.decodeInteractiveInkFeatureFactory('splash'),
      InkSplash.splashFactory,
    );
    expect(
      ThemeDecoder.instance.decodeInteractiveInkFeatureFactory('ripple'),
      InkRipple.splashFactory,
    );
    expect(
      ThemeDecoder.instance.decodeInteractiveInkFeatureFactory('sparkle'),
      InkSparkle.splashFactory,
    );

    expect(
      ThemeEncoder.instance.encodeInteractiveInkFeatureFactory(
        InkSplash.splashFactory,
      ),
      'splash',
    );
    expect(
      ThemeEncoder.instance.encodeInteractiveInkFeatureFactory(
        InkRipple.splashFactory,
      ),
      'ripple',
    );
    expect(
      ThemeEncoder.instance.encodeInteractiveInkFeatureFactory(
        InkSparkle.splashFactory,
      ),
      'sparkle',
    );
  });

  test('ListTileControlAffinity', () {
    expect(ThemeDecoder.instance.decodeListTileControlAffinity(null), null);
    expect(ThemeEncoder.instance.encodeListTileControlAffinity(null), null);

    expect(
      ThemeDecoder.instance.decodeListTileStyle(ListTileStyle.drawer),
      ListTileStyle.drawer,
    );

    expect(
      ThemeDecoder.instance.decodeListTileControlAffinity('leading'),
      ListTileControlAffinity.leading,
    );
    expect(
      ThemeDecoder.instance.decodeListTileControlAffinity('platform'),
      ListTileControlAffinity.platform,
    );
    expect(
      ThemeDecoder.instance.decodeListTileControlAffinity('trailing'),
      ListTileControlAffinity.trailing,
    );

    expect(
      ThemeEncoder.instance.encodeListTileControlAffinity(
        ListTileControlAffinity.leading,
      ),
      'leading',
    );
    expect(
      ThemeEncoder.instance.encodeListTileControlAffinity(
        ListTileControlAffinity.platform,
      ),
      'platform',
    );
    expect(
      ThemeEncoder.instance.encodeListTileControlAffinity(
        ListTileControlAffinity.trailing,
      ),
      'trailing',
    );
  });

  test('ListTileStyle', () {
    expect(ThemeDecoder.instance.decodeListTileStyle(null), null);
    expect(ThemeEncoder.instance.encodeListTileStyle(null), null);

    expect(
      ThemeDecoder.instance.decodeListTileStyle(ListTileStyle.drawer),
      ListTileStyle.drawer,
    );

    expect(
      ThemeDecoder.instance.decodeListTileStyle('drawer'),
      ListTileStyle.drawer,
    );
    expect(
      ThemeDecoder.instance.decodeListTileStyle('list'),
      ListTileStyle.list,
    );

    expect(
      ThemeEncoder.instance.encodeListTileStyle(ListTileStyle.drawer),
      'drawer',
    );
    expect(
      ThemeEncoder.instance.encodeListTileStyle(ListTileStyle.list),
      'list',
    );
  });

  test('ListTileTitleAlignment', () {
    expect(ThemeDecoder.instance.decodeListTileTitleAlignment(null), null);
    expect(ThemeEncoder.instance.encodeListTileTitleAlignment(null), null);

    expect(
      ThemeDecoder.instance.decodeListTileTitleAlignment(
        ListTileTitleAlignment.bottom,
      ),
      ListTileTitleAlignment.bottom,
    );

    expect(
      ThemeDecoder.instance.decodeListTileTitleAlignment('bottom'),
      ListTileTitleAlignment.bottom,
    );
    expect(
      ThemeDecoder.instance.decodeListTileTitleAlignment('center'),
      ListTileTitleAlignment.center,
    );
    expect(
      ThemeDecoder.instance.decodeListTileTitleAlignment('threeLine'),
      ListTileTitleAlignment.threeLine,
    );
    expect(
      ThemeDecoder.instance.decodeListTileTitleAlignment('titleHeight'),
      ListTileTitleAlignment.titleHeight,
    );
    expect(
      ThemeDecoder.instance.decodeListTileTitleAlignment('top'),
      ListTileTitleAlignment.top,
    );

    expect(
      ThemeEncoder.instance.encodeListTileTitleAlignment(
        ListTileTitleAlignment.bottom,
      ),
      'bottom',
    );
    expect(
      ThemeEncoder.instance.encodeListTileTitleAlignment(
        ListTileTitleAlignment.center,
      ),
      'center',
    );
    expect(
      ThemeEncoder.instance.encodeListTileTitleAlignment(
        ListTileTitleAlignment.threeLine,
      ),
      'threeLine',
    );
    expect(
      ThemeEncoder.instance.encodeListTileTitleAlignment(
        ListTileTitleAlignment.titleHeight,
      ),
      'titleHeight',
    );
    expect(
      ThemeEncoder.instance.encodeListTileTitleAlignment(
        ListTileTitleAlignment.top,
      ),
      'top',
    );
  });

  test('ListTileThemeData', () {
    expect(ThemeDecoder.instance.decodeListTileThemeData(null), null);
    expect(ThemeEncoder.instance.encodeListTileThemeData(null), null);

    const entry = ListTileThemeData(
      contentPadding: EdgeInsets.fromLTRB(1, 2, 3, 4),
      controlAffinity: ListTileControlAffinity.trailing,
      dense: true,
      enableFeedback: false,
      horizontalTitleGap: 5,
      iconColor: Color(0xff111111),
      minLeadingWidth: 6,
      minTileHeight: 10.0,
      minVerticalPadding: 7,
      selectedColor: Color(0xff222222),
      selectedTileColor: Color(0xff333333),
      shape: ContinuousRectangleBorder(),
      style: ListTileStyle.drawer,
      textColor: Color(0xff444444),
      tileColor: Color(0xff555555),
    );

    final decoded = ThemeDecoder.instance.decodeListTileThemeData(entry);
    final encoded = ThemeEncoder.instance.encodeListTileThemeData(decoded);

    expect(encoded, {
      'contentPadding': {'left': 1, 'top': 2, 'right': 3, 'bottom': 4},
      'controlAffinity': 'trailing',
      'dense': true,
      'enableFeedback': false,
      'horizontalTitleGap': 5,
      'iconColor': '#ff111111',
      'minLeadingWidth': 6,
      'minTileHeight': 10.0,
      'minVerticalPadding': 7,
      'selectedColor': '#ff222222',
      'selectedTileColor': '#ff333333',
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rectangle',
      },
      'style': 'drawer',
      'textColor': '#ff444444',
      'tileColor': '#ff555555',
    });

    expect(decoded, entry);
  });

  test('Locale', () {
    expect(ThemeDecoder.instance.decodeLocale(null), null);
    expect(ThemeEncoder.instance.encodeLocale(null), null);

    const entry = Locale('en', 'US');

    expect(ThemeDecoder.instance.decodeLocale(entry), entry);

    final encoded = ThemeEncoder.instance.encodeLocale(entry);
    final decoded = ThemeDecoder.instance.decodeLocale(encoded);

    expect(encoded, {'countryCode': 'US', 'languageCode': 'en'});

    expect(decoded, entry);
  });

  test('MainAxisAlignment', () {
    expect(ThemeDecoder.instance.decodeMainAxisAlignment(null), null);
    expect(ThemeEncoder.instance.encodeMainAxisAlignment(null), null);

    expect(
      ThemeDecoder.instance.decodeMainAxisAlignment(MainAxisAlignment.center),
      MainAxisAlignment.center,
    );

    expect(
      ThemeDecoder.instance.decodeMainAxisAlignment('center'),
      MainAxisAlignment.center,
    );
    expect(
      ThemeDecoder.instance.decodeMainAxisAlignment('end'),
      MainAxisAlignment.end,
    );
    expect(
      ThemeDecoder.instance.decodeMainAxisAlignment('spaceAround'),
      MainAxisAlignment.spaceAround,
    );
    expect(
      ThemeDecoder.instance.decodeMainAxisAlignment('spaceBetween'),
      MainAxisAlignment.spaceBetween,
    );
    expect(
      ThemeDecoder.instance.decodeMainAxisAlignment('spaceEvenly'),
      MainAxisAlignment.spaceEvenly,
    );
    expect(
      ThemeDecoder.instance.decodeMainAxisAlignment('start'),
      MainAxisAlignment.start,
    );

    expect(
      ThemeEncoder.instance.encodeMainAxisAlignment(MainAxisAlignment.center),
      'center',
    );
    expect(
      ThemeEncoder.instance.encodeMainAxisAlignment(MainAxisAlignment.end),
      'end',
    );
    expect(
      ThemeEncoder.instance.encodeMainAxisAlignment(
        MainAxisAlignment.spaceAround,
      ),
      'spaceAround',
    );
    expect(
      ThemeEncoder.instance.encodeMainAxisAlignment(
        MainAxisAlignment.spaceBetween,
      ),
      'spaceBetween',
    );
    expect(
      ThemeEncoder.instance.encodeMainAxisAlignment(
        MainAxisAlignment.spaceEvenly,
      ),
      'spaceEvenly',
    );
    expect(
      ThemeEncoder.instance.encodeMainAxisAlignment(MainAxisAlignment.start),
      'start',
    );
  });

  test('MainAxisSize', () {
    expect(ThemeDecoder.instance.decodeMainAxisSize(null), null);
    expect(ThemeEncoder.instance.encodeMainAxisSize(null), null);

    expect(
      ThemeDecoder.instance.decodeMainAxisSize(MainAxisSize.max),
      MainAxisSize.max,
    );

    expect(ThemeDecoder.instance.decodeMainAxisSize('max'), MainAxisSize.max);
    expect(ThemeDecoder.instance.decodeMainAxisSize('min'), MainAxisSize.min);

    expect(ThemeEncoder.instance.encodeMainAxisSize(MainAxisSize.max), 'max');
    expect(ThemeEncoder.instance.encodeMainAxisSize(MainAxisSize.min), 'min');
  });

  test('MaterialBannerThemeData', () {
    expect(ThemeDecoder.instance.decodeMaterialBannerThemeData(null), null);
    expect(ThemeEncoder.instance.encodeMaterialBannerThemeData(null), null);

    const entry = MaterialBannerThemeData(
      backgroundColor: _kColor,
      contentTextStyle: _kTextStyle,
      dividerColor: Color(0xff111111),
      elevation: 5.5,
      leadingPadding: EdgeInsets.all(1.0),
      padding: EdgeInsets.all(2.0),
      shadowColor: Color(0xff222222),
      surfaceTintColor: Color(0xff333333),
    );

    expect(ThemeDecoder.instance.decodeMaterialBannerThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeMaterialBannerThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeMaterialBannerThemeData(
      encoded,
    );

    expect(encoded, {
      'backgroundColor': _kColorStr,
      'contentTextStyle': _kTextStyleJson,
      'dividerColor': '#ff111111',
      'elevation': 5.5,
      'leadingPadding': {'bottom': 1.0, 'left': 1.0, 'right': 1.0, 'top': 1.0},
      'padding': {'bottom': 2.0, 'left': 2.0, 'right': 2.0, 'top': 2.0},
      'shadowColor': '#ff222222',
      'surfaceTintColor': '#ff333333',
    });

    expect(decoded, entry);
  });

  test('MaterialColor', () {
    expect(ThemeDecoder.instance.decodeMaterialColor(null), null);
    expect(ThemeEncoder.instance.encodeMaterialColor(null), null);

    final entry = MaterialColor(colorToInt(_kColor)!, const {
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

    expect(ThemeDecoder.instance.decodeMaterialColor(entry), entry);

    final encoded = ThemeEncoder.instance.encodeMaterialColor(entry);
    final decoded = ThemeDecoder.instance.decodeMaterialColor(encoded);

    expect(encoded, {
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
      },
    });

    expect(ThemeEncoder.instance.encodeMaterialColor(decoded), encoded);
  });

  test('MaterialTapTargetSize', () {
    expect(ThemeDecoder.instance.decodeMaterialTapTargetSize(null), null);
    expect(ThemeEncoder.instance.encodeMaterialTapTargetSize(null), null);

    expect(
      ThemeDecoder.instance.decodeMaterialTapTargetSize(
        MaterialTapTargetSize.padded,
      ),
      MaterialTapTargetSize.padded,
    );

    expect(
      ThemeDecoder.instance.decodeMaterialTapTargetSize('padded'),
      MaterialTapTargetSize.padded,
    );
    expect(
      ThemeDecoder.instance.decodeMaterialTapTargetSize('shrinkWrap'),
      MaterialTapTargetSize.shrinkWrap,
    );

    expect(
      ThemeEncoder.instance.encodeMaterialTapTargetSize(
        MaterialTapTargetSize.padded,
      ),
      'padded',
    );
    expect(
      ThemeEncoder.instance.encodeMaterialTapTargetSize(
        MaterialTapTargetSize.shrinkWrap,
      ),
      'shrinkWrap',
    );
  });

  test('MaterialType', () {
    expect(ThemeDecoder.instance.decodeMaterialType(null), null);
    expect(ThemeEncoder.instance.encodeMaterialType(null), null);

    expect(
      ThemeDecoder.instance.decodeMaterialType(MaterialType.button),
      MaterialType.button,
    );

    expect(
      ThemeDecoder.instance.decodeMaterialType('button'),
      MaterialType.button,
    );
    expect(
      ThemeDecoder.instance.decodeMaterialType('canvas'),
      MaterialType.canvas,
    );
    expect(ThemeDecoder.instance.decodeMaterialType('card'), MaterialType.card);
    expect(
      ThemeDecoder.instance.decodeMaterialType('circle'),
      MaterialType.circle,
    );
    expect(
      ThemeDecoder.instance.decodeMaterialType('transparency'),
      MaterialType.transparency,
    );

    expect(
      ThemeEncoder.instance.encodeMaterialType(MaterialType.button),
      'button',
    );
    expect(
      ThemeEncoder.instance.encodeMaterialType(MaterialType.canvas),
      'canvas',
    );
    expect(ThemeEncoder.instance.encodeMaterialType(MaterialType.card), 'card');
    expect(
      ThemeEncoder.instance.encodeMaterialType(MaterialType.circle),
      'circle',
    );
    expect(
      ThemeEncoder.instance.encodeMaterialType(MaterialType.transparency),
      'transparency',
    );
  });

  test('Matrix4', () {
    expect(ThemeDecoder.instance.decodeMatrix4(null), null);
    expect(ThemeEncoder.instance.encodeMatrix4(null), null);

    final entry = Matrix4(
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

    expect(ThemeDecoder.instance.decodeMatrix4(entry), entry);

    final encoded = ThemeEncoder.instance.encodeMatrix4(entry);
    final decoded = ThemeDecoder.instance.decodeMatrix4(encoded);

    expect(encoded, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]);

    expect(decoded, entry);
  });

  test('MaxLengthEnforcement', () {
    expect(ThemeDecoder.instance.decodeMaxLengthEnforcement(null), null);
    expect(ThemeEncoder.instance.encodeMaxLengthEnforcement(null), null);

    expect(
      ThemeDecoder.instance.decodeMaxLengthEnforcement('enforced'),
      MaxLengthEnforcement.enforced,
    );
    expect(
      ThemeDecoder.instance.decodeMaxLengthEnforcement('none'),
      MaxLengthEnforcement.none,
    );
    expect(
      ThemeDecoder.instance.decodeMaxLengthEnforcement(
        'truncateAfterCompositionEnds',
      ),
      MaxLengthEnforcement.truncateAfterCompositionEnds,
    );

    expect(
      ThemeEncoder.instance.encodeMaxLengthEnforcement(
        MaxLengthEnforcement.enforced,
      ),
      'enforced',
    );
    expect(
      ThemeEncoder.instance.encodeMaxLengthEnforcement(
        MaxLengthEnforcement.none,
      ),
      'none',
    );
    expect(
      ThemeEncoder.instance.encodeMaxLengthEnforcement(
        MaxLengthEnforcement.truncateAfterCompositionEnds,
      ),
      'truncateAfterCompositionEnds',
    );
  });

  test('MenuButtonThemeData', () {
    expect(ThemeDecoder.instance.decodeMenuButtonThemeData(null), null);
    expect(ThemeEncoder.instance.encodeMenuButtonThemeData(null), null);

    final entry = MenuButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.bottomCenter,
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: WidgetStateProperty.all(const Color(0xff555555)),
        elevation: WidgetStateProperty.all(1.0),
        enableFeedback: false,
        fixedSize: WidgetStateProperty.all(const Size(50.0, 50.0)),
        foregroundColor: WidgetStateProperty.all(const Color(0xff555555)),
        iconColor: WidgetStateProperty.all(const Color(0xff555555)),
        iconSize: WidgetStateProperty.all(12.0),
        maximumSize: WidgetStateProperty.all(const Size(10.0, 10.0)),
        minimumSize: WidgetStateProperty.all(const Size(100.0, 100.0)),
        mouseCursor: WidgetStateProperty.all(MouseCursor.defer),
        overlayColor: WidgetStateProperty.all(const Color(0xff555555)),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        shadowColor: WidgetStateProperty.all(const Color(0xff555555)),
        shape: WidgetStateProperty.all(const CircleBorder()),
        side: WidgetStateProperty.all(const BorderSide()),
        tapTargetSize: MaterialTapTargetSize.padded,
        textStyle: WidgetStateProperty.all(const TextStyle()),
        visualDensity: VisualDensity.standard,
      ),
    );

    expect(ThemeDecoder.instance.decodeMenuButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeMenuButtonThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeMenuButtonThemeData(encoded);

    expect(encoded, {
      'style': {
        'alignment': 'bottomCenter',
        'animationDuration': 1000,
        'backgroundColor': _materializeState('#ff555555'),
        'elevation': _materializeState(1.0),
        'enableFeedback': false,
        'fixedSize': _materializeState({'height': 50.0, 'width': 50.0}),
        'foregroundColor': _materializeState('#ff555555'),
        'iconColor': _materializeState('#ff555555'),
        'iconSize': _materializeState(12.0),
        'maximumSize': _materializeState({'height': 10.0, 'width': 10.0}),
        'minimumSize': _materializeState({'height': 100.0, 'width': 100.0}),
        'mouseCursor': _materializeState({'type': 'defer'}),
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
            'strokeAlign': -1.0,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'circle',
        }),
        'side': _materializeState({
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        }),
        'tapTargetSize': 'padded',
        'textStyle': _materializeState({'inherit': true}),
        'visualDensity': 'standard',
      },
    });

    expect(_buttonStylesAreEqual(decoded!.style, entry.style), true);
  });

  test('MenuStyle', () {
    expect(ThemeDecoder.instance.decodeMenuStyle(null), null);
    expect(ThemeEncoder.instance.encodeMenuStyle(null), null);

    const entry = MenuStyle(alignment: Alignment.center);

    expect(ThemeDecoder.instance.decodeMenuStyle(entry), entry);

    final encoded = ThemeEncoder.instance.encodeMenuStyle(entry);
    final decoded = ThemeDecoder.instance.decodeMenuStyle(encoded);

    expect(encoded, {'alignment': 'center'});

    expect(entry, decoded);
  });

  test('MouseCursor', () {
    expect(ThemeDecoder.instance.decodeMouseCursor(null), null);
    expect(ThemeEncoder.instance.encodeMouseCursor(null), null);

    expect(
      ThemeDecoder.instance.decodeMouseCursor(MouseCursor.defer),
      MouseCursor.defer,
    );

    expect(
      ThemeDecoder.instance.decodeMouseCursor({'type': 'defer'}),
      MouseCursor.defer,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'clickable',
        'type': 'material',
      }),
      WidgetStateMouseCursor.clickable,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'textable',
        'type': 'material',
      }),
      WidgetStateMouseCursor.textable,
    );

    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'alias',
        'type': 'system',
      }),
      SystemMouseCursors.alias,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'allScroll',
        'type': 'system',
      }),
      SystemMouseCursors.allScroll,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'basic',
        'type': 'system',
      }),
      SystemMouseCursors.basic,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'cell',
        'type': 'system',
      }),
      SystemMouseCursors.cell,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'click',
        'type': 'system',
      }),
      SystemMouseCursors.click,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'contextMenu',
        'type': 'system',
      }),
      SystemMouseCursors.contextMenu,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'copy',
        'type': 'system',
      }),
      SystemMouseCursors.copy,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'disappearing',
        'type': 'system',
      }),
      SystemMouseCursors.disappearing,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'forbidden',
        'type': 'system',
      }),
      SystemMouseCursors.forbidden,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'grab',
        'type': 'system',
      }),
      SystemMouseCursors.grab,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'grabbing',
        'type': 'system',
      }),
      SystemMouseCursors.grabbing,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'help',
        'type': 'system',
      }),
      SystemMouseCursors.help,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'move',
        'type': 'system',
      }),
      SystemMouseCursors.move,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'noDrop',
        'type': 'system',
      }),
      SystemMouseCursors.noDrop,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'none',
        'type': 'system',
      }),
      SystemMouseCursors.none,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'precise',
        'type': 'system',
      }),
      SystemMouseCursors.precise,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'progress',
        'type': 'system',
      }),
      SystemMouseCursors.progress,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeColumn',
        'type': 'system',
      }),
      SystemMouseCursors.resizeColumn,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeDown',
        'type': 'system',
      }),
      SystemMouseCursors.resizeDown,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeDownLeft',
        'type': 'system',
      }),
      SystemMouseCursors.resizeDownLeft,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeDownRight',
        'type': 'system',
      }),
      SystemMouseCursors.resizeDownRight,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeLeft',
        'type': 'system',
      }),
      SystemMouseCursors.resizeLeft,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeRight',
        'type': 'system',
      }),
      SystemMouseCursors.resizeRight,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeRow',
        'type': 'system',
      }),
      SystemMouseCursors.resizeRow,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeUp',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUp,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeUpDown',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpDown,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeUpLeft',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpLeft,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeUpLeftDownRight',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpLeftDownRight,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeUpRight',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpRight,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'resizeUpRightDownLeft',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpRightDownLeft,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'text',
        'type': 'system',
      }),
      SystemMouseCursors.text,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'verticalText',
        'type': 'system',
      }),
      SystemMouseCursors.verticalText,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'wait',
        'type': 'system',
      }),
      SystemMouseCursors.wait,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'zoomIn',
        'type': 'system',
      }),
      SystemMouseCursors.zoomIn,
    );
    expect(
      ThemeDecoder.instance.decodeMouseCursor({
        'cursor': 'zoomOut',
        'type': 'system',
      }),
      SystemMouseCursors.zoomOut,
    );

    expect(
      ThemeDecoder.instance.decodeMouseCursor({'type': 'uncontrolled'}),
      MouseCursor.uncontrolled,
    );

    expect(ThemeEncoder.instance.encodeMouseCursor(MouseCursor.defer), {
      'type': 'defer',
    });
    expect(
      ThemeEncoder.instance.encodeMouseCursor(WidgetStateMouseCursor.clickable),
      {'cursor': 'clickable', 'type': 'material'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(WidgetStateMouseCursor.textable),
      {'cursor': 'textable', 'type': 'material'},
    );

    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.alias), {
      'cursor': 'alias',
      'type': 'system',
    });
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.allScroll),
      {'cursor': 'allScroll', 'type': 'system'},
    );
    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.basic), {
      'cursor': 'basic',
      'type': 'system',
    });
    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.cell), {
      'cursor': 'cell',
      'type': 'system',
    });
    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.click), {
      'cursor': 'click',
      'type': 'system',
    });
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.contextMenu),
      {'cursor': 'contextMenu', 'type': 'system'},
    );
    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.copy), {
      'cursor': 'copy',
      'type': 'system',
    });
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.disappearing),
      {'cursor': 'disappearing', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.forbidden),
      {'cursor': 'forbidden', 'type': 'system'},
    );
    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.grab), {
      'cursor': 'grab',
      'type': 'system',
    });
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.grabbing),
      {'cursor': 'grabbing', 'type': 'system'},
    );
    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.help), {
      'cursor': 'help',
      'type': 'system',
    });
    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.move), {
      'cursor': 'move',
      'type': 'system',
    });
    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.noDrop), {
      'cursor': 'noDrop',
      'type': 'system',
    });
    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.none), {
      'cursor': 'none',
      'type': 'system',
    });
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.precise),
      {'cursor': 'precise', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.progress),
      {'cursor': 'progress', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.resizeColumn),
      {'cursor': 'resizeColumn', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.resizeDown),
      {'cursor': 'resizeDown', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(
        SystemMouseCursors.resizeDownLeft,
      ),
      {'cursor': 'resizeDownLeft', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(
        SystemMouseCursors.resizeDownRight,
      ),
      {'cursor': 'resizeDownRight', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.resizeLeft),
      {'cursor': 'resizeLeft', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.resizeRight),
      {'cursor': 'resizeRight', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.resizeRow),
      {'cursor': 'resizeRow', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.resizeUp),
      {'cursor': 'resizeUp', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.resizeUpDown),
      {'cursor': 'resizeUpDown', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.resizeUpLeft),
      {'cursor': 'resizeUpLeft', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(
        SystemMouseCursors.resizeUpLeftDownRight,
      ),
      {'cursor': 'resizeUpLeftDownRight', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.resizeUpRight),
      {'cursor': 'resizeUpRight', 'type': 'system'},
    );
    expect(
      ThemeEncoder.instance.encodeMouseCursor(
        SystemMouseCursors.resizeUpRightDownLeft,
      ),
      {'cursor': 'resizeUpRightDownLeft', 'type': 'system'},
    );
    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.text), {
      'cursor': 'text',
      'type': 'system',
    });
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.verticalText),
      {'cursor': 'verticalText', 'type': 'system'},
    );
    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.wait), {
      'cursor': 'wait',
      'type': 'system',
    });
    expect(ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.zoomIn), {
      'cursor': 'zoomIn',
      'type': 'system',
    });
    expect(
      ThemeEncoder.instance.encodeMouseCursor(SystemMouseCursors.zoomOut),
      {'cursor': 'zoomOut', 'type': 'system'},
    );

    expect(ThemeEncoder.instance.encodeMouseCursor(MouseCursor.uncontrolled), {
      'type': 'uncontrolled',
    });
  });

  test('NavigationDestinationLabelBehavior', () {
    expect(
      ThemeDecoder.instance.decodeNavigationDestinationLabelBehavior(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeNavigationDestinationLabelBehavior(null),
      null,
    );

    expect(
      ThemeDecoder.instance.decodeNavigationDestinationLabelBehavior(
        NavigationDestinationLabelBehavior.alwaysHide,
      ),
      NavigationDestinationLabelBehavior.alwaysHide,
    );

    expect(
      ThemeDecoder.instance.decodeNavigationDestinationLabelBehavior(
        'alwaysHide',
      ),
      NavigationDestinationLabelBehavior.alwaysHide,
    );
    expect(
      ThemeDecoder.instance.decodeNavigationDestinationLabelBehavior(
        'alwaysShow',
      ),
      NavigationDestinationLabelBehavior.alwaysShow,
    );
    expect(
      ThemeDecoder.instance.decodeNavigationDestinationLabelBehavior(
        'onlyShowSelected',
      ),
      NavigationDestinationLabelBehavior.onlyShowSelected,
    );

    expect(
      ThemeEncoder.instance.encodeNavigationDestinationLabelBehavior(
        NavigationDestinationLabelBehavior.alwaysHide,
      ),
      'alwaysHide',
    );
    expect(
      ThemeEncoder.instance.encodeNavigationDestinationLabelBehavior(
        NavigationDestinationLabelBehavior.alwaysShow,
      ),
      'alwaysShow',
    );
    expect(
      ThemeEncoder.instance.encodeNavigationDestinationLabelBehavior(
        NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
      'onlyShowSelected',
    );
  });

  test('NavigationRailLabelType', () {
    expect(ThemeDecoder.instance.decodeNavigationRailLabelType(null), null);
    expect(ThemeEncoder.instance.encodeNavigationRailLabelType(null), null);

    expect(
      ThemeDecoder.instance.decodeNavigationRailLabelType(
        NavigationRailLabelType.all,
      ),
      NavigationRailLabelType.all,
    );

    expect(
      ThemeDecoder.instance.decodeNavigationRailLabelType('all'),
      NavigationRailLabelType.all,
    );
    expect(
      ThemeDecoder.instance.decodeNavigationRailLabelType('none'),
      NavigationRailLabelType.none,
    );
    expect(
      ThemeDecoder.instance.decodeNavigationRailLabelType('selected'),
      NavigationRailLabelType.selected,
    );

    expect(
      ThemeEncoder.instance.encodeNavigationRailLabelType(
        NavigationRailLabelType.all,
      ),
      'all',
    );
    expect(
      ThemeEncoder.instance.encodeNavigationRailLabelType(
        NavigationRailLabelType.none,
      ),
      'none',
    );
    expect(
      ThemeEncoder.instance.encodeNavigationRailLabelType(
        NavigationRailLabelType.selected,
      ),
      'selected',
    );
  });

  test('NavigationBarThemeData', () {
    expect(ThemeDecoder.instance.decodeNavigationBarThemeData(null), null);
    expect(ThemeEncoder.instance.encodeNavigationBarThemeData(null), null);

    final entry = NavigationBarThemeData(
      backgroundColor: Color(0xff111111),
      elevation: 4.0,
      height: 12.0,
      indicatorColor: Color(0xff222222),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      labelPadding: EdgeInsets.all(8.0),
      overlayColor: WidgetStateProperty.all(Color(0xff222222)),
      shadowColor: Color(0xff333333),
      surfaceTintColor: Color(0xff444444),
    );

    final encoded = ThemeEncoder.instance.encodeNavigationBarThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeNavigationBarThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'elevation': 4.0,
      'height': 12.0,
      'indicatorColor': '#ff222222',
      'labelBehavior': 'onlyShowSelected',
      'labelPadding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
      'overlayColor': _materializeState('#ff222222'),
      'shadowColor': '#ff333333',
      'surfaceTintColor': '#ff444444',
    });
    expect(
      ThemeEncoder.instance.encodeNavigationBarThemeData(decoded),
      encoded,
    );
  });

  test('NavigationRailThemeData', () {
    expect(ThemeDecoder.instance.decodeNavigationRailThemeData(null), null);
    expect(ThemeEncoder.instance.encodeNavigationRailThemeData(null), null);

    const entry = NavigationRailThemeData(
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

    expect(ThemeDecoder.instance.decodeNavigationRailThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeNavigationRailThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeNavigationRailThemeData(
      encoded,
    );

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'elevation': 1.0,
      'groupAlignment': 2.0,
      'indicatorColor': '#ff666666',
      'labelType': 'all',
      'selectedIconTheme': {'color': '#ff222222', 'opacity': 0.5, 'size': 4.0},
      'selectedLabelTextStyle': {'color': '#ff333333', 'inherit': true},
      'unselectedIconTheme': {
        'color': '#ff444444',
        'opacity': 0.6,
        'size': 6.0,
      },
      'unselectedLabelTextStyle': {'color': '#ff555555', 'inherit': true},
      'useIndicator': true,
    });

    expect(decoded, entry);
  });

  test('NotchedShape', () {
    expect(ThemeDecoder.instance.decodeNotchedShape(null), null);
    expect(ThemeEncoder.instance.encodeNotchedShape(null), null);

    const entry = CircularNotchedRectangle();
    expect(ThemeDecoder.instance.decodeNotchedShape(entry), entry);
    expect(
      ThemeDecoder.instance.decodeNotchedShape('circular')?.runtimeType,
      const CircularNotchedRectangle().runtimeType,
    );
    expect(
      ThemeEncoder.instance.encodeNotchedShape(
        const CircularNotchedRectangle(),
      ),
      'circular',
    );
  });

  test('OrdinalSortKey', () {
    expect(ThemeDecoder.instance.decodeOrdinalSortKey(null), null);
    expect(ThemeEncoder.instance.encodeOrdinalSortKey(null), null);

    const entry = OrdinalSortKey(1.0, name: 'foo');

    expect(ThemeDecoder.instance.decodeOrdinalSortKey(entry), entry);

    final encoded = ThemeEncoder.instance.encodeOrdinalSortKey(entry);
    final decoded = ThemeDecoder.instance.decodeOrdinalSortKey(encoded);

    expect(encoded, {'name': 'foo', 'order': 1.0});

    expect(decoded!.name, entry.name);
    expect(decoded.order, entry.order);
  });

  test('Offset', () {
    expect(ThemeDecoder.instance.decodeOffset(null), null);
    expect(ThemeEncoder.instance.encodeOffset(null), null);

    const entry = Offset(1.0, 2.0);

    expect(ThemeDecoder.instance.decodeOffset(entry), entry);

    final encoded = ThemeEncoder.instance.encodeOffset(entry);
    final decoded = ThemeDecoder.instance.decodeOffset(encoded);

    expect(encoded, {'dx': 1.0, 'dy': 2.0});

    expect(decoded, entry);
  });

  test('OutlinedBorder', () {
    expect(ThemeDecoder.instance.decodeOutlinedBorder(null), null);
    expect(ThemeEncoder.instance.encodeOutlinedBorder(null), null);

    OutlinedBorder entry = BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    expect(ThemeDecoder.instance.decodeOutlinedBorder(entry), entry);

    var encoded = ThemeEncoder.instance.encodeOutlinedBorder(entry);
    var decoded = ThemeDecoder.instance.decodeOutlinedBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'type': 'only',
      },
      'side': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'beveled',
    });

    expect(decoded, entry);

    entry = const CircleBorder(
      side: BorderSide(color: _kColor, width: 1.0, style: BorderStyle.solid),
    );

    encoded = ThemeEncoder.instance.encodeOutlinedBorder(entry);
    decoded = ThemeDecoder.instance.decodeOutlinedBorder(encoded);

    expect(encoded, {
      'side': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'circle',
    });

    expect(decoded, entry);

    entry = ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    encoded = ThemeEncoder.instance.encodeOutlinedBorder(entry);
    decoded = ThemeDecoder.instance.decodeOutlinedBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'type': 'only',
      },
      'side': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'rectangle',
    });

    expect(decoded, entry);

    entry = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    encoded = ThemeEncoder.instance.encodeOutlinedBorder(entry);
    decoded = ThemeDecoder.instance.decodeOutlinedBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'type': 'only',
      },
      'side': {
        'color': '#00123456',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'rounded',
    });

    expect(decoded, entry);

    entry = const StadiumBorder(
      side: BorderSide(color: _kColor, width: 1.0, style: BorderStyle.solid),
    );

    encoded = ThemeEncoder.instance.encodeOutlinedBorder(entry);
    decoded = ThemeDecoder.instance.decodeOutlinedBorder(encoded);

    expect(encoded, {
      'side': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'stadium',
    });

    expect(decoded, entry);
  });

  test('OutlinedButtonThemeData', () {
    expect(ThemeDecoder.instance.decodeOutlinedButtonThemeData(null), null);
    expect(ThemeEncoder.instance.encodeOutlinedButtonThemeData(null), null);

    final entry = OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xff222222)),
      ),
    );

    expect(ThemeDecoder.instance.decodeOutlinedButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeOutlinedButtonThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeOutlinedButtonThemeData(
      encoded,
    );

    expect(encoded, {
      'style': {'backgroundColor': _materializeState('#ff222222')},
    });

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

    expect(outlinedButtonThemeDatasAreEqual(decoded, entry), true);
  });

  test('OverflowBoxFit', () {
    expect(ThemeDecoder.instance.decodeOverflowBoxFit(null), null);
    expect(ThemeEncoder.instance.encodeOverflowBoxFit(null), null);

    expect(
      ThemeDecoder.instance.decodeOverflowBoxFit(OverflowBoxFit.deferToChild),
      OverflowBoxFit.deferToChild,
    );

    expect(
      ThemeDecoder.instance.decodeOverflowBoxFit('deferToChild'),
      OverflowBoxFit.deferToChild,
    );
    expect(
      ThemeDecoder.instance.decodeOverflowBoxFit('max'),
      OverflowBoxFit.max,
    );

    expect(
      ThemeEncoder.instance.encodeOverflowBoxFit(OverflowBoxFit.deferToChild),
      'deferToChild',
    );
    expect(
      ThemeEncoder.instance.encodeOverflowBoxFit(OverflowBoxFit.max),
      'max',
    );
  });

  test('PageTransitionsBuilder', () {
    expect(ThemeDecoder.instance.decodePageTransitionsBuilder(null), null);
    expect(ThemeEncoder.instance.encodePageTransitionsBuilder(null), null);

    expect(
      ThemeDecoder.instance
          .decodePageTransitionsBuilder('cupertino')
          .runtimeType,
      CupertinoPageTransitionsBuilder,
    );
    expect(
      ThemeDecoder.instance
          .decodePageTransitionsBuilder('fadeUpwards')
          .runtimeType,
      FadeUpwardsPageTransitionsBuilder,
    );
    expect(
      ThemeDecoder.instance
          .decodePageTransitionsBuilder('openUpwards')
          .runtimeType,
      OpenUpwardsPageTransitionsBuilder,
    );
    expect(
      ThemeDecoder.instance.decodePageTransitionsBuilder('zoom').runtimeType,
      ZoomPageTransitionsBuilder,
    );

    expect(
      ThemeEncoder.instance.encodePageTransitionsBuilder(
        const CupertinoPageTransitionsBuilder(),
      ),
      'cupertino',
    );
    expect(
      ThemeEncoder.instance.encodePageTransitionsBuilder(
        const FadeUpwardsPageTransitionsBuilder(),
      ),
      'fadeUpwards',
    );
    expect(
      ThemeEncoder.instance.encodePageTransitionsBuilder(
        const OpenUpwardsPageTransitionsBuilder(),
      ),
      'openUpwards',
    );
    expect(
      ThemeEncoder.instance.encodePageTransitionsBuilder(
        const ZoomPageTransitionsBuilder(),
      ),
      'zoom',
    );
  });

  test('PageTransitionsTheme', () {
    expect(ThemeDecoder.instance.decodePageTransitionsTheme(null), null);
    expect(ThemeEncoder.instance.encodePageTransitionsTheme(null), null);

    final builders = {
      TargetPlatform.fuchsia: const CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: const FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: const OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.windows: const ZoomPageTransitionsBuilder(),
    };

    final encoded = ThemeEncoder.instance.encodePageTransitionsTheme(
      PageTransitionsTheme(builders: builders),
    );

    expect(encoded, {
      'builders': {
        'fuchsia': 'cupertino',
        'linux': 'fadeUpwards',
        'macOS': 'openUpwards',
        'windows': 'zoom',
      },
    });

    final decoded = ThemeDecoder.instance.decodePageTransitionsTheme(encoded);
    for (var entry in builders.entries) {
      expect(
        decoded?.builders[entry.key]?.runtimeType,
        entry.value.runtimeType,
      );
    }
  });

  test('PanAxis', () {
    expect(ThemeDecoder.instance.decodePanAxis(null), null);
    expect(ThemeEncoder.instance.encodePanAxis(null), null);

    expect(
      ThemeDecoder.instance.decodePanAxis(PanAxis.aligned),
      PanAxis.aligned,
    );
    expect(ThemeDecoder.instance.decodePanAxis('aligned'), PanAxis.aligned);
    expect(ThemeDecoder.instance.decodePanAxis('free'), PanAxis.free);
    expect(
      ThemeDecoder.instance.decodePanAxis('horizontal'),
      PanAxis.horizontal,
    );
    expect(ThemeDecoder.instance.decodePanAxis('vertical'), PanAxis.vertical);

    expect(ThemeEncoder.instance.encodePanAxis(PanAxis.aligned), 'aligned');
    expect(ThemeEncoder.instance.encodePanAxis(PanAxis.free), 'free');
    expect(
      ThemeEncoder.instance.encodePanAxis(PanAxis.horizontal),
      'horizontal',
    );
    expect(ThemeEncoder.instance.encodePanAxis(PanAxis.vertical), 'vertical');
  });

  test('PointerDeviceKind', () {
    expect(ThemeDecoder.instance.decodePointerDeviceKind(null), null);
    expect(ThemeEncoder.instance.encodePointerDeviceKind(null), null);

    expect(
      ThemeDecoder.instance.decodePointerDeviceKind(PointerDeviceKind.mouse),
      PointerDeviceKind.mouse,
    );
    expect(
      ThemeDecoder.instance.decodePointerDeviceKind('invertedStylus'),
      PointerDeviceKind.invertedStylus,
    );
    expect(
      ThemeDecoder.instance.decodePointerDeviceKind('mouse'),
      PointerDeviceKind.mouse,
    );
    expect(
      ThemeDecoder.instance.decodePointerDeviceKind('stylus'),
      PointerDeviceKind.stylus,
    );
    expect(
      ThemeDecoder.instance.decodePointerDeviceKind('touch'),
      PointerDeviceKind.touch,
    );
    expect(
      ThemeDecoder.instance.decodePointerDeviceKind('trackpad'),
      PointerDeviceKind.trackpad,
    );
    expect(
      ThemeDecoder.instance.decodePointerDeviceKind('unknown'),
      PointerDeviceKind.unknown,
    );

    expect(
      ThemeEncoder.instance.encodePointerDeviceKind(
        PointerDeviceKind.invertedStylus,
      ),
      'invertedStylus',
    );
    expect(
      ThemeEncoder.instance.encodePointerDeviceKind(PointerDeviceKind.mouse),
      'mouse',
    );
    expect(
      ThemeEncoder.instance.encodePointerDeviceKind(PointerDeviceKind.stylus),
      'stylus',
    );
    expect(
      ThemeEncoder.instance.encodePointerDeviceKind(PointerDeviceKind.touch),
      'touch',
    );
    expect(
      ThemeEncoder.instance.encodePointerDeviceKind(PointerDeviceKind.trackpad),
      'trackpad',
    );
    expect(
      ThemeEncoder.instance.encodePointerDeviceKind(PointerDeviceKind.unknown),
      'unknown',
    );
  });

  test('PopupMenuPosition', () {
    expect(ThemeDecoder.instance.decodePopupMenuPosition(null), null);
    expect(ThemeEncoder.instance.encodePopupMenuPosition(null), null);

    expect(
      ThemeDecoder.instance.decodePopupMenuPosition(PopupMenuPosition.over),
      PopupMenuPosition.over,
    );
    expect(
      ThemeDecoder.instance.decodePopupMenuPosition('over'),
      PopupMenuPosition.over,
    );
    expect(
      ThemeDecoder.instance.decodePopupMenuPosition('under'),
      PopupMenuPosition.under,
    );

    expect(
      ThemeEncoder.instance.encodePopupMenuPosition(PopupMenuPosition.over),
      'over',
    );
    expect(
      ThemeEncoder.instance.encodePopupMenuPosition(PopupMenuPosition.under),
      'under',
    );
  });

  test('PopupMenuThemeData', () {
    expect(ThemeDecoder.instance.decodePopupMenuThemeData(null), null);
    expect(ThemeEncoder.instance.encodePopupMenuThemeData(null), null);

    const entry = PopupMenuThemeData(
      color: _kColor,
      elevation: 1.0,
      enableFeedback: true,
      iconColor: _kColor,
      iconSize: 16.0,
      menuPadding: EdgeInsets.only(top: 20.0),
      position: PopupMenuPosition.over,
      shadowColor: Color(0xff111111),
      shape: RoundedRectangleBorder(),
      surfaceTintColor: Color(0xff222222),
      textStyle: _kTextStyle,
    );

    expect(ThemeDecoder.instance.decodePopupMenuThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodePopupMenuThemeData(entry);
    final decoded = ThemeDecoder.instance.decodePopupMenuThemeData(encoded);

    expect(encoded, {
      'color': '#00123456',
      'elevation': 1.0,
      'enableFeedback': true,
      'iconColor': _kColorStr,
      'iconSize': 16.0,
      'menuPadding': {'bottom': 0.0, 'left': 0.0, 'right': 0.0, 'top': 20.0},
      'position': 'over',
      'shadowColor': '#ff111111',
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'surfaceTintColor': '#ff222222',
      'textStyle': {'color': '#00123456', 'inherit': true},
    });

    expect(decoded, entry);
  });

  test('ProgressIndicatorThemeData', () {
    expect(ThemeDecoder.instance.decodeProgressIndicatorThemeData(null), null);
    expect(ThemeEncoder.instance.encodeProgressIndicatorThemeData(null), null);

    const entry = ProgressIndicatorThemeData(
      circularTrackColor: _kColor,
      color: _kColor,
      linearMinHeight: 16.0,
      linearTrackColor: _kColor,
      refreshBackgroundColor: _kColor,
      strokeCap: StrokeCap.butt,
    );

    expect(
      ThemeDecoder.instance.decodeProgressIndicatorThemeData(entry),
      entry,
    );

    final encoded = ThemeEncoder.instance.encodeProgressIndicatorThemeData(
      entry,
    );
    final decoded = ThemeDecoder.instance.decodeProgressIndicatorThemeData(
      encoded,
    );

    expect(encoded, {
      'circularTrackColor': _kColorStr,
      'color': _kColorStr,
      'linearMinHeight': 16.0,
      'linearTrackColor': _kColorStr,
      'refreshBackgroundColor': _kColorStr,
      'strokeCap': 'butt',
    });

    expect(decoded, entry);
  });

  test('RadioThemeData', () {
    expect(ThemeDecoder.instance.decodeRadioThemeData(null), null);
    expect(ThemeEncoder.instance.encodeRadioThemeData(null), null);

    final entry = RadioThemeData(
      fillColor: WidgetStateProperty.all(_kColor),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      mouseCursor: WidgetStateProperty.all(MouseCursor.uncontrolled),
      overlayColor: WidgetStateProperty.all(_kColor),
      splashRadius: 2.0,
      visualDensity: VisualDensity.comfortable,
    );

    expect(ThemeDecoder.instance.decodeRadioThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeRadioThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeRadioThemeData(encoded);

    expect(
      decoded!.fillColor!.resolve({WidgetState.error}),
      entry.fillColor!.resolve({WidgetState.error}),
    );
    expect(decoded.materialTapTargetSize, entry.materialTapTargetSize);
    expect(
      decoded.mouseCursor!.resolve({WidgetState.error}),
      entry.mouseCursor!.resolve({WidgetState.error}),
    );
    expect(
      decoded.overlayColor!.resolve({WidgetState.error}),
      entry.overlayColor!.resolve({WidgetState.error}),
    );
    expect(decoded.splashRadius, entry.splashRadius);
    expect(decoded.visualDensity, entry.visualDensity);
  });
  test('Radius', () {
    expect(ThemeDecoder.instance.decodeRadius(null), null);
    expect(ThemeEncoder.instance.encodeRadius(null), null);

    const entry = Radius.circular(1.0);

    expect(ThemeDecoder.instance.decodeRadius(entry), entry);

    final encoded = ThemeEncoder.instance.encodeRadius(entry);
    final decoded = ThemeDecoder.instance.decodeRadius(encoded);

    expect(encoded, {'type': 'elliptical', 'x': 1.0, 'y': 1.0});

    expect(decoded, entry);

    expect(
      ThemeDecoder.instance.decodeRadius({'radius': 4.0, 'type': 'circular'}),
      const Radius.circular(4.0),
    );
    expect(
      ThemeDecoder.instance.decodeRadius({
        'type': 'elliptical',
        'x': 1.0,
        'y': 2.0,
      }),
      const Radius.elliptical(1.0, 2.0),
    );
    expect(ThemeDecoder.instance.decodeRadius({'type': 'zero'}), Radius.zero);

    expect(ThemeDecoder.instance.decodeRadius(16), const Radius.circular(16));
  });

  test('RangeSliderThumbShape', () {
    expect(ThemeDecoder.instance.decodeRangeSliderThumbShape(null), null);
    expect(ThemeEncoder.instance.encodeRangeSliderThumbShape(null), null);

    const entry = RoundRangeSliderThumbShape(
      disabledThumbRadius: 1.0,
      elevation: 3.0,
      enabledThumbRadius: 2.0,
      pressedElevation: 4.0,
    );

    expect(ThemeDecoder.instance.decodeRangeSliderThumbShape(entry), entry);

    final encoded = ThemeEncoder.instance.encodeRangeSliderThumbShape(entry);
    final decoded =
        ThemeDecoder.instance.decodeRangeSliderThumbShape(encoded)
            as RoundRangeSliderThumbShape;

    expect(encoded, {
      'disabledThumbRadius': 1.0,
      'elevation': 3.0,
      'enabledThumbRadius': 2.0,
      'pressedElevation': 4.0,
      'type': 'round',
    });

    expect(decoded.disabledThumbRadius, entry.disabledThumbRadius);

    expect(decoded.enabledThumbRadius, entry.enabledThumbRadius);
  });

  test('RangeSliderTickMarkShape', () {
    expect(ThemeDecoder.instance.decodeRangeSliderTickMarkShape(null), null);
    expect(ThemeEncoder.instance.encodeRangeSliderTickMarkShape(null), null);

    const entry = RoundRangeSliderTickMarkShape(tickMarkRadius: 1.0);

    expect(ThemeDecoder.instance.decodeRangeSliderTickMarkShape(entry), entry);

    final encoded = ThemeEncoder.instance.encodeRangeSliderTickMarkShape(entry);
    final decoded =
        ThemeDecoder.instance.decodeRangeSliderTickMarkShape(encoded)
            as RoundRangeSliderTickMarkShape;

    expect(encoded, {'tickMarkRadius': 1.0, 'type': 'round'});

    expect(decoded.tickMarkRadius, entry.tickMarkRadius);
  });

  test('RangeSliderTrackShape', () {
    expect(ThemeDecoder.instance.decodeRangeSliderTrackShape(null), null);
    expect(ThemeEncoder.instance.encodeRangeSliderTrackShape(null), null);

    const entry = RectangularRangeSliderTrackShape();

    expect(ThemeDecoder.instance.decodeRangeSliderTrackShape(entry), entry);

    final encoded = ThemeEncoder.instance.encodeRangeSliderTrackShape(entry);
    final decoded = ThemeDecoder.instance.decodeRangeSliderTrackShape(encoded);

    expect(encoded, 'rectangular');
    expect(
      ThemeEncoder.instance.encodeRangeSliderTrackShape(
        const RoundedRectRangeSliderTrackShape(),
      ),
      'rounded',
    );
    expect(
      ThemeDecoder.instance.decodeRangeSliderTrackShape('rounded').runtimeType,
      const RoundedRectRangeSliderTrackShape().runtimeType,
    );

    expect(decoded?.runtimeType, entry.runtimeType);
  });

  test('RangeSliderValueIndicatorShape', () {
    expect(
      ThemeDecoder.instance.decodeRangeSliderValueIndicatorShape(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeRangeSliderValueIndicatorShape(null),
      null,
    );

    const entry = PaddleRangeSliderValueIndicatorShape();

    expect(
      ThemeDecoder.instance.decodeRangeSliderValueIndicatorShape(entry),
      entry,
    );

    final encoded = ThemeEncoder.instance.encodeRangeSliderValueIndicatorShape(
      entry,
    );
    final decoded = ThemeDecoder.instance.decodeRangeSliderValueIndicatorShape(
      encoded,
    );

    expect(encoded, 'paddle');

    expect(decoded.runtimeType, entry.runtimeType);

    const entry2 = RectangularRangeSliderValueIndicatorShape();

    final encoded2 = ThemeEncoder.instance.encodeRangeSliderValueIndicatorShape(
      entry2,
    );
    final decoded2 = ThemeDecoder.instance.decodeRangeSliderValueIndicatorShape(
      encoded2,
    );

    expect(encoded2, 'rectangular');

    expect(decoded2.runtimeType, entry2.runtimeType);
  });

  test('Rect', () {
    expect(ThemeDecoder.instance.decodeRect(null), null);
    expect(ThemeEncoder.instance.encodeRect(null), null);

    const entry = Rect.fromLTRB(1.0, 2.0, 3.0, 4.0);

    expect(ThemeDecoder.instance.decodeRect(entry), entry);

    final encoded = ThemeEncoder.instance.encodeRect(entry);
    final decoded = ThemeDecoder.instance.decodeRect(encoded);

    expect(encoded, {
      'bottom': 4.0,
      'left': 1.0,
      'right': 3.0,
      'top': 2.0,
      'type': 'ltrb',
    });

    expect(decoded, entry);

    expect(
      ThemeDecoder.instance.decodeRect({
        'center': {'dx': 1.0, 'dy': 2.0},
        'height': 3.0,
        'width': 4.0,
        'type': 'center',
      }),
      Rect.fromCenter(center: const Offset(1.0, 2.0), height: 3.0, width: 4.0),
    );

    expect(
      ThemeDecoder.instance.decodeRect({
        'center': {'dx': 1.0, 'dy': 2.0},
        'radius': 3.0,
        'type': 'circle',
      }),
      Rect.fromCircle(center: const Offset(1.0, 2.0), radius: 3.0),
    );
    expect(ThemeDecoder.instance.decodeRect({'type': 'largest'}), Rect.largest);
    expect(
      ThemeDecoder.instance.decodeRect({
        'bottom': 4.0,
        'left': 1.0,
        'right': 3.0,
        'top': 2.0,
        'type': 'ltrb',
      }),
      const Rect.fromLTRB(1.0, 2.0, 3.0, 4.0),
    );
    expect(
      ThemeDecoder.instance.decodeRect({
        'height': 4.0,
        'left': 1.0,
        'top': 2.0,
        'type': 'ltwh',
        'width': 3.0,
      }),
      const Rect.fromLTWH(1.0, 2.0, 3.0, 4.0),
    );
    expect(
      ThemeDecoder.instance.decodeRect({
        'a': {'dx': 1.0, 'dy': 2.0},
        'b': {'dx': 3.0, 'dy': 4.0},
        'type': 'points',
      }),
      Rect.fromPoints(const Offset(1.0, 2.0), const Offset(3.0, 4.0)),
    );
    expect(ThemeDecoder.instance.decodeRect({'type': 'zero'}), Rect.zero);
  });

  test('ScrollBehavior', () {
    expect(ThemeDecoder.instance.decodeScrollBehavior(null), null);
    expect(ThemeEncoder.instance.encodeScrollBehavior(null), null);

    const entry = ScrollBehavior();

    expect(ThemeDecoder.instance.decodeScrollBehavior(entry), entry);

    ThemeEncoder.instance.encodeScrollBehavior(entry);
  });

  test('ScrollPhysics', () {
    expect(ThemeDecoder.instance.decodeScrollPhysics(null), null);
    expect(ThemeEncoder.instance.encodeScrollPhysics(null), null);

    const entry = AlwaysScrollableScrollPhysics();
    expect(ThemeDecoder.instance.decodeScrollPhysics(entry), entry);
    expect(
      ThemeDecoder.instance.decodeScrollPhysics({'type': 'always'}).runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.instance.decodeScrollPhysics({
        'type': 'bouncing',
      }).runtimeType,
      const BouncingScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.instance.decodeScrollPhysics({
        'type': 'clamping',
      }).runtimeType,
      const ClampingScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.instance.decodeScrollPhysics({
        'type': 'fixedExtent',
      }).runtimeType,
      const FixedExtentScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.instance.decodeScrollPhysics({'type': 'never'}).runtimeType,
      const NeverScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.instance.decodeScrollPhysics({'type': 'page'}).runtimeType,
      const PageScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.instance.decodeScrollPhysics({
        'type': 'rangeMaintaining',
      }).runtimeType,
      const RangeMaintainingScrollPhysics().runtimeType,
    );

    expect(
      ThemeDecoder.instance
          .decodeScrollPhysics({
            'parent': {'type': 'always'},
            'type': 'always',
          })!
          .parent
          .runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.instance
          .decodeScrollPhysics({
            'parent': {'type': 'always'},
            'type': 'bouncing',
          })!
          .parent
          .runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.instance
          .decodeScrollPhysics({
            'parent': {'type': 'always'},
            'type': 'clamping',
          })!
          .parent
          .runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.instance
          .decodeScrollPhysics({
            'parent': {'type': 'always'},
            'type': 'fixedExtent',
          })!
          .parent
          .runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.instance
          .decodeScrollPhysics({
            'parent': {'type': 'always'},
            'type': 'never',
          })!
          .parent
          .runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.instance
          .decodeScrollPhysics({
            'parent': {'type': 'always'},
            'type': 'page',
          })!
          .parent
          .runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.instance
          .decodeScrollPhysics({
            'parent': {'type': 'always'},
            'type': 'rangeMaintaining',
          })!
          .parent
          .runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );

    expect(
      JsonClass.removeNull(
        ThemeEncoder.instance.encodeScrollPhysics(
          const AlwaysScrollableScrollPhysics(),
        ),
      ),
      {'type': 'always'},
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.instance.encodeScrollPhysics(
          const BouncingScrollPhysics(),
        ),
      ),
      {'type': 'bouncing'},
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.instance.encodeScrollPhysics(
          const ClampingScrollPhysics(),
        ),
      ),
      {'type': 'clamping'},
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.instance.encodeScrollPhysics(
          const FixedExtentScrollPhysics(),
        ),
      ),
      {'type': 'fixedExtent'},
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.instance.encodeScrollPhysics(
          const NeverScrollableScrollPhysics(),
        ),
      ),
      {'type': 'never'},
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.instance.encodeScrollPhysics(const PageScrollPhysics()),
      ),
      {'type': 'page'},
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.instance.encodeScrollPhysics(
          const RangeMaintainingScrollPhysics(),
        ),
      ),
      {'type': 'rangeMaintaining'},
    );

    expect(
      JsonClass.removeNull(
        ThemeEncoder.instance.encodeScrollPhysics(
          const AlwaysScrollableScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'always',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.instance.encodeScrollPhysics(
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'bouncing',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.instance.encodeScrollPhysics(
          const ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'clamping',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.instance.encodeScrollPhysics(
          const FixedExtentScrollPhysics(
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
        ThemeEncoder.instance.encodeScrollPhysics(
          const NeverScrollableScrollPhysics(
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
        ThemeEncoder.instance.encodeScrollPhysics(
          const PageScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'page',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.instance.encodeScrollPhysics(
          const RangeMaintainingScrollPhysics(
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
    expect(
      ThemeDecoder.instance.decodeScrollViewKeyboardDismissBehavior(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeScrollViewKeyboardDismissBehavior(null),
      null,
    );

    expect(
      ThemeDecoder.instance.decodeScrollViewKeyboardDismissBehavior(
        ScrollViewKeyboardDismissBehavior.manual,
      ),
      ScrollViewKeyboardDismissBehavior.manual,
    );

    expect(
      ThemeDecoder.instance.decodeScrollViewKeyboardDismissBehavior('manual'),
      ScrollViewKeyboardDismissBehavior.manual,
    );
    expect(
      ThemeDecoder.instance.decodeScrollViewKeyboardDismissBehavior('onDrag'),
      ScrollViewKeyboardDismissBehavior.onDrag,
    );

    expect(
      ThemeEncoder.instance.encodeScrollViewKeyboardDismissBehavior(
        ScrollViewKeyboardDismissBehavior.manual,
      ),
      'manual',
    );
    expect(
      ThemeEncoder.instance.encodeScrollViewKeyboardDismissBehavior(
        ScrollViewKeyboardDismissBehavior.onDrag,
      ),
      'onDrag',
    );
  });

  test('ScrollbarOrientation', () {
    expect(ThemeDecoder.instance.decodeScrollbarOrientation(null), null);
    expect(ThemeEncoder.instance.encodeScrollbarOrientation(null), null);

    expect(
      ThemeDecoder.instance.decodeScrollbarOrientation(
        ScrollbarOrientation.top,
      ),
      ScrollbarOrientation.top,
    );

    expect(
      ThemeDecoder.instance.decodeScrollbarOrientation('bottom'),
      ScrollbarOrientation.bottom,
    );
    expect(
      ThemeDecoder.instance.decodeScrollbarOrientation('left'),
      ScrollbarOrientation.left,
    );
    expect(
      ThemeDecoder.instance.decodeScrollbarOrientation('right'),
      ScrollbarOrientation.right,
    );
    expect(
      ThemeDecoder.instance.decodeScrollbarOrientation('top'),
      ScrollbarOrientation.top,
    );

    expect(
      ThemeEncoder.instance.encodeScrollbarOrientation(
        ScrollbarOrientation.bottom,
      ),
      'bottom',
    );
    expect(
      ThemeEncoder.instance.encodeScrollbarOrientation(
        ScrollbarOrientation.left,
      ),
      'left',
    );
    expect(
      ThemeEncoder.instance.encodeScrollbarOrientation(
        ScrollbarOrientation.right,
      ),
      'right',
    );
    expect(
      ThemeEncoder.instance.encodeScrollbarOrientation(
        ScrollbarOrientation.top,
      ),
      'top',
    );
  });

  test('ScrollbarThemeData', () {
    expect(ThemeDecoder.instance.decodeScrollbarThemeData(null), null);
    expect(ThemeEncoder.instance.encodeScrollbarThemeData(null), null);

    final entry = ScrollbarThemeData(
      crossAxisMargin: 1.0,
      interactive: true,
      mainAxisMargin: 2.0,
      minThumbLength: 3.0,
      radius: const Radius.circular(4.0),
      thickness: WidgetStateProperty.all(5.0),
      thumbVisibility: WidgetStateProperty.all(true),
    );

    expect(ThemeDecoder.instance.decodeScrollbarThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeScrollbarThemeData(entry);
    expect(encoded!['crossAxisMargin'], entry.crossAxisMargin);

    expect(encoded['interactive'], entry.interactive);

    expect(encoded['mainAxisMargin'], entry.mainAxisMargin);

    expect(encoded['minThumbLength'], entry.minThumbLength);

    expect(encoded['radius'], ThemeEncoder.instance.encodeRadius(entry.radius));

    expect(
      encoded['thickness']['error'],
      entry.thickness!.resolve({WidgetState.error}),
    );

    expect(
      encoded['thumbVisibility']['error'],
      entry.thumbVisibility!.resolve({WidgetState.error}),
    );

    final decoded = ThemeDecoder.instance.decodeScrollbarThemeData(encoded);
    expect(decoded!.crossAxisMargin, entry.crossAxisMargin);

    expect(decoded.interactive, entry.interactive);

    expect(decoded.mainAxisMargin, entry.mainAxisMargin);

    expect(decoded.minThumbLength, entry.minThumbLength);

    expect(decoded.radius, entry.radius);

    expect(
      decoded.thickness!.resolve({WidgetState.error}),
      entry.thickness!.resolve({WidgetState.error}),
    );

    expect(
      decoded.thumbVisibility!.resolve({WidgetState.error}),
      entry.thumbVisibility!.resolve({WidgetState.error}),
    );
  });

  test('SearchBarThemeData', () {
    expect(ThemeDecoder.instance.decodeSearchBarThemeData(null), null);
    expect(ThemeEncoder.instance.encodeSearchBarThemeData(null), null);

    final entry = SearchBarThemeData(
      backgroundColor: WidgetStateProperty.all(_kColor),
      constraints: const BoxConstraints(maxWidth: 200.0, minWidth: 100.0),
      elevation: WidgetStateProperty.all(4.0),
      hintStyle: WidgetStateProperty.all(_kTextStyle),
      overlayColor: WidgetStateProperty.all(_kColor),
      padding: WidgetStateProperty.all(const EdgeInsets.all(16.0)),
      shadowColor: WidgetStateProperty.all(_kColor),
      textCapitalization: TextCapitalization.sentences,
      textStyle: WidgetStateProperty.all(_kTextStyle),
    );

    expect(ThemeDecoder.instance.decodeSearchBarThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeSearchBarThemeData(entry);

    expect(encoded, {
      'backgroundColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'constraints': {'maxWidth': 200.0, 'minHeight': 0.0, 'minWidth': 100.0},
      'elevation': {
        'disabled': 4.0,
        'dragged': 4.0,
        'empty': 4.0,
        'error': 4.0,
        'focused': 4.0,
        'hovered': 4.0,
        'pressed': 4.0,
        'scrolledUnder': 4.0,
        'selected': 4.0,
      },
      'hintStyle': {
        'disabled': {'color': '#00123456', 'inherit': true},
        'dragged': {'color': '#00123456', 'inherit': true},
        'empty': {'color': '#00123456', 'inherit': true},
        'error': {'color': '#00123456', 'inherit': true},
        'focused': {'color': '#00123456', 'inherit': true},
        'hovered': {'color': '#00123456', 'inherit': true},
        'pressed': {'color': '#00123456', 'inherit': true},
        'scrolledUnder': {'color': '#00123456', 'inherit': true},
        'selected': {'color': '#00123456', 'inherit': true},
      },
      'overlayColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'padding': {
        'disabled': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'dragged': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'empty': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'error': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'focused': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'hovered': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'pressed': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'scrolledUnder': {
          'bottom': 16.0,
          'left': 16.0,
          'right': 16.0,
          'top': 16.0,
        },
        'selected': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
      },
      'shadowColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'textCapitalization': 'sentences',
      'textStyle': {
        'disabled': {'color': '#00123456', 'inherit': true},
        'dragged': {'color': '#00123456', 'inherit': true},
        'empty': {'color': '#00123456', 'inherit': true},
        'error': {'color': '#00123456', 'inherit': true},
        'focused': {'color': '#00123456', 'inherit': true},
        'hovered': {'color': '#00123456', 'inherit': true},
        'pressed': {'color': '#00123456', 'inherit': true},
        'scrolledUnder': {'color': '#00123456', 'inherit': true},
        'selected': {'color': '#00123456', 'inherit': true},
      },
    });
  });

  test('SearchViewThemeData', () {
    expect(ThemeDecoder.instance.decodeSearchViewThemeData(null), null);
    expect(ThemeEncoder.instance.encodeSearchViewThemeData(null), null);

    const entry = SearchViewThemeData(
      backgroundColor: _kColor,
      barPadding: EdgeInsets.all(6.0),
      constraints: BoxConstraints(maxWidth: 200.0, minWidth: 100.0),
      dividerColor: _kColor,
      elevation: 4.0,
      headerHeight: 11.0,
      headerHintStyle: _kTextStyle,
      headerTextStyle: _kTextStyle,
      padding: EdgeInsets.all(8.0),
      shrinkWrap: true,
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.instance.decodeSearchViewThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeSearchViewThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeSearchViewThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#00123456',
      'barPadding': {'bottom': 6.0, 'left': 6.0, 'right': 6.0, 'top': 6.0},
      'constraints': {'maxWidth': 200.0, 'minHeight': 0.0, 'minWidth': 100.0},
      'dividerColor': '#00123456',
      'elevation': 4.0,
      'headerHeight': 11.0,
      'headerHintStyle': {'color': '#00123456', 'inherit': true},
      'headerTextStyle': {'color': '#00123456', 'inherit': true},
      'padding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
      'shrinkWrap': true,
      'surfaceTintColor': '#00123456',
    });

    expect(decoded, entry);
  });

  test('SegmentedButton', () {
    expect(ThemeDecoder.instance.decodeSegmentedButtonThemeData(null), null);
    expect(ThemeEncoder.instance.encodeSegmentedButtonThemeData(null), null);

    const entry = SegmentedButtonThemeData(
      selectedIcon: Icon(Icons.abc),
      style: ButtonStyle(enableFeedback: false),
    );

    final encoded = ThemeEncoder.instance.encodeSegmentedButtonThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeSegmentedButtonThemeData(
      encoded,
    );

    expect(encoded, {
      'selectedIcon': {
        'icon': {
          'codePoint': 984246,
          'fontFamily': 'MaterialIcons',
          'matchTextDirection': false,
        },
      },
      'style': {'enableFeedback': false},
    });

    expect(entry.selectedIcon.toString(), decoded?.selectedIcon.toString());
    expect(entry.style, decoded?.style);
  });

  test('SemanticsTag', () {
    expect(ThemeDecoder.instance.decodeSemanticsTag(null), null);
    expect(ThemeEncoder.instance.encodeSemanticsTag(null), null);

    const entry = SemanticsTag('foo');

    expect(ThemeDecoder.instance.decodeSemanticsTag(entry), entry);

    final encoded = ThemeEncoder.instance.encodeSemanticsTag(entry);
    final decoded = ThemeDecoder.instance.decodeSemanticsTag(encoded);

    expect(encoded, {'name': 'foo'});

    expect(decoded!.name, entry.name);
  });

  test('Shadow', () {
    expect(ThemeDecoder.instance.decodeShadow(null), null);
    expect(ThemeEncoder.instance.encodeShadow(null), null);

    const entry = Shadow(
      color: _kColor,
      blurRadius: 1.0,
      offset: Offset(2.0, 3.0),
    );

    expect(ThemeDecoder.instance.decodeShadow(entry), entry);

    final encoded = ThemeEncoder.instance.encodeShadow(entry);
    final decoded = ThemeDecoder.instance.decodeShadow(encoded);

    expect(encoded, {
      'blurRadius': 1.0,
      'color': _kColorStr,
      'offset': {'dx': 2.0, 'dy': 3.0},
    });

    expect(decoded, entry);
  });

  test('ShapeBorder', () {
    expect(ThemeDecoder.instance.decodeShapeBorder(null), null);
    expect(ThemeEncoder.instance.encodeShapeBorder(null), null);

    ShapeBorder entry = const CircleBorder(
      side: BorderSide(color: _kColor, width: 1.0, style: BorderStyle.solid),
    );

    expect(ThemeDecoder.instance.decodeShapeBorder(entry), entry);

    var encoded = ThemeEncoder.instance.encodeShapeBorder(entry);
    var decoded = ThemeDecoder.instance.decodeShapeBorder(encoded);

    expect(encoded, {
      'side': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'circle',
    });

    expect(decoded, entry);

    entry = ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    encoded = ThemeEncoder.instance.encodeShapeBorder(entry);
    decoded = ThemeDecoder.instance.decodeShapeBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'type': 'only',
      },
      'side': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'rectangle',
    });

    expect(decoded, entry);

    entry = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    encoded = ThemeEncoder.instance.encodeShapeBorder(entry);
    decoded = ThemeDecoder.instance.decodeShapeBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'type': 'only',
      },
      'side': {
        'color': '#00123456',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'rounded',
    });

    expect(decoded, entry);

    entry = const StadiumBorder(
      side: BorderSide(color: _kColor, width: 1.0, style: BorderStyle.solid),
    );

    encoded = ThemeEncoder.instance.encodeShapeBorder(entry);
    decoded = ThemeDecoder.instance.decodeShapeBorder(encoded);

    expect(encoded, {
      'side': {
        'color': '#00123456',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'stadium',
    });

    expect(decoded, entry);
  });

  test('ShowValueIndicator', () {
    expect(ThemeDecoder.instance.decodeShowValueIndicator(null), null);
    expect(ThemeEncoder.instance.encodeShowValueIndicator(null), null);

    expect(
      ThemeDecoder.instance.decodeShowValueIndicator(ShowValueIndicator.onDrag),
      ShowValueIndicator.onDrag,
    );

    expect(
      ThemeDecoder.instance.decodeShowValueIndicator('always'),
      ShowValueIndicator.onDrag,
    );
    expect(
      ThemeDecoder.instance.decodeShowValueIndicator('never'),
      ShowValueIndicator.never,
    );
    expect(
      ThemeDecoder.instance.decodeShowValueIndicator('onlyForContinuous'),
      ShowValueIndicator.onlyForContinuous,
    );
    expect(
      ThemeDecoder.instance.decodeShowValueIndicator('onlyForDiscrete'),
      ShowValueIndicator.onlyForDiscrete,
    );

    expect(
      ThemeEncoder.instance.encodeShowValueIndicator(ShowValueIndicator.onDrag),
      'always',
    );
    expect(
      ThemeEncoder.instance.encodeShowValueIndicator(ShowValueIndicator.never),
      'never',
    );
    expect(
      ThemeEncoder.instance.encodeShowValueIndicator(
        ShowValueIndicator.onlyForContinuous,
      ),
      'onlyForContinuous',
    );
    expect(
      ThemeEncoder.instance.encodeShowValueIndicator(
        ShowValueIndicator.onlyForDiscrete,
      ),
      'onlyForDiscrete',
    );
  });

  test('Size', () {
    expect(ThemeDecoder.instance.decodeSize(null), null);
    expect(ThemeEncoder.instance.encodeSize(null), null);

    const entry = Size(0.0, 0.0);

    expect(ThemeDecoder.instance.decodeSize(entry), entry);

    final encoded = ThemeEncoder.instance.encodeSize(entry);
    final decoded = ThemeDecoder.instance.decodeSize(encoded);

    expect(encoded, {'height': 0.0, 'width': 0.0});

    expect(decoded, entry);
  });

  test('SliderComponentShape', () {
    expect(ThemeDecoder.instance.decodeSliderComponentShape(null), null);
    expect(ThemeEncoder.instance.encodeSliderComponentShape(null), null);

    expect(
      ThemeDecoder.instance.decodeSliderComponentShape(
        SliderComponentShape.noOverlay,
      ),
      SliderComponentShape.noOverlay,
    );

    expect(
      ThemeDecoder.instance.decodeSliderComponentShape('noOverlay'),
      SliderComponentShape.noOverlay,
    );
    expect(
      ThemeDecoder.instance.decodeSliderComponentShape('noThumb'),
      SliderComponentShape.noThumb,
    );

    expect(
      ThemeEncoder.instance.encodeSliderComponentShape(
        SliderComponentShape.noOverlay,
      ),
      'noOverlay',
    );
    expect(
      ThemeEncoder.instance.encodeSliderComponentShape(
        SliderComponentShape.noThumb,
      ),
      'noOverlay',
    );
  });

  test('SliderInteraction', () {
    expect(ThemeDecoder.instance.decodeSliderInteraction(null), null);
    expect(ThemeEncoder.instance.encodeSliderInteraction(null), null);

    expect(
      ThemeDecoder.instance.decodeSliderInteraction(
        SliderInteraction.slideOnly,
      ),
      SliderInteraction.slideOnly,
    );

    expect(
      ThemeDecoder.instance.decodeSliderInteraction('slideOnly'),
      SliderInteraction.slideOnly,
    );
    expect(
      ThemeDecoder.instance.decodeSliderInteraction('slideThumb'),
      SliderInteraction.slideThumb,
    );
    expect(
      ThemeDecoder.instance.decodeSliderInteraction('tapAndSlide'),
      SliderInteraction.tapAndSlide,
    );
    expect(
      ThemeDecoder.instance.decodeSliderInteraction('tapOnly'),
      SliderInteraction.tapOnly,
    );

    // expect(
    //   ThemeEncoder.instance.encodeSliderInteraction(
    //     SliderInteraction.slideOnly,
    //   ),
    //   'slideOnly',
    // );
    // expect(
    //   ThemeEncoder.instance.encodeSliderInteraction(
    //     SliderInteraction.slideThumb,
    //   ),
    //   'slideThumb',
    // );
    // expect(
    //   ThemeEncoder.instance.encodeSliderInteraction(
    //     SliderInteraction.tapAndSlide,
    //   ),
    //   'tapAndSlide',
    // );
    // expect(
    //   ThemeEncoder.instance.encodeSliderInteraction(SliderInteraction.tapOnly),
    //   'tapOnly',
    // );
  });

  test('SliderThemeData', () {
    expect(ThemeDecoder.instance.decodeSliderThemeData(null), null);
    expect(ThemeEncoder.instance.encodeSliderThemeData(null), null);

    final entry = SliderThemeData(
      activeTickMarkColor: const Color(0xff111111),
      activeTrackColor: const Color(0xff222222),
      disabledActiveTickMarkColor: const Color(0xff333333),
      disabledActiveTrackColor: const Color(0xff444444),
      disabledInactiveTickMarkColor: const Color(0xff555555),
      disabledInactiveTrackColor: const Color(0xff666666),
      disabledSecondaryActiveTrackColor: const Color(0xff676767),
      disabledThumbColor: const Color(0xff777777),
      inactiveTickMarkColor: const Color(0xff888888),
      inactiveTrackColor: const Color(0xff999999),
      minThumbSeparation: 5.0,
      overlappingShapeStrokeColor: const Color(0xff000000),
      overlayColor: const Color(0xffaaaaaa),
      overlayShape: SliderComponentShape.noOverlay,
      padding: EdgeInsets.all(5.0),
      rangeThumbShape: const RoundRangeSliderThumbShape(),
      rangeTrackShape: const RectangularRangeSliderTrackShape(),
      rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
      secondaryActiveTrackColor: const Color(0xffababab),
      showValueIndicator: ShowValueIndicator.onDrag,
      thumbColor: const Color(0xffbbbbbb),
      thumbShape: SliderComponentShape.noOverlay,
      trackGap: 11.0,
      trackHeight: 10.0,
      trackShape: const RectangularSliderTrackShape(),
      valueIndicatorColor: const Color(0xffcccccc),
      valueIndicatorShape: SliderComponentShape.noOverlay,
      valueIndicatorStrokeColor: const Color(0xffcccccc),
      valueIndicatorTextStyle: _kTextStyle,
    );

    expect(ThemeDecoder.instance.decodeSliderThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeSliderThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeSliderThemeData(encoded);

    expect(encoded, {
      'activeTickMarkColor': '#ff111111',
      'activeTrackColor': '#ff222222',
      'disabledActiveTickMarkColor': '#ff333333',
      'disabledActiveTrackColor': '#ff444444',
      'disabledInactiveTickMarkColor': '#ff555555',
      'disabledInactiveTrackColor': '#ff666666',
      'disabledSecondaryActiveTrackColor': '#ff676767',
      'disabledThumbColor': '#ff777777',
      'inactiveTickMarkColor': '#ff888888',
      'inactiveTrackColor': '#ff999999',
      'minThumbSeparation': 5.0,
      'overlappingShapeStrokeColor': '#ff000000',
      'overlayColor': '#ffaaaaaa',
      'overlayShape': 'noOverlay',
      'padding': {'bottom': 5.0, 'left': 5.0, 'right': 5.0, 'top': 5.0},
      'rangeThumbShape': {
        'elevation': 1.0,
        'enabledThumbRadius': 10.0,
        'pressedElevation': 6.0,
        'type': 'round',
      },
      'rangeTrackShape': 'rectangular',
      'rangeValueIndicatorShape': 'paddle',
      'secondaryActiveTrackColor': '#ffababab',
      'showValueIndicator': 'always',
      'thumbColor': '#ffbbbbbb',
      'thumbShape': 'noOverlay',
      'trackGap': 11.0,
      'trackHeight': 10.0,
      'trackShape': {'type': 'rectangular'},
      'valueIndicatorColor': '#ffcccccc',
      'valueIndicatorShape': 'noOverlay',
      'valueIndicatorStrokeColor': '#ffcccccc',
      'valueIndicatorTextStyle': {'color': '#00123456', 'inherit': true},
    });

    expect(ThemeEncoder.instance.encodeSliderThemeData(decoded), encoded);
  });

  test('SliderTickMarkShape', () {
    expect(ThemeDecoder.instance.decodeSliderTickMarkShape(null), null);
    expect(ThemeEncoder.instance.encodeSliderTickMarkShape(null), null);

    expect(
      ThemeDecoder.instance.decodeSliderTickMarkShape(
        SliderTickMarkShape.noTickMark,
      ),
      SliderTickMarkShape.noTickMark,
    );

    expect(
      ThemeDecoder.instance.decodeSliderTickMarkShape('noTickMark'),
      SliderTickMarkShape.noTickMark,
    );

    expect(
      ThemeEncoder.instance.encodeSliderTickMarkShape(
        SliderTickMarkShape.noTickMark,
      ),
      'noTickMark',
    );
  });

  test('SliderTrackShape', () {
    expect(ThemeDecoder.instance.decodeSliderTrackShape(null), null);
    expect(ThemeEncoder.instance.encodeSliderTrackShape(null), null);

    SliderTrackShape entry = const RectangularSliderTrackShape();

    expect(ThemeDecoder.instance.decodeSliderTrackShape(entry), entry);

    var encoded = ThemeEncoder.instance.encodeSliderTrackShape(entry);
    var decoded = ThemeDecoder.instance.decodeSliderTrackShape(encoded);

    expect(encoded, {'type': 'rectangular'});

    expect(decoded?.runtimeType, entry.runtimeType);

    entry = const RoundedRectSliderTrackShape();

    encoded = ThemeEncoder.instance.encodeSliderTrackShape(entry);
    decoded = ThemeDecoder.instance.decodeSliderTrackShape(encoded);

    expect(encoded, {'type': 'rounded'});

    expect(decoded?.runtimeType, entry.runtimeType);
  });

  test('SnackBarBehavior', () {
    expect(ThemeDecoder.instance.decodeSnackBarBehavior(null), null);
    expect(ThemeEncoder.instance.encodeSnackBarBehavior(null), null);

    expect(
      ThemeDecoder.instance.decodeSnackBarBehavior(SnackBarBehavior.fixed),
      SnackBarBehavior.fixed,
    );

    expect(
      ThemeDecoder.instance.decodeSnackBarBehavior('fixed'),
      SnackBarBehavior.fixed,
    );
    expect(
      ThemeDecoder.instance.decodeSnackBarBehavior('floating'),
      SnackBarBehavior.floating,
    );

    expect(
      ThemeEncoder.instance.encodeSnackBarBehavior(SnackBarBehavior.fixed),
      'fixed',
    );
    expect(
      ThemeEncoder.instance.encodeSnackBarBehavior(SnackBarBehavior.floating),
      'floating',
    );
  });

  test('SnackBarThemeData', () {
    expect(ThemeDecoder.instance.decodeSnackBarThemeData(null), null);
    expect(ThemeEncoder.instance.encodeSnackBarThemeData(null), null);

    const entry = SnackBarThemeData(
      actionTextColor: Color(0xff111111),
      backgroundColor: Color(0xff222222),
      behavior: SnackBarBehavior.floating,
      contentTextStyle: TextStyle(color: Color(0xff333333)),
      disabledActionTextColor: Color(0xff444444),
      dismissDirection: DismissDirection.endToStart,
      elevation: 1.0,
      shape: RoundedRectangleBorder(),
      width: 12.0,
    );

    expect(ThemeDecoder.instance.decodeSnackBarThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeSnackBarThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeSnackBarThemeData(encoded);

    expect(encoded, {
      'actionTextColor': '#ff111111',
      'backgroundColor': '#ff222222',
      'behavior': 'floating',
      'contentTextStyle': {'color': '#ff333333', 'inherit': true},
      'disabledActionTextColor': '#ff444444',
      'dismissDirection': 'endToStart',
      'elevation': 1.0,
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'width': 12.0,
    });

    expect(decoded, entry);
  });

  test('SmartDashesType', () {
    expect(ThemeDecoder.instance.decodeSmartDashesType(null), null);
    expect(ThemeEncoder.instance.encodeSmartDashesType(null), null);

    expect(
      ThemeDecoder.instance.decodeSmartDashesType(SmartDashesType.disabled),
      SmartDashesType.disabled,
    );

    expect(
      ThemeDecoder.instance.decodeSmartDashesType('disabled'),
      SmartDashesType.disabled,
    );
    expect(
      ThemeDecoder.instance.decodeSmartDashesType('enabled'),
      SmartDashesType.enabled,
    );

    expect(
      ThemeEncoder.instance.encodeSmartDashesType(SmartDashesType.disabled),
      'disabled',
    );
    expect(
      ThemeEncoder.instance.encodeSmartDashesType(SmartDashesType.enabled),
      'enabled',
    );
  });

  test('SmartQuotesType', () {
    expect(ThemeDecoder.instance.decodeSmartQuotesType(null), null);
    expect(ThemeEncoder.instance.encodeSmartQuotesType(null), null);

    expect(
      ThemeDecoder.instance.decodeSmartQuotesType(SmartQuotesType.disabled),
      SmartQuotesType.disabled,
    );

    expect(
      ThemeDecoder.instance.decodeSmartQuotesType('disabled'),
      SmartQuotesType.disabled,
    );
    expect(
      ThemeDecoder.instance.decodeSmartQuotesType('enabled'),
      SmartQuotesType.enabled,
    );

    expect(
      ThemeEncoder.instance.encodeSmartQuotesType(SmartQuotesType.disabled),
      'disabled',
    );
    expect(
      ThemeEncoder.instance.encodeSmartQuotesType(SmartQuotesType.enabled),
      'enabled',
    );
  });
  test('StackFit', () {
    expect(ThemeDecoder.instance.decodeStackFit(null), null);
    expect(ThemeEncoder.instance.encodeStackFit(null), null);

    expect(
      ThemeDecoder.instance.decodeStackFit(StackFit.expand),
      StackFit.expand,
    );

    expect(ThemeDecoder.instance.decodeStackFit('expand'), StackFit.expand);
    expect(ThemeDecoder.instance.decodeStackFit('loose'), StackFit.loose);
    expect(
      ThemeDecoder.instance.decodeStackFit('passthrough'),
      StackFit.passthrough,
    );

    expect(ThemeEncoder.instance.encodeStackFit(StackFit.expand), 'expand');
    expect(ThemeEncoder.instance.encodeStackFit(StackFit.loose), 'loose');
    expect(
      ThemeEncoder.instance.encodeStackFit(StackFit.passthrough),
      'passthrough',
    );
  });

  test('StrokeCap', () {
    expect(ThemeDecoder.instance.decodeStrokeCap(null), null);
    expect(ThemeEncoder.instance.encodeStrokeCap(null), null);

    expect(
      ThemeDecoder.instance.decodeStrokeCap(StrokeCap.butt),
      StrokeCap.butt,
    );

    expect(ThemeDecoder.instance.decodeStrokeCap('butt'), StrokeCap.butt);
    expect(ThemeDecoder.instance.decodeStrokeCap('round'), StrokeCap.round);
    expect(ThemeDecoder.instance.decodeStrokeCap('square'), StrokeCap.square);

    expect(ThemeEncoder.instance.encodeStrokeCap(StrokeCap.butt), 'butt');
    expect(ThemeEncoder.instance.encodeStrokeCap(StrokeCap.round), 'round');
    expect(ThemeEncoder.instance.encodeStrokeCap(StrokeCap.square), 'square');
  });

  test('StrutStyle', () {
    expect(ThemeDecoder.instance.decodeStrutStyle(null), null);
    expect(ThemeEncoder.instance.encodeStrutStyle(null), null);

    const entry = StrutStyle(
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

    expect(ThemeDecoder.instance.decodeStrutStyle(entry), entry);

    final encoded = ThemeEncoder.instance.encodeStrutStyle(entry);
    final decoded = ThemeDecoder.instance.decodeStrutStyle(encoded);

    expect(encoded, {
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
    });

    expect(ThemeEncoder.instance.encodeStrutStyle(decoded), encoded);
  });

  test('SwitchThemeData', () {
    expect(ThemeDecoder.instance.decodeSwitchThemeData(null), null);
    expect(ThemeEncoder.instance.encodeSwitchThemeData(null), null);

    final entry = SwitchThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      mouseCursor: WidgetStateProperty.all(MouseCursor.defer),
      overlayColor: WidgetStateProperty.all(_kColor),
      padding: EdgeInsets.all(8.0),
      splashRadius: 20.0,
      thumbColor: WidgetStateProperty.all(_kColor),
      trackColor: WidgetStateProperty.all(_kColor),
      trackOutlineWidth: WidgetStateProperty.all(2.0),
    );

    final encoded = {
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
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'padding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
      'splashRadius': 20.0,
      'thumbColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'trackColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'trackOutlineColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'trackOutlineWidth': {
        'disabled': 2.0,
        'dragged': 2.0,
        'empty': 2.0,
        'error': 2.0,
        'focused': 2.0,
        'hovered': 2.0,
        'pressed': 2.0,
        'scrolledUnder': 2.0,
        'selected': 2.0,
      },
    };

    expect(ThemeDecoder.instance.decodeSwitchThemeData(entry), entry);
    expect(ThemeEncoder.instance.encodeSwitchThemeData(entry), encoded);

    final theme = ThemeDecoder.instance.decodeSwitchThemeData({
      'thumbColor': {
        'disabled': '#ff9e9e9e',
        'dragged': '#fff44336',
        'empty': '#fff44336',
        'error': '#fff44336',
        'focused': '#fff44336',
        'hovered': '#fff44336',
        'pressed': '#fff44336',
        'selected': '#ff2196f3',
      },
    });

    expect(
      theme!.thumbColor!.resolve({WidgetState.selected}),
      const Color(0xff2196f3),
    );
  });

  test('SystemUiOverlayStyle', () {
    expect(ThemeDecoder.instance.decodeSystemUiOverlayStyle(null), null);
    expect(ThemeEncoder.instance.encodeSystemUiOverlayStyle(null), null);

    expect(
      ThemeDecoder.instance.decodeSystemUiOverlayStyle(
        SystemUiOverlayStyle.dark,
      ),
      SystemUiOverlayStyle.dark,
    );

    expect(
      ThemeDecoder.instance.decodeSystemUiOverlayStyle('dark'),
      SystemUiOverlayStyle.dark,
    );
    expect(
      ThemeDecoder.instance.decodeSystemUiOverlayStyle('light'),
      SystemUiOverlayStyle.light,
    );

    expect(
      ThemeEncoder.instance.encodeSystemUiOverlayStyle(
        SystemUiOverlayStyle.dark,
      ),
      'dark',
    );
    expect(
      ThemeEncoder.instance.encodeSystemUiOverlayStyle(
        SystemUiOverlayStyle.light,
      ),
      'light',
    );

    expect(
      ThemeDecoder.instance.decodeSystemUiOverlayStyle({
        'statusBarBrightness': 'light',
        'statusBarColor': '#ff000000',
        'statusBarIconBrightness': 'dark',
        'systemNavigationBarColor': '#ff111111',
        'systemNavigationBarContrastEnforced': true,
        'systemNavigationBarDividerColor': '#ff222222',
        'systemNavigationBarIconBrightness': 'light',
        'systemStatusBarContrastEnforced': false,
      }),
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Color(0xff000000),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xff111111),
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarDividerColor: Color(0xff222222),
        systemNavigationBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
    );

    expect(
      ThemeEncoder.instance.encodeSystemUiOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Color(0xff000000),
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xff111111),
          systemNavigationBarContrastEnforced: true,
          systemNavigationBarDividerColor: Color(0xff222222),
          systemNavigationBarIconBrightness: Brightness.light,
          systemStatusBarContrastEnforced: false,
        ),
      ),
      {
        'statusBarBrightness': 'light',
        'statusBarColor': '#ff000000',
        'statusBarIconBrightness': 'dark',
        'systemNavigationBarColor': '#ff111111',
        'systemNavigationBarContrastEnforced': true,
        'systemNavigationBarDividerColor': '#ff222222',
        'systemNavigationBarIconBrightness': 'light',
        'systemStatusBarContrastEnforced': false,
      },
    );
  });

  test('TabAlignment', () {
    expect(ThemeDecoder.instance.decodeTabAlignment(null), null);
    expect(ThemeEncoder.instance.encodeTabAlignment(null), null);

    expect(
      ThemeDecoder.instance.decodeTabAlignment(TabAlignment.center),
      TabAlignment.center,
    );

    expect(
      ThemeDecoder.instance.decodeTabAlignment('center'),
      TabAlignment.center,
    );
    expect(ThemeDecoder.instance.decodeTabAlignment('fill'), TabAlignment.fill);
    expect(
      ThemeDecoder.instance.decodeTabAlignment('start'),
      TabAlignment.start,
    );
    expect(
      ThemeDecoder.instance.decodeTabAlignment('startOffset'),
      TabAlignment.startOffset,
    );

    expect(
      ThemeEncoder.instance.encodeTabAlignment(TabAlignment.center),
      'center',
    );
    expect(ThemeEncoder.instance.encodeTabAlignment(TabAlignment.fill), 'fill');
    expect(
      ThemeEncoder.instance.encodeTabAlignment(TabAlignment.start),
      'start',
    );
    expect(
      ThemeEncoder.instance.encodeTabAlignment(TabAlignment.startOffset),
      'startOffset',
    );
  });

  test('TabBarIndicatorSize', () {
    expect(ThemeDecoder.instance.decodeTabBarIndicatorSize(null), null);
    expect(ThemeEncoder.instance.encodeTabBarIndicatorSize(null), null);

    expect(
      ThemeDecoder.instance.decodeTabBarIndicatorSize(
        TabBarIndicatorSize.label,
      ),
      TabBarIndicatorSize.label,
    );

    expect(
      ThemeDecoder.instance.decodeTabBarIndicatorSize('label'),
      TabBarIndicatorSize.label,
    );
    expect(
      ThemeDecoder.instance.decodeTabBarIndicatorSize('tab'),
      TabBarIndicatorSize.tab,
    );

    expect(
      ThemeEncoder.instance.encodeTabBarIndicatorSize(
        TabBarIndicatorSize.label,
      ),
      'label',
    );
    expect(
      ThemeEncoder.instance.encodeTabBarIndicatorSize(TabBarIndicatorSize.tab),
      'tab',
    );
  });

  test('TabBarThemeData', () {
    expect(ThemeDecoder.instance.decodeTabBarThemeData(null), null);
    expect(ThemeEncoder.instance.encodeTabBarThemeData(null), null);

    try {
      ThemeDecoder.instance.decodeTabBarThemeData({'indicator': 'foo'});
      fail('exception expected');
    } catch (e) {
      // pass
    }

    final entry = TabBarThemeData(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Color(0xff111111),
      labelPadding: EdgeInsets.all(1.0),
      labelStyle: _kTextStyle,
      splashBorderRadius: BorderRadius.circular(4.0),
      textScaler: TextScaler.noScaling,
      unselectedLabelColor: Color(0xff222222),
      unselectedLabelStyle: TextStyle(color: Color(0xff333333)),
    );

    expect(ThemeDecoder.instance.decodeTabBarThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeTabBarThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeTabBarThemeData(encoded);

    expect(encoded, {
      'indicatorSize': 'label',
      'labelColor': '#ff111111',
      'labelPadding': {'bottom': 1.0, 'left': 1.0, 'right': 1.0, 'top': 1.0},
      'labelStyle': _kTextStyleJson,
      'splashBorderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'bottomRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'topLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'topRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'type': 'only',
      },
      'textScaler': 'noScaling',
      'unselectedLabelColor': '#ff222222',
      'unselectedLabelStyle': {'color': '#ff333333', 'inherit': true},
    });

    expect(decoded, entry);
  });

  test('TabIndicatorAnimation', () {
    expect(ThemeDecoder.instance.decodeTabIndicatorAnimation(null), null);
    expect(ThemeEncoder.instance.encodeTabIndicatorAnimation(null), null);

    expect(
      ThemeDecoder.instance.decodeTabIndicatorAnimation(
        TabIndicatorAnimation.elastic,
      ),
      TabIndicatorAnimation.elastic,
    );

    expect(
      ThemeDecoder.instance.decodeTabIndicatorAnimation('elastic'),
      TabIndicatorAnimation.elastic,
    );
    expect(
      ThemeDecoder.instance.decodeTabIndicatorAnimation('linear'),
      TabIndicatorAnimation.linear,
    );

    expect(
      ThemeEncoder.instance.encodeTabIndicatorAnimation(
        TabIndicatorAnimation.elastic,
      ),
      'elastic',
    );
    expect(
      ThemeEncoder.instance.encodeTabIndicatorAnimation(
        TabIndicatorAnimation.linear,
      ),
      'linear',
    );
  });

  test('TableBorder', () {
    expect(ThemeDecoder.instance.decodeTableBorder(null), null);
    expect(ThemeEncoder.instance.encodeTableBorder(null), null);

    final entry = TableBorder(
      borderRadius: BorderRadius.circular(1.0),
      bottom: const BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      horizontalInside: const BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 3.0,
      ),
      left: const BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 4.0,
      ),
      right: const BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 5.0,
      ),
      top: const BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 6.0,
      ),
      verticalInside: const BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 7.0,
      ),
    );

    expect(ThemeDecoder.instance.decodeTableBorder(entry), entry);

    final encoded = ThemeEncoder.instance.encodeTableBorder(entry);
    final decoded = ThemeDecoder.instance.decodeTableBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'bottomRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'topLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'topRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'type': 'only',
      },
      'bottom': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 2.0,
      },
      'horizontalInside': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 3.0,
      },
      'left': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 4.0,
      },
      'right': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 5.0,
      },
      'top': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 6.0,
      },
      'verticalInside': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 7.0,
      },
    });

    expect(decoded, entry);
  });

  test('TableColumnWidth', () {
    expect(ThemeDecoder.instance.decodeTableColumnWidth(null), null);
    expect(ThemeEncoder.instance.encodeTableColumnWidth(null), null);

    const entry = FlexColumnWidth();

    expect(ThemeDecoder.instance.decodeTableColumnWidth(entry), entry);

    expect(
      ThemeDecoder.instance.decodeTableColumnWidth({
        'type': 'fixed',
        'value': 1.0,
      }).toString(),
      const FixedColumnWidth(1.0).toString(),
    );
    expect(
      ThemeDecoder.instance.decodeTableColumnWidth({
        'type': 'flex',
        'value': 2.0,
      }).toString(),
      const FlexColumnWidth(2.0).toString(),
    );
    expect(
      ThemeDecoder.instance.decodeTableColumnWidth({
        'type': 'fraction',
        'value': 3.0,
      }).toString(),
      const FractionColumnWidth(3.0).toString(),
    );
    expect(
      ThemeDecoder.instance.decodeTableColumnWidth({
        'type': 'intrinsic',
        'value': 4.0,
      }).toString(),
      const IntrinsicColumnWidth(flex: 4.0).toString(),
    );
    expect(
      ThemeDecoder.instance.decodeTableColumnWidth({
        'a': {'type': 'fixed', 'value': 5.0},
        'b': {'type': 'fixed', 'value': 6.0},
        'type': 'max',
      }).toString(),
      const MaxColumnWidth(
        FixedColumnWidth(5.0),
        FixedColumnWidth(6.0),
      ).toString(),
    );
    expect(
      ThemeDecoder.instance.decodeTableColumnWidth({
        'a': {'type': 'fixed', 'value': 5.0},
        'b': {'type': 'fixed', 'value': 6.0},
        'type': 'min',
      }).toString(),
      const MinColumnWidth(
        FixedColumnWidth(5.0),
        FixedColumnWidth(6.0),
      ).toString(),
    );

    expect(
      ThemeEncoder.instance.encodeTableColumnWidth(const FixedColumnWidth(1.0)),
      {'type': 'fixed', 'value': 1.0},
    );
    expect(
      ThemeEncoder.instance.encodeTableColumnWidth(const FlexColumnWidth(2.0)),
      {'type': 'flex', 'value': 2.0},
    );
    expect(
      ThemeEncoder.instance.encodeTableColumnWidth(
        const FractionColumnWidth(3.0),
      ),
      {'type': 'fraction', 'value': 3.0},
    );
    expect(
      ThemeEncoder.instance.encodeTableColumnWidth(
        const IntrinsicColumnWidth(flex: 4.0),
      ),
      {'type': 'intrinsic', 'value': 4.0},
    );
    expect(
      ThemeEncoder.instance.encodeTableColumnWidth(
        const MaxColumnWidth(FixedColumnWidth(5.0), FixedColumnWidth(6.0)),
      ),
      {
        'a': {'type': 'fixed', 'value': 5.0},
        'b': {'type': 'fixed', 'value': 6.0},
        'type': 'max',
      },
    );
    expect(
      ThemeEncoder.instance.encodeTableColumnWidth(
        const MinColumnWidth(FixedColumnWidth(5.0), FixedColumnWidth(6.0)),
      ),
      {
        'a': {'type': 'fixed', 'value': 5.0},
        'b': {'type': 'fixed', 'value': 6.0},
        'type': 'min',
      },
    );
  });

  test('TargetPlatform', () {
    expect(ThemeDecoder.instance.decodeTargetPlatform(null), null);
    expect(ThemeEncoder.instance.encodeTargetPlatform(null), null);

    expect(
      ThemeDecoder.instance.decodeTargetPlatform(TargetPlatform.android),
      TargetPlatform.android,
    );

    expect(
      ThemeDecoder.instance.decodeTargetPlatform('android'),
      TargetPlatform.android,
    );
    expect(
      ThemeDecoder.instance.decodeTargetPlatform('fuchsia'),
      TargetPlatform.fuchsia,
    );
    expect(
      ThemeDecoder.instance.decodeTargetPlatform('iOS'),
      TargetPlatform.iOS,
    );
    expect(
      ThemeDecoder.instance.decodeTargetPlatform('linux'),
      TargetPlatform.linux,
    );
    expect(
      ThemeDecoder.instance.decodeTargetPlatform('macOS'),
      TargetPlatform.macOS,
    );
    expect(
      ThemeDecoder.instance.decodeTargetPlatform('windows'),
      TargetPlatform.windows,
    );

    expect(
      ThemeEncoder.instance.encodeTargetPlatform(TargetPlatform.android),
      'android',
    );
    expect(
      ThemeEncoder.instance.encodeTargetPlatform(TargetPlatform.fuchsia),
      'fuchsia',
    );
    expect(
      ThemeEncoder.instance.encodeTargetPlatform(TargetPlatform.iOS),
      'iOS',
    );
    expect(
      ThemeEncoder.instance.encodeTargetPlatform(TargetPlatform.linux),
      'linux',
    );
    expect(
      ThemeEncoder.instance.encodeTargetPlatform(TargetPlatform.macOS),
      'macOS',
    );
    expect(
      ThemeEncoder.instance.encodeTargetPlatform(TargetPlatform.windows),
      'windows',
    );
  });

  test('TextAlign', () {
    expect(ThemeDecoder.instance.decodeTextAlign(null), null);
    expect(ThemeEncoder.instance.encodeTextAlign(null), null);

    expect(
      ThemeDecoder.instance.decodeTextAlign(TextAlign.center),
      TextAlign.center,
    );

    expect(ThemeDecoder.instance.decodeTextAlign('center'), TextAlign.center);
    expect(ThemeDecoder.instance.decodeTextAlign('end'), TextAlign.end);
    expect(ThemeDecoder.instance.decodeTextAlign('justify'), TextAlign.justify);
    expect(ThemeDecoder.instance.decodeTextAlign('left'), TextAlign.left);
    expect(ThemeDecoder.instance.decodeTextAlign('right'), TextAlign.right);
    expect(ThemeDecoder.instance.decodeTextAlign('start'), TextAlign.start);

    expect(ThemeEncoder.instance.encodeTextAlign(TextAlign.center), 'center');
    expect(ThemeEncoder.instance.encodeTextAlign(TextAlign.end), 'end');
    expect(ThemeEncoder.instance.encodeTextAlign(TextAlign.justify), 'justify');
    expect(ThemeEncoder.instance.encodeTextAlign(TextAlign.left), 'left');
    expect(ThemeEncoder.instance.encodeTextAlign(TextAlign.right), 'right');
    expect(ThemeEncoder.instance.encodeTextAlign(TextAlign.start), 'start');
  });

  test('TextAlignVertical', () {
    expect(ThemeDecoder.instance.decodeTextAlignVertical(null), null);
    expect(ThemeEncoder.instance.encodeTextAlignVertical(null), null);

    expect(
      ThemeDecoder.instance.decodeTextAlignVertical(TextAlignVertical.bottom),
      TextAlignVertical.bottom,
    );

    expect(
      ThemeDecoder.instance.decodeTextAlignVertical('bottom'),
      TextAlignVertical.bottom,
    );
    expect(
      ThemeDecoder.instance.decodeTextAlignVertical('center'),
      TextAlignVertical.center,
    );
    expect(
      ThemeDecoder.instance.decodeTextAlignVertical('top'),
      TextAlignVertical.top,
    );

    expect(
      ThemeEncoder.instance.encodeTextAlignVertical(TextAlignVertical.bottom),
      'bottom',
    );
    expect(
      ThemeEncoder.instance.encodeTextAlignVertical(TextAlignVertical.center),
      'center',
    );
    expect(
      ThemeEncoder.instance.encodeTextAlignVertical(TextAlignVertical.top),
      'top',
    );
  });

  test('TextBaseline', () {
    expect(ThemeDecoder.instance.decodeTextBaseline(null), null);
    expect(ThemeEncoder.instance.encodeTextBaseline(null), null);

    expect(
      ThemeDecoder.instance.decodeTextBaseline(TextBaseline.alphabetic),
      TextBaseline.alphabetic,
    );

    expect(
      ThemeDecoder.instance.decodeTextBaseline('alphabetic'),
      TextBaseline.alphabetic,
    );
    expect(
      ThemeDecoder.instance.decodeTextBaseline('ideographic'),
      TextBaseline.ideographic,
    );

    expect(
      ThemeEncoder.instance.encodeTextBaseline(TextBaseline.alphabetic),
      'alphabetic',
    );
    expect(
      ThemeEncoder.instance.encodeTextBaseline(TextBaseline.ideographic),
      'ideographic',
    );
  });

  test('TextButtonThemeData', () {
    expect(ThemeDecoder.instance.decodeTextButtonThemeData(null), null);
    expect(ThemeEncoder.instance.encodeTextButtonThemeData(null), null);

    final entry = TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xff222222)),
      ),
    );

    expect(ThemeDecoder.instance.decodeTextButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeTextButtonThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeTextButtonThemeData(encoded);

    expect(encoded, {
      'style': {'backgroundColor': _materializeState('#ff222222')},
    });

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

    expect(textButtonThemeDatasAreEqual(decoded, entry), true);
  });

  test('TextCapitalization', () {
    expect(ThemeDecoder.instance.decodeTextCapitalization(null), null);
    expect(ThemeEncoder.instance.encodeTextCapitalization(null), null);

    expect(
      ThemeDecoder.instance.decodeTextCapitalization(
        TextCapitalization.characters,
      ),
      TextCapitalization.characters,
    );

    expect(
      ThemeDecoder.instance.decodeTextCapitalization('characters'),
      TextCapitalization.characters,
    );
    expect(
      ThemeDecoder.instance.decodeTextCapitalization('none'),
      TextCapitalization.none,
    );
    expect(
      ThemeDecoder.instance.decodeTextCapitalization('sentences'),
      TextCapitalization.sentences,
    );
    expect(
      ThemeDecoder.instance.decodeTextCapitalization('words'),
      TextCapitalization.words,
    );

    expect(
      ThemeEncoder.instance.encodeTextCapitalization(
        TextCapitalization.characters,
      ),
      'characters',
    );
    expect(
      ThemeEncoder.instance.encodeTextCapitalization(TextCapitalization.none),
      'none',
    );
    expect(
      ThemeEncoder.instance.encodeTextCapitalization(
        TextCapitalization.sentences,
      ),
      'sentences',
    );
    expect(
      ThemeEncoder.instance.encodeTextCapitalization(TextCapitalization.words),
      'words',
    );
  });

  test('TextDecoration', () {
    expect(ThemeDecoder.instance.decodeTextDecoration(null), null);
    expect(ThemeEncoder.instance.encodeTextDecoration(null), null);

    expect(
      ThemeDecoder.instance.decodeTextDecoration(TextDecoration.lineThrough),
      TextDecoration.lineThrough,
    );

    expect(
      ThemeDecoder.instance.decodeTextDecoration('lineThrough'),
      TextDecoration.lineThrough,
    );
    expect(
      ThemeDecoder.instance.decodeTextDecoration('none'),
      TextDecoration.none,
    );
    expect(
      ThemeDecoder.instance.decodeTextDecoration('overline'),
      TextDecoration.overline,
    );
    expect(
      ThemeDecoder.instance.decodeTextDecoration('underline'),
      TextDecoration.underline,
    );

    expect(
      ThemeEncoder.instance.encodeTextDecoration(TextDecoration.lineThrough),
      'lineThrough',
    );
    expect(
      ThemeEncoder.instance.encodeTextDecoration(TextDecoration.none),
      'none',
    );
    expect(
      ThemeEncoder.instance.encodeTextDecoration(TextDecoration.overline),
      'overline',
    );
    expect(
      ThemeEncoder.instance.encodeTextDecoration(TextDecoration.underline),
      'underline',
    );
  });

  test('TextDecorationStyle', () {
    expect(ThemeDecoder.instance.decodeTextDecorationStyle(null), null);
    expect(ThemeEncoder.instance.encodeTextDecorationStyle(null), null);

    expect(
      ThemeDecoder.instance.decodeTextDecorationStyle(
        TextDecorationStyle.dashed,
      ),
      TextDecorationStyle.dashed,
    );

    expect(
      ThemeDecoder.instance.decodeTextDecorationStyle('dashed'),
      TextDecorationStyle.dashed,
    );
    expect(
      ThemeDecoder.instance.decodeTextDecorationStyle('dotted'),
      TextDecorationStyle.dotted,
    );
    expect(
      ThemeDecoder.instance.decodeTextDecorationStyle('double'),
      TextDecorationStyle.double,
    );
    expect(
      ThemeDecoder.instance.decodeTextDecorationStyle('solid'),
      TextDecorationStyle.solid,
    );
    expect(
      ThemeDecoder.instance.decodeTextDecorationStyle('wavy'),
      TextDecorationStyle.wavy,
    );

    expect(
      ThemeEncoder.instance.encodeTextDecorationStyle(
        TextDecorationStyle.dashed,
      ),
      'dashed',
    );
    expect(
      ThemeEncoder.instance.encodeTextDecorationStyle(
        TextDecorationStyle.dotted,
      ),
      'dotted',
    );
    expect(
      ThemeEncoder.instance.encodeTextDecorationStyle(
        TextDecorationStyle.double,
      ),
      'double',
    );
    expect(
      ThemeEncoder.instance.encodeTextDecorationStyle(
        TextDecorationStyle.solid,
      ),
      'solid',
    );
    expect(
      ThemeEncoder.instance.encodeTextDecorationStyle(TextDecorationStyle.wavy),
      'wavy',
    );
  });

  test('TextDirection', () {
    expect(ThemeDecoder.instance.decodeTextDirection(null), null);
    expect(ThemeEncoder.instance.encodeTextDirection(null), null);

    expect(
      ThemeDecoder.instance.decodeTextDirection(TextDirection.ltr),
      TextDirection.ltr,
    );

    expect(ThemeDecoder.instance.decodeTextDirection('ltr'), TextDirection.ltr);
    expect(ThemeDecoder.instance.decodeTextDirection('rtl'), TextDirection.rtl);

    expect(ThemeEncoder.instance.encodeTextDirection(TextDirection.ltr), 'ltr');
    expect(ThemeEncoder.instance.encodeTextDirection(TextDirection.rtl), 'rtl');
  });

  test('TextHeightBehavior', () {
    expect(ThemeDecoder.instance.decodeTextHeightBehavior(null), null);
    expect(ThemeEncoder.instance.encodeTextHeightBehavior(null), null);

    const entry = TextHeightBehavior(
      applyHeightToFirstAscent: true,
      applyHeightToLastDescent: true,
      leadingDistribution: TextLeadingDistribution.even,
    );

    expect(ThemeDecoder.instance.decodeTextHeightBehavior(entry), entry);

    final encoded = ThemeEncoder.instance.encodeTextHeightBehavior(entry);
    final decoded = ThemeDecoder.instance.decodeTextHeightBehavior(encoded);

    expect(encoded, {
      'applyHeightToFirstAscent': true,
      'applyHeightToLastDescent': true,
      'leadingDistribution': 'even',
    });

    expect(decoded, entry);
  });

  test('TextInputAction', () {
    expect(ThemeDecoder.instance.decodeTextInputAction(null), null);
    expect(ThemeEncoder.instance.encodeTextInputAction(null), null);

    expect(
      ThemeDecoder.instance.decodeTextInputAction(
        TextInputAction.continueAction,
      ),
      TextInputAction.continueAction,
    );

    expect(
      ThemeDecoder.instance.decodeTextInputAction('continueAction'),
      TextInputAction.continueAction,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputAction('done'),
      TextInputAction.done,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputAction('emergencyCall'),
      TextInputAction.emergencyCall,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputAction('go'),
      TextInputAction.go,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputAction('join'),
      TextInputAction.join,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputAction('newline'),
      TextInputAction.newline,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputAction('next'),
      TextInputAction.next,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputAction('none'),
      TextInputAction.none,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputAction('previous'),
      TextInputAction.previous,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputAction('route'),
      TextInputAction.route,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputAction('search'),
      TextInputAction.search,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputAction('send'),
      TextInputAction.send,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputAction('unspecified'),
      TextInputAction.unspecified,
    );

    expect(
      ThemeEncoder.instance.encodeTextInputAction(
        TextInputAction.continueAction,
      ),
      'continueAction',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputAction(TextInputAction.done),
      'done',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputAction(
        TextInputAction.emergencyCall,
      ),
      'emergencyCall',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputAction(TextInputAction.go),
      'go',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputAction(TextInputAction.join),
      'join',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputAction(TextInputAction.newline),
      'newline',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputAction(TextInputAction.next),
      'next',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputAction(TextInputAction.none),
      'none',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputAction(TextInputAction.previous),
      'previous',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputAction(TextInputAction.route),
      'route',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputAction(TextInputAction.search),
      'search',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputAction(TextInputAction.send),
      'send',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputAction(TextInputAction.unspecified),
      'unspecified',
    );
  });

  test('TextInputType', () {
    expect(ThemeDecoder.instance.decodeTextInputType(null), null);
    expect(ThemeEncoder.instance.encodeTextInputType(null), null);

    expect(
      ThemeDecoder.instance.decodeTextInputType(TextInputType.datetime),
      TextInputType.datetime,
    );

    expect(
      ThemeDecoder.instance.decodeTextInputType('datetime'),
      TextInputType.datetime,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputType('emailAddress'),
      TextInputType.emailAddress,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputType('multiline'),
      TextInputType.multiline,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputType('name'),
      TextInputType.name,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputType('none'),
      TextInputType.none,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputType('number'),
      TextInputType.number,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputType('phone'),
      TextInputType.phone,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputType('streetAddress'),
      TextInputType.streetAddress,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputType('text'),
      TextInputType.text,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputType('twitter'),
      TextInputType.twitter,
    );
    expect(ThemeDecoder.instance.decodeTextInputType('url'), TextInputType.url);
    expect(
      ThemeDecoder.instance.decodeTextInputType('visiblePassword'),
      TextInputType.visiblePassword,
    );
    expect(
      ThemeDecoder.instance.decodeTextInputType('webSearch'),
      TextInputType.webSearch,
    );

    expect(
      ThemeEncoder.instance.encodeTextInputType(TextInputType.datetime),
      'datetime',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputType(TextInputType.emailAddress),
      'emailAddress',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputType(TextInputType.multiline),
      'multiline',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputType(TextInputType.name),
      'name',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputType(TextInputType.none),
      'none',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputType(TextInputType.number),
      'number',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputType(TextInputType.phone),
      'phone',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputType(TextInputType.streetAddress),
      'streetAddress',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputType(TextInputType.text),
      'text',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputType(TextInputType.twitter),
      'twitter',
    );
    expect(ThemeEncoder.instance.encodeTextInputType(TextInputType.url), 'url');
    expect(
      ThemeEncoder.instance.encodeTextInputType(TextInputType.visiblePassword),
      'visiblePassword',
    );
    expect(
      ThemeEncoder.instance.encodeTextInputType(TextInputType.webSearch),
      'webSearch',
    );
  });

  test('TextLeadingDistribution', () {
    expect(ThemeDecoder.instance.decodeTextLeadingDistribution(null), null);
    expect(ThemeEncoder.instance.encodeTextLeadingDistribution(null), null);

    expect(
      ThemeDecoder.instance.decodeTextLeadingDistribution(
        TextLeadingDistribution.even,
      ),
      TextLeadingDistribution.even,
    );

    expect(
      ThemeDecoder.instance.decodeTextLeadingDistribution('even'),
      TextLeadingDistribution.even,
    );
    expect(
      ThemeDecoder.instance.decodeTextLeadingDistribution('proportional'),
      TextLeadingDistribution.proportional,
    );

    expect(
      ThemeEncoder.instance.encodeTextLeadingDistribution(
        TextLeadingDistribution.even,
      ),
      'even',
    );
    expect(
      ThemeEncoder.instance.encodeTextLeadingDistribution(
        TextLeadingDistribution.proportional,
      ),
      'proportional',
    );
  });

  test('TextOverflow', () {
    expect(ThemeDecoder.instance.decodeTextOverflow(null), null);
    expect(ThemeEncoder.instance.encodeTextOverflow(null), null);

    expect(
      ThemeDecoder.instance.decodeTextOverflow(TextOverflow.clip),
      TextOverflow.clip,
    );

    expect(ThemeDecoder.instance.decodeTextOverflow('clip'), TextOverflow.clip);
    expect(
      ThemeDecoder.instance.decodeTextOverflow('ellipsis'),
      TextOverflow.ellipsis,
    );
    expect(ThemeDecoder.instance.decodeTextOverflow('fade'), TextOverflow.fade);
    expect(
      ThemeDecoder.instance.decodeTextOverflow('visible'),
      TextOverflow.visible,
    );

    expect(ThemeEncoder.instance.encodeTextOverflow(TextOverflow.clip), 'clip');
    expect(
      ThemeEncoder.instance.encodeTextOverflow(TextOverflow.ellipsis),
      'ellipsis',
    );
    expect(ThemeEncoder.instance.encodeTextOverflow(TextOverflow.fade), 'fade');
    expect(
      ThemeEncoder.instance.encodeTextOverflow(TextOverflow.visible),
      'visible',
    );
  });

  test('TextScaler', () {
    expect(ThemeDecoder.instance.decodeTextScaler(null), null);
    expect(ThemeEncoder.instance.encodeTextScaler(null), null);

    expect(
      ThemeDecoder.instance.decodeTextScaler(TextScaler.noScaling),
      TextScaler.noScaling,
    );

    expect(
      ThemeDecoder.instance.decodeTextScaler('noScaling'),
      TextScaler.noScaling,
    );

    expect(
      ThemeEncoder.instance.encodeTextScaler(TextScaler.noScaling),
      'noScaling',
    );
  });

  test('TextSelectionThemeData', () {
    expect(ThemeDecoder.instance.decodeTextSelectionThemeData(null), null);
    expect(ThemeEncoder.instance.encodeTextSelectionThemeData(null), null);

    const entry = TextSelectionThemeData(
      cursorColor: Color(0xff222222),
      selectionColor: Color(0xff222222),
      selectionHandleColor: Color(0xff222222),
    );

    expect(ThemeDecoder.instance.decodeTextSelectionThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeTextSelectionThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeTextSelectionThemeData(encoded);

    expect(encoded, {
      'cursorColor': '#ff222222',
      'selectionColor': '#ff222222',
      'selectionHandleColor': '#ff222222',
    });

    expect(decoded, entry);
  });

  test('TextSpan', () {
    expect(ThemeDecoder.instance.decodeTextSpan(null), null);
    expect(ThemeEncoder.instance.encodeTextSpan(null), null);

    const entry = TextSpan(
      children: [
        TextSpan(text: 'Hello'),
        TextSpan(text: 'World', style: TextStyle(fontSize: 24.0)),
      ],
      mouseCursor: SystemMouseCursors.copy,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w100),
    );
    final encoded = ThemeEncoder.instance.encodeTextSpan(entry);
    final decoded = ThemeDecoder.instance.decodeTextSpan(encoded);

    expect(encoded, {
      'children': [
        {
          'mouseCursor': {'type': 'defer'},
          'text': 'Hello',
        },
        {
          'mouseCursor': {'type': 'defer'},
          'text': 'World',
          'style': {'fontSize': 24.0, 'inherit': true},
        },
      ],
      'mouseCursor': {'cursor': 'copy', 'type': 'system'},
      'style': {'fontSize': 20.0, 'fontWeight': 'w100', 'inherit': true},
    });

    expect(decoded, entry);

    expect(
      ThemeDecoder.instance.decodeTextSpan('Hello World'),
      const TextSpan(text: 'Hello World'),
    );
  });

  test('TextStyle', () {
    expect(ThemeDecoder.instance.decodeTextStyle(null), null);
    expect(ThemeEncoder.instance.encodeTextStyle(null), null);

    const entry = TextStyle(
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
      fontVariations: [FontVariation('slnt', 20.0)],
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
          offset: Offset(6.0, 7.0),
        ),
      ],
      textBaseline: TextBaseline.alphabetic,
      wordSpacing: 8.0,
    );

    expect(ThemeDecoder.instance.decodeTextStyle(entry), entry);

    final encoded = ThemeEncoder.instance.encodeTextStyle(entry);
    final decoded = ThemeDecoder.instance.decodeTextStyle(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'color': '#ff222222',
      'decoration': 'lineThrough',
      'decorationColor': '#ff333333',
      'decorationStyle': 'solid',
      'decorationThickness': 1.0,
      'fontFamily': 'packages/bar/foo',
      'fontFamilyFallback': ['packages/bar/bar'],
      'fontFeatures': [
        {'feature': 'fooo', 'value': 2},
      ],
      'fontVariations': [
        {'axis': 'slnt', 'value': 20.0},
      ],
      'fontWeight': 'w100',
      'fontSize': 3.0,
      'fontStyle': 'italic',
      'height': 4.0,
      'inherit': false,
      'leadingDistribution': 'even',
      'letterSpacing': 5.0,
      'locale': {'countryCode': 'US', 'languageCode': 'en'},
      'overflow': 'ellipsis',
      'shadows': [
        {
          'blurRadius': 6.0,
          'color': '#ff444444',
          'offset': {'dx': 6.0, 'dy': 7.0},
        },
      ],
      'textBaseline': 'alphabetic',
      'wordSpacing': 8.0,
    });

    expect(decoded!.color, entry.color);
  });

  test('TextTheme', () {
    expect(ThemeDecoder.instance.decodeTextTheme(null), null);
    expect(ThemeEncoder.instance.encodeTextTheme(null), null);

    const entry = TextTheme(
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

    expect(ThemeDecoder.instance.decodeTextTheme(entry), entry);

    final encoded = ThemeEncoder.instance.encodeTextTheme(entry);
    final decoded = ThemeDecoder.instance.decodeTextTheme(encoded);

    expect(encoded, {
      'bodyLarge': {'color': '#ff111111', 'inherit': true},
      'bodyMedium': {'color': '#ff222222', 'inherit': true},
      'bodySmall': {'color': '#ff333333', 'inherit': true},
      'displayLarge': {'color': '#ff444444', 'inherit': true},
      'displayMedium': {'color': '#ff555555', 'inherit': true},
      'displaySmall': {'color': '#ff666666', 'inherit': true},
      'headlineLarge': {'color': '#ff777777', 'inherit': true},
      'headlineMedium': {'color': '#ff888888', 'inherit': true},
      'headlineSmall': {'color': '#ff999999', 'inherit': true},
      'labelLarge': {'color': '#ff000000', 'inherit': true},
      'labelMedium': {'color': '#ffaaaaaa', 'inherit': true},
      'labelSmall': {'color': '#ffbbbbbb', 'inherit': true},
      'titleLarge': {'color': '#ffcccccc', 'inherit': true},
      'titleMedium': {'color': '#ffdddddd', 'inherit': true},
      'titleSmall': {'color': '#ffeeeeee', 'inherit': true},
    });

    expect(decoded, entry);
  });

  test('TextWidthBasis', () {
    expect(ThemeDecoder.instance.decodeTextWidthBasis(null), null);
    expect(ThemeEncoder.instance.encodeTextWidthBasis(null), null);

    expect(
      ThemeDecoder.instance.decodeTextWidthBasis(TextWidthBasis.longestLine),
      TextWidthBasis.longestLine,
    );

    expect(
      ThemeDecoder.instance.decodeTextWidthBasis('longestLine'),
      TextWidthBasis.longestLine,
    );
    expect(
      ThemeDecoder.instance.decodeTextWidthBasis('parent'),
      TextWidthBasis.parent,
    );

    expect(
      ThemeEncoder.instance.encodeTextWidthBasis(TextWidthBasis.longestLine),
      'longestLine',
    );
    expect(
      ThemeEncoder.instance.encodeTextWidthBasis(TextWidthBasis.parent),
      'parent',
    );
  });

  test('TileMode', () {
    expect(ThemeDecoder.instance.decodeTileMode(null), null);
    expect(ThemeEncoder.instance.encodeTileMode(null), null);

    expect(
      ThemeDecoder.instance.decodeTileMode(TileMode.clamp),
      TileMode.clamp,
    );

    expect(ThemeDecoder.instance.decodeTileMode('clamp'), TileMode.clamp);
    expect(ThemeDecoder.instance.decodeTileMode('mirror'), TileMode.mirror);
    expect(ThemeDecoder.instance.decodeTileMode('repeated'), TileMode.repeated);

    expect(ThemeEncoder.instance.encodeTileMode(TileMode.clamp), 'clamp');
    expect(ThemeEncoder.instance.encodeTileMode(TileMode.mirror), 'mirror');
    expect(ThemeEncoder.instance.encodeTileMode(TileMode.repeated), 'repeated');
  });

  test('TimePickerThemeData', () {
    expect(ThemeDecoder.instance.decodeTimePickerThemeData(null), null);
    expect(ThemeEncoder.instance.encodeTimePickerThemeData(null), null);

    final entry = TimePickerThemeData(
      backgroundColor: const Color(0xff000001),
      dayPeriodBorderSide: const BorderSide(
        color: Color(0xff000002),
        style: BorderStyle.solid,
        width: 1.0,
      ),
      dayPeriodColor: WidgetStateColor.resolveWith(
        (_) => const Color(0xff000003),
      ),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      dayPeriodTextColor: const Color(0xff000004),
      dayPeriodTextStyle: const TextStyle(fontSize: 1.0),
      dialBackgroundColor: const Color(0xff000005),
      dialHandColor: const Color(0xff000006),
      dialTextColor: const Color(0xff000007),
      entryModeIconColor: const Color(0xff000008),
      helpTextStyle: const TextStyle(fontSize: 2.0),
      hourMinuteColor: const Color(0xff000009),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      hourMinuteTextColor: const Color(0xff000010),
      hourMinuteTextStyle: const TextStyle(fontSize: 3.0),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Color(0xff000011),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
    );

    expect(ThemeDecoder.instance.decodeTimePickerThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeTimePickerThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeTimePickerThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff000001',
      'dayPeriodBorderSide': {
        'color': '#ff000002',
        'strokeAlign': -1.0,
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
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'dayPeriodTextColor': '#ff000004',
      'dayPeriodTextStyle': {'fontSize': 1.0, 'inherit': true},
      'dialBackgroundColor': '#ff000005',
      'dialHandColor': '#ff000006',
      'dialTextColor': '#ff000007',
      'entryModeIconColor': '#ff000008',
      'helpTextStyle': {'fontSize': 2.0, 'inherit': true},
      'hourMinuteColor': '#ff000009',
      'hourMinuteShape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 5.0, 'y': 5.0},
          'bottomRight': {'type': 'elliptical', 'x': 5.0, 'y': 5.0},
          'topLeft': {'type': 'elliptical', 'x': 5.0, 'y': 5.0},
          'topRight': {'type': 'elliptical', 'x': 5.0, 'y': 5.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'hourMinuteTextColor': '#ff000010',
      'hourMinuteTextStyle': {'fontSize': 3.0, 'inherit': true},
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
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
    });

    expect(decoded, entry);
  });

  test('ToggleButtonsThemeData', () {
    expect(ThemeDecoder.instance.decodeToggleButtonsThemeData(null), null);
    expect(ThemeEncoder.instance.encodeToggleButtonsThemeData(null), null);

    final entry = ToggleButtonsThemeData(
      borderColor: const Color(0xff111111),
      borderRadius: BorderRadius.circular(1.0),
      borderWidth: 2.0,
      color: const Color(0xff222222),
      constraints: const BoxConstraints(
        maxHeight: 30.0,
        maxWidth: 40.0,
        minHeight: 5.0,
        minWidth: 6.0,
      ),
      disabledBorderColor: const Color(0xff333333),
      disabledColor: const Color(0xff444444),
      fillColor: const Color(0xff555555),
      focusColor: const Color(0xff666666),
      highlightColor: const Color(0xff777777),
      hoverColor: const Color(0xff888888),
      selectedBorderColor: const Color(0xff999999),
      selectedColor: const Color(0xff000000),
      splashColor: const Color(0xffaaaaaa),
      textStyle: const TextStyle(color: Color(0xffbbbbbb)),
    );

    expect(ThemeDecoder.instance.decodeToggleButtonsThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeToggleButtonsThemeData(entry);
    final decoded = ThemeDecoder.instance.decodeToggleButtonsThemeData(encoded);

    expect(encoded, {
      'borderColor': '#ff111111',
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'bottomRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'topLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'topRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'type': 'only',
      },
      'borderWidth': 2.0,
      'color': '#ff222222',
      'constraints': {
        'maxHeight': 30.0,
        'maxWidth': 40.0,
        'minHeight': 5.0,
        'minWidth': 6.0,
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
      'textStyle': {'color': '#ffbbbbbb', 'inherit': true},
    });

    expect(decoded, entry);
  });

  test('TooltipThemeData', () {
    expect(ThemeDecoder.instance.decodeTooltipThemeData(null), null);
    expect(ThemeEncoder.instance.encodeTooltipThemeData(null), null);

    const entry = TooltipThemeData(
      constraints: BoxConstraints(minHeight: 1.0),
      enableFeedback: true,
      excludeFromSemantics: true,
      exitDuration: Duration(milliseconds: 100),
      margin: EdgeInsets.all(2.0),
      padding: EdgeInsets.all(3.0),
      preferBelow: true,
      showDuration: Duration(milliseconds: 4),
      textAlign: TextAlign.center,
      textStyle: _kTextStyle,
      triggerMode: TooltipTriggerMode.longPress,
      verticalOffset: 5.0,
      waitDuration: Duration(milliseconds: 6),
    );

    expect(ThemeDecoder.instance.decodeTooltipThemeData(entry), entry);

    final encoded = ThemeEncoder.instance.encodeTooltipThemeData(entry);

    expect(encoded, {
      'enableFeedback': true,
      'excludeFromSemantics': true,
      'exitDuration': 100,
      'height': 1.0,
      'margin': {'bottom': 2.0, 'left': 2.0, 'right': 2.0, 'top': 2.0},
      'padding': {'bottom': 3.0, 'left': 3.0, 'right': 3.0, 'top': 3.0},
      'preferBelow': true,
      'showDuration': 4,
      'textAlign': 'center',
      'textStyle': {'color': '#00123456', 'inherit': true},
      'triggerMode': 'longPress',
      'verticalOffset': 5.0,
      'waitDuration': 6,
    });
  });

  test('TooltipTriggerMode', () {
    expect(ThemeDecoder.instance.decodeTooltipTriggerMode(null), null);
    expect(ThemeEncoder.instance.encodeTooltipTriggerMode(null), null);

    expect(
      ThemeDecoder.instance.decodeTooltipTriggerMode(
        TooltipTriggerMode.longPress,
      ),
      TooltipTriggerMode.longPress,
    );

    expect(
      ThemeDecoder.instance.decodeTooltipTriggerMode('longPress'),
      TooltipTriggerMode.longPress,
    );
    expect(
      ThemeDecoder.instance.decodeTooltipTriggerMode('manual'),
      TooltipTriggerMode.manual,
    );
    expect(
      ThemeDecoder.instance.decodeTooltipTriggerMode('tap'),
      TooltipTriggerMode.tap,
    );

    expect(
      ThemeEncoder.instance.encodeTooltipTriggerMode(
        TooltipTriggerMode.longPress,
      ),
      'longPress',
    );
    expect(
      ThemeEncoder.instance.encodeTooltipTriggerMode(TooltipTriggerMode.manual),
      'manual',
    );
    expect(
      ThemeEncoder.instance.encodeTooltipTriggerMode(TooltipTriggerMode.tap),
      'tap',
    );
  });

  test('Typography', () {
    expect(ThemeDecoder.instance.decodeTypography(null), null);
    expect(ThemeEncoder.instance.encodeTypography(null), null);

    final entry = Typography.material2018(
      black: const TextTheme(bodyLarge: TextStyle(color: Color(0xff111111))),
      dense: const TextTheme(bodyLarge: TextStyle(color: Color(0xff222222))),
      englishLike: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xff333333)),
      ),
      tall: const TextTheme(bodyLarge: TextStyle(color: Color(0xff444444))),
      white: const TextTheme(bodyLarge: TextStyle(color: Color(0xff555555))),
    );

    expect(ThemeDecoder.instance.decodeTypography(entry), entry);

    final encoded = ThemeEncoder.instance.encodeTypography(entry);
    final decoded = ThemeDecoder.instance.decodeTypography(encoded);

    expect(encoded, {
      'black': {
        'bodyLarge': {'color': '#ff111111', 'inherit': true},
      },
      'dense': {
        'bodyLarge': {'color': '#ff222222', 'inherit': true},
      },
      'englishLike': {
        'bodyLarge': {'color': '#ff333333', 'inherit': true},
      },
      'tall': {
        'bodyLarge': {'color': '#ff444444', 'inherit': true},
      },
      'white': {
        'bodyLarge': {'color': '#ff555555', 'inherit': true},
      },
    });

    expect(decoded, entry);
  });
  test('VerticalDirection', () {
    expect(ThemeDecoder.instance.decodeVerticalDirection(null), null);
    expect(ThemeEncoder.instance.encodeVerticalDirection(null), null);

    expect(
      ThemeDecoder.instance.decodeVerticalDirection(VerticalDirection.down),
      VerticalDirection.down,
    );

    expect(
      ThemeDecoder.instance.decodeVerticalDirection('down'),
      VerticalDirection.down,
    );
    expect(
      ThemeDecoder.instance.decodeVerticalDirection('up'),
      VerticalDirection.up,
    );

    expect(
      ThemeEncoder.instance.encodeVerticalDirection(VerticalDirection.down),
      'down',
    );
    expect(
      ThemeEncoder.instance.encodeVerticalDirection(VerticalDirection.up),
      'up',
    );
  });

  test('VisualDensity', () {
    expect(ThemeDecoder.instance.decodeVisualDensity(null), null);
    expect(ThemeEncoder.instance.encodeVisualDensity(null), null);

    expect(
      ThemeDecoder.instance.decodeVisualDensity(
        VisualDensity.adaptivePlatformDensity,
      ),
      VisualDensity.adaptivePlatformDensity,
    );

    expect(
      ThemeDecoder.instance.decodeVisualDensity('adaptivePlatformDensity'),
      VisualDensity.adaptivePlatformDensity,
    );
    expect(
      ThemeDecoder.instance.decodeVisualDensity('comfortable'),
      VisualDensity.comfortable,
    );
    expect(
      ThemeDecoder.instance.decodeVisualDensity('compact'),
      VisualDensity.compact,
    );
    expect(
      ThemeDecoder.instance.decodeVisualDensity('standard'),
      VisualDensity.standard,
    );

    expect(
      ThemeEncoder.instance.encodeVisualDensity(VisualDensity.comfortable),
      'comfortable',
    );
    expect(
      ThemeEncoder.instance.encodeVisualDensity(VisualDensity.compact),
      'compact',
    );
    expect(
      ThemeEncoder.instance.encodeVisualDensity(VisualDensity.standard),
      'standard',
    );
  });

  test('WidgetStateColor', () {
    expect(ThemeDecoder.instance.decodeWidgetStateColor(null), null);
    expect(ThemeEncoder.instance.encodeWidgetStateColor(null), null);

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    final colors = {
      'disabled': '#ff111111',
      'dragged': '#ff222222',
      'error': '#ff333333',
      'focused': '#ff444444',
      'hovered': '#ff555555',
      'pressed': '#ff666666',
      'scrolledUnder': '#ff888888',
      'selected': '#ff777777',
      'empty': '#00000000',
    };

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final colorStr = colors[stateKey];
      final color = ThemeDecoder.instance.decodeColor(colorStr);

      var decoded = ThemeDecoder.instance.decodeWidgetStateColor(color);
      expect(decoded!.resolve({state}), color);

      decoded = ThemeDecoder.instance.decodeWidgetStateColor(colorStr);
      expect(decoded!.resolve({state}), color);

      final encoded = ThemeEncoder.instance.encodeWidgetStateColor(decoded);
      expect(encoded![stateKey], colorStr);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final colorStr = colors[stateKey];
      final color = ThemeDecoder.instance.decodeColor(colorStr);
      final encodedColor = ThemeEncoder.instance.encodeColor(color);

      final decoded = ThemeDecoder.instance.decodeWidgetStateColor(
        encodedColor,
      );

      expect(decoded!.resolve({state}), color);

      final encoded = ThemeEncoder.instance.encodeWidgetStateColor(decoded);

      expect(encoded![stateKey], colorStr);
    }

    /// Test if pressed takes precedence over hovered
    final materialColor = ThemeDecoder.instance.decodeWidgetStateColor(colors);
    final color = materialColor?.resolve({states['pressed']!});
    expect(ThemeEncoder.instance.encodeColor(color), colors['pressed']);
  });

  test('WidgetStatePropertyBool', () {
    expect(ThemeDecoder.instance.decodeWidgetStatePropertyBool(null), null);
    expect(ThemeEncoder.instance.encodeWidgetStatePropertyBool(null), null);

    final stateMap = {
      WidgetState.disabled: 'disabled',
      WidgetState.dragged: 'dragged',
      WidgetState.error: 'error',
      WidgetState.focused: 'focused',
      WidgetState.hovered: 'hovered',
      WidgetState.pressed: 'pressed',
      WidgetState.scrolledUnder: 'scrolledUnder',
      WidgetState.selected: 'selected',
    };

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    final values = {
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
      final stateKey = entry.key;
      final state = entry.value;

      final value = values[stateKey];

      var decoded = ThemeDecoder.instance.decodeWidgetStatePropertyBool(value);
      expect(decoded?.resolve({state}), value);

      decoded = ThemeDecoder.instance.decodeWidgetStatePropertyBool(
        value.toString(),
      );
      expect(decoded?.resolve({state}), value);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyBool(
        decoded,
      );
      expect(encoded![stateKey], value);
    }

    bool? func(Set<WidgetState> states) =>
        states.isEmpty ? null : values[stateMap[states.first]!];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyBool(prop);
    for (var entry in states.entries) {
      final value = values[stateMap[entry.value]!];

      expect(decoded!.resolve({entry.value}), value);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyBool(
        decoded,
      );

      expect(encoded?[entry.key], value);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final value = values[stateKey];

      final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyBool(
        value,
      );

      expect(decoded!.resolve({state}), value);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyBool(
        decoded,
      );

      expect(encoded![stateKey], value);
    }
  });

  test('WidgetStatePropertyBorderSide', () {
    expect(
      ThemeDecoder.instance.decodeWidgetStatePropertyBorderSide(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeWidgetStatePropertyBorderSide(null),
      null,
    );

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    var count = 1.0;
    final sides = <WidgetState, BorderSide>{};

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: ++count,
      );
      sides[state] = side;

      final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyBorderSide(
        side,
      );

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyBorderSide(
        decoded,
      );

      expect(encoded![stateKey]['width'], side.width);
    }

    BorderSide? func(Set<WidgetState> states) =>
        states.isEmpty ? null : sides[states.first];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyBorderSide(
      prop,
    );
    for (var entry in states.entries) {
      final side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyBorderSide(
        decoded,
      );

      expect(encoded![entry.key]['width'], side!.width);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: ++count,
      );
      final encodedSide = ThemeEncoder.instance.encodeBorderSide(side);

      final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyBorderSide(
        encodedSide,
      );

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyBorderSide(
        decoded,
      );

      expect(encoded![stateKey]['width'], side.width);
    }
  });

  test('WidgetStatePropertyColor', () {
    expect(ThemeDecoder.instance.decodeWidgetStatePropertyColor(null), null);
    expect(ThemeEncoder.instance.encodeWidgetStatePropertyColor(null), null);

    final stateMap = {
      WidgetState.disabled: 'disabled',
      WidgetState.dragged: 'dragged',
      WidgetState.error: 'error',
      WidgetState.focused: 'focused',
      WidgetState.hovered: 'hovered',
      WidgetState.pressed: 'pressed',
      WidgetState.scrolledUnder: 'scrolledUnder',
      WidgetState.selected: 'selected',
    };
    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    final colors = {
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
      final stateKey = entry.key;
      final state = entry.value;

      final colorStr = colors[stateKey];
      final color = ThemeDecoder.instance.decodeColor(colorStr);

      var decoded = ThemeDecoder.instance.decodeWidgetStatePropertyColor(color);
      expect(decoded!.resolve({state}), color);

      decoded = ThemeDecoder.instance.decodeWidgetStatePropertyColor(colorStr);
      expect(decoded!.resolve({state}), color);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyColor(
        decoded,
      );
      expect(encoded![stateKey], colorStr);
    }

    Color? func(Set<WidgetState> states) => states.isEmpty
        ? null
        : ThemeDecoder.instance.decodeColor(colors[stateMap[states.first]]);

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyColor(prop);
    for (var entry in states.entries) {
      final colorStr = colors[stateMap[entry.value]];
      final color = ThemeDecoder.instance.decodeColor(colorStr);

      expect(decoded!.resolve({entry.value}), color);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyColor(
        decoded,
      );

      expect(encoded?[entry.key], colorStr);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final colorStr = colors[stateKey];
      final color = ThemeDecoder.instance.decodeColor(colorStr);
      final encodedColor = ThemeEncoder.instance.encodeColor(color);

      final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyColor(
        encodedColor,
      );

      expect(decoded!.resolve({state}), color);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyColor(
        decoded,
      );

      expect(encoded![stateKey], colorStr);
    }

    /// Test if pressed takes precedence over hovered
    final materialColor = ThemeDecoder.instance.decodeWidgetStatePropertyColor(
      colors,
    );
    final color = materialColor?.resolve({
      states['hovered']!,
      states['pressed']!,
    });
    expect(ThemeEncoder.instance.encodeColor(color), colors['pressed']);
  });

  test('WidgetStatePropertyDouble', () {
    expect(ThemeDecoder.instance.decodeWidgetStatePropertyDouble(null), null);
    expect(ThemeEncoder.instance.encodeWidgetStatePropertyDouble(null), null);
    final stateMap = {
      WidgetState.disabled: 'disabled',
      WidgetState.dragged: 'dragged',
      WidgetState.error: 'error',
      WidgetState.focused: 'focused',
      WidgetState.hovered: 'hovered',
      WidgetState.pressed: 'pressed',
      WidgetState.scrolledUnder: 'scrolledUnder',
      WidgetState.selected: 'selected',
    };

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    final values = {
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
      final stateKey = entry.key;
      final state = entry.value;

      final value = values[stateKey];

      var decoded = ThemeDecoder.instance.decodeWidgetStatePropertyDouble(
        value,
      );
      expect(decoded!.resolve({state}), value);

      decoded = ThemeDecoder.instance.decodeWidgetStatePropertyDouble(
        value.toString(),
      );
      expect(decoded!.resolve({state}), value);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyDouble(
        decoded,
      );
      expect(encoded![stateKey], value);
    }

    double? func(Set<WidgetState> states) =>
        states.isEmpty ? null : values[stateMap[states.first]];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyDouble(prop);
    for (var entry in states.entries) {
      final value = values[stateMap[entry.value]];

      expect(decoded!.resolve({entry.value}), value);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyDouble(
        decoded,
      );

      expect(encoded?[entry.key], value);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final value = values[stateKey];

      final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyDouble(
        value,
      );

      expect(decoded!.resolve({state}), value);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyDouble(
        decoded,
      );

      expect(encoded![stateKey], value);
    }
  });

  test('WidgetStatePropertyEdgeInsetsGeometry', () {
    expect(
      ThemeDecoder.instance.decodeWidgetStatePropertyEdgeInsetsGeometry(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeWidgetStatePropertyEdgeInsetsGeometry(null),
      null,
    );

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    var count = 1.0;
    final sides = <WidgetState, EdgeInsetsGeometry>{};

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = EdgeInsets.all(++count);
      sides[state] = side;

      final decoded = ThemeDecoder.instance
          .decodeWidgetStatePropertyEdgeInsetsGeometry(side);

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.instance
          .encodeWidgetStatePropertyEdgeInsetsGeometry(decoded);

      expect(encoded![stateKey]['bottom'], side.bottom);
    }

    EdgeInsetsGeometry? func(Set<WidgetState> states) =>
        states.isEmpty ? null : sides[states.first];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.instance
        .decodeWidgetStatePropertyEdgeInsetsGeometry(prop);
    for (var entry in states.entries) {
      final side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      final encoded = ThemeEncoder.instance
          .encodeWidgetStatePropertyEdgeInsetsGeometry(decoded);

      expect(encoded![entry.key]['bottom'], (side as EdgeInsets).bottom);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = EdgeInsets.all(++count);
      final encodedSide = ThemeEncoder.instance.encodeEdgeInsetsGeometry(side);

      final decoded = ThemeDecoder.instance
          .decodeWidgetStatePropertyEdgeInsetsGeometry(encodedSide);

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.instance
          .encodeWidgetStatePropertyEdgeInsetsGeometry(decoded);

      expect(encoded![stateKey]['bottom'], side.bottom);
    }

    final symmetricDecoded = ThemeDecoder.instance
        .decodeWidgetStatePropertyEdgeInsetsGeometry([1, 2]);
    for (var state in states.values) {
      expect(
        symmetricDecoded!.resolve({state}),
        const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
      );
    }

    final ltrbDecoded = ThemeDecoder.instance
        .decodeWidgetStatePropertyEdgeInsetsGeometry([1, 2, 3, 4]);
    for (var state in states.values) {
      expect(
        ltrbDecoded!.resolve({state}),
        const EdgeInsets.fromLTRB(1, 2, 3, 4),
      );
    }

    final allDecoded = ThemeDecoder.instance
        .decodeWidgetStatePropertyEdgeInsetsGeometry(1);
    for (var state in states.values) {
      expect(allDecoded!.resolve({state}), const EdgeInsets.all(1));
    }
  });

  test('WidgetStatePropertyIconThemeData', () {
    expect(
      ThemeDecoder.instance.decodeWidgetStatePropertyIconThemeData(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeWidgetStatePropertyIconThemeData(null),
      null,
    );

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    final icons = <WidgetState, IconThemeData>{};

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      const icon = IconThemeData(color: _kColor, opacity: 0.5, size: 12.0);
      icons[state] = icon;

      final decoded = ThemeDecoder.instance
          .decodeWidgetStatePropertyIconThemeData(icon);

      expect(decoded!.resolve({state}), icon);

      final encoded = ThemeEncoder.instance
          .encodeWidgetStatePropertyIconThemeData(decoded);

      expect(encoded![stateKey]['color'], _kColorStr);
    }

    IconThemeData? func(Set<WidgetState> states) =>
        states.isEmpty ? null : icons[states.first];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.instance
        .decodeWidgetStatePropertyIconThemeData(prop);
    for (var entry in states.entries) {
      final icon = icons[entry.value];

      expect(decoded!.resolve({entry.value}), icon);

      final encoded = ThemeEncoder.instance
          .encodeWidgetStatePropertyIconThemeData(decoded);

      expect(encoded![entry.key]['color'], _kColorStr);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final icon = icons[state];
      final encodedSide = ThemeEncoder.instance.encodeIconThemeData(icon);

      final decoded = ThemeDecoder.instance
          .decodeWidgetStatePropertyIconThemeData(encodedSide);

      expect(decoded!.resolve({state}), icon);

      final encoded = ThemeEncoder.instance
          .encodeWidgetStatePropertyIconThemeData(decoded);

      expect(encoded![stateKey]['color'], _kColorStr);
    }
  });

  test('WidgetStatePropertyMouseCursor', () {
    expect(ThemeDecoder.instance.decodeWidgetStatePropertyColor(null), null);
    expect(ThemeEncoder.instance.encodeWidgetStatePropertyColor(null), null);
    final stateMap = {
      WidgetState.disabled: 'disabled',
      WidgetState.dragged: 'dragged',
      WidgetState.error: 'error',
      WidgetState.focused: 'focused',
      WidgetState.hovered: 'hovered',
      WidgetState.pressed: 'pressed',
      WidgetState.scrolledUnder: 'scrolledUnder',
      WidgetState.selected: 'selected',
    };

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    final cursors = {
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
      final stateKey = entry.key;
      final state = entry.value;

      final cursorStr = cursors[stateKey];
      final cursor = ThemeDecoder.instance.decodeMouseCursor(cursorStr);

      var decoded = ThemeDecoder.instance.decodeWidgetStatePropertyMouseCursor(
        cursor,
      );
      expect(decoded!.resolve({state}), cursor);

      decoded = ThemeDecoder.instance.decodeWidgetStatePropertyMouseCursor(
        cursorStr,
      );
      expect(decoded!.resolve({state}), cursor);

      final encoded = ThemeEncoder.instance
          .encodeWidgetStatePropertyMouseCursor(decoded);
      expect(encoded![stateKey], cursorStr);
    }

    MouseCursor? func(Set<WidgetState> states) => states.isEmpty
        ? null
        : ThemeDecoder.instance.decodeMouseCursor(
            cursors[stateMap[states.first]],
          );

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyMouseCursor(
      prop,
    );
    for (var entry in states.entries) {
      final cursorStr = cursors[stateMap[entry.value]];
      final cursor = ThemeDecoder.instance.decodeMouseCursor(cursorStr);

      expect(decoded!.resolve({entry.value}), cursor);

      final encoded = ThemeEncoder.instance
          .encodeWidgetStatePropertyMouseCursor(decoded);

      expect(encoded?[entry.key], cursorStr);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final cursorStr = cursors[stateKey];
      final cursor = ThemeDecoder.instance.decodeMouseCursor(cursorStr);
      final encodedCursor = ThemeEncoder.instance.encodeMouseCursor(cursor);

      final decoded = ThemeDecoder.instance
          .decodeWidgetStatePropertyMouseCursor(encodedCursor);

      expect(decoded!.resolve({state}), cursor);

      final encoded = ThemeEncoder.instance
          .encodeWidgetStatePropertyMouseCursor(decoded);

      expect(encoded![stateKey], cursorStr);
    }
  });

  test('WidgetStatePropertyOutlinedBorder', () {
    expect(
      ThemeDecoder.instance.decodeWidgetStatePropertyOutlinedBorder(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeWidgetStatePropertyOutlinedBorder(null),
      null,
    );

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    var count = 1.0;
    final sides = <WidgetState, OutlinedBorder>{};

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: ++count,
        ),
      );
      sides[state] = side;

      final decoded = ThemeDecoder.instance
          .decodeWidgetStatePropertyOutlinedBorder(side);

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.instance
          .encodeWidgetStatePropertyOutlinedBorder(decoded);

      expect(encoded![stateKey]['side']['width'], side.side.width);
    }

    OutlinedBorder? func(Set<WidgetState> states) =>
        states.isEmpty ? null : sides[states.first];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.instance
        .decodeWidgetStatePropertyOutlinedBorder(prop);
    for (var entry in states.entries) {
      final side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      final encoded = ThemeEncoder.instance
          .encodeWidgetStatePropertyOutlinedBorder(decoded);

      expect(encoded![entry.key]['side']['width'], side!.side.width);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = sides[state];
      final encodedSide = ThemeEncoder.instance.encodeOutlinedBorder(side);

      final decoded = ThemeDecoder.instance
          .decodeWidgetStatePropertyOutlinedBorder(encodedSide);

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.instance
          .encodeWidgetStatePropertyOutlinedBorder(decoded);

      expect(encoded![stateKey]['side']['width'], side!.side.width);
    }
  });

  test('WidgetStatePropertySize', () {
    expect(ThemeDecoder.instance.decodeWidgetStatePropertySize(null), null);
    expect(ThemeEncoder.instance.encodeWidgetStatePropertySize(null), null);

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    var count = 1.0;
    final sides = <WidgetState, Size>{};

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = Size(++count, ++count);
      sides[state] = side;

      final decoded = ThemeDecoder.instance.decodeWidgetStatePropertySize(side);

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertySize(
        decoded,
      );

      expect(encoded![stateKey]['width'], side.width);
    }

    Size? func(Set<WidgetState> states) =>
        states.isEmpty ? null : sides[states.first];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.instance.decodeWidgetStatePropertySize(prop);
    for (var entry in states.entries) {
      final side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertySize(
        decoded,
      );

      expect(encoded![entry.key]['width'], side!.width);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = sides[state];
      final encodedSide = ThemeEncoder.instance.encodeSize(side);

      final decoded = ThemeDecoder.instance.decodeWidgetStatePropertySize(
        encodedSide,
      );

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertySize(
        decoded,
      );

      expect(encoded![stateKey]['width'], side!.width);
    }
  });

  test('WidgetStatePropertyTextStyle', () {
    expect(
      ThemeDecoder.instance.decodeWidgetStatePropertyTextStyle(null),
      null,
    );
    expect(
      ThemeEncoder.instance.encodeWidgetStatePropertyTextStyle(null),
      null,
    );

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    var count = 1.0;
    final sides = <WidgetState, TextStyle>{};

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = TextStyle(fontSize: ++count);
      sides[state] = side;

      final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyTextStyle(
        side,
      );

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyTextStyle(
        decoded,
      );

      expect(encoded![stateKey]['fontSize'], side.fontSize);
    }

    TextStyle? func(Set<WidgetState> states) =>
        states.isEmpty ? null : sides[states.first];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyTextStyle(
      prop,
    );
    for (var entry in states.entries) {
      final side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyTextStyle(
        decoded,
      );

      expect(encoded![entry.key]['fontSize'], side!.fontSize);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = sides[state];
      final encodedSide = ThemeEncoder.instance.encodeTextStyle(side);

      final decoded = ThemeDecoder.instance.decodeWidgetStatePropertyTextStyle(
        encodedSide,
      );

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.instance.encodeWidgetStatePropertyTextStyle(
        decoded,
      );

      expect(encoded![stateKey]['fontSize'], side!.fontSize);
    }
  });

  test('WrapAlignment', () {
    expect(ThemeDecoder.instance.decodeWrapAlignment(null), null);
    expect(ThemeEncoder.instance.encodeWrapAlignment(null), null);

    expect(
      ThemeDecoder.instance.decodeWrapAlignment(WrapAlignment.start),
      WrapAlignment.start,
    );

    expect(
      ThemeDecoder.instance.decodeWrapAlignment('center'),
      WrapAlignment.center,
    );
    expect(ThemeDecoder.instance.decodeWrapAlignment('end'), WrapAlignment.end);
    expect(
      ThemeDecoder.instance.decodeWrapAlignment('spaceAround'),
      WrapAlignment.spaceAround,
    );
    expect(
      ThemeDecoder.instance.decodeWrapAlignment('spaceBetween'),
      WrapAlignment.spaceBetween,
    );
    expect(
      ThemeDecoder.instance.decodeWrapAlignment('spaceEvenly'),
      WrapAlignment.spaceEvenly,
    );
    expect(
      ThemeDecoder.instance.decodeWrapAlignment('start'),
      WrapAlignment.start,
    );

    expect(
      ThemeEncoder.instance.encodeWrapAlignment(WrapAlignment.center),
      'center',
    );
    expect(ThemeEncoder.instance.encodeWrapAlignment(WrapAlignment.end), 'end');
    expect(
      ThemeEncoder.instance.encodeWrapAlignment(WrapAlignment.spaceAround),
      'spaceAround',
    );
    expect(
      ThemeEncoder.instance.encodeWrapAlignment(WrapAlignment.spaceBetween),
      'spaceBetween',
    );
    expect(
      ThemeEncoder.instance.encodeWrapAlignment(WrapAlignment.spaceEvenly),
      'spaceEvenly',
    );
    expect(
      ThemeEncoder.instance.encodeWrapAlignment(WrapAlignment.start),
      'start',
    );
  });

  test('WrapCrossAlignment', () {
    expect(ThemeDecoder.instance.decodeWrapCrossAlignment(null), null);
    expect(ThemeEncoder.instance.encodeWrapCrossAlignment(null), null);

    expect(
      ThemeDecoder.instance.decodeWrapAlignment(WrapAlignment.start),
      WrapAlignment.start,
    );

    expect(
      ThemeDecoder.instance.decodeWrapCrossAlignment('center'),
      WrapCrossAlignment.center,
    );
    expect(
      ThemeDecoder.instance.decodeWrapCrossAlignment('end'),
      WrapCrossAlignment.end,
    );
    expect(
      ThemeDecoder.instance.decodeWrapCrossAlignment('start'),
      WrapCrossAlignment.start,
    );

    expect(
      ThemeEncoder.instance.encodeWrapCrossAlignment(WrapCrossAlignment.center),
      'center',
    );
    expect(
      ThemeEncoder.instance.encodeWrapCrossAlignment(WrapCrossAlignment.end),
      'end',
    );
    expect(
      ThemeEncoder.instance.encodeWrapCrossAlignment(WrapCrossAlignment.start),
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
    result =
        first.alignment == second.alignment &&
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

Map<String, dynamic> _materializeState(dynamic value) => {
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
