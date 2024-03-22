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
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions empty_catches

import 'dart:convert';

import 'package:telegram_client/isolate/isolate.dart';

/// add state data
class MtprotoClient {
  int client_id;
  Isolate isolate;
  int client_user_id;
  DateTime join_date = DateTime.now();

  MtprotoClient({
    required this.client_id,
    required this.isolate,
    this.client_user_id = 0,
  });

  /// close
  void close() {
    isolate.kill();
  }

  Map toJson() {
    return {
      "client_id": client_id,
      "client_user_id": client_user_id,
      "join_date": join_date.toString(),
    };
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}

extension MtprotoClients on List<MtprotoClient> {
  // exit
  MtprotoClient? getClientByUserId(int clientUserId) {
    for (var i = 0; i < length; i++) {
      MtprotoClient tdlibClient = this[i];
      if (tdlibClient.client_user_id == clientUserId) {
        return tdlibClient;
      }
    }
    return null;
  }

  // exit
  MtprotoClient? getClientById(int clientId) {
    for (var i = 0; i < length; i++) {
      MtprotoClient tdlibClient = this[i];
      if (tdlibClient.client_id == clientId) {
        return tdlibClient;
      }
    }
    return null;
  }

  Future<bool> exitClientById(
    int clientId, {
    String? extra,
  }) async {
    MtprotoClient? tdlibClient = getClientById(clientId);
    if (tdlibClient != null) {
      tdlibClient.close();
      remove(tdlibClient);
      return true;
    }
    return false;
  }
}
