import 'package:flutter/material.dart' as material;
import 'package:flutter/rendering.dart' as rendering;

class FontFeature extends material.FontFeature {
  FontFeature({required String feature, int value = 1}) : super(feature, value);
}

class FontVariation extends material.FontVariation {
  FontVariation({required String axis, required double value})
    : super(axis, value);
}

class GradientTransform extends material.GradientRotation {
  const GradientTransform({required double radians}) : super(radians);
}

class IconData extends material.IconData {
  const IconData({
    required int codePoint,
    String? fontFamily,
    String? fontPackage,
    bool matchTextDirection = false,
  }) : super(
         codePoint,
         fontFamily: fontFamily,
         fontPackage: fontPackage,
         matchTextDirection: matchTextDirection,
       );
}

class Locale extends material.Locale {
  Locale({String? countryCode, required String languageCode})
    : super(languageCode, countryCode);
}

class Offset extends material.Offset {
  const Offset({required double dx, required double dy}) : super(dx, dy);

  static const zero = Offset(dx: 0.0, dy: 0.0);
}

class OrdinalSortKey extends rendering.OrdinalSortKey {
  const OrdinalSortKey({String? name, required double order})
    : super(order, name: name);
}

class SemanticsTag extends rendering.SemanticsTag {
  SemanticsTag({required String name}) : super(name);
}

class Size extends material.Size {
  Size({required double height, required double width}) : super(width, height);
}
