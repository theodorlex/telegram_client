// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

class TelegramClientLibraryOk extends JsonScheme {
  TelegramClientLibraryOk(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {"@type": "telegramClientLibraryOk", "@extra": ""};
  }

  /// create [TelegramClientLibraryOk]
  /// Empty
  static TelegramClientLibraryOk empty() {
    return TelegramClientLibraryOk({});
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

  static TelegramClientLibraryOk create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "telegramClientLibraryOk",
    String special_extra = "",
  }) {
    // TelegramClientLibraryOk telegramClientLibraryOk = TelegramClientLibraryOk({
    final Map telegramClientLibraryOk_data_create_json = {
      "@type": special_type,
      "@extra": special_extra,
    };

    telegramClientLibraryOk_data_create_json
        .removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (telegramClientLibraryOk_data_create_json.containsKey(key) ==
            false) {
          telegramClientLibraryOk_data_create_json[key] = value;
        }
      });
    }
    return TelegramClientLibraryOk(telegramClientLibraryOk_data_create_json);
  }
}
