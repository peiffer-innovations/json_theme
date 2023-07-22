// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

class JsonMaterialStateProperty<T> implements MaterialStateProperty<T> {
  JsonMaterialStateProperty(this._resolve);

  final MaterialPropertyResolver<T> _resolve;

  @override
  T resolve(Set<MaterialState> states) => _resolve(states);

  static MaterialStateProperty<T> resolveWith<T>(MaterialPropertyResolver<T> callback) =>
      JsonMaterialStateProperty<T>(callback);

  static MaterialStateProperty<T?> fromMap<T>(Map<MaterialState, T?> map) =>
      JsonMaterialStateProperty<T?>((states) => _fromMap<T?>(states, map));

  static T? _fromMap<T>(Set<MaterialState> states, Map<MaterialState, T?> map) {
    T? result;
    if (states.contains(MaterialState.disabled)) {
      result = map[MaterialState.disabled];
    } else if (states.contains(MaterialState.dragged)) {
      result = map[MaterialState.dragged];
    } else if (states.contains(MaterialState.error)) {
      result = map[MaterialState.error];
    } else if (states.contains(MaterialState.focused)) {
      result = map[MaterialState.focused];
    } else if (states.contains(MaterialState.pressed)) {
      result = map[MaterialState.pressed];
    } else if (states.contains(MaterialState.hovered)) {
      result = map[MaterialState.hovered];
    } else if (states.contains(MaterialState.scrolledUnder)) {
      result = map[MaterialState.scrolledUnder];
    } else if (states.contains(MaterialState.selected)) {
      result = map[MaterialState.selected];
    } else {
      result = map.values.first;
    }

    return result;
  }

  @override
  String toString() {
    final map = <MaterialState, T?>{};
    for (final state in MaterialState.values) map[state] = _resolve({state});
    map.removeWhere((_, value) => value == null);
    final sb = StringBuffer('${runtimeType}.fromMap<$T>({');
    if (map.isNotEmpty) {
      for (final en in map.entries) sb.write('${en.key}: ${en.value}, ');
    }

    return '${sb.toString().trimRight()}})';
  }
}
