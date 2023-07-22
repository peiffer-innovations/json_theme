import 'package:flutter/material.dart';

class JsonMaterialStateProperty<T> implements MaterialStateProperty<T> {
  JsonMaterialStateProperty(this._resolve);

  final MaterialPropertyResolver<T> _resolve;

  @override
  T resolve(Set<MaterialState> states) => _resolve(states);

  static MaterialStateProperty<T> resolveWith<T>(MaterialPropertyResolver<T> callback) =>
      JsonMaterialStateProperty<T>(callback);

  @override
  String toString() {
    final sb = StringBuffer();
    MaterialState.values.forEach((state) => sb.write('$state: ${_resolve({state})}\n'));
    return sb.toString();
  }
}
