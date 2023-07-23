// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show experimental;

/// Helper class that allows to expose values of [MaterialPropertyResolver] in
/// form of type-safe [Map<MaterialState?, T>] instead of `Instance of
/// '_MaterialStatePropertyWith'` via toString() call.
@immutable
class JsonMaterialStateProperty<T extends Object>
    implements MaterialStateProperty<T?> {
  const JsonMaterialStateProperty(this.map);

  final Map<MaterialState?, T> map;

  bool get _hasValues => map.values.whereType<T>().isNotEmpty;

  /// Partially copies the behavior of the ThemeDecoder's
  /// `decodeMaterialStateProperty*` through [MaterialState.values].
  @experimental
  @override
  T? resolve(Set<MaterialState> states) {
    if (!_hasValues) return null;
    for (final s in MaterialState.values) if (states.contains(s)) return map[s];
    return map[null];
  }

  @override
  String toString() {
    if (!_hasValues) return null.toString();
    final sb = StringBuffer('JsonMaterialStateProperty({');
    for (final entry in map.entries) sb.write('${entry.key}: ${entry.value}, ');
    return '${sb.toString().trimRight()}})';
  }
}
