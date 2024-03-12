// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions unused_import
import "json_dart.dart";
// import "dart:convert";

class UserTelegramLoginWidget extends JsonScheme {
  UserTelegramLoginWidget(super.rawData);

  static Map get defaultData {
    return {
      "@type": "userTelegramLoginWidget",
      "id": "",
      "first_name": "Gi",
      "username": "",
      "hash": "",
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

  String? get id {
    try {
      if (rawData["id"] is String == false) {
        return null;
      }
      return rawData["id"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get first_name {
    try {
      if (rawData["first_name"] is String == false) {
        return null;
      }
      return rawData["first_name"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get username {
    try {
      if (rawData["username"] is String == false) {
        return null;
      }
      return rawData["username"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get hash {
    try {
      if (rawData["hash"] is String == false) {
        return null;
      }
      return rawData["hash"] as String;
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

  static UserTelegramLoginWidget create({
    String special_type = "userTelegramLoginWidget",
    String? id,
    String? first_name,
    String? username,
    String? hash,
    String special_extra = "",
  }) {
    // UserTelegramLoginWidget userTelegramLoginWidget = UserTelegramLoginWidget({
    Map userTelegramLoginWidget_data_create_json = {
      "@type": special_type,
      "id": id,
      "first_name": first_name,
      "username": username,
      "hash": hash,
      "@extra": special_extra,
    };

    userTelegramLoginWidget_data_create_json
        .removeWhere((key, value) => value == null);
    UserTelegramLoginWidget userTelegramLoginWidget_data_create =
        UserTelegramLoginWidget(userTelegramLoginWidget_data_create_json);

    return userTelegramLoginWidget_data_create;
  }
}
