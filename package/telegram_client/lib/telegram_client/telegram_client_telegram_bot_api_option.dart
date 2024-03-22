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
