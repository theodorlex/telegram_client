// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';

import 'package:telegram_client/telegram_client/telegram_client.dart';
import 'package:telegram_client/telegram_client/call_api_invoke.dart';

/// method AnswerShippingQuery
extension AnswerShippingQueryDataOn on TelegramClient {
  /// method AnswerShippingQuery
  FutureOr<Map> answerShippingQuery({
    required Map parameters,
    required TelegramClientCallApiInvoke callApiInvoke,
  }) async {
    Map newScheme = {
      "@type": "template",
    };
    return newScheme;
  }
}
