// ignore_for_file: non_constant_identifier_names, camel_case_extensions

// import 'package:general_lib/extension/extension.dart';
import 'dart:convert';

import 'package:telegram_client/telegram_client/telegram_client_core.dart';
import 'package:telegram_client/telegram_client/telegram_client_data.dart';
import 'package:telegram_client/telegram_client/telegram_client_type.dart';
import 'package:telegram_client/telegram_client/update/update.dart';
import 'package:telegram_client/util/util.dart';

/// update telegram data
class UpdateTelegramClient {
  Map rawData;
  Map query;
  late Uri uri;
  Map client_option;

  TelegramClientData telegramClientData;
  TelegramClient tg;
  UpdateTelegramClient({
    required this.rawData,
    required Uri tg_uri,
    required this.query,
    required this.client_option,
    required this.telegramClientData,
    required this.tg,
  }) {
    uri = tg_uri;
  }

  Map tgClientData() {
    if (telegramClientData.telegramClientType ==
        TelegramClientType.telegam_bot_api) {
      Map decyprt = json.decode(
          tg.telegramBotApi.telegram_crypto.decrypt(data_base64: query["tg"]));

      if (decyprt["client_user_id"] == null || decyprt["client_user_id"] == 0) {
        decyprt["client_user_id"] =
            TgUtils.parserBotUserIdFromToken(decyprt["client_token"]);
      }
      return decyprt;
    }
    return client_option;
  }

  /// DOCS: https://core.telegram.org/bots/api#update
  Future<Map?> updateRaw({
    required bool is_lite,
    required UpdataOptionTelegramClient updataOptionTelegramClient,
  }) async {
    if (telegramClientData.telegramClientType ==
        TelegramClientType.telegam_bot_api) {
      return rawData;
    }
    if (rawData["@type"] == "updateAuthorizationState") {
      return rawData;
    }

    if (rawData["@type"] == "updateNewCallbackQuery" ||
        rawData["@type"] == "updateNewInlineCallbackQuery") {
      return await tg.callbackQuery_toJson(
        update: rawData,
        telegramClientData: telegramClientData,
        is_lite: is_lite,
      );
    }

    if (rawData["@type"] == "updateNewInlineQuery") {
      return await tg.inlineQuery_toJson(
        update: rawData,
        telegramClientData: telegramClientData,
        is_lite: is_lite,
      );
    }
    if (rawData["@type"] == "updateNewMessage") {
      return await tg.message_toJson(
        update: rawData,
        telegramClientData: telegramClientData,
        is_lite: is_lite,
        updataOptionTelegramClient: updataOptionTelegramClient,
      );
    }

    return null;
  }

  /// DOCS: https://core.telegram.org/bots/api#update
  Future<Map?> get update_lite async {
    return await updateRaw(
      is_lite: true,
      updataOptionTelegramClient: UpdataOptionTelegramClient(
        updataMessageTelegramClient: UpdataMessageTelegramClient(
          is_use_cache: true,
        ),
      ),
    );
  }

  /// DOCS: https://core.telegram.org/bots/api#update
  Future<Map?> get update async {
    return await updateRaw(
      is_lite: false,
      updataOptionTelegramClient: UpdataOptionTelegramClient(
        updataMessageTelegramClient: UpdataMessageTelegramClient(),
      ),
    );
  }
}

class UpdataOptionTelegramClient {
  final UpdataMessageTelegramClient updataMessageTelegramClient;
  UpdataOptionTelegramClient({
    required this.updataMessageTelegramClient,
  });
}

class UpdataMessageTelegramClient {
  final bool bot_is_skip_old_message;
  final bool user_is_skip_old_message;
  late final Duration duration_old_message_skip;
  late final List<String> skip_old_chat_types;
  final bool is_use_cache;
  final Duration? duration_expire_cache;
  UpdataMessageTelegramClient({
    this.bot_is_skip_old_message = false,
    this.user_is_skip_old_message = true,
    this.is_use_cache = false,
    this.duration_expire_cache,
    Duration? durationOldMessageSkip,
    List<String>? skipOldChatTypes,
  }) {
    durationOldMessageSkip ??= Duration(seconds: 10);
    skipOldChatTypes ??= ["group", "supergroup", "channel"];

    duration_old_message_skip = durationOldMessageSkip;
    skip_old_chat_types = skipOldChatTypes;
  }
}
