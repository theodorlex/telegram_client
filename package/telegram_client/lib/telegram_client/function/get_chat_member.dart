/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';
import 'package:telegram_client/telegram_client/call_api_invoke.dart';
import 'package:general_lib/extension/regexp.dart';

import 'package:telegram_client/telegram_client/telegram_client.dart';
import 'package:telegram_client/util/util.dart';

/// method GetChatMember
extension GetChatMemberDataOn on TelegramClient {
  /// method GetChatMember
  FutureOr<Map> getChatMember({
    required Map parameters,
    required TelegramClientCallApiInvoke callApiInvoke,
  }) async {
    dynamic target_chat_id = TgUtils.parse_all_chat_id(parameters: parameters);
    if (target_chat_id is String &&
        RegExp(r"^((@)[a-z0-9_]+)$", caseSensitive: false)
            .hashData(target_chat_id)) {
      var search_public_chat = await callApiInvoke(
        parameters: {
          "@type": "searchPublicChat",
          "username": (target_chat_id)
              .replaceAll(RegExp(r"@", caseSensitive: false), ""),
        },
        is_invoke_no_relevance: true,
      );
      if (search_public_chat["@type"] == "chat") {
        parameters["chat_id"] = search_public_chat["id"];
      } else {
        return search_public_chat;
      }
    }
    Map request_parameters = {
      "@type": "getChatMember",
      "chat_id": parameters["chat_id"],
      "member_id": {
        "@type": "messageSenderUser",
        "user_id": parameters["user_id"],
      },
    };
    Map request_result = await callApiInvoke(
      parameters: request_parameters,
    );

    Map message_user_json = {};

    if (request_result["member_id"] is Map) {
      if (request_result["member_id"]["@type"] == "messageSenderUser") {
        var res = await callApiInvoke(
          parameters: {
            "@type": "getUser",
            "user_id": request_result["member_id"]["user_id"],
          },
        );
        message_user_json["user"] = res;
      }
    }

    Map new_scheme = {
      "@type": "chatMember",
      "status": () {
        if (request_result["status"] is Map) {
          return (request_result["status"]["@type"] as String)
              .replaceAll(
                  RegExp(r"^(chatMemberStatus)", caseSensitive: false), "")
              .toLowerCase();
        }
        return "";
      }(),
      ...message_user_json,
    };

    if (request_result["status"] is Map) {
      (request_result["status"] as Map).forEach((key, value) {
        if (key == "@type") {
          return;
        }
        if (value is Map) {
          value.forEach((key_data, value_data) {
            if (key == "@type") {
              return;
            }
            new_scheme[key_data] = value_data;
          });
        } else {
          new_scheme[key] = value;
        }
      });
    }

    return (new_scheme);
  }
}
