// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';

import 'package:telegram_client/telegram_client/telegram_client.dart';

import 'package:telegram_client/telegram_client/call_api_invoke.dart';

/// method CloseGeneralForumTopic
extension CloseGeneralForumTopicDataOn on TelegramClient {
  /// method CloseGeneralForumTopic
  FutureOr<Map> closeGeneralForumTopic({
    required Map parameters,
    required TelegramClientCallApiInvoke callApiInvoke,
  }) async {
    Map newScheme = {
      "@type": "template",
    };
    return newScheme;
  }
}
