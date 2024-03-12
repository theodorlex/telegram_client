// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';
import 'package:telegram_client/telegram_client/call_api_invoke.dart';
import 'package:telegram_client/telegram_client/function/send_message_raw.dart';

import 'package:telegram_client/telegram_client/telegram_client.dart';

/// method EditMessageReplyMarkup
extension EditMessageReplyMarkupDataOn on TelegramClient {
  /// method EditMessageReplyMarkup
  FutureOr<Map> editMessageReplyMarkup({
    required Map parameters,
    required TelegramClientCallApiInvoke callApiInvoke,
    required TelegramClientData telegramClientData,
  }) async {
    return await sendMessageRaw(
      parameters: parameters,
      callApiInvoke: callApiInvoke,
      telegramClientData: telegramClientData,
    );
  }
}
