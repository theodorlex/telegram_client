// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';
import 'package:general_lib/extension/extension.dart';
import 'package:telegram_client/telegram_client/telegram_client.dart';

import 'package:telegram_client/util/util.dart';

import 'package:telegram_client/telegram_client/call_api_invoke.dart';

/// method ViewMessages
extension ViewMessagesDataOn on TelegramClient {
  /// method ViewMessages
  FutureOr<Map> viewMessages({
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
        is_use_cache: false,
        duration_cache_expire: null,
      );
      if (search_public_chat["@type"] == "chat") {
        parameters["chat_id"] = search_public_chat["id"];
      } else {
        return search_public_chat;
      }
    }
    Map request_parameters = {
      "@type": "viewMessages",
      "chat_id": parameters["chat_id"],
      "message_ids": (parameters["message_ids"] as List)
          .map((e) => TgUtils().messageApiToTdlib(e))
          .toList(),
    };
    if (parameters["force_read"] is bool) {
      request_parameters["force_read"] = parameters["force_read"];
    }
    Map request_result = await callApiInvoke(
      parameters: request_parameters,
    );

    return request_result;
  }
}
