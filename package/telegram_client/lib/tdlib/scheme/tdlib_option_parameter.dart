// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

class TdlibOptionParameter extends JsonScheme {
  TdlibOptionParameter(super.rawData);

  static Map get defaultData {
    return {
      "@type": "tdlibOptionParameter",
      "api_id": 0,
      "api_hash": "",
      "database_directory": "tg_db",
      "files_directory": "tg_file",
      "use_file_database": true,
      "use_chat_info_database": true,
      "use_message_database": true,
      "use_secret_chats": true,
      "enable_storage_optimizer": true,
      "system_language_code": "en",
      "new_verbosity_level": 0,
      "application_version": "v1",
      "device_model": "Telegram Client",
      "system_version":
          "Linux 6.8.0-31-generic #31-Ubuntu SMP PREEMPT_DYNAMIC Sat Apr 20 00:40:06 UTC 2024",
      "database_key": "",
      "start": true,
      "database_encryption_key": "",
      "use_test_dc": false
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

  set special_type(String? value) {
    rawData["@type"] = value;
  }

  num? get api_id {
    try {
      if (rawData["api_id"] is num == false) {
        return null;
      }
      return rawData["api_id"] as num;
    } catch (e) {
      return null;
    }
  }

  set api_id(num? value) {
    rawData["api_id"] = value;
  }

  String? get api_hash {
    try {
      if (rawData["api_hash"] is String == false) {
        return null;
      }
      return rawData["api_hash"] as String;
    } catch (e) {
      return null;
    }
  }

  set api_hash(String? value) {
    rawData["api_hash"] = value;
  }

  String? get database_directory {
    try {
      if (rawData["database_directory"] is String == false) {
        return null;
      }
      return rawData["database_directory"] as String;
    } catch (e) {
      return null;
    }
  }

  set database_directory(String? value) {
    rawData["database_directory"] = value;
  }

  String? get files_directory {
    try {
      if (rawData["files_directory"] is String == false) {
        return null;
      }
      return rawData["files_directory"] as String;
    } catch (e) {
      return null;
    }
  }

  set files_directory(String? value) {
    rawData["files_directory"] = value;
  }

  bool? get use_file_database {
    try {
      if (rawData["use_file_database"] is bool == false) {
        return null;
      }
      return rawData["use_file_database"] as bool;
    } catch (e) {
      return null;
    }
  }

  set use_file_database(bool? value) {
    rawData["use_file_database"] = value;
  }

  bool? get use_chat_info_database {
    try {
      if (rawData["use_chat_info_database"] is bool == false) {
        return null;
      }
      return rawData["use_chat_info_database"] as bool;
    } catch (e) {
      return null;
    }
  }

  set use_chat_info_database(bool? value) {
    rawData["use_chat_info_database"] = value;
  }

  bool? get use_message_database {
    try {
      if (rawData["use_message_database"] is bool == false) {
        return null;
      }
      return rawData["use_message_database"] as bool;
    } catch (e) {
      return null;
    }
  }

  set use_message_database(bool? value) {
    rawData["use_message_database"] = value;
  }

  bool? get use_secret_chats {
    try {
      if (rawData["use_secret_chats"] is bool == false) {
        return null;
      }
      return rawData["use_secret_chats"] as bool;
    } catch (e) {
      return null;
    }
  }

  set use_secret_chats(bool? value) {
    rawData["use_secret_chats"] = value;
  }

  bool? get enable_storage_optimizer {
    try {
      if (rawData["enable_storage_optimizer"] is bool == false) {
        return null;
      }
      return rawData["enable_storage_optimizer"] as bool;
    } catch (e) {
      return null;
    }
  }

  set enable_storage_optimizer(bool? value) {
    rawData["enable_storage_optimizer"] = value;
  }

  String? get system_language_code {
    try {
      if (rawData["system_language_code"] is String == false) {
        return null;
      }
      return rawData["system_language_code"] as String;
    } catch (e) {
      return null;
    }
  }

  set system_language_code(String? value) {
    rawData["system_language_code"] = value;
  }

  num? get new_verbosity_level {
    try {
      if (rawData["new_verbosity_level"] is num == false) {
        return null;
      }
      return rawData["new_verbosity_level"] as num;
    } catch (e) {
      return null;
    }
  }

  set new_verbosity_level(num? value) {
    rawData["new_verbosity_level"] = value;
  }

  String? get application_version {
    try {
      if (rawData["application_version"] is String == false) {
        return null;
      }
      return rawData["application_version"] as String;
    } catch (e) {
      return null;
    }
  }

  set application_version(String? value) {
    rawData["application_version"] = value;
  }

  String? get device_model {
    try {
      if (rawData["device_model"] is String == false) {
        return null;
      }
      return rawData["device_model"] as String;
    } catch (e) {
      return null;
    }
  }

  set device_model(String? value) {
    rawData["device_model"] = value;
  }

  String? get system_version {
    try {
      if (rawData["system_version"] is String == false) {
        return null;
      }
      return rawData["system_version"] as String;
    } catch (e) {
      return null;
    }
  }

  set system_version(String? value) {
    rawData["system_version"] = value;
  }

  String? get database_key {
    try {
      if (rawData["database_key"] is String == false) {
        return null;
      }
      return rawData["database_key"] as String;
    } catch (e) {
      return null;
    }
  }

  set database_key(String? value) {
    rawData["database_key"] = value;
  }

  bool? get start {
    try {
      if (rawData["start"] is bool == false) {
        return null;
      }
      return rawData["start"] as bool;
    } catch (e) {
      return null;
    }
  }

  set start(bool? value) {
    rawData["start"] = value;
  }

  String? get database_encryption_key {
    try {
      if (rawData["database_encryption_key"] is String == false) {
        return null;
      }
      return rawData["database_encryption_key"] as String;
    } catch (e) {
      return null;
    }
  }

  set database_encryption_key(String? value) {
    rawData["database_encryption_key"] = value;
  }

  bool? get use_test_dc {
    try {
      if (rawData["use_test_dc"] is bool == false) {
        return null;
      }
      return rawData["use_test_dc"] as bool;
    } catch (e) {
      return null;
    }
  }

  set use_test_dc(bool? value) {
    rawData["use_test_dc"] = value;
  }

  static TdlibOptionParameter create({
    String special_type = "tdlibOptionParameter",
    num? api_id,
    String? api_hash,
    String? database_directory,
    String? files_directory,
    bool? use_file_database,
    bool? use_chat_info_database,
    bool? use_message_database,
    bool? use_secret_chats,
    bool? enable_storage_optimizer,
    String? system_language_code,
    num? new_verbosity_level,
    String? application_version,
    String? device_model,
    String? system_version,
    String? database_key,
    bool? start,
    String? database_encryption_key,
    bool? use_test_dc,
  }) {
    // TdlibOptionParameter tdlibOptionParameter = TdlibOptionParameter({
    Map tdlibOptionParameter_data_create_json = {
      "@type": special_type,
      "api_id": api_id,
      "api_hash": api_hash,
      "database_directory": database_directory,
      "files_directory": files_directory,
      "use_file_database": use_file_database,
      "use_chat_info_database": use_chat_info_database,
      "use_message_database": use_message_database,
      "use_secret_chats": use_secret_chats,
      "enable_storage_optimizer": enable_storage_optimizer,
      "system_language_code": system_language_code,
      "new_verbosity_level": new_verbosity_level,
      "application_version": application_version,
      "device_model": device_model,
      "system_version": system_version,
      "database_key": database_key,
      "start": start,
      "database_encryption_key": database_encryption_key,
      "use_test_dc": use_test_dc,
    };

    tdlibOptionParameter_data_create_json
        .removeWhere((key, value) => value == null);
    TdlibOptionParameter tdlibOptionParameter_data_create =
        TdlibOptionParameter(tdlibOptionParameter_data_create_json);

    return tdlibOptionParameter_data_create;
  }
}
