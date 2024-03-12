// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';

import 'package:general_lib/event_emitter/event_emitter.dart';
import 'package:telegram_client/tdlib/tdlib_ffi/tdlib.dart';

class TelegramClientTdlibOption {
  Map<dynamic, dynamic>? clientOption;
  bool is_cli;
  int? clientId;
  Duration? invokeTimeOut;

  Duration? delayUpdate;
  double timeOutUpdate;
  EventEmitter? eventEmitter;
  bool isAutoGetChat;

  FutureOr<Map<dynamic, dynamic>> Function(String, int, LibTdJson)?
      on_get_invoke_data;
  FutureOr<void> Function(dynamic, LibTdJson)? on_receive_update;
  FutureOr<String> Function(int, LibTdJson)? on_generate_extra_invoke;
  bool isInvokeThrowOnError;
  Duration? delayInvoke;
  TelegramClientTdlibOption({
    this.isAutoGetChat = false,
    this.clientOption,
    this.is_cli = false,
    this.clientId,
    this.invokeTimeOut,
    this.timeOutUpdate = 1.0,
    this.delayInvoke,
    this.delayUpdate,
    this.on_generate_extra_invoke,
    this.on_get_invoke_data,
    this.eventEmitter,
    this.on_receive_update,
    this.isInvokeThrowOnError = true,
  });
}
