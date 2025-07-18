// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show experimental;

/// Helper class that allows to expose values of [WidgetPropertyResolver] in
/// form of type-safe [Map<WidgetState?, T>] instead of `Instance of
/// '_WidgetStatePropertyWith'` via toString() call.
@immutable
class JsonWidgetStateProperty<T extends Object>
    implements WidgetStateProperty<T?> {
  const JsonWidgetStateProperty(this.map);

  /// Map containing [WidgetState?] and it's corresponding [T] values.
  final Map<WidgetState?, T> map;

  bool get _hasValues => map.values.whereType<T>().isNotEmpty;

  /// Copies the behavior of the ThemeDecoder's `decodeWidgetStateProperty*`
  /// through [WidgetState.values].
  @experimental
  @override
  T? resolve(Set<WidgetState> states) {
    if (!_hasValues) return null;
    for (final s in WidgetState.values) if (states.contains(s)) return map[s];
    return map[null];
  }

  @override
  String toString() {
    if (!_hasValues) return null.toString();
    final sb = StringBuffer('JsonWidgetStateProperty({');
    for (final entry in map.entries) sb.write('${entry.key}: ${entry.value}, ');
    return '${sb.toString().trimRight()}})';
  }
}
