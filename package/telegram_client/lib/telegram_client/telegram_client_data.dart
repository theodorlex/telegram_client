// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'package:telegram_client/telegram_client/telegram_client_type.dart';

/// return original data json
class TelegramClientData {
  int tdlib_client_id;
  TelegramClientType telegramClientType;
  String telegram_bot_api_token_bot;
  bool is_bot;
  int client_user_id;
  String client_user_name;

  /// return original data json
  TelegramClientData({
    required this.telegram_bot_api_token_bot,
    required this.telegramClientType,
    required this.tdlib_client_id,
    this.client_user_name = "",
    this.client_user_id = 0,
    this.is_bot = false,
  });

  /// return original data json
  static TelegramClientData tdlib({
    required int tdlib_client_id,
    String client_user_name = "",
    int client_user_id = 0,
    bool is_bot = true,
  }) {
    return TelegramClientData(
      telegram_bot_api_token_bot: "",
      telegramClientType: TelegramClientType.tdlib,
      tdlib_client_id: tdlib_client_id,
      client_user_name: client_user_name,
      client_user_id: client_user_id,
      is_bot: is_bot,
    );
  }

  /// return original data json
  static TelegramClientData telegramBotApi({
    required String token_bot,
    String client_user_name = "",
    int client_user_id = 0,
    bool is_bot = true,
  }) {
    return TelegramClientData(
      telegram_bot_api_token_bot: token_bot,
      telegramClientType: TelegramClientType.telegam_bot_api,
      tdlib_client_id: 0,
      client_user_name: client_user_name,
      client_user_id: client_user_id,
      is_bot: is_bot,
    );
  }
}
