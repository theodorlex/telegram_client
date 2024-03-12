// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';
import 'package:telegram_client/telegram_client/function/send_message_raw.dart';

import 'package:telegram_client/telegram_client/telegram_client.dart';

import 'package:telegram_client/telegram_client/call_api_invoke.dart';

/// method CopyMessage
extension CopyMessageDataOn on TelegramClient {
  /// method CopyMessage
  FutureOr<Map> copyMessage({
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
