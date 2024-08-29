// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

class TgClientClientData extends JsonScheme {
  TgClientClientData(super.rawData);

  static Map get defaultData {
    return {"@type": "tgClientClientData", "id": 0, "created_at": "2022-12-26T05:26:40.500935+00:00", "client_tg_user_id": 0, "client_title": "", "client_token": "", "owner_user_id": 0, "client_type": "", "from_bot_type": null, "can_join_groups": false, "can_read_all_group_messages": false, "from_bot_user_id": 0, "expire_date": 0, "client_username": "", "version": "", "client_id": 0, "client_data": "{}"};
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

  num? get id {
    try {
      if (rawData["id"] is num == false) {
        return null;
      }
      return rawData["id"] as num;
    } catch (e) {
      return null;
    }
  }

  set id(num? value) {
    rawData["id"] = value;
  }

  String? get created_at {
    try {
      if (rawData["created_at"] is String == false) {
        return null;
      }
      return rawData["created_at"] as String;
    } catch (e) {
      return null;
    }
  }

  set created_at(String? value) {
    rawData["created_at"] = value;
  }

  num? get client_tg_user_id {
    try {
      if (rawData["client_tg_user_id"] is num == false) {
        return null;
      }
      return rawData["client_tg_user_id"] as num;
    } catch (e) {
      return null;
    }
  }

  set client_tg_user_id(num? value) {
    rawData["client_tg_user_id"] = value;
  }

  String? get client_title {
    try {
      if (rawData["client_title"] is String == false) {
        return null;
      }
      return rawData["client_title"] as String;
    } catch (e) {
      return null;
    }
  }

  set client_title(String? value) {
    rawData["client_title"] = value;
  }

  String? get client_token {
    try {
      if (rawData["client_token"] is String == false) {
        return null;
      }
      return rawData["client_token"] as String;
    } catch (e) {
      return null;
    }
  }

  set client_token(String? value) {
    rawData["client_token"] = value;
  }

  num? get owner_user_id {
    try {
      if (rawData["owner_user_id"] is num == false) {
        return null;
      }
      return rawData["owner_user_id"] as num;
    } catch (e) {
      return null;
    }
  }

  set owner_user_id(num? value) {
    rawData["owner_user_id"] = value;
  }

  String? get client_type {
    try {
      if (rawData["client_type"] is String == false) {
        return null;
      }
      return rawData["client_type"] as String;
    } catch (e) {
      return null;
    }
  }

  set client_type(String? value) {
    rawData["client_type"] = value;
  }

  Object? get from_bot_type {
    try {
      if (rawData["from_bot_type"] is Object == false) {
        return null;
      }
      return rawData["from_bot_type"] as Object;
    } catch (e) {
      return null;
    }
  }

  set from_bot_type(Object? value) {
    rawData["from_bot_type"] = value;
  }

  bool? get can_join_groups {
    try {
      if (rawData["can_join_groups"] is bool == false) {
        return null;
      }
      return rawData["can_join_groups"] as bool;
    } catch (e) {
      return null;
    }
  }

  set can_join_groups(bool? value) {
    rawData["can_join_groups"] = value;
  }

  bool? get can_read_all_group_messages {
    try {
      if (rawData["can_read_all_group_messages"] is bool == false) {
        return null;
      }
      return rawData["can_read_all_group_messages"] as bool;
    } catch (e) {
      return null;
    }
  }

  set can_read_all_group_messages(bool? value) {
    rawData["can_read_all_group_messages"] = value;
  }

  num? get from_bot_user_id {
    try {
      if (rawData["from_bot_user_id"] is num == false) {
        return null;
      }
      return rawData["from_bot_user_id"] as num;
    } catch (e) {
      return null;
    }
  }

  set from_bot_user_id(num? value) {
    rawData["from_bot_user_id"] = value;
  }

  num? get expire_date {
    try {
      if (rawData["expire_date"] is num == false) {
        return null;
      }
      return rawData["expire_date"] as num;
    } catch (e) {
      return null;
    }
  }

  set expire_date(num? value) {
    rawData["expire_date"] = value;
  }

  String? get client_username {
    try {
      if (rawData["client_username"] is String == false) {
        return null;
      }
      return rawData["client_username"] as String;
    } catch (e) {
      return null;
    }
  }

  set client_username(String? value) {
    rawData["client_username"] = value;
  }

  String? get version {
    try {
      if (rawData["version"] is String == false) {
        return null;
      }
      return rawData["version"] as String;
    } catch (e) {
      return null;
    }
  }

  set version(String? value) {
    rawData["version"] = value;
  }

  num? get client_id {
    try {
      if (rawData["client_id"] is num == false) {
        return null;
      }
      return rawData["client_id"] as num;
    } catch (e) {
      return null;
    }
  }

  set client_id(num? value) {
    rawData["client_id"] = value;
  }

  String? get client_data {
    try {
      if (rawData["client_data"] is String == false) {
        return null;
      }
      return rawData["client_data"] as String;
    } catch (e) {
      return null;
    }
  }

  set client_data(String? value) {
    rawData["client_data"] = value;
  }

  static TgClientClientData create({
    String special_type = "tgClientClientData",
    num? id,
    String? created_at,
    num? client_tg_user_id,
    String? client_title,
    String? client_token,
    num? owner_user_id,
    String? client_type,
    Object? from_bot_type,
    bool? can_join_groups,
    bool? can_read_all_group_messages,
    num? from_bot_user_id,
    num? expire_date,
    String? client_username,
    String? version,
    num? client_id,
    String? client_data,
  }) {
    // TgClientClientData tgClientClientData = TgClientClientData({
    Map tgClientClientData_data_create_json = {
      "@type": special_type,
      "id": id,
      "created_at": created_at,
      "client_tg_user_id": client_tg_user_id,
      "client_title": client_title,
      "client_token": client_token,
      "owner_user_id": owner_user_id,
      "client_type": client_type,
      "from_bot_type": from_bot_type,
      "can_join_groups": can_join_groups,
      "can_read_all_group_messages": can_read_all_group_messages,
      "from_bot_user_id": from_bot_user_id,
      "expire_date": expire_date,
      "client_username": client_username,
      "version": version,
      "client_id": client_id,
      "client_data": client_data,
    };

    tgClientClientData_data_create_json.removeWhere((key, value) => value == null);
    TgClientClientData tgClientClientData_data_create = TgClientClientData(tgClientClientData_data_create_json);

    return tgClientClientData_data_create;
  }
}
