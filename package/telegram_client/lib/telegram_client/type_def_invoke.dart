// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions camel_case_types

import 'dart:async';

import 'package:telegram_client/tdlib/tdlib_ffi/tdlib.dart';

import 'package:telegram_client/telegram_client/telegram_client_data.dart';

typedef TgClientInvokeFunction = FutureOr<Map> Function({
  required Map parameters,
  required TelegramClientData telegramClientData,
  bool? is_form,
  String? urlApi,
  String? clientType,
  void Function(int bytes, int bytess)? onUploadProgress,
  bool? isVoid,
  Duration? delayDuration,
  Duration? invokeTimeOut,
  String? extra,
  bool? isAutoGetChat,
  bool? isInvokeThrowOnError,
  FutureOr<String> Function(int client_id, LibTdJson libTdJson)?
      onGenerateExtraInvoke,
  FutureOr<Map<dynamic, dynamic>> Function(
          String, int client_id, LibTdJson libTdJson)?
      onGetInvokeData,
});
