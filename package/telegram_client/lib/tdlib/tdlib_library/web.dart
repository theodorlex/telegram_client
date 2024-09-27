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

import 'package:telegram_client/tdlib/tdlib_library/base.dart';

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
    super.on_generate_extra_invoke,
    super.on_get_invoke_data,
    super.on_receive_update,
    super.pathTdl,
    super.task_max_count,
    super.task_min_cooldown,
    super.timeOutUpdate,
  }) {
    opentdLib(pathTdlib: path_tdlib);
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
}

Future<void> opentdLib({
  required String pathTdlib,
}) async{

  //final url ='https://unpkg.com/isar@${Isar.version}/isar.wasm'; 
}
