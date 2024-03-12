// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';
import 'package:telegram_client/telegram_client/function/view_messages.dart';

import 'package:telegram_client/telegram_client/telegram_client.dart';

import 'package:telegram_client/telegram_client/call_api_invoke.dart';

/// method ViewMessage
extension ViewMessageDataOn on TelegramClient {
  /// method ViewMessage
  FutureOr<Map> viewMessage({
    required Map parameters,
    required TelegramClientCallApiInvoke callApiInvoke,
  }) async {
    parameters["message_ids"] = parameters["message_id"];
    return await viewMessages(
      parameters: parameters,
      callApiInvoke: callApiInvoke,
    );
  }
}
