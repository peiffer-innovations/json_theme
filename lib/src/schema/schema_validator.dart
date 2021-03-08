import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_schema2/json_schema2.dart';
import 'package:json_theme/json_theme_schemas.dart';

/// Schema validator that can validate the JSON Theme objects while also being
/// able to be extended to also perform validation against schemas that include
/// JSON Theme objects.
class SchemaValidator {
  /// Sets whether or not the validator is enabled globally or not.  Set to
  /// [false] to disable validation across the entire application.  This cannot
  /// be used to globally enable validation.  Rather it can be used only to
  /// globally disable validation.  A value of [true] can still be overridden
  /// by values passed to [validate].  But a value of [false] will ensure that
  /// [validate] always skips the validation.
  static bool enabled = true;

  static bool _initialized = false;

  /// Validates the given [schemaId] against the given [value].  If the
  /// optional [validate] parameter is not [true] then this will no-op and
  /// immediately return with [true].
  ///
  /// It should be noted that this validation is a relatively expensive
  /// operation.  For that reason, this defaults to performing the validation
  /// when in the debug build and skipping validation for release builds.  This
  /// optimization can be overridden by setting [debugOnly] to [false].
  ///
  /// As a note, if the [enabled] value is [false] then both the [debugOnly] and
  /// the [validate] values will be ignored and validation will always be
  /// skipped.
  static bool validate({
    bool debugOnly = true,
    required String schemaId,
    required dynamic value,
    bool validate = true,
  }) {
    var result = true;
    if (enabled == true) {
      if (validate == true) {
        if (_initialized != true) {
          _initialized = true;
          SchemaCache().addSchemas(Schemas.all);
        }

        if (debugOnly == true) {
          assert(() {
            result = _validate(
              schemaId: schemaId,
              value: value,
            );

            return true;
          }());
        } else {
          result = _validate(
            schemaId: schemaId,
            value: value,
          );
        }
      }
    }

    return result;
  }

  static bool _validate({
    required String schemaId,
    required dynamic value,
  }) {
    if (schemaId.endsWith('.json') != true) {
      schemaId += '.json';
    }
    var result = true;
    RefProvider? refProvider;
    refProvider = (String ref) {
      var schema = SchemaCache().getSchema(ref);
      if (schema == null) {
        throw Exception('Unable to find schema: $ref');
      }

      return JsonSchema.createSchema(
        schema,
        refProvider: refProvider,
      );
    };

    var schemaData = SchemaCache().getSchema(schemaId)!;
    var jsonSchema = JsonSchema.createSchema(
      schemaData,
      refProvider: refProvider,
    );

    var removed = value is Map
        ? JsonClass.removeNull(Map<String, dynamic>.from(value))
        : value;

    if (removed == null && value is Map) {
      removed = {};
    }

    var errors = jsonSchema.validateWithErrors(removed);
    if (errors.isNotEmpty == true) {
      result = false;
      var errorStr =
          'Value: ${json.encode(value)}\n\nSchema Error: $schemaId\n';
      for (var error in errors) {
        errorStr += ' * [${error.schemaPath}]: ${error.message}\n';
      }

      FlutterError.reportError(
        FlutterErrorDetails(
          exception: Exception(errorStr),
        ),
      );
    }

    return result;
  }
}
