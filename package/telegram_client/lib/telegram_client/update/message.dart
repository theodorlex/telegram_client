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
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, empty_catches, unnecessary_brace_in_string_interps

import 'dart:async';

//
import 'package:telegram_client/telegram_client/telegram_client.dart';
import 'package:telegram_client/util/util.dart';

/// method MessageData
extension MessageDataDataOn on TelegramClient {
  Future<Map> message_Message({
    required Map message,
    required TelegramClientData telegramClientData,
    bool is_skip_reply_message = false,
    required bool is_lite,
    bool? isUseCache,
    Duration? durationCacheExpire,
  }) async {
    // message.printPretty(2);
    Map message_thread_json = <dynamic, dynamic>{};
    // message.printPretty(2);
    if (message["message_thread_id"] is int &&
        message["message_thread_id"] > 0) {
      if (message["is_topic_message"] == true) {
        message_thread_json["message_thread_id"] = message["message_thread_id"];
      }
    }
    Map message_from_json = <dynamic, dynamic>{};
    Map message_sender_chat_json = <dynamic, dynamic>{};

    if (message["sender_id"] is Map) {
      if (message["sender_id"]["@type"] == "messageSenderUser") {
        message_from_json["from"] = <dynamic, dynamic>{};
        if (message["sender_id"]["user_id"] is int) {
          message_from_json["from"]["id"] = message["sender_id"]["user_id"];
          if (is_lite) {
            (message_from_json["from"] as Map).addAll({
              "first_name": "",
              "last_name": "",
              "is_lite": true,
            });
          } else {
            var res = await request(
              parameters: {
                "@type": "getUser",
                "user_id": message_from_json["from"]["id"],
              },
              isUseCache: isUseCache,
              durationCacheExpire: durationCacheExpire,
              telegramClientData: telegramClientData,
              is_return_as_api: false,
            );

            (message_from_json["from"] as Map).addAll(res);
          }
        }
      }
      if (message["sender_id"]["@type"] == "messageSenderChat") {
        message_sender_chat_json["sender_chat"] = <dynamic, dynamic>{};
        if (message["sender_id"]["chat_id"] is int) {
          message_sender_chat_json["sender_chat"]["id"] =
              message["sender_id"]["chat_id"];
          if (is_lite) {
          } else {
            var res = await request(
              parameters: {
                "@type": "getChat",
                "chat_id": message_sender_chat_json["sender_chat"]["id"],
              },
              isUseCache: isUseCache,
              durationCacheExpire: durationCacheExpire,
              telegramClientData: telegramClientData,
              is_return_as_api: false,
            );

            (message_sender_chat_json["sender_chat"] as Map).addAll(res);
          }
        }
      }
    }
    Map message_chat_json = {};

    if (message["chat_id"] is int) {
      message_chat_json["id"] = message["chat_id"];
      //
      // if (is_lite) {

      // } else {
      var res = await request(
        parameters: {
          "@type": "getChat",
          "chat_id": message_chat_json["id"],
        },
        isUseCache: isUseCache,
        durationCacheExpire: durationCacheExpire,
        telegramClientData: telegramClientData,
        is_return_as_api: false,
      );
      message_chat_json.addAll(res);
      // }
    }
    if (message["is_channel_post"] != true) {
      if (message_sender_chat_json["sender_chat"] is Map) {
        if (message["chat_id"] ==
            message_sender_chat_json["sender_chat"]["id"]) {
          message_from_json["from"] = <dynamic, dynamic>{
            "id": 1087968824,
          };
          if (is_lite) {
          } else {
            try {
              var res = await request(
                parameters: {
                  "@type": "getUser",
                  "user_id": 1087968824,
                },
                isUseCache: isUseCache,
                durationCacheExpire: durationCacheExpire,
                telegramClientData: telegramClientData,
                is_return_as_api: false,
              );
              (message_from_json["from"] as Map).addAll(res);
            } catch (e) {}
          }
        } else {
          message_from_json["from"] =
              message_sender_chat_json["sender_chat"] as Map;
        }
      }
    }

    if (telegramClientData.is_bot == false) {
      if ((message_from_json["from"] is Map)) {
        (message_from_json["from"] as Map)
            .removeWhere((key, value) => key == "phone_number");
      }
      message_chat_json.removeWhere((key, value) => key == "phone_number");
    }

    Map msg = {
      "@type": "message",
      "id": message["id"],
      "message_id": TgUtils().messageTdlibToApi(message["id"]),
      ...message_thread_json,
      ...message_from_json,
      ...message_sender_chat_json,
      "chat": message_chat_json,
      "date": message["date"],
      "is_outgoing": (message["is_outgoing"] == true),
      "content_type": "",
    };

    if (message["is_channel_post"] == true) {
      msg["chat"]["type"] = "channel";
    } else {}

    if (message["reply_to"] is Map) {
      if (is_skip_reply_message == false) {
        if (message["reply_to"]["@type"] == "messageReplyToMessage") {
          int message_reply_to_chat_id = message["reply_to"]["chat_id"];
          int message_reply_to_message_id = message["reply_to"]["message_id"];
          if (message_reply_to_message_id > 0) {
            try {
              Map message_reply_to = await invoke(
                parameters: {
                  "@type": "getRepliedMessage",
                  "chat_id": message_reply_to_chat_id,
                  "message_id": message["id"],
                },
                isUseCache: isUseCache,
                durationCacheExpire: durationCacheExpire,
                telegramClientData: telegramClientData,
              );

              msg["reply_to_message"] = await message_Message(
                message: message_reply_to,
                telegramClientData: telegramClientData,
                is_skip_reply_message: true,
                is_lite: is_lite,
                isUseCache: isUseCache,
                durationCacheExpire: durationCacheExpire,
              );
            } catch (e) {}
          }
        }
      }
    }

    if (message["edit_date"] is int && message["edit_date"] > 0) {
      msg["edit_date"] = message["edit_date"];
    }

    if (message["forward_info"] is Map) {
      Map forwardInfo = message["forward_info"];
      forwardInfo.forEach((key, value) {
        if (key == "@type") {
          return;
        }
        if (value is Map) {
        } else {
          msg["forward_${key}"] = value;
        }
      });
    }

    if (message["author_signature"] is String &&
        (message["author_signature"] as String).isNotEmpty) {
      msg["author_signature"] = message["author_signature"];
    }

    if (message["content"] is Map) {
      // ignore: unused_local_variable
      List text_entities = [];
      // ignore: unused_local_variable
      List caption_entities = [];
      Map message_content = message["content"];
      if (message_content["@type"] == "messageChatShared") {
        msg["user_shared"] = {
          "chat_id": message_content["chat_id"],
          "request_id": message_content["button_id"],
        };
      }
      if (message_content["@type"] == "messageUserShared") {
        msg["user_shared"] = {
          "user_id": message_content["user_id"],
          "request_id": message_content["button_id"],
        };
      }
      if (message_content["@type"] == "messageLocation") {
        msg["location"] = {};
        message_content.forEach((key, value) {
          if (["@type"].contains(key)) {
            return;
          }

          if (value is Map) {
            value.forEach((key_data, value_data) {
              if (["@type"].contains(key_data)) {
                return;
              }
              msg["location"][key_data] = value_data;
            });
          } else {
            msg["location"][key] = value;
          }
        });
      }
      if (message_content["@type"] == "messageText") {
        msg["content_type"] = "text";
        if (message_content["text"] is Map) {
          msg["text"] = message_content["text"]["text"];
          if (message["content"]["text"]["entities"] is List) {
            text_entities = message["content"]["text"]["entities"];
          }
        }
      }

      if (message_content["caption"] is Map) {
        if (message_content["caption"]["text"] is String &&
            (message_content["caption"]["text"] as String).isNotEmpty) {
          msg["caption"] = message_content["caption"]["text"];
        }
        if (message["content"]["caption"]["entities"] is List) {
          caption_entities = message["content"]["caption"]["entities"];
        }
      }

      if (text_entities.isNotEmpty) {
        msg["entities"] = await entitiesToApi(
          oldEntities: text_entities,
          telegramClientData: telegramClientData,
          is_lite: is_lite,
          isUseCache: isUseCache,
          durationCacheExpire: durationCacheExpire,
        );
      }
      if (caption_entities.isNotEmpty) {
        msg["caption_entities"] = await entitiesToApi(
          oldEntities: caption_entities,
          telegramClientData: telegramClientData,
          is_lite: is_lite,
          isUseCache: isUseCache,
          durationCacheExpire: durationCacheExpire,
        );
      }

      if (message_content["@type"] == "messageAnimation") {
        msg["content_type"] = "animation";

        /// http://0.0.0.0:8080/classtd_1_1td__api_1_1animation.html
        Map animation = {};
        if (message["animation"] is Map) {
          if (message["animation"]["animation"] is Map) {
            Map message_animation = message["animation"]["animation"];
            animation["id"] = message_animation["id"];
            if (message_animation["local"] is Map) {
              animation["file_path"] = message_animation["local"]["path"];
              animation["is_downloading_active"] =
                  message_animation["local"]["is_downloading_active"];
              animation["is_downloading_completed"] =
                  message_animation["local"]["is_downloading_completed"];
            }
            if (message_animation["remote"] is Map) {
              animation["file_id"] = message_animation["remote"]["id"];
              animation["file_unique_id"] =
                  message_animation["remote"]["unique_id"];
              animation["file_size"] = message_animation["remote"]["size"];
            }
          }
          animation["width"] = message["animation"]["width"];
          animation["height"] = message["animation"]["height"];
          animation["duration"] = message["animation"]["duration"];
          // Map msg_content_thumbnail = {};
          animation["file_name"] = message["animation"]["file_name"];
          animation["mime_type"] = message["animation"]["mime_type"];
        }
        msg["animation"] = animation;
      }

      if (message_content["@type"] == "messagePhoto") {
        // http://0.0.0.0:8080/classtd_1_1td__api_1_1animation.html
        List photos = [];
        if (message_content["photo"] is Map) {
          List photo_sizes = message_content["photo"]["sizes"];

          for (var i = 0; i < photo_sizes.length; i++) {
            dynamic photo_data = photo_sizes[i];
            if (photo_data is Map) {
              if (photo_data["photo"] is Map) {
                Map jsonDataPhoto = {};

                Map message_photo = photo_data["photo"];
                jsonDataPhoto["id"] = message_photo["id"];
                if (message_photo["local"] is Map) {
                  jsonDataPhoto["file_path"] = message_photo["local"]["path"];
                  jsonDataPhoto["is_downloading_active"] =
                      message_photo["local"]["is_downloading_active"];
                  jsonDataPhoto["is_downloading_completed"] =
                      message_photo["local"]["is_downloading_completed"];
                }
                if (message_photo["remote"] is Map) {
                  jsonDataPhoto["file_id"] = message_photo["remote"]["id"];
                  jsonDataPhoto["file_unique_id"] =
                      message_photo["remote"]["unique_id"];
                  jsonDataPhoto["file_size"] = message_photo["remote"]["size"];
                }
                photos.add(jsonDataPhoto);
              }
            }
          }
        }
        msg["photo"] = photos;
      }

      if (message["content"]["@type"] == "messageVideo") {
        msg["content_type"] = "video";
        if (message["content"]["video"] is Map) {
          if (message["content"]["video"]["@type"] == "video") {
            var jsonVideo = {};
            var contentVideo = message["content"]["video"];
            jsonVideo["duration"] = contentVideo["duration"];
            jsonVideo["height"] = contentVideo["height"];
            jsonVideo["file_name"] = contentVideo["file_name"];
            jsonVideo["mime_type"] = contentVideo["mime_type"];
            try {
              if (message["content"]["video"]["thumbnail"] != null &&
                  message["content"]["video"]["thumbnail"]["@type"]
                          .toString()
                          .toLowerCase() ==
                      "thumbnail") {
                var contentThumb = contentVideo["thumbnail"];
                var jsonThumb = {};
                jsonVideo["thumb"] = jsonThumb;
                jsonThumb["file_id"] = contentThumb["file"]["remote"]["id"];
                jsonThumb["file_unique_id"] =
                    contentThumb["file"]["remote"]["unique_id"];
                jsonThumb["file_size"] = contentThumb["file"]["size"];
                jsonThumb["width"] = contentThumb["width"];
                jsonThumb["height"] = contentThumb["height"];
              }
            } catch (e) {}
            jsonVideo["file_id"] = contentVideo["video"]["remote"]["id"];
            jsonVideo["file_size"] = contentVideo["video"]["size"];
            msg["video"] = jsonVideo;
          }
        }
      }

      // http://localhost:8080/classtd_1_1td__api_1_1audio.html
      if (message["content"]["@type"] == "messageAudio") {
        var contentType = "audio";
        msg["content_type"] = "audio";
        if (message["content"]["audio"] is Map) {
          if (message["content"]["audio"]["@type"] == "audio") {
            var jsonContent = {};
            var contentUpdate = message["content"][contentType];

            jsonContent["id"] = contentUpdate[contentType]["id"];
            jsonContent["file_path"] =
                contentUpdate[contentType]["local"]["path"];
            jsonContent["is_downloading_active"] =
                contentUpdate[contentType]["local"]["is_downloading_active"];
            jsonContent["is_downloading_completed"] =
                contentUpdate[contentType]["local"]["is_downloading_completed"];

            jsonContent["file_id"] = contentUpdate[contentType]["remote"]["id"];
            jsonContent["file_unique_id"] =
                contentUpdate[contentType]["remote"]["unique_id"];
            jsonContent["duration"] = contentUpdate["duration"];
            jsonContent["performer"] = contentUpdate["performer"];
            jsonContent["file_name"] = contentUpdate["file_name"];
            jsonContent["title"] = contentUpdate["title"];
            jsonContent["mime_type"] = contentUpdate["mime_type"];
            jsonContent["file_size"] = contentUpdate[contentType]["size"];
            msg[contentType] = jsonContent;
          }
        }
      }
      // http://localhost:8080/classtd_1_1td__api_1_1file.html
      // https://core.telegram.org/bots/api#contact
      if (message["content"]["@type"] == "messageContact") {
        var contentType = "contact";
        msg["content_type"] = contentType;
        if (message["content"][contentType] is Map) {
          if (message["content"][contentType]["@type"] == contentType) {
            var jsonContent = {};
            var contentUpdate = message["content"][contentType];
            jsonContent["phone_number"] = contentUpdate["phone_number"];
            jsonContent["first_name"] = contentUpdate["first_name"];
            jsonContent["last_name"] = contentUpdate["last_name"];
            jsonContent["user_id"] = contentUpdate["user_id"];
            jsonContent["vcard"] = contentUpdate["vcard"];
            msg[contentType] = jsonContent;
          }
        }
      }

      if (message["content"]["@type"] == "messagePoll") {
        var contentType = "poll";
        msg["content_type"] = contentType;
        if (message["content"][contentType] is Map) {
          if (message["content"][contentType]["@type"] == contentType) {
            var jsonContent = {};
            var contentUpdate = message["content"][contentType];
            jsonContent["id"] = contentUpdate["id"];
            jsonContent["question"] = contentUpdate["question"];
            jsonContent["options"] = contentUpdate["options"];
            jsonContent["total_voter_count"] =
                contentUpdate["total_voter_count"];
            jsonContent["recent_voter_user_ids"] =
                contentUpdate["recent_voter_user_ids"];
            jsonContent["is_anonymous"] = contentUpdate["is_anonymous"];
            jsonContent["type"] = contentUpdate["type"];
            jsonContent["open_period"] = contentUpdate["open_period"];
            jsonContent["close_date"] = contentUpdate["close_date"];
            jsonContent["is_closed"] = contentUpdate["is_closed"];
            msg[contentType] = jsonContent;
          }
        }
      }

      if (message["content"]["@type"] == "messageDocument") {
        var contentType = "document";
        msg["content_type"] = contentType;
        if (message["content"][contentType] is Map) {
          if (message["content"][contentType]["@type"] == contentType) {
            var jsonContent = {};
            var contentUpdate = message["content"][contentType];
            jsonContent["file_name"] = contentUpdate["file_name"];
            jsonContent["mime_type"] = contentUpdate["mime_type"];

            jsonContent["file_id"] = contentUpdate[contentType]["remote"]["id"];
            jsonContent["unique_id"] =
                contentUpdate[contentType]["remote"]["unique_id"];
            jsonContent["file_size"] = contentUpdate[contentType]["size"];
            msg[contentType] = jsonContent;
          }
        }
      }

      if (message["content"]["@type"] == "messageSticker") {
        var contentType = "sticker";
        msg["content_type"] = contentType;
        if (message["content"][contentType] is Map) {
          if (message["content"][contentType]["@type"] == contentType) {
            var jsonContent = {};
            var contentUpdate = message["content"][contentType];
            jsonContent["set_id"] = contentUpdate["set_id"];

            try {
              var res = await invoke(
                parameters: {
                  "@type": "getStickerSet",
                  "set_id": int.tryParse(contentUpdate["set_id"]) ??
                      contentUpdate["set_id"],
                },
                isUseCache: isUseCache,
                durationCacheExpire: durationCacheExpire,
                telegramClientData: telegramClientData,
              );

              jsonContent["set_name"] = res["name"];
            } catch (e) {
              // print(e);
            }
            jsonContent["width"] = contentUpdate["width"];
            jsonContent["height"] = contentUpdate["height"];
            jsonContent["emoji"] = contentUpdate["emoji"];
            jsonContent["is_animated"] = contentUpdate["is_animated"];
            jsonContent["is_mask"] = contentUpdate["is_mask"];

            try {
              if (message["content"][contentType]["thumbnail"] != null &&
                  message["content"][contentType]["thumbnail"]["@type"]
                          .toString()
                          .toLowerCase() ==
                      "thumbnail") {
                var contentThumb = contentUpdate["thumbnail"];
                var jsonThumb = {};
                jsonThumb["file_id"] = contentThumb["file"]["remote"]["id"];
                jsonThumb["file_unique_id"] =
                    contentThumb["file"]["remote"]["unique_id"];
                jsonThumb["file_size"] = contentThumb["file"]["size"];
                jsonThumb["width"] = contentThumb["width"];
                jsonThumb["height"] = contentThumb["height"];
                jsonContent["thumb"] = jsonThumb;
              }
            } catch (e) {}

            jsonContent["file_id"] = contentUpdate[contentType]["remote"]["id"];
            jsonContent["file_unique_id"] =
                contentUpdate[contentType]["remote"]["unique_id"];
            jsonContent["file_size"] = contentUpdate[contentType]["size"];
            msg[contentType] = jsonContent;
          }
        }
      }

      if (message["content"]["@type"] == "messageVoiceNote") {
        var contentType = "voice_note";
        msg["content_type"] = contentType;
        if (message["content"][contentType] is Map) {
          if (message["content"][contentType]["@type"] == "voiceNote") {
            var jsonContent = {};
            var contentUpdate = message["content"][contentType];

            jsonContent["duration"] = contentUpdate["duration"];
            jsonContent["waveform"] = contentUpdate["waveform"];
            jsonContent["mime_type"] = contentUpdate["mime_type"];

            jsonContent["file_id"] = contentUpdate["voice"]["remote"]["id"];
            jsonContent["unique_id"] =
                contentUpdate["voice"]["remote"]["unique_id"];
            jsonContent["file_size"] = contentUpdate["voice"]["size"];
            msg["voice"] = jsonContent;
          }
        }
      }
      if (message["content"]["@type"] == "messageChatJoinByLink") {
        msg["content_type"] = "new_member";
        Map newMemberFrom = msg["from"];
        try {
          newMemberFrom.remove("detail");
        } catch (e) {}
        msg["new_chat_members"] = [newMemberFrom];
      }
      if (message["content"]["@type"] == "messageScreenshotTaken") {
        msg["content_type"] = "screenshot";

        msg["is_screenshot"] = true;
      }
      if (message["content"]["@type"] == "messageStory") {
        msg["content_type"] = "story";

        msg["story"] = {
          "story_sender_chat_id": message["content"]["story_sender_chat_id"],
          "story_id": message["content"]["story_id"],
        };
      }
    }

    if (message["reply_markup"] is Map) {
      Map? reply_markup = TgUtils.replyMarkupTdlibToTgApi(
        replyMarkup: message["reply_markup"],
      );
      if (reply_markup != null) {
        msg["reply_markup"] = reply_markup;
      }
    }
    message.forEach((key, value) {
      if (value is bool) {
        msg[key] = value;
      }
    });
    if (message["can_be_saved"] == false) {
      msg["has_protected_content"] = true;
    }

    return msg;
  }

  Future<List<Map<dynamic, dynamic>>> entitiesToApi({
    required List oldEntities,
    required TelegramClientData telegramClientData,
    required bool is_lite,
    bool? isUseCache,
    Duration? durationCacheExpire,
  }) async {
    List<Map<dynamic, dynamic>> entities_data = [];

    for (var i = 0; i < oldEntities.length; i++) {
      var dataEntities = oldEntities[i];
      try {
        Map<dynamic, dynamic> jsonEntities = <dynamic, dynamic>{};
        jsonEntities["offset"] = dataEntities["offset"];
        jsonEntities["length"] = dataEntities["length"];
        if (dataEntities["type"]["@type"] != null) {
          var typeEntities = dataEntities["type"]["@type"]
              .toString()
              .toLowerCase()
              .replaceAll(RegExp("textEntityType", caseSensitive: false), "")
              .replaceAll(RegExp("textUrl", caseSensitive: false), "text_link")
              .replaceAll(
                  RegExp("bot_command", caseSensitive: false), "bot_command")
              .replaceAll(
                  RegExp("mentionname", caseSensitive: false), "text_mention");
          jsonEntities["type"] = typeEntities;
          if (dataEntities["type"]["url"] != null) {
            jsonEntities["url"] = dataEntities["type"]["url"];
          }
          if (typeEntities == "text_mention" &&
              dataEntities["type"]["user_id"] != null) {
            var entitiesUserId = dataEntities["type"]["user_id"];
            Map<dynamic, dynamic> fromJson = <dynamic, dynamic>{
              "id": entitiesUserId
            };
            if (is_lite) {
            } else {
              try {
                var res = await request(
                  parameters: {
                    "@type": "getUser",
                    "user_id": entitiesUserId,
                  },
                  isUseCache: isUseCache,
                  durationCacheExpire: durationCacheExpire,
                  is_return_as_api: false,
                  telegramClientData: telegramClientData,
                );

                fromJson = res;
              } catch (e) {}
            }
            jsonEntities["user"] = fromJson;
          }
        }
        entities_data.add(jsonEntities);
      } catch (e) {}
    }
    return entities_data;
  }

  /// method MessageData
  FutureOr<Map?> message_toJson({
    required Map update,
    required TelegramClientData telegramClientData,
    required bool is_lite,
    required UpdataOptionTelegramClient updataOptionTelegramClient,
  }) async {
    // http://0.0.0.0:8704/classtd_1_1td__api_1_1message.html
    if (update["@type"] == "updateNewMessage") {
      Map message = update["message"];
      if ((message["is_outgoing"] == true)) {
        if (telegramClientData.is_bot) {
          return null;
        }
      }
      bool isSkipUpdate() {
        String chat_type = "";
        // spambot false
        if (message["chat_id"] == 178220800) {
          return false;
        }

        if (message["chat_id"] > 0) {
          chat_type = "private";
        }
        if (message["chat_id"] < 0) {
          chat_type = "group";
        }

        if (message["is_channel_post"] == true) {
          chat_type = "channel";
        }
        if (chat_type.isNotEmpty &&
            updataOptionTelegramClient
                .updataMessageTelegramClient.skip_old_chat_types
                .contains(chat_type)) {
          DateTime dateTime =
              DateTime.now().copyWith(microsecond: 0, millisecond: 0);
          DateTime dateTimeMessage =
              DateTime.fromMillisecondsSinceEpoch((message["date"] * 1000));
          Duration duration = dateTime.difference(dateTimeMessage);

          if (duration >
              updataOptionTelegramClient
                  .updataMessageTelegramClient.duration_old_message_skip) {
            return true;
          }
        }
        return false;
      }

      // check user
      if (telegramClientData.is_bot == false) {
        if (updataOptionTelegramClient
            .updataMessageTelegramClient.user_is_skip_old_message) {
          bool is_skip_update = isSkipUpdate();
          if (is_skip_update) {
            return null;
          }
        }
      } else {
        if (updataOptionTelegramClient
            .updataMessageTelegramClient.bot_is_skip_old_message) {
          bool is_skip_update = isSkipUpdate();
          if (is_skip_update) {
            return null;
          }
        }
      }

      Map msg = await message_Message(
        message: message,
        telegramClientData: telegramClientData,
        is_lite: is_lite,
        isUseCache:
            updataOptionTelegramClient.updataMessageTelegramClient.is_use_cache,
        durationCacheExpire: updataOptionTelegramClient
            .updataMessageTelegramClient.duration_expire_cache,
      );

      if (msg["chat"]["type"] == "channel") {
        return {
          "@type": "updateChannelPost",
          "channel_post": msg,
        };
      } else {
        return {
          "@type": "updateMessage",
          "message": msg,
        };
      }
    }

    return null;
  }
}
