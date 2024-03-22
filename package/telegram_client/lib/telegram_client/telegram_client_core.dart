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
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions empty_catches, empty_catches, unused_local_variable

import 'dart:async';
import 'package:general_lib/general_lib.dart';
import 'package:telegram_client/telegram_client/function/answer_callback_query.dart';
import 'package:telegram_client/telegram_client/function/answer_inline_query.dart';
import 'package:telegram_client/telegram_client/function/ban_chat_member.dart';
import 'package:telegram_client/telegram_client/function/ban_chat_sender_chat.dart';
import 'package:telegram_client/telegram_client/function/copy_message.dart';
import 'package:telegram_client/telegram_client/function/delete_message.dart';
import 'package:telegram_client/telegram_client/function/delete_messages.dart';
import 'package:telegram_client/telegram_client/function/edit_message_caption.dart';
import 'package:telegram_client/telegram_client/function/edit_message_media.dart';
import 'package:telegram_client/telegram_client/function/edit_message_reply_markup.dart';
import 'package:telegram_client/telegram_client/function/edit_message_text.dart';
import 'package:telegram_client/telegram_client/function/forward_message.dart';
import 'package:telegram_client/telegram_client/function/function.dart';
import 'package:telegram_client/tdlib/tdlib_ffi/tdlib.dart';
import 'package:telegram_client/telegram_bot_api/update_bot.dart';
import 'package:telegram_client/telegram_client.dart';
import 'package:telegram_client/telegram_client/function/get_chat_administrators.dart';
import 'package:telegram_client/telegram_client/function/get_chat_member.dart';
import 'package:telegram_client/telegram_client/function/get_me.dart';
import 'package:telegram_client/telegram_client/function/join_chat.dart';
import 'package:telegram_client/telegram_client/function/pin_chat_message.dart';
import 'package:telegram_client/telegram_client/function/report_message.dart';
import 'package:telegram_client/telegram_client/function/report_messages.dart';
import 'package:telegram_client/telegram_client/function/send_animation.dart';
import 'package:telegram_client/telegram_client/function/send_audio.dart';
import 'package:telegram_client/telegram_client/function/send_chat_action.dart';
import 'package:telegram_client/telegram_client/function/send_chat_screenshot_taken_notification.dart';
import 'package:telegram_client/telegram_client/function/send_contact.dart';
import 'package:telegram_client/telegram_client/function/send_dice.dart';
import 'package:telegram_client/telegram_client/function/send_document.dart';
import 'package:telegram_client/telegram_client/function/send_game.dart';
import 'package:telegram_client/telegram_client/function/send_invoice.dart';
import 'package:telegram_client/telegram_client/function/send_location.dart';
import 'package:telegram_client/telegram_client/function/send_media_group.dart';
import 'package:telegram_client/telegram_client/function/send_message.dart';
import 'package:telegram_client/telegram_client/function/send_photo.dart';
import 'package:telegram_client/telegram_client/function/send_poll.dart';
import 'package:telegram_client/telegram_client/function/send_sticker.dart';
import 'package:telegram_client/telegram_client/function/send_venue.dart';
import 'package:telegram_client/telegram_client/function/send_video.dart';
import 'package:telegram_client/telegram_client/function/send_video_note.dart';
import 'package:telegram_client/telegram_client/function/send_voice.dart';
import 'package:telegram_client/telegram_client/function/un_pin_all_chat_messages.dart';
import 'package:telegram_client/telegram_client/function/un_pin_chat_message.dart';
import 'package:telegram_client/telegram_client/function/view_message.dart';
import 'package:telegram_client/telegram_client/function/view_messages.dart';
import "package:telegram_client/telegram_client/scheme/scheme.dart"
    as telegram_client_scheme;
import 'package:universal_io/io.dart';

/// return original data json
class TelegramClient {
  late Tdlib tdlib;
  late TelegramBotApi telegramBotApi;
  EventEmitter event_emitter = EventEmitter();
  String event_update;
  String event_invoke;
  Directory? directory_temp;

  /// return original data json
  TelegramClient({
    EventEmitter? eventEmitter,
    this.event_invoke = "tg_client_invoke",
    this.event_update = "tg_client_update",
    this.directory_temp,
  }) {
    if (eventEmitter != null) {
      event_emitter = eventEmitter;
    }
  }

  /// return original data json
  void ensureInitialized({
    String? pathTdlib,
    bool is_init_tdlib = true,
    bool is_init_telegram_bot_api = true,
    TelegramClientTdlibOption? telegramClientTdlibOption,
    TelegramClientTelegramBotApiOption? telegramClientTelegramBotApiOption,
  }) {
    telegramClientTdlibOption ??= TelegramClientTdlibOption(
      isAutoGetChat: false,
      is_cli: false,
      timeOutUpdate: 1.0,
      delayInvoke: Duration(milliseconds: 1),
      delayUpdate: Duration(milliseconds: 1),
      isInvokeThrowOnError: true,
    );
    telegramClientTelegramBotApiOption ??= TelegramClientTelegramBotApiOption(
      tokenBot: "",
      clientOption: {},
    );
    if (is_init_telegram_bot_api) {
      telegramBotApi = TelegramBotApi(
        tokenBot: telegramClientTelegramBotApiOption.tokenBot,
        event_invoke: event_invoke,
        event_update: event_update,
        clientOption: telegramClientTelegramBotApiOption.clientOption,
        eventEmitter: event_emitter,
        alfred: telegramClientTelegramBotApiOption.alfred,
        telegramCryptoKey: telegramClientTelegramBotApiOption.telegramCryptoKey,
        telegramUrlWebhook:
            telegramClientTelegramBotApiOption.telegramUrlWebhook,
        httpClient: telegramClientTelegramBotApiOption.httpClient,
      );
      telegramBotApi.initServer();
    }
    if (is_init_tdlib) {
      tdlib = Tdlib(
        pathTdl: pathTdlib,
        is_cli: telegramClientTdlibOption.is_cli,
        clientOption: telegramClientTdlibOption.clientOption,
        clientId: telegramClientTdlibOption.clientId,
        timeOutUpdate: telegramClientTdlibOption.timeOutUpdate,
        invokeTimeOut: telegramClientTdlibOption.invokeTimeOut,
        event_invoke: event_invoke,
        event_update: event_update,
        delayUpdate: telegramClientTdlibOption.delayUpdate,
        delayInvoke: telegramClientTdlibOption.delayInvoke,
        isAutoGetChat: telegramClientTdlibOption.isAutoGetChat,
        on_generate_extra_invoke:
            telegramClientTdlibOption.on_generate_extra_invoke,
        on_get_invoke_data: telegramClientTdlibOption.on_get_invoke_data,
        on_receive_update: telegramClientTdlibOption.on_receive_update,
        isInvokeThrowOnError: telegramClientTdlibOption.isInvokeThrowOnError,
        eventEmitter: event_emitter,
      );
    }
  }

  Future<void> autoSetData(UpdateTelegramClient updateTelegramClient) async {
    if (updateTelegramClient.telegramClientData.telegramClientType ==
        TelegramClientType.tdlib) {
      Map update_raw = updateTelegramClient.rawData;

      if (update_raw["@type"] == "updateAuthorizationState") {
        if (update_raw["authorization_state"] is Map) {
          Map authorization_state = update_raw["authorization_state"];

          if (authorization_state["@type"] == "authorizationStateReady") {
            var user = await invoke(
              parameters: {
                "@type": "getMe",
              },
              isUseCache: false,
              durationCacheExpire: null,
              telegramClientData: updateTelegramClient.telegramClientData,
            );

            String user_usename = () {
              if (user["usernames"] is Map) {
                if (user["usernames"]["editable_username"] is String) {
                  return (user["usernames"]["editable_username"] as String);
                }
              }
              return "";
            }();

            TdlibClient? tdlibClient = tdlib.clients[
                updateTelegramClient.telegramClientData.tdlib_client_id];
            if (tdlibClient == null) {
              tdlibClient ??= TdlibClient(
                client_id:
                    updateTelegramClient.telegramClientData.tdlib_client_id,
                client_option: updateTelegramClient.client_option,
              );
              tdlib.clients[updateTelegramClient
                  .telegramClientData.tdlib_client_id] = tdlibClient;
            }

            bool is_constain_update = false;

            tdlibClient.client_user_id = user["id"];

            if (user["type"] is Map) {
              if (user["type"]["@type"] == "userTypeBot") {
                is_constain_update = true;
                tdlibClient.is_bot = true;

                updateTelegramClient.telegramClientData.is_bot = true;
              }
            }
            if (updateTelegramClient.client_option["client_first_name"] !=
                user["first_name"]) {
              is_constain_update = true;
              tdlibClient.client_option["client_first_name"] =
                  user["first_name"];
            }
            if (updateTelegramClient.client_option["client_first_name"] !=
                user["last_name"]) {
              is_constain_update = true;
              tdlibClient.client_option["client_last_name"] = user["last_name"];
            }

            if (updateTelegramClient.client_option["client_title"] !=
                "${user["first_name"]} ${user["last_name"]}".trim()) {
              is_constain_update = true;
              tdlibClient.client_option["client_title"] =
                  "${user["first_name"]} ${user["last_name"]}".trim();
            }
            if (tdlibClient.client_option["client_user_id"] != user["id"]) {
              is_constain_update = true;
              tdlibClient.client_option["client_user_id"] = user["id"];
            }

            if (updateTelegramClient.client_option["client_username"] !=
                user_usename) {
              is_constain_update = true;
              tdlibClient.client_option["client_username"] = user_usename;
              updateTelegramClient.telegramClientData.client_user_name =
                  user_usename;
            }

            if (is_constain_update) {
              await tdlib.updateClientById(
                  updateTelegramClient.telegramClientData.tdlib_client_id,
                  newTdlibClient: tdlibClient);
            }
          }
        }
      }

      if (update_raw["@type"] == "updateUser") {
        if (update_raw["user"] is Map) {
          Map user = update_raw["user"];

          if (user["id"] ==
              updateTelegramClient.telegramClientData.client_user_id) {
            // int user_id = user["id"];
            String user_usename = () {
              if (user["usernames"] is Map) {
                if (user["usernames"]["editable_username"] is String) {
                  return (user["usernames"]["editable_username"] as String);
                }
              }
              return "";
            }();

            TdlibClient? tdlibClient = tdlib.clients[
                updateTelegramClient.telegramClientData.tdlib_client_id];

            bool is_constain_update = false;
            if (tdlibClient == null) {
              tdlibClient ??= TdlibClient(
                client_id:
                    updateTelegramClient.telegramClientData.tdlib_client_id,
                client_option: updateTelegramClient.client_option,
              );
              tdlib.clients[updateTelegramClient
                  .telegramClientData.tdlib_client_id] = tdlibClient;
              is_constain_update = true;
            }

            if (user["type"] is Map) {
              if (user["type"]["@type"] == "userTypeBot") {
                is_constain_update = true;
                tdlibClient.is_bot = true;

                updateTelegramClient.telegramClientData.is_bot = true;
              }
            }
            if (updateTelegramClient.client_option["client_first_name"] !=
                user["first_name"]) {
              is_constain_update = true;
              tdlibClient.client_option["client_first_name"] =
                  user["first_name"];
            }
            if (updateTelegramClient.client_option["client_first_name"] !=
                user["last_name"]) {
              is_constain_update = true;
              tdlibClient.client_option["client_last_name"] = user["last_name"];
            }

            if (updateTelegramClient.client_option["client_title"] !=
                "${user["first_name"]} ${user["last_name"]}".trim()) {
              is_constain_update = true;
              tdlibClient.client_option["client_title"] =
                  "${user["first_name"]} ${user["last_name"]}".trim();
            }
            if (tdlibClient.client_option["client_user_id"] != user["id"]) {
              is_constain_update = true;
              tdlibClient.client_option["client_user_id"] = user["id"];
            }

            if (updateTelegramClient.client_option["client_username"] !=
                user_usename) {
              is_constain_update = true;
              tdlibClient.client_option["client_username"] = user_usename;
              updateTelegramClient.telegramClientData.client_user_name =
                  user_usename;
            }

            if (is_constain_update) {
              await tdlib.updateClientById(
                  updateTelegramClient.telegramClientData.tdlib_client_id,
                  newTdlibClient: tdlibClient);
            }
          }
        }
      }
    }
  }

  /// return original data json
  Listener on({
    required String event_name,
    required FutureOr<dynamic> Function(
            UpdateTelegramClient updateTelegramClient)
        onUpdate,
    required FutureOr<dynamic> Function(Object error, StackTrace stackTrace)
        onError,
  }) {
    return event_emitter.on(event_name, null, (ev, context) async {
      try {
        if (ev.eventData is UpdateBot) {
          UpdateBot updateBot = (ev.eventData as UpdateBot);
          await onUpdate(
            UpdateTelegramClient(
              tg_uri: updateBot.uri,
              rawData: updateBot.body,
              query: updateBot.query,
              client_option: {},
              tg: this,
              telegramClientData: TelegramClientData(
                tdlib_client_id: 0,
                telegram_bot_api_token_bot: "",
                telegramClientType: TelegramClientType.telegam_bot_api,
              ),
            ),
          );
        }

        if (ev.eventData is TdlibIsolateReceiveData) {
          TdlibIsolateReceiveData tdlibIsolateReceiveData =
              (ev.eventData as TdlibIsolateReceiveData);

          TdlibClient? tdlibClient =
              tdlib.clients[tdlibIsolateReceiveData.clientId];

          UpdateTd updateTd = UpdateTd(
            update: tdlibIsolateReceiveData.updateData,
            client_id: tdlibIsolateReceiveData.clientId,
            client_option: () {
              try {
                if (tdlibClient != null) {
                  return tdlibClient.client_option;
                }
              } catch (e) {}
              return {};
            }(),
          );
          await onUpdate(
            UpdateTelegramClient(
              rawData: updateTd.raw,
              tg_uri: Uri.base,
              query: {},
              tg: this,
              client_option: updateTd.client_option,
              telegramClientData: TelegramClientData(
                tdlib_client_id: updateTd.client_id,
                telegram_bot_api_token_bot: "",
                telegramClientType: TelegramClientType.tdlib,
                client_user_name: () {
                  try {
                    if (tdlibClient != null) {
                      if (tdlibClient.client_option["client_username"]
                          is String) {
                        return tdlibClient.client_option["client_username"];
                      }
                    }
                  } catch (e) {}

                  return "";
                }(),
                client_user_id: () {
                  try {
                    if (tdlibClient != null) {
                      return tdlibClient.client_user_id;
                    }
                  } catch (e) {}
                  return 0;
                }(),
                is_bot: () {
                  try {
                    if (tdlibClient != null) {
                      return tdlibClient.is_bot;
                    }
                  } catch (e) {}
                  return false;
                }(),
              ),
            ),
          );
        }
      } catch (e, stack) {
        try {
          await onError(e, stack);
        } catch (e) {}
      }
    });
  }

  /// return original data json
  FutureOr<Map> invoke({
    required Map parameters,
    required TelegramClientData telegramClientData,
    bool is_form = false,
    String? urlApi,
    String? clientType,
    void Function(int bytes, int bytess)? onUploadProgress,
    bool isVoid = false,
    bool? isUseCache,
    Duration? durationCacheExpire,
    Duration? delayDuration,
    Duration? invokeTimeOut,
    String? extra,
    bool? isAutoGetChat,
    bool isInvokeThrowOnError = true,
    bool isAutoExtendMessage = false,
    FutureOr<String> Function(int client_id, LibTdJson libTdJson)?
        onGenerateExtraInvoke,
    FutureOr<Map<dynamic, dynamic>> Function(
            String, int client_id, LibTdJson libTdJson)?
        onGetInvokeData,
  }) async {
    // telegramClientLib ??= telegram_client_lib;
    if (telegramClientData.telegramClientType ==
        TelegramClientType.telegam_bot_api) {
      Map respond = await telegramBotApi.request(
        parameters["@type"],
        tokenBot: telegramClientData.telegram_bot_api_token_bot,
        parameters: parameters,
        is_form: is_form,
        urlApi: urlApi,
        clientType: clientType,
        isAutoExtendMessage: isAutoExtendMessage,
        isThrowOnError: isInvokeThrowOnError,
        onUploadProgress: onUploadProgress,
      );
      return respond;
    }
    if ((telegramClientData.telegramClientType == TelegramClientType.tdlib)) {
      Map respond = (await tdlib.invoke(
        parameters["@type"],
        parameters: parameters,
        clientId: telegramClientData.tdlib_client_id,
        isVoid: isVoid,
        isUseCache: isUseCache,
        durationCacheExpire: durationCacheExpire,
        delayDuration: delayDuration,
        invokeTimeOut: invokeTimeOut,
        extra: extra,
        isAutoGetChat: isAutoGetChat,
        isInvokeThrowOnError: isInvokeThrowOnError,
        onGenerateExtraInvoke: onGenerateExtraInvoke,
        onGetInvokeData: onGetInvokeData,
      ));
      return respond;
    }
    telegram_client_scheme.Error error = telegram_client_scheme.Error.create(
      special_extra: "error",
      code: 500,
      message: "telegram_client_type_not_found",
      description: "",
    );
    if (isInvokeThrowOnError) {
      throw error.rawData;
    }
    return error.rawData;
  }

  Map requestReturnAsApi({
    required Map result,
    required bool is_return_as_api,
  }) {
    if (is_return_as_api == false) {
      return result;
    }
    Map result_data = {
      "ok": (result["@type"] == "error") ? false : true,
    };

    if (result_data["ok"] == false) {
      result_data.addAll(result);
    } else {
      if (result.containsKey("result")) {
        result_data["result"] = result["result"];
      } else {
        result_data["result"] = result;
      }
    }

    return result_data;
  }

  /// return original data json
  Future<Map> request({
    required Map parameters,
    required TelegramClientData telegramClientData,
    bool is_return_as_api = true,
    bool is_form = false,
    String? urlApi,
    String? clientType,
    void Function(int bytes, int bytess)? onUploadProgress,
    bool isVoid = false,
    bool? isUseCache,
    Duration? durationCacheExpire,
    Duration? delayDuration,
    Duration? invokeTimeOut,
    String? extra,
    bool? isAutoGetChat,
    bool isInvokeThrowOnError = true,
    bool isAutoExtendMessage = false,
    FutureOr<String> Function(int client_id, LibTdJson libTdJson)?
        onGenerateExtraInvoke,
    FutureOr<Map<dynamic, dynamic>> Function(
            String, int client_id, LibTdJson libTdJson)?
        onGetInvokeData,
  }) async {
    if (telegramClientData.telegramClientType != TelegramClientType.tdlib) {
      return await invoke(
        parameters: parameters,
        telegramClientData: telegramClientData,
        is_form: is_form,
        urlApi: urlApi,
        clientType: clientType,
        onUploadProgress: onUploadProgress,
        isVoid: isVoid,
        isUseCache: isUseCache,
        durationCacheExpire: durationCacheExpire,
        delayDuration: delayDuration,
        invokeTimeOut: invokeTimeOut,
        extra: extra,
        isAutoGetChat: isAutoGetChat,
        isAutoExtendMessage: isAutoExtendMessage,
        isInvokeThrowOnError: isInvokeThrowOnError,
        onGenerateExtraInvoke: onGenerateExtraInvoke,
        onGetInvokeData: onGetInvokeData,
      );
    }

    String method = (parameters["@type"] as String);

    /// return original data json
    FutureOr<Map> callApiInvoke({
      required Map parameters,
      bool? is_invoke_no_relevance,
      bool? is_use_cache,
      Duration? duration_cache_expire,
    }) async {
      return await invoke(
        parameters: parameters,
        telegramClientData: telegramClientData,
        is_form: is_form,
        urlApi: urlApi,
        isUseCache: is_use_cache ?? isUseCache,
        durationCacheExpire: duration_cache_expire ?? durationCacheExpire,
        clientType: clientType,
        onUploadProgress: onUploadProgress,
        isVoid: (is_invoke_no_relevance == true) ? false : isVoid,
        delayDuration: delayDuration,
        invokeTimeOut: invokeTimeOut,
        extra: (is_invoke_no_relevance == true) ? null : extra,
        isAutoGetChat: isAutoGetChat,
        isInvokeThrowOnError: isInvokeThrowOnError,
        onGenerateExtraInvoke: onGenerateExtraInvoke,
        onGetInvokeData: onGetInvokeData,
      );
    }

    if (RegExp(r"^(answerCallbackQuery)$", caseSensitive: false)
        .hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await answerCallbackQuery(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }

    if (RegExp(r"^(answerInlineQuery)$", caseSensitive: false)
        .hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await answerInlineQuery(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }

    if (RegExp(r"^(banChatMember)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await banChatMember(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(banChatSenderChat)$", caseSensitive: false)
        .hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await banChatSenderChat(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(copyMessage)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await copyMessage(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }
    if (RegExp(r"^(deleteMessage)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await deleteMessage(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(deleteMessages)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await deleteMessages(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(editMessageText)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await editMessageText(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }
    if (RegExp(r"^(editMessageCaption)$", caseSensitive: false)
        .hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await editMessageCaption(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }
    if (RegExp(r"^(editMessageMedia)$", caseSensitive: false)
        .hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await editMessageMedia(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }
    if (RegExp(r"^(editMessageReplyMarkup)$", caseSensitive: false)
        .hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await editMessageReplyMarkup(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }

    if (RegExp(r"^(forwardMessage)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await forwardMessage(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }
    if (RegExp(r"^(getChatAdministrators)$", caseSensitive: false)
        .hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await getChatAdministrators(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(getChatMember)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await getChatMember(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(getChat)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await getChat(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(getMe)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await getMe(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(getUser)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await getUser(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(joinChat)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await joinChat(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }

    if (RegExp(r"^(reportMessage)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await reportMessage(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(reportMessages)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await reportMessages(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(sendAnimation)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendAnimation(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }
    if (RegExp(r"^(sendAudio)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendAudio(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }
    if (RegExp(r"^(sendChatAction)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendChatAction(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(sendChatScreenshotTakenNotification)$", caseSensitive: false)
        .hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendChatScreenshotTakenNotification(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(sendContact)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendContact(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }
    if (RegExp(r"^(sendDice)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendDice(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }
    if (RegExp(r"^(sendDocument)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendDocument(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }
    if (RegExp(r"^(sendGame)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendGame(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }

    if (RegExp(r"^(sendInvoice)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendInvoice(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }

    if (RegExp(r"^(sendLocation)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendLocation(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }

    if (RegExp(r"^(sendMediaGroup)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendMediaGroup(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }

    if (RegExp(r"^(sendMessage)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendMessage(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }

    if (RegExp(r"^(sendPhoto)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendPhoto(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }

    if (RegExp(r"^(sendPoll)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendPoll(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }

    if (RegExp(r"^(sendSticker)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendSticker(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }

    if (RegExp(r"^(sendVenue)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendVenue(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }

    if (RegExp(r"^(sendVideoNote)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendVideoNote(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }

    if (RegExp(r"^(sendVideo)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendVideo(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }
    if (RegExp(r"^(sendVoice)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await sendVoice(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
          telegramClientData: telegramClientData,
        ),
      );
    }

    if (RegExp(r"^(pinChatMessage)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await pinChatMessage(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }

    if (RegExp(r"^(unPinAllChatMessages)$", caseSensitive: false)
        .hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await unPinAllChatMessages(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(unPinChatMessage)$", caseSensitive: false)
        .hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await unPinChatMessage(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }
    if (RegExp(r"^(viewMessage)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await viewMessage(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }

    if (RegExp(r"^(viewMessages)$", caseSensitive: false).hasMatch(method)) {
      return requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: await viewMessages(
          parameters: parameters,
          callApiInvoke: callApiInvoke,
        ),
      );
    }

    telegram_client_scheme.Error error = telegram_client_scheme.Error.create(
      special_extra: "error",
      code: 500,
      message: "telegram_client_type_not_found",
      description: "",
    );
    if (isInvokeThrowOnError == true) {
      throw requestReturnAsApi(
        is_return_as_api: is_return_as_api,
        result: (error.rawData),
      );
    }
    return requestReturnAsApi(
      is_return_as_api: is_return_as_api,
      result: (error.rawData),
    );
  }
}
