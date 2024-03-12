// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';
import 'package:telegram_client/telegram_client/call_api_invoke.dart';
import 'package:telegram_client/telegram_client/function/report_messages.dart';

import 'package:telegram_client/telegram_client/telegram_client.dart';

/// method ReportMessage
extension ReportMessageDataOn on TelegramClient {
  /// method ReportMessage
  FutureOr<Map> reportMessage({
    required Map parameters,
    required TelegramClientCallApiInvoke callApiInvoke,
  }) async {
    parameters["message_ids"] = parameters["message_id"];
    return reportMessages(
      parameters: parameters,
      callApiInvoke: callApiInvoke,
    );
  }
}
