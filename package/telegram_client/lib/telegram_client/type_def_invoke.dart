/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!


<!-- END LICENSE --> */
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
