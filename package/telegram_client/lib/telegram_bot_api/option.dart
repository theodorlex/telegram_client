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
import 'package:general_lib/general_lib.dart';
import 'package:http/http.dart';
import 'package:server_universe/native/core/server_universe_native.dart';
import "package:server_universe/native/native.dart";
// import 'package:telegram_client/serverUniverseNative/serverUniverseNative.dart';

class TelegramClientTelegramBotApiOption {
  final Map clientOption;
  final String tokenBot;
  final ServerUniverseNative? serverUniverseNative;
  final Crypto? crypto;
  final Uri? telegramUrlWebhook;
  final Client? httpClient;
  const TelegramClientTelegramBotApiOption({
    required this.tokenBot,
    required this.clientOption,
    this.serverUniverseNative,
    this.crypto,
    this.telegramUrlWebhook,
    this.httpClient,
  });

  TelegramClientTelegramBotApiOption copyWith({
    String? tokenBot,
    Map<dynamic, dynamic>? clientOption,
    ServerUniverseNative? serverUniverseNative,
    Crypto? crypto,
    Uri? telegramUrlWebhook,
    Client? httpClient,
  }) {
    return TelegramClientTelegramBotApiOption(
      tokenBot: tokenBot ?? this.tokenBot,
      clientOption: clientOption ?? this.clientOption,
      serverUniverseNative: serverUniverseNative ?? this.serverUniverseNative,
      crypto: crypto ?? this.crypto,
      telegramUrlWebhook: telegramUrlWebhook ?? this.telegramUrlWebhook,
      httpClient: httpClient ?? this.httpClient,
    );
  }
}
