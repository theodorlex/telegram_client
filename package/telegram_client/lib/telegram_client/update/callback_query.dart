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
import 'dart:convert';

// import 'package:telegram_client/telegram_client/scheme/json_dart.dart'
//     as scheme;
import 'package:telegram_client/telegram_client/telegram_client.dart';
// import 'package:telegram_client/util/util.dart';

/// method CallbackQueryData
extension CallbackQueryDataDataOn on TelegramClient {
  /// http://0.0.0.0:8080/classtd_1_1td__api_1_1update_new_callback_query.html
  Future<Map> callbackQuery_CallbackQuery({
    required Map callbackQuery,
    required TelegramClientData telegramClientData,
    bool is_skip_reply_message = false,
    required bool is_lite,
    bool? isUseCache,
    Duration? durationCacheExpire,
  }) async {
    Map message_inline_message_id = {};
    if (callbackQuery.containsKey("inline_message_id")) {
      message_inline_message_id["inline_message_id"] =
          callbackQuery["inline_message_id"];
    }
    Map message_sender_chat_json = {};

    if (callbackQuery["sender_user_id"] is int) {
      if (is_lite) {
        message_sender_chat_json["from"] = {
          "id": callbackQuery["sender_user_id"],
        };
      } else {
        var res = await request(
          parameters: {
            "@type": "getUser",
            "user_id": callbackQuery["sender_user_id"],
          },
          isUseCache: isUseCache,
          durationCacheExpire: durationCacheExpire,
          is_return_as_api: false,
          telegramClientData: telegramClientData,
        );

        message_sender_chat_json["from"] = res;
      }
    }
    Map message_chat_json = {};

    if (callbackQuery["chat_id"] is int) {
      if (is_lite) {
        message_chat_json["chat"] = {
          "id": callbackQuery["chat_id"],
        };
      } else {
        var res = await request(
          parameters: {
            "@type": "getChat",
            "chat_id": callbackQuery["chat_id"],
          },
          isUseCache: isUseCache,
          durationCacheExpire: durationCacheExpire,
          is_return_as_api: false,
          telegramClientData: telegramClientData,
        );
        message_chat_json["chat"] = res;
      }
    }
    Map new_scheme_data = {
      "id": callbackQuery["id"],
      ...message_inline_message_id,
      ...message_sender_chat_json,
      ...message_chat_json,
    };

    if (callbackQuery["message_id"] is int) {
      Map message_reply_to = await invoke(
        parameters: {
          "@type": "getMessageLocally",
          "chat_id": callbackQuery["chat_id"],
          "message_id": callbackQuery["message_id"],
        },
        isUseCache: isUseCache,
        durationCacheExpire: durationCacheExpire,
        telegramClientData: telegramClientData,
      );
      new_scheme_data["message"] = await message_Message(
        message: message_reply_to,
        telegramClientData: telegramClientData,
        is_skip_reply_message: true,
        is_lite: is_lite,
        isUseCache: isUseCache,
        durationCacheExpire: durationCacheExpire,
      );
    }
    new_scheme_data["chat_instance"] = callbackQuery["chat_instance"];
    new_scheme_data["data"] =
        utf8.decode(base64.decode(callbackQuery["payload"]["data"]));

    return new_scheme_data;
  }

  /// method CallbackQueryData
  FutureOr<Map?> callbackQuery_toJson({
    required Map update,
    required TelegramClientData telegramClientData,
    required bool is_lite,
    bool? isUseCache,
    Duration? durationCacheExpire,
  }) async {
    // http://0.0.0.0:8704/classtd_1_1td__api_1_1message.html
    if (update["@type"] == "updateNewCallbackQuery" ||
        update["@type"] == "updateNewInlineCallbackQuery") {
      Map callback_query = await callbackQuery_CallbackQuery(
        callbackQuery: update,
        telegramClientData: telegramClientData,
        is_lite: is_lite,
        isUseCache: isUseCache,
        durationCacheExpire: durationCacheExpire,
      );
      return {
        "@type": "updateCallbackQuery",
        "callback_query": callback_query,
      };
    }

    return null;
  }
}
