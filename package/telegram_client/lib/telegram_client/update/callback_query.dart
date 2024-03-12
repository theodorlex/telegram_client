// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';
import 'dart:convert';

// import 'package:telegram_client/telegram_client/scheme/json_dart.dart'
//     as scheme;
import 'package:telegram_client/telegram_client/telegram_client.dart';
// import 'package:telegram_client/util/util.dart';

/// method CallbackQueryData
extension CallbackQueryDataDataOn on TelegramClient {
  /// http://0.0.0.0:8080/classtd_1_1td__api_1_1update_new_callback_query.html
  Future<Map> callbackQuery_CallbackQuery({
    required Map callbackQuery,
    required TelegramClientData telegramClientData,
    bool is_skip_reply_message = false,
    required bool is_lite,
  }) async {
    Map message_inline_message_id = {};
    if (callbackQuery.containsKey("inline_message_id")) {
      message_inline_message_id["inline_message_id"] =
          callbackQuery["inline_message_id"];
    }
    Map message_sender_chat_json = {};

    if (callbackQuery["sender_user_id"] is int) {
      if (is_lite) {
        message_sender_chat_json["from"] = {
          "id": callbackQuery["sender_user_id"],
        };
      } else {
        var res = await request(
          parameters: {
            "@type": "getUser",
            "user_id": callbackQuery["sender_user_id"],
          },
          is_return_as_api: false,
          telegramClientData: telegramClientData,
        );

        message_sender_chat_json["from"] = res;
      }
    }
    Map message_chat_json = {};

    if (callbackQuery["chat_id"] is int) {
      if (is_lite) {
        message_chat_json["chat"] = {
          "id": callbackQuery["chat_id"],
        };
      } else {
        var res = await request(
          parameters: {
            "@type": "getChat",
            "chat_id": callbackQuery["chat_id"],
          },
          is_return_as_api: false,
          telegramClientData: telegramClientData,
        );
        message_chat_json["chat"] = res;
      }
    }
    Map new_scheme_data = {
      "id": callbackQuery["id"],
      ...message_inline_message_id,
      ...message_sender_chat_json,
      ...message_chat_json,
    };

    if (callbackQuery["message_id"] is int) {
      Map message_reply_to = await invoke(
        parameters: {
          "@type": "getMessage",
          "chat_id": callbackQuery["chat_id"],
          "message_id": callbackQuery["message_id"],
        },
        telegramClientData: telegramClientData,
      );
      new_scheme_data["message"] = await message_Message(
        message: message_reply_to,
        telegramClientData: telegramClientData,
        is_skip_reply_message: true,
        is_lite: is_lite,
      );
    }
    new_scheme_data["chat_instance"] = callbackQuery["chat_instance"];
    new_scheme_data["data"] =
        utf8.decode(base64.decode(callbackQuery["payload"]["data"]));

    return new_scheme_data;
  }

  /// method CallbackQueryData
  FutureOr<Map?> callbackQuery_toJson({
    required Map update,
    required TelegramClientData telegramClientData,
    required bool is_lite,
  }) async {
    // http://0.0.0.0:8704/classtd_1_1td__api_1_1message.html
    if (update["@type"] == "updateNewCallbackQuery" ||
        update["@type"] == "updateNewInlineCallbackQuery") {
      Map callback_query = await callbackQuery_CallbackQuery(
        callbackQuery: update,
        telegramClientData: telegramClientData,
        is_lite: is_lite,
      );
      return {
        "@type": "updateCallbackQuery",
        "callback_query": callback_query,
      };
    }

    return null;
  }
}
