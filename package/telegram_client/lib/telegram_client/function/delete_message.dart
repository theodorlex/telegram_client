// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';
import 'package:telegram_client/telegram_client/call_api_invoke.dart';
import 'package:general_lib/extension/regexp.dart';
import 'package:general_lib/general_lib.dart' as glx_lib;

import 'package:telegram_client/telegram_client/telegram_client.dart';
import 'package:telegram_client/util/util.dart';

/// method DeleteMessage
extension DeleteMessageDataOn on TelegramClient {
  /// method DeleteMessage
  FutureOr<Map> deleteMessage({
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
      "@type": "deleteMessages",
      "chat_id": parameters["chat_id"],
      "message_ids": [
        TgUtils().messageApiToTdlib(parameters["message_id"]),
      ],
      "revoke": (parameters["revoke"] is bool) ? parameters["revoke"] : true,
    };
    Map message_send = await callApiInvoke(
      parameters: request_parameters,
    );
    return message_send;
  }
}
