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
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, empty_catches, unnecessary_type_check, void_checks, unnecessary_brace_in_string_interps

// ignore: slash_for_doc_comments
//

// import 'dart:ffi';

import 'dart:async';

import 'package:telegram_client/tdlib/tdlib_library/base.dart';
import 'package:wasm_ffi/ffi.dart';

typedef TdCharNative = Pointer<Char>;
typedef TdReceiveNative = TdCharNative Function(Double timout);
typedef TdReceiveDart = TdCharNative Function(double timout);

typedef TdCreateClientIdNative = Int Function();
typedef TdCreateClientIdDart = int Function();
typedef TdSendNative = Void Function(Int client, TdCharNative request);
typedef TdSendDart = void Function(int client, TdCharNative request);
typedef TdExecuteNative = TdCharNative Function(TdCharNative parameters);

/// Cheatset
///
/// ```dart
/// Tdlib tg = Tdlib(
///  pathTdl: "libtdjson.so",
///  clientOption: {
///   "api_id": 121315,
///   "api_hash": "saskaspasad"
///  },
/// );
/// tg.on("update", (UpdateTelegramClientTdlib update) async {
///   print(update.raw);
/// });
/// tg.initIsolate();
/// ````
///
class TdlibNative extends TdlibBase {
  static final Completer<bool> _td_completer = Completer<bool>();
  TdlibNative({
    super.clientOption,
    super.delayInvoke,
    super.delayUpdate,
    super.eventEmitter,
    super.event_invoke,
    super.event_update,
    super.invokeTimeOut,
    super.isAutoGetChat,
    super.isInvokeThrowOnError,
    super.onGenerateExtraInvoke,
    super.onGetInvokeData,
    super.onReceiveUpdate,
    super.pathTdl,
    super.taskMaxCount,
    super.taskMinCooldown,
    super.timeOutUpdate,
  }) {
    opentdLib(pathTdlib: path_tdlib).then((a) {
      if (client_option["start"] == true) {
        invokeSync(
          parameters: {
            "@type": "setLogVerbosityLevel",
            "new_verbosity_level": client_option['new_verbosity_level'],
          },
        );
        ensureInitialized();
      }
    });
  }
  static late DynamicLibrary tdLib;
  static bool is_open_tdlib = false;

  static late final TdExecuteNative td_execute_native_function;
  static late final TdSendDart td_send_function;
  static late final TdCreateClientIdDart td_pointer_native_function;
  static late final TdReceiveDart td_receive_function;

  @override
  int td_create_client_id() {
    // TODO: implement td_create_client_id
    return 0;
  }

  @override
  Map<String, dynamic> td_execute(Map parameters) {
    return {"@type": "error"};
  }

  @override
  void td_send(int clientId, Map parameters) {
    // TODO: implement td_send
  }

  @override
  String platformType() {
    return "web";
  }

  @override
  Future<bool> is_td_initialized() {
    return _td_completer.future;
  }
}

Future<void> opentdLib({
  required String pathTdlib,
}) async {
  //final url ='https://unpkg.com/isar@${Isar.version}/isar.wasm';
  if (TdlibNative.is_open_tdlib) {
    return;
  }

  TdlibNative.tdLib = await DynamicLibrary.open(pathTdlib);
  TdlibNative.is_open_tdlib = true;
  TdlibNative.td_execute_native_function = TdlibNative.tdLib.lookupFunction<TdExecuteNative, TdExecuteNative>('td_execute');
  TdlibNative.td_send_function = TdlibNative.tdLib.lookupFunction<TdSendNative, TdSendDart>('td_send');
  TdlibNative.td_pointer_native_function = TdlibNative.tdLib.lookupFunction<TdCreateClientIdNative, TdCreateClientIdDart>('td_create_client_id');
  TdlibNative.td_receive_function = TdlibNative.tdLib.lookupFunction<TdReceiveNative, TdReceiveDart>('td_receive');
  TdlibNative._td_completer.complete(true);
}
