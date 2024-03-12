// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';
import 'package:telegram_client/telegram_client/call_api_invoke.dart';

import 'package:telegram_client/telegram_client/function/send_message_raw.dart';

import 'package:telegram_client/telegram_client/telegram_client.dart';

/// method SendMessage
extension SendMessageDataOn on TelegramClient {
  /// method SendMessage
  FutureOr<Map> sendMessage({
    required Map parameters,
    required TelegramClientCallApiInvoke callApiInvoke,
    required TelegramClientData telegramClientData,
  }) async {
    return await sendMessageRaw(
        parameters: parameters,
        callApiInvoke: callApiInvoke,
        telegramClientData: telegramClientData);
  }
}
