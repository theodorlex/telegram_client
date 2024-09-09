// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

class TelegramClientLibraryError extends JsonScheme {
  TelegramClientLibraryError(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {
      "@type": "telegramClientLibraryError",
      "code": 500,
      "message": "",
      "description": "",
      "@extra": ""
    };
  }

  /// create [TelegramClientLibraryError]
  /// Empty
  static TelegramClientLibraryError empty() {
    return TelegramClientLibraryError({});
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

  set special_type(String? value) {
    rawData["@type"] = value;
  }

  num? get code {
    try {
      if (rawData["code"] is num == false) {
        return null;
      }
      return rawData["code"] as num;
    } catch (e) {
      return null;
    }
  }

  set code(num? value) {
    rawData["code"] = value;
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

  set message(String? value) {
    rawData["message"] = value;
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

  set description(String? value) {
    rawData["description"] = value;
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

  set special_extra(String? value) {
    rawData["@extra"] = value;
  }

  static TelegramClientLibraryError create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "telegramClientLibraryError",
    num? code,
    String? message,
    String? description,
    String special_extra = "",
  }) {
    // TelegramClientLibraryError telegramClientLibraryError = TelegramClientLibraryError({
    final Map telegramClientLibraryError_data_create_json = {
      "@type": special_type,
      "code": code,
      "message": message,
      "description": description,
      "@extra": special_extra,
    };

    telegramClientLibraryError_data_create_json
        .removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (telegramClientLibraryError_data_create_json.containsKey(key) ==
            false) {
          telegramClientLibraryError_data_create_json[key] = value;
        }
      });
    }
    return TelegramClientLibraryError(
        telegramClientLibraryError_data_create_json);
  }
}
