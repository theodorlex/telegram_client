// ignore_for_file: unnecessary_brace_in_string_interps

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
// ignore_for_file: non_constant_identifier_names,

import 'package:general_lib/general_lib.dart';
import 'package:telegram_client/telegram_client/telegram_client.dart';

void main(List<String> args) async {
  print("Start Program");
  TelegramClient tg = TelegramClient();
  tg.ensureInitialized();
  tg.on(
    event_name: tg.event_update,
    onUpdate: (updateTelegramClient) async {
      Map? update = await updateTelegramClient.updateRaw(
        is_lite: false,
        updataOptionTelegramClient: UpdataOptionTelegramClient(
          updataMessageTelegramClient: UpdataMessageTelegramClient(),
        ),
      );
      if (update == null) {
        return;
      }
      if (update["@type"] == "updateAuthorizationState") {
        if (update["authorization_state"] is Map) {
          Map authorization_state = update["authorization_state"];
          if (authorization_state["@type"] == "authorizationStateWaitPhoneNumber") {
            Map res = await tg.invoke(
              parameters: {
                "@type": "setAuthenticationPhoneNumber",
                "phone_number": "62xxx",
              },
              telegramClientData: updateTelegramClient.telegramClientData,
            );
            print(res);
          }

          if (authorization_state["@type"] == "authorizationStateWaitCode") {
            Map res = await tg.invoke(
              parameters: {
                "@type": "checkAuthenticationCode",
                "code": "xxxxx",
              },
              telegramClientData: updateTelegramClient.telegramClientData,
            );
            print(res);
          }

          if (authorization_state["@type"] == "authorizationStateReady") {
            Map get_me = await tg.invoke(
              parameters: {
                "@type": "getMe",
              },
              telegramClientData: updateTelegramClient.telegramClientData,
            );
            get_me.printPretty();
          }
        }
      }
    },
    onError: (error, stackTrace) {
      print("ERROR: ${error} ${stackTrace}");
    },
  );

  await tg.tdlib.initIsolate();

  print("Client running...");
}
