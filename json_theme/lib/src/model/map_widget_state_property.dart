import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show internal;

import 'json_widget_state_property.dart';

/// Helper class that does not break [WidgetStateProperty] resolveWith
/// contract and on the other hand exposes values as [JsonWidgetStateProperty]
/// instead of `Instance of '_WidgetStatePropertyWith'` via toString() call.
@internal
@immutable
class MapWidgetStateProperty<R extends Object, T extends R?>
    implements WidgetStateProperty<T> {
  /// Class is internal, means that it not a part of the public API.
  const MapWidgetStateProperty(this._resolve);

  final WidgetPropertyResolver<T> _resolve;

  /// Convenience method for creating a [WidgetStateProperty] from a
  /// [WidgetPropertyResolver] function alone.
  ///
  /// Copied from [WidgetStateProperty].
  static WidgetStateProperty<T> resolveWith<R extends Object, T extends R?>(
    WidgetPropertyResolver<T> callback,
  ) =>
      MapWidgetStateProperty<R, T>(callback);

  @override
  T resolve(Set<WidgetState> states) => _resolve(states);

  @override
  String toString() {
    final map = <WidgetState?, T?>{};
    // ignore: curly_braces_in_flow_control_structures
    for (final state in WidgetState.values) map[state] = _resolve({state});
    map[null] = _resolve({}); // Covers "empty" case.

    return JsonWidgetStateProperty(_nonNullValueMap(map)).toString();
  }

  Map<WidgetState?, R> _nonNullValueMap(Map<WidgetState?, T?> map) {
    map.removeWhere((_, value) => value == null);

    return Map<WidgetState?, R>.unmodifiable(map);
  }
}
