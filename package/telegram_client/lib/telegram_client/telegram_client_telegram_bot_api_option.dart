import 'package:http/http.dart';
import 'package:telegram_client/alfred/alfred.dart';

class TelegramClientTelegramBotApiOption {
  Map clientOption;
  String tokenBot;
  Alfred? alfred;
  String telegramCryptoKey;
  Uri? telegramUrlWebhook;
  Client? httpClient;
  TelegramClientTelegramBotApiOption({
    required this.tokenBot,
    required this.clientOption,
    this.alfred,
    this.telegramCryptoKey = "aeatmlvodkm9ii37l2p0WGkaAAF3BWCh",
    this.telegramUrlWebhook,
    this.httpClient,
  });
}
