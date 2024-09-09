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
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions empty_catches, unnecessary_type_check, void_checks, unnecessary_brace_in_string_interps, empty_catches, constant_identifier_names

// ignore: slash_for_doc_comments
//

import 'dart:ffi';
import 'package:ffi/ffi.dart';
// import 'dart:ffi' as ffi;
// import 'dart:ffi';
import 'dart:convert' as convert;

import 'package:telegram_client/tdlib/tdlib_library/base.dart';
import 'package:universal_io/io.dart';

typedef TdPointerNative = Pointer;
typedef TdPointerFunctionNative = TdPointerNative Function();

typedef TdStringNative = Pointer<Utf8>;
typedef TdReceiveNative = TdStringNative Function(Double timout);
typedef TdReceiveDart = TdStringNative Function(double timout);

typedef TdSendNative = Void Function(
    TdPointerNative client, TdStringNative request);
typedef TdSendDart = void Function(
    TdPointerNative client, TdStringNative request);

typedef TdExecuteNative = TdStringNative Function(TdStringNative parameters);

typedef TdDestroyNative = Void Function(Pointer client_id);
typedef TdDestroyDart = void Function(Pointer client_id);

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
/// tg.on("update", (UpdateTd update) async {
///   print(update.raw);
/// });
/// tg.initIsolate();
/// ````
///
class TdlibNative extends TdlibBase {
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
    super.is_cli,
    super.on_generate_extra_invoke,
    super.on_get_invoke_data,
    super.on_receive_update,
    super.pathTdl,
    super.task_max_count,
    super.task_min_cooldown,
    super.timeOutUpdate,
  }) {
    opentdLib(isCli: is_cli, pathTdlib: path_tdlib);
    if (client_option["start"] == true) {
      invokeSync(
        parameters: {
          "@type": "setLogVerbosityLevel",
          "new_verbosity_level": client_option['new_verbosity_level'],
        },
      );
      ensureInitialized();
    }
  }
  static late DynamicLibrary tdLib;

  static void opentdLib({
    required bool isCli,
    required String pathTdlib,
  }) {
    if (Platform.isIOS || Platform.isMacOS) {
      if (isCli) {
        tdLib = DynamicLibrary.open(pathTdlib);
      } else {
        tdLib = DynamicLibrary.process();
      }
    } else {
      tdLib = DynamicLibrary.open(pathTdlib);
    }
  }

  /// create client id for multi client
  @override
  int td_create_client_id() {
    int client_id_new = using((Arena arena) {
      TdPointerFunctionNative td_pointer_native_function = tdLib.lookupFunction<
          TdPointerFunctionNative,
          TdPointerFunctionNative>('td_create_client_id', isLeaf: false);
      Pointer<NativeType> td_pointer_native_result =
          arena.using(td_pointer_native_function(), (p0) {});
      int client_id_new = td_pointer_native_result.address;
      arena.releaseAll();
      return client_id_new;
    });
    return client_id_new;
  }

  /// create client id for multi client
  @override
  int td_json_client_create() {
    int client_id_new = using((Arena arena) {
      TdPointerFunctionNative td_pointer_native_function = tdLib.lookupFunction<
          TdPointerFunctionNative,
          TdPointerFunctionNative>('td_json_client_create', isLeaf: false);
      TdPointerNative td_pointer_native_result =
          arena.using(td_pointer_native_function(), (p0) {});
      int client_id_new = td_pointer_native_result.address;
      arena.releaseAll();
      return client_id_new;
    });

    return client_id_new;
  }

  Pointer client_id_addres(int clientId) {
    return Pointer.fromAddress(clientId);
  }

  /// td_send
  @override
  void td_send(int clientId, [Map? parameters]) {
    using((Arena arena) {
      Pointer client_id_addres_data = client_id_addres(clientId);
      TdStringNative request_data =
          convert.json.encode(parameters).toNativeUtf8();
      Arena arena = Arena();
      TdSendDart td_send_function = tdLib
          .lookupFunction<TdSendNative, TdSendDart>('td_send', isLeaf: false);
      // void td_send_result =
      arena.using(
          td_send_function(client_id_addres_data, request_data), (p0) {});
      arena.releaseAll();
      malloc.free(request_data);
    });
    return;
  }

  /// td_send
  @override
  void td_json_client_send(int clientId, [Map? parameters]) {
    using((Arena arena) {
      Pointer client_id_addres_data = client_id_addres(clientId);
      TdStringNative request_data =
          convert.json.encode(parameters).toNativeUtf8();

      Arena arena = Arena();
      TdSendDart td_send_function =
          tdLib.lookupFunction<TdSendNative, TdSendDart>('td_json_client_send',
              isLeaf: false);
      // void td_send_result =
      arena.using(
          td_send_function(client_id_addres_data, request_data), (p0) {});
      arena.releaseAll();
      malloc.free(request_data);
    });

    return;
  }

  /// client_execute
  @override
  Map<String, dynamic> td_execute(Map parameters) {
    Map<String, dynamic> result_data = using((Arena arena) {
      TdStringNative request_data =
          convert.json.encode(parameters).toNativeUtf8();

      TdExecuteNative td_execute_native_function =
          tdLib.lookupFunction<TdExecuteNative, TdExecuteNative>('td_execute',
              isLeaf: false);

      TdStringNative td_execute_native_result =
          arena.using(td_execute_native_function(request_data), (p0) {});
      Map<String, dynamic> result_data =
          convert.json.decode(td_execute_native_result.toDartString());
      arena.releaseAll();
      malloc.free(request_data);

      return result_data;
    });
    return result_data;
  }

  /// client_destroy
  @override
  void td_json_client_destroy(int clientId) {
    using((Arena arena) {
      Pointer client_id_addres_data = client_id_addres(clientId);
      TdDestroyDart td_destroy_dart_function =
          tdLib.lookupFunction<TdDestroyNative, TdDestroyDart>(
              'td_json_client_destroy',
              isLeaf: false);
      arena.using(td_destroy_dart_function(client_id_addres_data), (p0) {});
      arena.releaseAll();
    });
    return;
  }

  /// fetch update
  static Map<String, dynamic>? td_receive_static({
    double timeout = 1.0,
    bool isAndroid = false,
  }) {
    try {
      Map<String, dynamic>? result = using((Arena arena) {
        TdReceiveDart td_receive_function =
            tdLib.lookupFunction<TdReceiveNative, TdReceiveDart>('td_receive',
                isLeaf: false);
        TdStringNative update =
            arena.using(td_receive_function(timeout), (p0) {});
        if (update.address != 0) {
          String update_string = update.toDartString();
          arena.releaseAll();
          if (update_string.isEmpty) {
            return null;
          }
          Map<String, dynamic>? updateOrigin;
          try {
            updateOrigin = convert.json.decode(update.toDartString());
          } catch (e) {}
          if (updateOrigin != null) {
            return updateOrigin;
          }
        } else {
          arena.releaseAll();
        }
        return null;
      });
      return result;
    } catch (e) {}
    return null;
  }
}
