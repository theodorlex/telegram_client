// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';
import 'package:telegram_client/telegram_client/call_api_invoke.dart';
import 'package:general_lib/extension/regexp.dart';

import 'package:telegram_client/telegram_client/telegram_client.dart';
import 'package:telegram_client/util/util.dart';

/// method GetMe
extension GetMeDataOn on TelegramClient {
  /// method GetMe
  FutureOr<Map> getMe({
    required Map parameters,
    required TelegramClientCallApiInvoke callApiInvoke,
  }) async {
    Map get_user = await callApiInvoke(
      parameters: {"@type": "getMe"},
    );

    Map newScheme = {
      "@type": "user",
      "id": 0,
      "title": "",
      "first_name": "",
      "last_name": "",
      "username": "",
      "type": "",
      "is_forum": false,
      "active_usernames": [],
    };

    if (get_user["@type"] == "user") {
      newScheme["id"] = get_user["id"];
      if (get_user["type"] is Map) {
        newScheme["type"] = (get_user["type"]["@type"] as String)
            .replaceAll(RegExp(r"(userType)", caseSensitive: false), "")
            .toLowerCase();
      }

      newScheme["id"] = get_user["id"];
      try {
        if (RegExp("^userTypeBot\$", caseSensitive: false)
            .hashData(get_user["type"]["@type"])) {
          newScheme["is_bot"] = true;
        } else {
          newScheme["is_bot"] = false;
        }
      } catch (e) {
        newScheme["is_bot"] = false;
      }
      newScheme["first_name"] = get_user["first_name"];
      if (TgUtils.getBoolean(get_user["last_name"])) {
        newScheme["last_name"] = get_user["last_name"];
      }
      if (TgUtils.getBoolean(get_user["username"])) {
        newScheme["username"] = get_user["username"];
      }

      if (get_user["usernames"] is Map) {
        Map get_user_usernames = (get_user["usernames"] as Map);
        // newScheme["usernames"] = get_user["usernames"];
        if (get_user_usernames["active_usernames"] is List) {
          if ((get_user_usernames["active_usernames"] as List).isNotEmpty) {
            newScheme["active_usernames"] =
                (get_user_usernames["active_usernames"] as List);
            newScheme["username"] =
                (get_user_usernames["active_usernames"] as List).first;
          }
        }
      }

      if (TgUtils.getBoolean(get_user["phone_number"])) {
        newScheme["phone_number"] = get_user["phone_number"];
      }
      if (TgUtils.getBoolean(get_user["language_code"])) {
        newScheme["language_code"] = get_user["language_code"];
      }
      newScheme["detail"] = {
        "has_protected_content": get_user["has_protected_content"] ?? false,
        "is_marked_as_unread": get_user["is_marked_as_unread"] ?? false,
        "is_contact": get_user["is_contact"],
        "is_mutual_contact": get_user["is_mutual_contact"],
        "is_verified": get_user["is_verified"],
        "is_support": get_user["is_support"],
        "is_scam": get_user["is_scam"],
        "is_fake": get_user["is_fake"],
        "have_acces": get_user["have_access"],
      };
    }

    return newScheme;
  }
}
