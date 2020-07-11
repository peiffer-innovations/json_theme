import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_schema/json_schema.dart';
import 'package:meta/meta.dart';

import 'schemas.dart';

class SchemaValidator {
  static bool validate({
    @required String schema,
    @required dynamic value,
    bool validate = true,
  }) {
    var result = true;
    assert(() {
      if (validate == true) {
        RefProvider refProvider;
        refProvider = (String ref) {
          if (Schemas.all.containsKey(ref) != true) {
            throw Exception('Unable to find schema: $ref');
          }

          return JsonSchema.createSchema(
            Schemas.all[ref],
            refProvider: refProvider,
          );
        };

        var url = 'https://peifferinnovations.com/json_theme/schemas/$schema';
        var schemaData = Schemas.all[url];
        assert(schemaData != null, 'Cannot find schema: $url');
        var jsonSchema = JsonSchema.createSchema(
          schemaData,
          refProvider: refProvider,
        );

        var errors = jsonSchema.validateWithErrors(value is Map
            ? JsonClass.removeNull(Map<String, dynamic>.from(value))
            : value);
        if (errors?.isNotEmpty == true) {
          result = false;
          var errorStr =
              'Value: ${json.encode(value)}\n\nSchema Error: ${schema}\n';
          for (var error in errors) {
            errorStr += ' * [${error.schemaPath}]: ${error.message}\n';
          }

          FlutterError.reportError(
            FlutterErrorDetails(
              exception: Exception(errorStr),
            ),
          );
        }
      }

      return true;
    }());

    return result;
  }
}
