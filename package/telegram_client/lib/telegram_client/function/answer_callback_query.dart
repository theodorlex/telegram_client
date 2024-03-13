// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';
import 'package:general_lib/extension/extension.dart';
import 'package:telegram_client/telegram_client/call_api_invoke.dart';

import 'package:telegram_client/telegram_client/telegram_client.dart';
import 'package:telegram_client/util/util.dart';

/// method AnswerCallbackQuery
extension AnswerCallbackQueryDataOn on TelegramClient {
  /// method AnswerCallbackQuery
  FutureOr<Map> answerCallbackQuery({
    required Map parameters,
    required TelegramClientCallApiInvoke callApiInvoke,

    bool? isUseCache = false,
    Duration? durationCacheExpire,
  }) async {
    dynamic target_chat_id = TgUtils.parse_all_chat_id(parameters: parameters);
    if (target_chat_id is String && RegExp(r"^((@)[a-z0-9_]+)$", caseSensitive: false).hashData(target_chat_id)) {
      var search_public_chat = await callApiInvoke(
        parameters: {
          "@type": "searchPublicChat",
          "username": (target_chat_id).replaceAll(RegExp(r"@", caseSensitive: false), ""),
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
      "@type": "answerCallbackQuery",
      "callback_query_id": parameters["callback_query_id"],
      "text": parameters["text"],
      "show_alert": (parameters["show_alert"] == true),
    };
    if (parameters["url"] is String) {
      request_parameters["url"] = parameters["url"];
    }
    if (parameters["cache_time"] is int) {
      request_parameters["cache_time"] = parameters["cache_time"];
    }
    Map request_result = await callApiInvoke(
      parameters: request_parameters,
    );

    return request_result;
  }
}
