// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';

import 'package:telegram_client/telegram_client/telegram_client.dart';

import 'package:telegram_client/telegram_client/call_api_invoke.dart';

import 'package:telegram_client/util/util.dart';

/// method AnswerInlineQuery
extension AnswerInlineQueryDataOn on TelegramClient {
  /// method AnswerInlineQuery
  FutureOr<Map> answerInlineQuery({
    required Map parameters,
    required TelegramClientCallApiInvoke callApiInvoke,
  }) async {
    Map request_parameters = {
      "@type": "answerInlineQuery",
    };

    parameters.forEach((key, value) {
      if (["@type"].contains(key)) {
        return;
      }

      if (value is Map || value is List) {
      } else {
        request_parameters[key] = value;
      }
    });
    if (parameters["button"] is Map) {
      Map parameters_button = parameters["button"] as Map;
      request_parameters["button"] = <dynamic, dynamic>{
        "@type": "inlineQueryResultsButton",
      };

      if (parameters_button.containsKey("text")) {
        request_parameters["button"]["text"] = parameters_button["text"];
      }
    }

    if (parameters["results"] is List) {
      List results = (parameters["results"] as List);

      List result_tdlib = [];

      for (var i = 0; i < results.length; i++) {
        dynamic result_data = results[i];
        if (result_data is Map) {
          Map jsonData = {
            "@type": "inputInlineQueryResultArticle",
          };
          if (result_data["type"] == "article") {
            jsonData["@type"] = "inputInlineQueryResultArticle";
          }
          result_data.forEach((key, value) {
            if (["@type"].contains(key)) {
              return;
            }

            if (value is Map) {
              if (key == "reply_markup") {
                jsonData[key] =
                    TgUtils.replyMarkupTgApiToTdlib(replyMarkup: value);
              }
              if (key == "input_message_content") {
                jsonData[key] = TgUtils.inputMessageContentInlineQueryTgToTdlib(
                  inputMessageContent: value,
                  tg: this,
                );
              }
            } else {
              jsonData[key] = value;
            }
          });

          if (jsonData.isNotEmpty) {
            result_tdlib.add(jsonData);
          }
        }
      }
      request_parameters["results"] = result_tdlib;
    }

    Map request_result = await callApiInvoke(
      parameters: request_parameters,
    );

    return request_result;
  }
}
