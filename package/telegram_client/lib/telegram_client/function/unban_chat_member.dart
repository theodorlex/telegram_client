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
import 'package:telegram_client/telegram_client/call_api_invoke.dart';

import 'package:telegram_client/telegram_client/telegram_client.dart';

import 'package:telegram_client/util/util.dart';

import 'package:general_lib/extension/extension.dart';

/// method UnbanChatMember
extension UnbanChatMemberDataOn on TelegramClient {
  /// method UnbanChatMember
  FutureOr<Map> unbanChatMember({
    required Map parameters,
    required TelegramClientCallApiInvoke callApiInvoke,
  }) async {
    dynamic target_chat_id = TgUtils.parse_all_chat_id(parameters: parameters);
    if (target_chat_id is String &&
        RegExp(r"^((@)[a-z0-9_]+)$", caseSensitive: false)
            .hashData(target_chat_id)) {
      var search_public_chat = await callApiInvoke(
        parameters: {
          "@type": "searchPublicChat",
          "username": (target_chat_id)
              .replaceAll(RegExp(r"@", caseSensitive: false), ""),
        },
        is_invoke_no_relevance: true,
      );
      if (search_public_chat["@type"] == "chat") {
        parameters["chat_id"] = search_public_chat["id"];
      } else {
        return search_public_chat;
      }
    }
    Map request_parameters = {
      "@type": "setChatMemberStatus",
      "chat_id": parameters["chat_id"],
      "member_id": {
        "@type": "messageSenderUser",
        "user_id": parameters["user_id"],
      },
      "status": {
        "@type": "chatMemberStatusLeft",
      }
    };

    Map request_result = await callApiInvoke(
      parameters: request_parameters,
    );

    return request_result;
  }
}
