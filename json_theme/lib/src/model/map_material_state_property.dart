import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show internal;

import 'json_material_state_property.dart';

/// Helper class that does not break [MaterialStateProperty] resolveWith
/// contract and on the other hand exposes values as [JsonMaterialStateProperty]
/// instead of `Instance of '_MaterialStatePropertyWith'` via toString() call.
@internal
@immutable
class MapMaterialStateProperty<R extends Object, T extends R?>
    implements MaterialStateProperty<T> {
  /// Class is internal, means that it not a part of the public API.
  MapMaterialStateProperty(this._resolve);

  final MaterialPropertyResolver<T> _resolve;

  /// Convenience method for creating a [MaterialStateProperty] from a
  /// [MaterialPropertyResolver] function alone.
  ///
  /// Copied from [MaterialStateProperty].
  static MaterialStateProperty<T> resolveWith<R extends Object, T extends R?>(
    MaterialPropertyResolver<T> callback,
  ) =>
      MapMaterialStateProperty<R, T>(callback);

  @override
  T resolve(Set<MaterialState> states) => _resolve(states);

  @override
  String toString() {
    final map = <MaterialState?, T?>{};
    // ignore: curly_braces_in_flow_control_structures
    for (final state in MaterialState.values) map[state] = _resolve({state});
    map[null] = _resolve({}); // Covers "empty" case.

    return JsonMaterialStateProperty(_nonNullValueMap(map)).toString();
  }

  Map<MaterialState?, R> _nonNullValueMap(Map<MaterialState?, T?> map) {
    map.removeWhere((_, value) => value == null);

    return Map<MaterialState?, R>.unmodifiable(map);
  }
}
