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
// import 'dart:convert';

// import 'package:general_lib/general_lib.dart';
//
import 'package:telegram_client/telegram_client/telegram_client.dart';
// import 'package:telegram_client/util/util.dart';

/// method InlineQueryData
extension InlineQueryDataDataOn on TelegramClient {
  /// http://0.0.0.0:8080/classtd_1_1td__api_1_1update_new_inline_query.html
  Future<Map> inlineQuery_InlineQuery({
    required Map inlineQuery,
    required TelegramClientData telegramClientData,
    bool is_skip_reply_message = false,
    required bool is_lite,
    bool? isUseCache,
    Duration? durationCacheExpire,
  }) async {
    // Map message_inline_message_id = {};
    Map message_sender_chat_json = {};

    if (inlineQuery["sender_user_id"] is int) {
      if (is_lite) {
        message_sender_chat_json["from"] = {
          "id": inlineQuery["sender_user_id"],
        };
      } else {
        var res = await request(
          parameters: {
            "@type": "getUser",
            "user_id": inlineQuery["sender_user_id"],
          },
          is_return_as_api: false,
          telegramClientData: telegramClientData,
          isUseCache: isUseCache,
          durationCacheExpire: durationCacheExpire,
        );

        message_sender_chat_json["from"] = res;
      }
    }
    Map new_scheme_data = {
      "id": inlineQuery["id"],
      ...message_sender_chat_json,
    };

    if (inlineQuery["chat_type"] is Map) {
      new_scheme_data["chat_type"] =
          (inlineQuery["chat_type"]["@type"] as String)
              .replaceAll(RegExp(r"(chatType)", caseSensitive: false), "")
              .toLowerCase();
    }
    new_scheme_data["query"] = inlineQuery["query"];
    new_scheme_data["offset"] = inlineQuery["offset"];
    if (inlineQuery["location"] is Map) {
      new_scheme_data["location"] = inlineQuery["location"];
    }
    return new_scheme_data;
  }

  /// method InlineQueryData
  FutureOr<Map?> inlineQuery_toJson({
    required Map update,
    required TelegramClientData telegramClientData,
    required bool is_lite,
    bool? isUseCache,
    Duration? durationCacheExpire,
  }) async {
    // http://0.0.0.0:8704/classtd_1_1td__api_1_1message.html
    if (update["@type"] == "updateNewInlineQuery") {
      Map callback_query = await inlineQuery_InlineQuery(
        inlineQuery: update,
        telegramClientData: telegramClientData,
        is_lite: is_lite,
        isUseCache: isUseCache,
        durationCacheExpire: durationCacheExpire,
      );
      return {
        "@type": "updateInlineQuery",
        "inline_query": callback_query,
      };
    }

    return null;
  }
}
