import 'package:flutter/material.dart';

import 'json_material_state_property.dart';

class MapMaterialStateProperty<R extends Object, T extends R?>
    implements MaterialStateProperty<T> {
  MapMaterialStateProperty(this._resolve);

  final MaterialPropertyResolver<T> _resolve;

  @override
  T resolve(Set<MaterialState> states) => _resolve(states);

  /// Convenience method for creating a [MaterialStateProperty] from a
  /// [MaterialPropertyResolver] function alone.
  ///
  /// Copied from [MaterialStateProperty].
  static MaterialStateProperty<T> resolveWith<R extends Object, T extends R?>(
    MaterialPropertyResolver<T> callback,
  ) =>
      MapMaterialStateProperty<R, T>(callback);

  Map<MaterialState, R> _nonNullValueMap(Map<MaterialState, T?> map) {
    map.removeWhere((_, value) => value == null);

    return Map<MaterialState, R>.unmodifiable(map);
  }

  @override
  String toString() {
    final map = <MaterialState, T?>{};
    // ignore: curly_braces_in_flow_control_structures
    for (final state in MaterialState.values) map[state] = _resolve({state});

    return JsonMaterialStateProperty(_nonNullValueMap(map)).toString();
  }
}
