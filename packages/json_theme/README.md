<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [json_theme](#json_theme)
- [Live Example](#live-example)
- [Decoding](#decoding)
- [Schema Validation](#schema-validation)
- [Class Selection](#class-selection)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# json_theme

Library to encode and decode `ThemeData` and associated objects to / from JSON.  This is currently an early release of the library.

This provides two main classes.
* `ThemeDecoder` -- Provides functionality to decode theme related objects from JSON maps.
* `ThemeEncoder` -- Provides functionality to encode theme related objects into JSON maps.

**Note**: Encoding and decoding is _mostly_ bi-directionally compatible, but it is not fully bi-directionally compatible.  That's because there are some properties in theme objects that exist on the constructors, but are not re-exposed as properties and only exposed as dynamic calculated values.  Likewise, there are some dynamic classes (specifically custom `Shape`, `Slider`, and `Decoration` classes) that have no meaningful way of being encoded to JSON nor decoded from JSON.

The decodes utilize a JSON Schema validator to ensure the JSON is well formed.  This validation is enabled by default in debug mode and disabled in release mode for performance reasons.  Even in development mode, you can disable the validation by setting the optional `validate` parameter to `false`.

**Important Note**

Because this library allows for icons to be dynamically referenced, Flutter cannot tree shake icons because it has no way of knowing what icons may or may not be referenced.  If you include this library, then you will need to add the `--no-tree-shake-icons` flag to your Flutter build or you will get an error stating that Flutter cannot tree shake the icons.


# Live Example

* [Web](https://peiffer-innovations.github.io/json_theme/web)


# Decoding

The framework accepts both JSON-compatible objects as well as actual concrete instances being passed to the `decode` functions.  For example, the following will properly decode:

```dart
var appBarTheme = ThemeDecoder.instance.decodeAppBarTheme({
    'brightness': Brightness.dark,
    'color': '#ffdddddd'
  }, 
  validate: false,
);
```


# Schema Validation

The framework comes with a built-in JSON Schema validator.  This validator is set to be enabled by default in debug mode but disabled in release and profile mode.

The JSON Schema validator can only validate pure JSON based objects.  It cannot validate mixed JSON and concrete objects.  If your application uses mixed JSON and concrete objects in the implementation you will either need to disable validation in the decode calls where mixed objects can be used (as is done in the example above) or disable validation globally for the entire application via:

```dart
import 'package:json_theme/json_theme_schemas.dart';

void main() {
  SchemaValidator.enabled = false;

  /// rest of app initialization goes here
}

```



# Class Selection

As close as possible, the names used in the Dart APIs are replicated.  However, there are instances where the class is different for things like `Shape` objects, or there's an enum like `VerticalDirection`.  Those are all documented in this section.


**Alignment**

Plain string that must be one of:
* `bottomCenter` ==> `Alignment.bottomCenter`
* `bottomLeft` ==> `Alignment.bottomLeft`
* `bottomRight` ==> `Alignment.bottomRight`
* `center` ==> `Alignment.center`
* `centerLeft` ==> `Alignment.centerLeft`
* `centerRight` ==> `Alignment.centerRight`
* `topCenter` ==> `Alignment.topCenter`
* `topLeft` ==> `Alignment.topLeft`
* `topRight` ==> `Alignment.topRight`


**AutovalidateMode**

Plain string that must be one of:
* `always` ==> `AutovalidateMode.always`
* `disabled` ==> `AutovalidateMode.disabled`
* `onUserInteraction` ==> `AutovalidateMode.onUserInteraction`


**Axis**

Plain string that must be one of:
* `horizontal` ==> `Axis.horizontal`
* `vertical` ==> `Axis.vertical`


**BlendMode**

Plain string that must be one of:
* `clear` ==> `BlendMode.clear`
* `color` ==> `BlendMode.color`
* `colorBurn` ==> `BlendMode.colorBurn`
* `colorDodge` ==> `BlendMode.colorDodge`
* `darken` ==> `BlendMode.darken`
* `difference` ==> `BlendMode.difference`
* `dst` ==> `BlendMode.dst`
* `dstATop` ==> `BlendMode.dstATop`
* `dstIn` ==> `BlendMode.dstIn`
* `dstOut` ==> `BlendMode.dstOut`
* `dstOver` ==> `BlendMode.dstOver`
* `exclusion` ==> `BlendMode.exclusion`
* `hardLight` ==> `BlendMode.hardLight`
* `hue` ==> `BlendMode.hue`
* `lighten` ==> `BlendMode.lighten`
* `luminosity` ==> `BlendMode.luminosity`
* `modulate` ==> `BlendMode.modulate`
* `multiply` ==> `BlendMode.multiply`
* `overlay` ==> `BlendMode.overlay`
* `plus` ==> `BlendMode.plus`
* `saturation` ==> `BlendMode.saturation`
* `screen` ==> `BlendMode.screen`
* `softLight` ==> `BlendMode.softLight`
* `src` ==> `BlendMode.src`
* `srcATop` ==> `BlendMode.srcATop`
* `srcIn` ==> `BlendMode.srcIn`
* `srcOut` ==> `BlendMode.srcOut`
* `srcOver` ==> `BlendMode.srcOver`
* `xor` ==> `BlendMode.xor`


**BorderRadius**

Requires a `type` value that must be one of:
* `all` ==> `BorderRadius.all`
* `circular` ==> `BorderRadius.circular`
* `horizontal` ==> `BorderRadius.horizontal`
* `only` ==> `BorderRadius.only`
* `vertical` ==> `BorderRadius.vertical`


**BorderStyle**

Plain string that must be one of:
* `none` ==> `BorderStyle.none`
* `solid` ==> `BorderStyle.solid`


**BottomNavigationBarType**

Plain string that must be one of:
* `fixed` ==> BottomNavigationBarType.fixed
* `shifting` ==> BottomNavigationBarType.shifting


**BoxFit**

Plain string that must be one of:
* `contain` ==> `BoxFit.contain`
* `cover` ==> `BoxFit.cover`
* `fill` ==> `BoxFit.fill`
* `fitHeight` ==> `BoxFit.fitHeight`
* `fitWidth` ==> `BoxFit.fitWidth`
* `none` ==> `BoxFit.none`
* `scaleDown` ==> `BoxFit.scaleDown`


**ButtonBarLayoutBehavior**

Plain string that must be one of:
* `constrained` ==> `ButtonBarLayoutBehavior.constrained`
* `padded` ==> `ButtonBarLayoutBehavior.padded`


**ButtonTextTheme**

Plain string that must be one of:
* `accent` ==> `ButtonTextTheme.accent`
* `normal` ==> `ButtonTextTheme.normal`
* `primary` ==> `ButtonTextTheme.primary`


**Clip**

Plain string that must be one of:
* `antiAlias` ==> `Clip.antiAlias`
* `antiAliasWithSaveLayer` ==> `Clip.antiAliasWithSaveLayer`
* `hardEdge` ==> `Clip.hardEdge`
* `none` ==> `Clip.none`


**CrossAxisAlignment**

Plain string that must be one of:
* `baseline` ==> `CrossAxisAlignment.baseline`
* `center` ==> `CrossAxisAlignment.center`
* `end` ==> `CrossAxisAlignment.end`
* `start` ==> `CrossAxisAlignment.start`
* `stretch` ==> `CrossAxisAlignment.stretch`


**CrossFadeState**

Plain string that must be one of:
* `showFirst` ==> `CrossFadeState.showFirst`
* `showSecond` ==> `CrossFadeState.showSecond`


**DecorationPosition**

Plain string that must be one of:
* `background` ==> `DecorationPosition.background`
* `foreground` ==> `DecorationPosition.foreground`


**DragStartBehavior**

Plain string that must be one of:
* `down` ==> `DragStartBehavior.down`
* `start` ==> `DragStartBehavior.start`


**FilterQuality**
Plain string that must be one of:
* `high` ==> `FilterQuality.high`
* `low` ==> `FilterQuality.low`
* `medium` ==> `FilterQuality.medium`
* `none` ==> `FilterQuality.none`


**FlexFit**

Plain string that must be one of:
* `loose` ==> `FlexFit.loose`
* `tight` ==> `FlexFit.tight`


**FloatingActionButtonAnimator**

Plain string that must be one of:
* `scaling` ==> `FloatingActionButtonAnimator.scaling`


**FloatingActionButtonLocation**

Plain string that must be one of:
* `centerDocked` ==> `FloatingActionButtonLocation.centerDocked`
* `centerFloat` ==> `FloatingActionButtonLocation.centerFloat`
* `centerTop` ==> `FloatingActionButtonLocation.centerTop`
* `endDocked` ==> `FloatingActionButtonLocation.endDocked`
* `endFloat` ==> `FloatingActionButtonLocation.endFloat`
* `endTop` ==> `FloatingActionButtonLocation.endTop`
* `miniCenterDocked` ==> `FloatingActionButtonLocation.miniCenterDocked`
* `miniCenterFloat` ==> `FloatingActionButtonLocation.miniCenterFloat`
* `miniCenterTop` ==> `FloatingActionButtonLocation.miniCenterTop`
* `miniEndDocked` ==> `FloatingActionButtonLocation.miniEndDocked`
* `miniEndFloat` ==> `FloatingActionButtonLocation.miniEndFloat`
* `miniEndTop` ==> `FloatingActionButtonLocation.miniEndTop`
* `miniStartDocked` ==> `FloatingActionButtonLocation.miniStartDocked`
* `miniStartFloat` ==> `FloatingActionButtonLocation.miniStartFloat`
* `miniStartTop` ==> `FloatingActionButtonLocation.miniStartTop`
* `startDocked` ==> `FloatingActionButtonLocation.startDocked`
* `startFloat` ==> `FloatingActionButtonLocation.startFloat`
* `startTop` ==> `FloatingActionButtonLocation.startTop`


**FloatingLabelBehavior**

Plain string that must be one of:
* `always` ==> `FloatingLabelBehavior.always`
* `auto` ==> `FloatingLabelBehavior.auto`
* `never` ==> `FloatingLabelBehavior.never`


**FontWeight**

Plain string that must be one of:
* `bold` ==> `FontWeight.bold`
* `normal` ==> `FontWeight.normal`
* `w100` ==> `FontWeight.w100`
* `w200` ==> `FontWeight.w200`
* `w300` ==> `FontWeight.w300`
* `w400` ==> `FontWeight.w400`
* `w500` ==> `FontWeight.w500`
* `w600` ==> `FontWeight.w600`
* `w700` ==> `FontWeight.w700`
* `w800` ==> `FontWeight.w800`
* `w900` ==> `FontWeight.w900`


**FontStyle**

Plain string that must be one of:
* `italic` ==> `FontStyle.italic`
* `normal` ==> `FontStyle.normal`


**Gradient**

Requires a `type` value that must be one of:
* `linear` ==> `LinearGradient`
* `radial` ==> `RadialGradient`
* `sweep` ==> `SweepGradient`


**HitTestBehavior**

Plain string that must be one of:
* `deferToChild` ==> `HitTestBehavior.deferToChild`
* `opaque` ==> `HitTestBehavior.opaque`
* `translucent` ==> `HitTestBehavior.translucent`


**ImageProvider**

Requires a `type` value that must be one of:
* `asset` ==> `AssetImage`
* `memory` ==> `MemoryImage`
* `network` ==> `NetworkImage`


**ImageRepeat**

Plain string that must be one of:
* `noRepeat` ==> `ImageRepeat.noRepeat`
* `repeat` ==> `ImageRepeat.repeat`
* `repeatX` ==> `ImageRepeat.repeatX`
* `repeatY` ==> `ImageRepeat.repeatY`


**InputBorder**

Requires a `type` value that must be one of:
* `outline` ==> `OutlineInputBorder`
* `underline` ==> `UnderlineInputBorder`


**InteractiveInkFeatureFactory**

Plain string that must be one of:
* `splash` ==> `InkSplash.splashFactory`
* `ripple` ==> `InkRipple.splashFactory`


**MainAxisAlignment**

Plain string that must be one of:
* `center` ==> `MainAxisAlignment.center`
* `end` ==> `MainAxisAlignment.end`
* `spaceAround` ==> `MainAxisAlignment.spaceAround`
* `spaceBetween` ==> `MainAxisAlignment.spaceBetween`
* `spaceEvenly` ==> `MainAxisAlignment.spaceEvenly`
* `start` ==> `MainAxisAlignment.start`


**MainAxisSize**

Plain string that must be one of:
* `min` ==> `MainAxisSize.min`
* `max` ==> `MainAxisSize.max`


**MaterialTapTargetSize**

Plain string that must be one of:
* `padded` ==> `MaterialTapTargetSize.padded`
* `shrinkWrap` ==> `MaterialTapTargetSize.shrinkWrap`


**MaterialType**

Plain string that must be one of:
* `button` ==> `MaterialType.button`
* `canvas` ==> `MaterialType.canvas`
* `card` ==> `MaterialType.card`
* `circle` ==>`MaterialType.circle`
* `transparency` ==> `MaterialType.transparency`


**MaxLengthEnforcement**

Plain string that must be one of:
* `enforced` ==> `MaxLengthEnforcement.enforced`
* `none` ==> `MaxLengthEnforcement.none`
* `truncateAfterCompositionEnds` ==> `MaxLengthEnforcement.truncateAfterCompositionEnds`


**MouseCursor**

Requires a `type` value that must be one of:
* `defer` ==> `MouseCursor.defer`
* `material` ==> `MouseCursor.material`
* `system` ==> `MouseCursor.system`
* `uncontrolled` ==> `MouseCursor.uncontrolled`


**NavigationRailLabelType**

Plain string that must be one of:
* `all` ==> `NavigationRailLabelType.all`
* `none` ==> `NavigationRailLabelType.none`
* `selected` ==> `NavigationRailLabelType.selected`


**NotchedShape**

Plain string that must be one of:
* `circular` ==> `CircularNotchedRectangle`


**OutlinedBorder**
Requires a `type` value that must be one of:
* `stadium` ==> `BeveledRectangleBorder`
* `circle` ==> `CircleBorder`
* `rectangle` ==> `ContinuousRectangleBorder`
* `rounded` ==> `RoundedRectangleBorder`
* `stadium` ==> `StadiumBorder`


**PageTransitionsBuilder**

Plain string that must be one of:
* `clip` ==> `Overflow.clip`
* `visible` ==> `Overflow.visible`


**Radius**

Requires a `type` value that must be one of:
* `circular` ==> `Radius.circular`
* `elliptical` ==> `Radius.elliptical`
* `zero` ==> `Radius.zero`


**RangeSliderThumbShape**

Requires a `type` value that must be one of:
* `round` ==> `RoundRangeSliderThumbShape`


**RangeSliderTickMarkShape**

Plain string that must be one of:
Requires a `type` value that must be one of:
* `round` ==> `RoundRangeSliderTickMarkShape`


**RangeSliderTrackShape**

Plain string that must be one of:
* `rectangular` ==> `RectangularRangeSliderTrackShape`
* `rounded` ==> `RoundedRectRangeSliderTrackShape`


**RangeSliderValueIndicatorShape**

Requires a `type` value that must be one of:
* `paddle` ==> `PaddleRangeSliderValueIndicatorShape`
* `rectangular` ==> `RectangularRangeSliderValueIndicatorShape`


**Rect**

Requires a `type` value that must be one of:

* `center` ==> `Rect.fromCenter`
* `circle` ==> `Rect.fromCircle`
* `largest` ==> `Rect.largest`
* `ltrb` ==> `Rect.fromLTRB`
* `ltwh` ==> `Rect.fromLTWH`
* `points` ==> `Rect.fromPoints`
* `zero` ==> `Rect.zero`


**ScrollPhysics**

Requires a `type` value that must be one of:
* `always` ==> `AlwaysScrollableScrollPhysics`
* `bouncing` ==> `BouncingScrollPhysics`
* `clamping` ==> `ClampingScrollPhysics`
* `fixedExtent` ==> `FixedExtentScrollPhysics`
* `never` ==> `NeverScrollableScrollPhysics`
* `page` ==> `PageScrollPhysics`
* `rangeMaintaining` ==> `RangeMaintainingScrollPhysics`


**ScrollViewKeyboardDismissBehavior**

Plain string that must be one of:
* `manual` ==> `ScrollViewKeyboardDismissBehavior.manual`
* `onDrag` ==> `ScrollViewKeyboardDismissBehavior.onDrag`


**ShapeBorder**

Requires a `type` value that must be one of:
* `circle` ==> `CircleBorder`
* `rectangle` ==> `ContinuousRectangleBorder`
* `rounded` ==> `RoundedRectangleBorder`


**ShowValueIndicator**

Plain string that must be one of:
* `always` ==> `ShowValueIndicator.always`
* `never` ==> `ShowValueIndicator.never`
* `onlyForContinuous` ==> `ShowValueIndicator.onlyForContinuous`
* `onlyForDiscrete` ==> `ShowValueIndicator.onlyForDiscrete`


**SliderComponentShape**

Plain string that must be one of:
* `noOverlay` ==> `SliderComponentShape.noOverlay`
* `noOverlay` ==> `SliderComponentShape.noOverlay`


**SliderTickMarkShape**

Plain string that must be one of:
* `noTickMark` ==> `SliderTickMarkShape.noTickMark`


**SliderTrackShape**

Plain string that must be one of:
* `rectangular` ==> `RectangularSliderTrackShape`
* `rounded` ==> `RoundedRectSliderTrackShape`


**SmartDashesType**

Plain string that must be one of:
* `disabled` ==> `SmartDashesType.disabled`
* `enabled` ==> `SmartDashesType.enabled`


**SmartQuotesType**

Plain string that must be one of:
* `disabled` ==> `SmartQuotesType.disabled`
* `enabled` ==> `SmartQuotesType.enabled`


**SnackBarBehavior**

Plain string that must be one of:
* `fixed` ==> `SnackBarBehavior.fixed`
* `floating` ==> `SnackBarBehavior.floating`


**StackFit**

Plain string that must be one of:
* `expand` ==> `StackFit.expand`
* `loose` ==> `StackFit.loose`
* `passthrough` ==> `StackFit.passthrough`


**TabBarIndicatorSize**

Plain string that must be one of:
* `label` ==> `ButtonTextTheme.label`
* `tab` ==> `ButtonTextTheme.tab`


**TargetPlatform**

Plain string that must be one of:
* `android` ==> `TargetPlatform.android`
* `fuchsia` ==> `TargetPlatform.fuchsia`
* `iOS` ==> `TargetPlatform.iOS`
* `linux` ==> `TargetPlatform.linux`
* `macOS` ==> `TargetPlatform.macOS`
* `windows` ==> `TargetPlatform.windows`


**TextAlign**

Plain string that must be one of:
* `center` ==> `TextAlign.center`
* `end` ==> `TextAlign.end`
* `justify` ==> `TextAlign.justify`
* `left` ==> `TextAlign.left`
* `right` ==> `TextAlign.right`
* `start` ==> `TextAlign.start`


**TextAlignVertical**

Plain string that must be one of:
* `bottom` ==> `TextAlignVertical.bottom`
* `center` ==> `TextAlignVertical.center`
* `top` ==> `TextAlignVertical.top`


**TextBaseline**

Plain string that must be one of:
* `alphabetic` ==> `TextBaseline.alphabetic`
* `ideographic` ==> `TextBaseline.ideographic`


**TextCapitalization**

Plain string that must be one of:
* `characters` ==> `TextCapitalization.characters`
* `none` ==> `TextCapitalization.none`
* `sentences` ==> `TextCapitalization.sentences`
* `words` ==> `TextCapitalization.words`


**TextDecoration**

Plain string that must be one of:
* `lineThrough` ==> `TextDecoration.lineThrough`
* `none` ==> `TextDecoration.none`
* `overline` ==> `TextDecoration.overline`
* `underline` ==> `TextDecoration.underline`


**TextDecorationStyle**

Plain string that must be one of:
* `dashed` ==> `TextDecorationStyle.dashed`
* `dotted` ==> `TextDecorationStyle.dotted`
* `double` ==> `TextDecorationStyle.double`
* `solid` ==> `TextDecorationStyle.solid`
* `wavy` ==> `TextDecorationStyle.wavy`


**TextDirection**

Plain string that must be one of:
* `ltr` ==> `TextDirection.ltr`
* `rtl` ==> `TextDirection.rtl`


**TextInputAction**

Plain string that must be one of:
* `continueAction` ==> `TextInputAction.continueAction`
* `done` ==> `TextInputAction.done`
* `emergencyCall` ==> `TextInputAction.emergencyCall`
* `go` ==> `TextInputAction.go`
* `join` ==> `TextInputAction.join`
* `newline` ==> `TextInputAction.newline`
* `next` ==> `TextInputAction.next`
* `none` ==> `TextInputAction.none`
* `previous` ==> `TextInputAction.previous`
* `route` ==> `TextInputAction.route`
* `search` ==> `TextInputAction.search`
* `send` ==> `TextInputAction.send`
* `unspecified` ==> `TextInputAction.unspecified`


**TextInputType**

Plain string that must be one of:
* `datetime` ==> `TextInputType.datetime`
* `emailAddress` ==> `TextInputType.emailAddress`
* `multiline` ==> `TextInputType.multiline`
* `name` ==> `TextInputType.name`
* `number` ==> `TextInputType.number`
* `phone` ==> `TextInputType.phone`
* `streetAddress` ==> `TextInputType.streetAddress`
* `text` ==> `TextInputType.text`
* `url` ==> `TextInputType.url`
* `visiblePassword` ==> `TextInputType.visiblePassword`


**TextOverflow**

Plain string that must be one of:
* `clip` ==> `TextOverflow.clip`
* `ellipsis` ==> `TextOverflow.ellipsis`
* `fade` ==> `TextOverflow.fade`
* `visible` ==> `TextOverflow.visible`


**TextWidthBasis**

Plain string that must be one of:
* `longestLine` ==> `TextWidthBasis.longestLine`
* `parent` ==> `TextWidthBasis.parent`


**TileMode**

Plain string that must be one of:
* `clamp` ==> `TileMode.clamp`
* `decal` ==> `TileMode.decal`
* `mirror` ==> `TileMode.mirror`
* `repeated` ==> `TileMode.repeated`


**VerticalDirection**

Plain string that must be one of:
* `down` ==> `VerticalDirection.down`
* `up` ==> `VerticalDirection.up`


**VisualDensity**

Plain string that must be one of:
* `adaptivePlatformDensity` ==> `VisualDensity.adaptivePlatformDensity`
* `comfortable` ==> `VisualDensity.comfortable`
* `compact` ==> `VisualDensity.compact`
* `standard` ==> `VisualDensity.standard`

