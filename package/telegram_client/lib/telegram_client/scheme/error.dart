// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions unused_import
import "json_dart.dart";
// import "dart:convert";

class Error extends JsonScheme {
  Error(super.rawData);

  static Map get defaultData {
    return {
      "@type": "error",
      "code": 500,
      "message": "",
      "description": "",
      "@extra": ""
    };
  }

  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  int? get code {
    try {
      if (rawData["code"] is int == false) {
        return null;
      }
      return rawData["code"] as int;
    } catch (e) {
      return null;
    }
  }

  String? get message {
    try {
      if (rawData["message"] is String == false) {
        return null;
      }
      return rawData["message"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get description {
    try {
      if (rawData["description"] is String == false) {
        return null;
      }
      return rawData["description"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get special_extra {
    try {
      if (rawData["@extra"] is String == false) {
        return null;
      }
      return rawData["@extra"] as String;
    } catch (e) {
      return null;
    }
  }

  static Error create({
    String special_type = "error",
    int? code,
    String? message,
    String? description,
    String special_extra = "",
  }) {
    // Error error = Error({
    Map error_data_create_json = {
      "@type": special_type,
      "code": code,
      "message": message,
      "description": description,
      "@extra": special_extra,
    };

    error_data_create_json.removeWhere((key, value) => value == null);
    Error error_data_create = Error(error_data_create_json);

    return error_data_create;
  }
}
