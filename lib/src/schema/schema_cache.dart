import 'package:json_theme/json_theme_schemas.dart';

class SchemaCache {
  factory SchemaCache() => _instance;
  SchemaCache._internal();
  static final SchemaCache _instance = SchemaCache._internal();

  final Map<String, dynamic> _schemas = {};

  /// Adds a [schema] to the internal schema cache using the given [id] (or URL).
  void addSchema(String id, Map<String, dynamic> schema) =>
      _schemas[id] = schema;

  /// Adds multiple [schemas] to the internal schema cache.  The key to the
  /// [schemas] must be the URL / id and the value is the actual schema itself.
  void addSchemas(Map<String, Map<String, dynamic>> schemas) =>
      _schemas.addAll(schemas);

  /// Returns the schema for the given [id] from the internal schema cache.
  /// This will return [null] if no schema exists with the given [id].
  Map<String, dynamic> getSchema(String id) => Schemas.all[id] ?? _schemas[id];
}
