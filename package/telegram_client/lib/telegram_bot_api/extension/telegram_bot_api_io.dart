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
// ignore_for_file: depend_on_referenced_packages

import 'package:telegram_client/telegram_bot_api/telegram_bot_api.dart';
import 'package:telegram_client/util/util.dart';

import 'package:universal_io/io.dart';
// import 'package:path/path.dart' as p;

/// extension tdlib for make
extension TelegramBotApiTypeFileMethodExtensions on TelegramBotApi {
  /// test method
  Map typeFile(dynamic content) {
    Map data = {};
    if (content is String) {
      if (RegExp(r"^http", caseSensitive: false).hasMatch(content)) {
        data = {"@type": 'inputFileRemote', "data": content};
      } else if (RegExp(r"^(\/|\.\.?\/|~\/)", caseSensitive: false)
          .hasMatch(content)) {
        File file = File(content);
        // file.uri.;
        data = {
          "@type": 'inputFileLocal',
          "data": TgUtils.telegram_bot_api_file(file: file)
        };
      } else if (content is int) {
        data = {"@type": 'inputFileId', "data": content};
      } else {
        data = {"@type": 'inputFileRemote', "data": content};
      }
    } else {
      data = {"@type": 'inputFileRemote', "data": content};
    }
    return data;
  }
}
