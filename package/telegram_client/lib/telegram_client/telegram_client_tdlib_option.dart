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

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';

import 'package:general_lib/event_emitter/event_emitter.dart';
import 'package:telegram_client/tdlib/scheme/scheme.dart';
import 'package:telegram_client/tdlib/tdlib_ffi/tdlib.dart';

class TelegramClientTdlibOption {
  TdlibOptionParameter? clientOption;
  bool is_cli;
  Duration? invokeTimeOut;

  Duration? delayUpdate;
  double timeOutUpdate;
  EventEmitter? eventEmitter;
  bool isAutoGetChat;

  FutureOr<Map<dynamic, dynamic>> Function(String, int, TdlibNative)?
      on_get_invoke_data;
  FutureOr<void> Function(dynamic, TdlibNative)? on_receive_update;
  FutureOr<String> Function(int, TdlibNative)? on_generate_extra_invoke;
  bool isInvokeThrowOnError;
  Duration? delayInvoke;
  int task_max_count;
  int task_min_cooldown;
  TelegramClientTdlibOption({
    this.isAutoGetChat = false,
    this.task_max_count = 10000,
    this.task_min_cooldown = 10,
    this.clientOption,
    this.is_cli = false,
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
