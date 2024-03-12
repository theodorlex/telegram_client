// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions unused_local_variable, unused_local_variable

import 'dart:convert';
import 'package:telegram_client/alfred/alfred.dart';
import 'package:telegram_client/telegram_client.dart';

void main(List<String> args) async {
  Alfred alfred = Alfred(
    logLevel: LogType.error,
  );
  await alfred.listen();
  TelegramBotApiServer telegramBotApiServer = TelegramBotApiServer();
  await telegramBotApiServer.run(
    executable: "telegram-bot-api",
    arguments: telegramBotApiServer.optionsParameters(
      api_id: "telegram_api_id",
      api_hash: "telegram_api_hash",
    ),
    host: "0.0.0.0",
    tg_bot_api_port: 9000,
  );
  print(
      "Server on: http://${alfred.server!.address.host}:${alfred.server!.port}");
  String telegram_token_bot = "";
  Uri telegram_url_webhook = Uri.parse("https://0.0.0.0:3000/telegram/webhook");
  TelegramBotApi tg = TelegramBotApi(
    tokenBot: telegram_token_bot,
    alfred: alfred,
    clientOption: {"api": "http://0.0.0.0:9000"},
    telegramUrlWebhook: telegram_url_webhook,
  );
  tg.on(tg.event_update, (updateBot) async {
    try {
      Map update = updateBot.body;
      if (update["message"] is Map) {
        Map msg = update["message"];
        int form_id = msg["from"]["id"];
        int chat_id = msg["chat"]["id"];
        String caption_msg = () {
          if (msg["text"] is String) {
            return msg["text"];
          }
          if (msg["caption"] is String) {
            return msg["caption"];
          }

          return "";
        }();
        if (caption_msg.isNotEmpty) {
          if (RegExp(r"^/(start)", caseSensitive: false)
              .hasMatch(caption_msg)) {
            return await tg.request(
              "sendMessage",
              parameters: {
                "chat_id": chat_id,
                "text": "Hai saya adalah robot",
              },
              isAutoExtendMessage: true,
            );
          }
        }
        await tg.request(
          "sendMessage",
          parameters: {
            "chat_id": chat_id,
            "text": json.encode(msg),
          },
          isAutoExtendMessage: true,
        );
      }
    } catch (e) {
      print(e);
    }
  });
  Map client = await tg.initIsolate();
  print(client);
}
