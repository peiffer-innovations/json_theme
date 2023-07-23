// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

typedef _MapStates<T> = Map<MaterialState, T>;

class JsonMaterialStateProperty<T extends Object>
    implements MaterialStateProperty<T?> {
  const JsonMaterialStateProperty(this.map);

  final _MapStates<T> map;

  bool get _hasValues => map.values.whereType<T>().isNotEmpty;

  @override
  T? resolve(Set<MaterialState> states) {
    if (states.isEmpty || !_hasValues) return null;
    for (final s in MaterialState.values) if (states.contains(s)) return map[s];
    return null;
  }

  @override
  String toString() {
    if (!_hasValues) return null.toString();
    final sb = StringBuffer('JsonMaterialStateProperty({');
    for (final en in map.entries) sb.write('${en.key}: ${en.value}, ');
    return '${sb.toString().trimRight()}})';
  }
}
