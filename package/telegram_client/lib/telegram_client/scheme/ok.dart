// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions unused_import
import "json_dart.dart";
// import "dart:convert";

class Ok extends JsonScheme {
  Ok(super.rawData);

  static Map get defaultData {
    return {"@type": "ok", "@extra": ""};
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

  static Ok create({
    String special_type = "ok",
    String special_extra = "",
  }) {
    // Ok ok = Ok({
    Map ok_data_create_json = {
      "@type": special_type,
      "@extra": special_extra,
    };

    ok_data_create_json.removeWhere((key, value) => value == null);
    Ok ok_data_create = Ok(ok_data_create_json);

    return ok_data_create;
  }
}
