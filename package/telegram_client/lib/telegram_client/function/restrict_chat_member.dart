// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';

import 'package:telegram_client/telegram_client/call_api_invoke.dart';
import 'package:telegram_client/telegram_client/telegram_client.dart';

/// method RestrictChatMember
extension RestrictChatMemberDataOn on TelegramClient {
  /// method RestrictChatMember
  FutureOr<Map> restrictChatMember({
    required Map parameters,
    required TelegramClientCallApiInvoke callApiInvoke,
  }) async {
    Map newScheme = {
      "@type": "template",
    };
    return newScheme;
  }
}
