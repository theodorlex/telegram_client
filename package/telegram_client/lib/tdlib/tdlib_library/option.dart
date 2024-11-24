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

import 'package:general_lib/event_emitter/event_emitter.dart';
import 'package:telegram_client/scheme/telegram_client_library_tdlib_option_parameter.dart';
import 'base.dart';

class TelegramClientTdlibOption {
  final TelegramClientLibraryTdlibOptionParameter? clientOption;
  final Duration? invokeTimeOut;

  final Duration? delayUpdate;
  final double timeOutUpdate;
  final EventEmitter? eventEmitter;
  final bool isAutoGetChat;

  final TdlibOnGetInvokeData? onGetInvokeData;
  final TdlibOnReceiveUpdate? onReceiveUpdate;
  final TdlibOnGenerateExtraInvoke? onGenerateExtraInvoke;
  final bool isInvokeThrowOnError;
  final Duration? delayInvoke;
  final int taskMaxCount;
  final int taskMinCooldown;
  const TelegramClientTdlibOption({
    this.isAutoGetChat = false,
    this.taskMaxCount = 10000,
    this.taskMinCooldown = 10,
    this.clientOption,
    this.invokeTimeOut,
    this.timeOutUpdate = 1.0,
    this.delayInvoke,
    this.delayUpdate,
    this.onGenerateExtraInvoke,
    this.onGetInvokeData,
    this.eventEmitter,
    this.onReceiveUpdate,
    this.isInvokeThrowOnError = true,
  });

  TelegramClientTdlibOption copyWith({
    TelegramClientLibraryTdlibOptionParameter? clientOption,
    Duration? invokeTimeOut,
    Duration? delayUpdate,
    double? timeOutUpdate,
    EventEmitter? eventEmitter,
    bool? isAutoGetChat,
    TdlibOnGetInvokeData? onGetInvokeData,
    TdlibOnReceiveUpdate? onReceiveUpdate,
    TdlibOnGenerateExtraInvoke? onGenerateExtraInvoke,
    bool? isInvokeThrowOnError,
    Duration? delayInvoke,
    int? taskMaxCount,
    int? taskMinCooldown,
  }) {
    return TelegramClientTdlibOption();
  }
}
