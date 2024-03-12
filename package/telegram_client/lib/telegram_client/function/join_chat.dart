// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';
import 'package:telegram_client/telegram_client/call_api_invoke.dart';
import 'package:general_lib/extension/extension.dart';

import 'package:telegram_client/telegram_client/telegram_client.dart';
import 'package:telegram_client/util/util.dart';

/// method JoinChat
extension JoinChatDataOn on TelegramClient {
  /// method JoinChat
  FutureOr<Map> joinChat({
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
    Map leave_chat = await callApiInvoke(
      parameters: {
        "@type": "joinChat",
        "chat_id": parameters["chat_id"],
      },
    );

    return leave_chat;
  }
}
