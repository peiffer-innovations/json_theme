import 'package:flutter/material.dart' as material;
import 'package:flutter/rendering.dart' as rendering;

class FontFeatureCodec extends material.FontFeature {
  FontFeatureCodec({required String feature, int value = 1})
    : super(feature, value);
}

class FontVariationCodec extends material.FontVariation {
  FontVariationCodec({required String axis, required double value})
    : super(axis, value);
}

class GradientTransformCodec extends material.GradientRotation {
  const GradientTransformCodec({required double radians}) : super(radians);
}

class IconDataCodec extends material.IconData {
  const IconDataCodec({
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

class LocaleCodec extends material.Locale {
  LocaleCodec({String? countryCode, required String languageCode})
    : super(languageCode, countryCode);
}

class OffsetCodec extends material.Offset {
  const OffsetCodec({required double dx, required double dy}) : super(dx, dy);

  static const zero = OffsetCodec(dx: 0.0, dy: 0.0);
}

class OrdinalSortKeyCodec extends rendering.OrdinalSortKey {
  const OrdinalSortKeyCodec({String? name, required double order})
    : super(order, name: name);
}

class SemanticsTagCodec extends rendering.SemanticsTag {
  SemanticsTagCodec({required String name}) : super(name);
}

class SizeCodec extends material.Size {
  SizeCodec({required double height, required double width})
    : super(width, height);
}
