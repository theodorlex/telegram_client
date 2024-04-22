// ignore_for_file: non_constant_identifier_names

// import 'dart:io';
import 'package:general_lib/script_generate/script_generate.dart';
import 'package:universal_io/io.dart';

List<ScriptGenerator> telegram_bot_telegram_client_script_generators = [
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    fileSystemEntity: Directory(".github"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.directory,
    value: r"""""",
    children: [
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        fileSystemEntity: File(".github/FUNDING.yaml"),
        state_data: {},
        fileSystemEntityType: FileSystemEntityType.file,
        value: r"""github: [azkadev]
custom: []""",
        children: [],
      )
    ],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    fileSystemEntity: Directory("bin"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.directory,
    value: r"""""",
    children: [
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        fileSystemEntity: File("bin/telegram_bot.dart"),
        state_data: {},
        fileSystemEntityType: FileSystemEntityType.file,
        value: r"""/* <!-- START LICENSE -->


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
// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names, empty_catches, unused_catch_stack

import 'dart:io';

import 'package:telegram_bot/telegram_bot.dart';
import 'package:telegram_bot/logger/logger.dart';

import 'package:general_lib/general_lib.dart';

import 'package:path/path.dart';
import 'package:telegram_client/telegram_client.dart';

void main(List<String> arguments) async {
  logger.info("Telegram Bot By Azkadev");

  Directory database_telegram = Directory(join(Directory.current.path, "database_telegram"));
  if (!database_telegram.existsSync()) {
    await database_telegram.create(recursive: true);
  }

  Directory database_user = await Future(() async {
    List<Directory> dirs = Directory(join(database_telegram.path))
        .listSync()
        .where((element) {
          if (element is Directory && RegExp(r"^(client_(.*))$", caseSensitive: false).hasMatch(basename(element.path))) {
            return true;
          }
          return false;
        })
        .map((e) => (e as Directory))
        .toList();

    // while (true) {
    // await Future.delayed(Duration(milliseconds: 100));
    Directory directory_choose = logger.chooseOne(
      "Silahkan Pilih Client / Buat Baru",
      choices: [
        Directory(join(database_telegram.path, "create_new_client")),
        ...dirs,
      ],
      display: (choice) {
        return basename(choice.path).replaceAll(RegExp(r"^(client_)", caseSensitive: false), "");
      },
    );
    if (basename(directory_choose.path) == "create_new_client") {
      while (true) {
        String new_client_name = logger.prompt("❔️ New Client Name: ").trim();
        if (new_client_name.isEmpty) {
          logger.err("Tolong isi data dengan benar!");
          continue;
        }
        Directory directory_new_client = Directory(join(database_telegram.path, "client_${new_client_name}"));
        if (directory_new_client.existsSync()) {
          logger.err("Client: ${new_client_name} Sudah Ada");
          continue;
        }
        logger.success("Succes Create Client: ${new_client_name}");
        return directory_new_client;
      }
    }
    return directory_choose;
    // }
  });
  TelegramClient tg = TelegramClient();

  tg.ensureInitialized(
    telegramClientTdlibOption: TelegramClientTdlibOption(
      clientOption: {
        'database_directory': database_user.path,
        'files_directory': database_user.path,
        "use_test_dc": false,
      },
      invokeTimeOut: Duration(minutes: 1),
      delayInvoke: Duration(milliseconds: 10),
      delayUpdate: Duration.zero,
      timeOutUpdate: 1.0,
    ),
  );

  tg.on(
    event_name: tg.event_update,
    onUpdate: (updateTelegramClient) async {
      try {
        await tg.autoSetData(updateTelegramClient);

        Map? update = await updateTelegramClient.updateRaw(
          is_lite: false,
          updataOptionTelegramClient: UpdataOptionTelegramClient(
            updataMessageTelegramClient: UpdataMessageTelegramClient(
              bot_is_skip_old_message: false,
              user_is_skip_old_message: true,
              skipOldChatTypes: [
                "private",
                "group",
                "channel",
                "supergroup",
              ],
            ),
          ),
        );

        if (update == null) {
          return null;
        }

        if (update["@type"] == "updateAuthorizationState") {
          if (update["authorization_state"] is Map) {
            var authStateType = update["authorization_state"]["@type"];

            if (authStateType == "authorizationStateWaitRegistration") {
              if (update["authorization_state"]["terms_of_service"] is Map) {
                Map terms_of_service = update["authorization_state"]["terms_of_service"] as Map;
                if (terms_of_service["text"] is Map) {
                  await tg.tdlib.invoke(
                    "registerUser",
                    parameters: {
                      "first_name": "random name",
                      "last_name": "generalfoss ${DateTime.now().toString()}",
                    },
                    clientId: updateTelegramClient.telegramClientData.tdlib_client_id,
                  );
                }
              }
            }

            if (authStateType == "authorizationStateClosed") {
              logger.info("silahkan login lagi");
              exit(1);
            }

            if (authStateType == "authorizationStateLoggingOut") {}

            if (authStateType == "authorizationStateClosed") {
              print("close: ${updateTelegramClient.telegramClientData.tdlib_client_id}");
              await tg.tdlib.exitClientById(updateTelegramClient.telegramClientData.tdlib_client_id, isClose: false);
            }

            if (authStateType == "authorizationStateWaitPhoneNumber") {
              while (true) {
                await Future.delayed(Duration(milliseconds: 10));
                String phone_number_or_token_bot_procces = logger.prompt("❔️ Nomor Ponsel / Token Bot @botfather", defaultValue: "+628888888888 / 123456789:abcdfghijklmnopqrstuvwxyz ", hidden: false).trim().replaceAll(
                      RegExp(r"( |\+)", caseSensitive: false),
                      "",
                    );
                if (phone_number_or_token_bot_procces.isEmpty) {
                  logger.err("Tolong isi data dengan benar!");
                  continue;
                }
                logger.info("Request Code: ${phone_number_or_token_bot_procces}");
                var res = {};

                if (RegExp(r"^(([0-9]+):AA(.*))$", caseSensitive: false).hasMatch(phone_number_or_token_bot_procces)) {
                  res = await tg.invoke(
                    // method: "setAuthenticationPhoneNumber",
                    parameters: {
                      "@type": "checkAuthenticationBotToken",
                      "token": phone_number_or_token_bot_procces,
                    },
                    telegramClientData: updateTelegramClient.telegramClientData,
                  );
                } else {
                  res = await tg.invoke(
                    // method: "setAuthenticationPhoneNumber",
                    parameters: {
                      "@type": "setAuthenticationPhoneNumber",
                      "phone_number": phone_number_or_token_bot_procces,
                    },
                    telegramClientData: updateTelegramClient.telegramClientData,
                  );
                }
                if (res["@type"] == "error") {
                  logger.err(jsonToMessage(res, jsonFullMedia: {}));
                  continue;
                }
                return;
                // break;
              }
            }

            if (authStateType == "authorizationStateWaitCode") {
              while (true) {
                await Future.delayed(Duration(milliseconds: 10));
                String code_procces = logger.prompt("❔️ Code", defaultValue: "12345 ", hidden: false).trim().replaceAll(RegExp(r"( |\+)", caseSensitive: false), "");
                if (code_procces.isEmpty) {
                  logger.err("Tolong isi data dengan benar!");
                  continue;
                }
                logger.info("send Code: ${code_procces}");
                var res = await tg.invoke(
                  // method: "setAuthenticationPhoneNumber",
                  parameters: {
                    "@type": "checkAuthenticationCode",
                    "code": code_procces,
                  },
                  telegramClientData: updateTelegramClient.telegramClientData,
                );

                if (res["@type"] == "error") {
                  logger.err(jsonToMessage(res, jsonFullMedia: {}));
                  continue;
                }
                return;
                // break;
              }
            }

            if (authStateType == "setAuthenticationEmailAddress") {}

            if (authStateType == "authorizationStateWaitEmailCode") {}

            if (authStateType == "authorizationStateWaitPassword") {}
            if (authStateType == "authorizationStateWaitOtherDeviceConfirmation") {}
            if (authStateType == "authorizationStateReady") {
              var getMe = await tg.tdlib.getMe(clientId: updateTelegramClient.telegramClientData.tdlib_client_id);

              logger.success(jsonToMessage(getMe["result"], jsonFullMedia: {}));
              return;
            }
          }

          update.printPretty();

          return;
        }

        if (update["message"] is Map) {
          Map msg = update["message"];
          // msg.clone().printPretty();
          await updateMessage(
            msg: msg,
            tg: tg,
            updateTelegramClient: updateTelegramClient,
          );
        }
      } catch (e, stack) {
        logger.err("${e} ${stack}");
      }
    },
    onError: (error, stackTrace) {
      logger.err("${error} ${stackTrace}");
    },
  );

  Map init_res = await tg.tdlib.initIsolate();
  if (init_res["@type"] == "error") {
    init_res.printPretty();

    exit(1);
  }
}
""",
        children: [],
      ),
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        fileSystemEntity: File("bin/telegram_bot_native.dart"),
        state_data: {},
        fileSystemEntityType: FileSystemEntityType.file,
        value: r"""import 'dart:io';

import 'package:server_universe_dart/native/native.dart';
import 'package:telegram_client/telegram_client/telegram_client_core.dart';

void main() async {
  print("start");
  int port = int.tryParse(Platform.environment["PORT"] ?? "3000") ?? 3000;
  String host = Platform.environment["HOST"] ?? "0.0.0.0";

  TelegramClient tg = TelegramClient();
  tg.ensureInitialized(
    is_init_tdlib: false,
  );

  ServerUniverseNative app = ServerUniverseNative(
    onNotFound: (req, res) async {
      return res.json({"@type": "error", "message": "path_not_found", "description": "PATH: Not Found"});
    },
    onInternalError: (req, res) {
      return res.json({"@type": "error", "message": "server_crash"});
    },
  );
  app.all("/", (req, res) {
    return res.send("oke");
  });
  app.all("/telegram/webhook", (req, res) {
    req.body;
    return res.send("oke");
  });

  await app.listen(port, host);

  print("Server on");
}
""",
        children: [],
      ),
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        fileSystemEntity: File("bin/telegram_bot_supabase.dart"),
        state_data: {},
        fileSystemEntityType: FileSystemEntityType.file,
        value: r"""import 'package:server_universe_dart/edge/edge.dart';
import 'package:server_universe_dart_http_client/server_universe_dart_http_client.dart';
import 'package:telegram_bot/config/config.dart';
import 'package:telegram_client/telegram_client.dart';

void main() async {
  print("start");
  ServerUniverseEdge app = ServerUniverseEdge(
    onNotFound: (req, res) async {
      return res.status(404).json({"@type": "error", "message": "path_not_found", "description": "PATH: ${req.path} Not Found"});
    },
    onError: (req, res, object, stackTrace) {
      return res.status(500).json({"@type": "error", "message": "server_crash"});
    },
  );
  app.ensureInitialized();
  TelegramClient tg = TelegramClient();
  tg.ensureInitialized(
    is_init_tdlib: false,
    telegramClientTelegramBotApiOption: TelegramClientTelegramBotApiOption(
      tokenBot: TelegramBotConfig.telegram_token_bot,
      clientOption: {},
      httpClient: ServerUniverseHttpClient(),
    ),
  );
  app.all("/", (req, res) {
    return res.send("oke");
  });
  app.all("/version", (req, res) {
    return res.json({
      "@type": "version",
      "version": "0.0.0",
    });
  });
}
""",
        children: [],
      )
    ],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    fileSystemEntity: Directory("lib"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.directory,
    value: r"""""",
    children: [
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        fileSystemEntity: Directory("lib/config"),
        state_data: {},
        fileSystemEntityType: FileSystemEntityType.directory,
        value: r"""""",
        children: [
          ScriptGenerator(
            is_generate: true,
            directory_base: Directory("telegram_bot"),
            fileSystemEntity: File("lib/config/config.dart"),
            state_data: {},
            fileSystemEntityType: FileSystemEntityType.file,
            value: r"""// ignore_for_file: non_constant_identifier_names

class TelegramBotConfig {
  TelegramBotConfig();
  
  // get it from @botfather
  static String telegram_token_bot = "";

}
""",
            children: [],
          )
        ],
      ),
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        fileSystemEntity: Directory("lib/logger"),
        state_data: {},
        fileSystemEntityType: FileSystemEntityType.directory,
        value: r"""""",
        children: [
          ScriptGenerator(
            is_generate: true,
            directory_base: Directory("telegram_bot"),
            fileSystemEntity: File("lib/logger/logger.dart"),
            state_data: {},
            fileSystemEntityType: FileSystemEntityType.file,
            value: r"""/* <!-- START LICENSE -->


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
import 'package:mason_logger/mason_logger.dart';

Logger logger = Logger(theme: LogTheme(
  
  success: (message) {
    return "✅️ ${message}";
  },
  err: (message) {
    return "❎️ ${message}";
  },
));
""",
            children: [],
          )
        ],
      ),
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        fileSystemEntity: Directory("lib/update"),
        state_data: {},
        fileSystemEntityType: FileSystemEntityType.directory,
        value: r"""""",
        children: [
          ScriptGenerator(
            is_generate: true,
            directory_base: Directory("telegram_bot"),
            fileSystemEntity: File("lib/update/update.dart"),
            state_data: {},
            fileSystemEntityType: FileSystemEntityType.file,
            value: r"""/* <!-- START LICENSE -->


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
export "package:telegram_bot/update/update_message.dart";
""",
            children: [],
          ),
          ScriptGenerator(
            is_generate: true,
            directory_base: Directory("telegram_bot"),
            fileSystemEntity: File("lib/update/update_message.dart"),
            state_data: {},
            fileSystemEntityType: FileSystemEntityType.file,
            value: r"""/* <!-- START LICENSE -->


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
// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:async';

import 'package:system_info_fetch/system_info_fetch.dart';
import 'package:telegram_client/telegram_client/telegram_client.dart';

FutureOr<dynamic> updateMessage({
  required Map msg,
  required TelegramClient tg,
  required UpdateTelegramClient updateTelegramClient,
}) async {
  String caption = "";
  if (msg["caption"] is String) {
    caption = msg["caption"];
  }
  String text = "";
  if (msg["text"] is String) {
    text = msg["text"];
  }
  String caption_msg = "${text.trim()} ${caption.trim()}".trim();
  bool isOutgoing = false;
  if (msg["is_outgoing"] is bool) {
    isOutgoing = msg["is_outgoing"];
  }
  if (msg["chat"] is Map == false) {
    return null;
  }
  bool isAdmin = false;

  String chat_type = (msg["chat"]["type"] as String).replaceAll(RegExp(r"(super)", caseSensitive: false), "");
  if (chat_type.isEmpty) {
    return null;
  }
  if (isOutgoing) {
    isAdmin = true;
  } else {
    if (updateTelegramClient.telegramClientData.is_bot) {
      isAdmin = true;
    }
  }

  Map msg_from = msg["from"];
  Map msg_chat = msg["chat"];

  int msg_id = (msg["id"] is int) ? (msg["id"] as int) : 0;
  int from_id = msg["from"]["id"];
  int chat_id = msg["chat"]["id"];

  if (msg["chat"]["type"] is String == false) {
    msg["chat"]["type"] = "";
  }
  if (isAdmin == false) {
    return;
  }
  if (RegExp(r"^((/)?me)", caseSensitive: false).hasMatch(caption_msg)) {
    return await tg.request(
      parameters: {
        "@type": "sendMessage",
        "chat_id": chat_id,
        "text": "Hai: ${updateTelegramClient.telegramClientData.is_bot}",
      },
      telegramClientData: updateTelegramClient.telegramClientData,
    );
  }
  if (RegExp(r"^((/)?start)", caseSensitive: false).hasMatch(caption_msg)) {
    return await tg.request(
      parameters: {"@type": "sendMessage", "chat_id": chat_id, "text": "Hai Saya robot"},
      telegramClientData: updateTelegramClient.telegramClientData,
    );
  }
  if (RegExp(r"^((/)?ping)$", caseSensitive: false).hasMatch(caption_msg)) {
    return await tg.request(
      parameters: {"@type": "sendMessage", "chat_id": chat_id, "text": "PONG"},
      telegramClientData: updateTelegramClient.telegramClientData,
    );
  }

  if (RegExp(r"^((/)?systeminfo|info|env|neofetch|pfetch)$", caseSensitive: false).hasMatch(caption_msg)) {
    return await tg.request(
      parameters: {
        "@type": "sendMessage",
        "chat_id": chat_id,
        "text": "SystemInfo: ${SystemInfoFetch.toMessage()}",
      },
      telegramClientData: updateTelegramClient.telegramClientData,
    );
  }

  RegExp regExp_echo = RegExp(r"^((/)?(echo[ ]+)(.*))", caseSensitive: false);
  if (regExp_echo.hasMatch(caption_msg)) {
    return await tg.request(
      parameters: {
        "@type": "sendMessage",
        "chat_id": chat_id,
        "text": caption_msg.replaceAll(RegExp(r"^((/)?(echo[ ]+))", caseSensitive: false), ""),
      },
      telegramClientData: updateTelegramClient.telegramClientData,
    );
  }
}
""",
            children: [],
          )
        ],
      ),
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        fileSystemEntity: File("lib/telegram_bot.dart"),
        state_data: {},
        fileSystemEntityType: FileSystemEntityType.file,
        value: r"""/* <!-- START LICENSE -->


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
export "package:telegram_bot/update/update.dart";
""",
        children: [],
      )
    ],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    fileSystemEntity: File(".gitignore"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.file,
    value: r"""# https://dart.dev/guides/libraries/private-files
# Created by `dart pub`
.dart_tool/
""",
    children: [],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    fileSystemEntity: File("analysis_options.yaml"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.file,
    value:
        r"""# This file configures the static analysis results for your project (errors,
# warnings, and lints).
#
# This enables the 'recommended' set of lints from `package:lints`.
# This set helps identify many issues that may lead to problems when running
# or consuming Dart code, and enforces writing Dart using a single, idiomatic
# style and format.
#
# If you want a smaller set of lints you can change this to specify
# 'package:lints/core.yaml'. These are just the most critical lints
# (the recommended set includes the core lints).
# The core lints are also what is used by pub.dev for scoring packages.

include: package:lints/recommended.yaml

# Uncomment the following section to specify additional rules.

# linter:
#   rules:
#     - camel_case_types

# analyzer:
#   exclude:
#     - path/to/excluded/files/**

# For more information about the core and recommended set of lints, see
# https://dart.dev/go/core-lints

# For additional information about configuring this file, see
# https://dart.dev/guides/language/analysis-options
""",
    children: [],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    fileSystemEntity: File("CHANGELOG.md"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.file,
    value: r"""## 1.0.0

- Initial version.
""",
    children: [],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    fileSystemEntity: File("pubspec.lock"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.file,
    value: r"""# Generated by pub
# See https://dart.dev/tools/pub/glossary#lockfile
packages:
  _fe_analyzer_shared:
    dependency: transitive
    description:
      name: _fe_analyzer_shared
      sha256: ae92f5d747aee634b87f89d9946000c2de774be1d6ac3e58268224348cd0101a
      url: "https://pub.dev"
    source: hosted
    version: "61.0.0"
  alfred:
    dependency: transitive
    description:
      name: alfred
      sha256: "61c74bfccd41447ddb7eb76e0e1204e1b1da0c099d441d00fa8d2b86de5415e3"
      url: "https://pub.dev"
    source: hosted
    version: "1.1.1"
  analyzer:
    dependency: transitive
    description:
      name: analyzer
      sha256: ea3d8652bda62982addfd92fdc2d0214e5f82e43325104990d4f4c4a2a313562
      url: "https://pub.dev"
    source: hosted
    version: "5.13.0"
  archive:
    dependency: transitive
    description:
      name: archive
      sha256: "22600aa1e926be775fa5fe7e6894e7fb3df9efda8891c73f70fb3262399a432d"
      url: "https://pub.dev"
    source: hosted
    version: "3.4.10"
  args:
    dependency: transitive
    description:
      name: args
      sha256: "7cf60b9f0cc88203c5a190b4cd62a99feea42759a7fa695010eb5de1c0b2252a"
      url: "https://pub.dev"
    source: hosted
    version: "2.5.0"
  asn1lib:
    dependency: transitive
    description:
      name: asn1lib
      sha256: c9c85fedbe2188b95133cbe960e16f5f448860f7133330e272edbbca5893ddc6
      url: "https://pub.dev"
    source: hosted
    version: "1.5.2"
  async:
    dependency: transitive
    description:
      name: async
      sha256: "947bfcf187f74dbc5e146c9eb9c0f10c9f8b30743e341481c1e2ed3ecc18c20c"
      url: "https://pub.dev"
    source: hosted
    version: "2.11.0"
  boolean_selector:
    dependency: transitive
    description:
      name: boolean_selector
      sha256: "6cfb5af12253eaf2b368f07bacc5a80d1301a071c73360d746b7f2e32d762c66"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.1"
  build:
    dependency: transitive
    description:
      name: build
      sha256: "80184af8b6cb3e5c1c4ec6d8544d27711700bc3e6d2efad04238c7b5290889f0"
      url: "https://pub.dev"
    source: hosted
    version: "2.4.1"
  built_collection:
    dependency: transitive
    description:
      name: built_collection
      sha256: "376e3dd27b51ea877c28d525560790aee2e6fbb5f20e2f85d5081027d94e2100"
      url: "https://pub.dev"
    source: hosted
    version: "5.1.1"
  built_value:
    dependency: transitive
    description:
      name: built_value
      sha256: c7913a9737ee4007efedaffc968c049fd0f3d0e49109e778edc10de9426005cb
      url: "https://pub.dev"
    source: hosted
    version: "8.9.2"
  clock:
    dependency: transitive
    description:
      name: clock
      sha256: cb6d7f03e1de671e34607e909a7213e31d7752be4fb66a86d29fe1eb14bfb5cf
      url: "https://pub.dev"
    source: hosted
    version: "1.1.1"
  code_builder:
    dependency: transitive
    description:
      name: code_builder
      sha256: f692079e25e7869c14132d39f223f8eec9830eb76131925143b2129c4bb01b37
      url: "https://pub.dev"
    source: hosted
    version: "4.10.0"
  collection:
    dependency: transitive
    description:
      name: collection
      sha256: ee67cb0715911d28db6bf4af1026078bd6f0128b07a5f66fb2ed94ec6783c09a
      url: "https://pub.dev"
    source: hosted
    version: "1.18.0"
  console:
    dependency: transitive
    description:
      name: console
      sha256: e04e7824384c5b39389acdd6dc7d33f3efe6b232f6f16d7626f194f6a01ad69a
      url: "https://pub.dev"
    source: hosted
    version: "4.1.0"
  convert:
    dependency: transitive
    description:
      name: convert
      sha256: "0f08b14755d163f6e2134cb58222dd25ea2a2ee8a195e53983d57c075324d592"
      url: "https://pub.dev"
    source: hosted
    version: "3.1.1"
  coverage:
    dependency: transitive
    description:
      name: coverage
      sha256: "8acabb8306b57a409bf4c83522065672ee13179297a6bb0cb9ead73948df7c76"
      url: "https://pub.dev"
    source: hosted
    version: "1.7.2"
  crypto:
    dependency: transitive
    description:
      name: crypto
      sha256: ff625774173754681d66daaf4a448684fb04b78f902da9cb3d308c19cc5e8bab
      url: "https://pub.dev"
    source: hosted
    version: "3.0.3"
  dart_style:
    dependency: transitive
    description:
      name: dart_style
      sha256: "1efa911ca7086affd35f463ca2fc1799584fb6aa89883cf0af8e3664d6a02d55"
      url: "https://pub.dev"
    source: hosted
    version: "2.3.2"
  encrypt:
    dependency: transitive
    description:
      name: encrypt
      sha256: "62d9aa4670cc2a8798bab89b39fc71b6dfbacf615de6cf5001fb39f7e4a996a2"
      url: "https://pub.dev"
    source: hosted
    version: "5.0.3"
  ffi:
    dependency: transitive
    description:
      name: ffi
      sha256: "493f37e7df1804778ff3a53bd691d8692ddf69702cf4c1c1096a2e41b4779e21"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.2"
  file:
    dependency: transitive
    description:
      name: file
      sha256: "5fc22d7c25582e38ad9a8515372cd9a93834027aacf1801cf01164dac0ffa08c"
      url: "https://pub.dev"
    source: hosted
    version: "7.0.0"
  fixnum:
    dependency: transitive
    description:
      name: fixnum
      sha256: "25517a4deb0c03aa0f32fd12db525856438902d9c16536311e76cdc57b31d7d1"
      url: "https://pub.dev"
    source: hosted
    version: "1.1.0"
  freezed_annotation:
    dependency: transitive
    description:
      name: freezed_annotation
      sha256: c3fd9336eb55a38cc1bbd79ab17573113a8deccd0ecbbf926cca3c62803b5c2d
      url: "https://pub.dev"
    source: hosted
    version: "2.4.1"
  frontend_server_client:
    dependency: transitive
    description:
      name: frontend_server_client
      sha256: f64a0333a82f30b0cca061bc3d143813a486dc086b574bfb233b7c1372427694
      url: "https://pub.dev"
    source: hosted
    version: "4.0.0"
  general_lib:
    dependency: "direct main"
    description:
      path: "../../../../../general_project/library/general_lib"
      relative: true
    source: path
    version: "0.0.34"
  github:
    dependency: transitive
    description:
      name: github
      sha256: "57f6ad78591f9638e903409977443093f862d25062a6b582a3c89e4ae44e4814"
      url: "https://pub.dev"
    source: hosted
    version: "9.24.0"
  glob:
    dependency: transitive
    description:
      name: glob
      sha256: "0e7014b3b7d4dac1ca4d6114f82bf1782ee86745b9b42a92c9289c23d8a0ab63"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.2"
  http:
    dependency: "direct main"
    description:
      name: http
      sha256: "761a297c042deedc1ffbb156d6e2af13886bb305c2a343a4d972504cd67dd938"
      url: "https://pub.dev"
    source: hosted
    version: "1.2.1"
  http_multi_server:
    dependency: transitive
    description:
      name: http_multi_server
      sha256: "97486f20f9c2f7be8f514851703d0119c3596d14ea63227af6f7a481ef2b2f8b"
      url: "https://pub.dev"
    source: hosted
    version: "3.2.1"
  http_parser:
    dependency: transitive
    description:
      name: http_parser
      sha256: "2aa08ce0341cc9b354a498388e30986515406668dbcc4f7c950c3e715496693b"
      url: "https://pub.dev"
    source: hosted
    version: "4.0.2"
  io:
    dependency: transitive
    description:
      name: io
      sha256: "2ec25704aba361659e10e3e5f5d672068d332fc8ac516421d483a11e5cbd061e"
      url: "https://pub.dev"
    source: hosted
    version: "1.0.4"
  js:
    dependency: transitive
    description:
      name: js
      sha256: f2c445dce49627136094980615a031419f7f3eb393237e4ecd97ac15dea343f3
      url: "https://pub.dev"
    source: hosted
    version: "0.6.7"
  json_annotation:
    dependency: transitive
    description:
      name: json_annotation
      sha256: b10a7b2ff83d83c777edba3c6a0f97045ddadd56c944e1a23a3fdf43a1bf4467
      url: "https://pub.dev"
    source: hosted
    version: "4.8.1"
  lints:
    dependency: "direct dev"
    description:
      name: lints
      sha256: cbf8d4b858bb0134ef3ef87841abdf8d63bfc255c266b7bf6b39daa1085c4290
      url: "https://pub.dev"
    source: hosted
    version: "3.0.0"
  logging:
    dependency: transitive
    description:
      name: logging
      sha256: "623a88c9594aa774443aa3eb2d41807a48486b5613e67599fb4c41c0ad47c340"
      url: "https://pub.dev"
    source: hosted
    version: "1.2.0"
  mason_logger:
    dependency: "direct main"
    description:
      name: mason_logger
      sha256: "0e90e637dcfcb7fb6c30b38e71cd41fa0e4e3df6f1da177f8251ac3f15147e9f"
      url: "https://pub.dev"
    source: hosted
    version: "0.2.12"
  matcher:
    dependency: transitive
    description:
      name: matcher
      sha256: d2323aa2060500f906aa31a895b4030b6da3ebdcc5619d14ce1aada65cd161cb
      url: "https://pub.dev"
    source: hosted
    version: "0.12.16+1"
  meta:
    dependency: transitive
    description:
      name: meta
      sha256: "25dfcaf170a0190f47ca6355bdd4552cb8924b430512ff0cafb8db9bd41fe33b"
      url: "https://pub.dev"
    source: hosted
    version: "1.14.0"
  mime:
    dependency: transitive
    description:
      name: mime
      sha256: "2e123074287cc9fd6c09de8336dae606d1ddb88d9ac47358826db698c176a1f2"
      url: "https://pub.dev"
    source: hosted
    version: "1.0.5"
  mime_type:
    dependency: transitive
    description:
      name: mime_type
      sha256: "2ad6e67d3d2de9ac0f8ef5352d998fd103cb21351ae8c02fb0c78b079b37d275"
      url: "https://pub.dev"
    source: hosted
    version: "1.0.0"
  node_preamble:
    dependency: transitive
    description:
      name: node_preamble
      sha256: "6e7eac89047ab8a8d26cf16127b5ed26de65209847630400f9aefd7cd5c730db"
      url: "https://pub.dev"
    source: hosted
    version: "2.0.2"
  package_config:
    dependency: transitive
    description:
      name: package_config
      sha256: "1c5b77ccc91e4823a5af61ee74e6b972db1ef98c2ff5a18d3161c982a55448bd"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.0"
  packagex:
    dependency: "direct main"
    description:
      name: packagex
      sha256: e8df6e41bde31823282864d84cd342311cb0aabe079b111a6880551d4a58a8f9
      url: "https://pub.dev"
    source: hosted
    version: "0.0.50"
  path:
    dependency: "direct main"
    description:
      name: path
      sha256: "087ce49c3f0dc39180befefc60fdb4acd8f8620e5682fe2476afd0b3688bb4af"
      url: "https://pub.dev"
    source: hosted
    version: "1.9.0"
  pointycastle:
    dependency: transitive
    description:
      name: pointycastle
      sha256: "70fe966348fe08c34bf929582f1d8247d9d9408130723206472b4687227e4333"
      url: "https://pub.dev"
    source: hosted
    version: "3.8.0"
  pool:
    dependency: transitive
    description:
      name: pool
      sha256: "20fe868b6314b322ea036ba325e6fc0711a22948856475e2c2b6306e8ab39c2a"
      url: "https://pub.dev"
    source: hosted
    version: "1.5.1"
  pub_semver:
    dependency: transitive
    description:
      name: pub_semver
      sha256: "40d3ab1bbd474c4c2328c91e3a7df8c6dd629b79ece4c4bd04bee496a224fb0c"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.4"
  queue:
    dependency: transitive
    description:
      name: queue
      sha256: "9a41ecadc15db79010108c06eae229a45c56b18db699760f34e8c9ac9b831ff9"
      url: "https://pub.dev"
    source: hosted
    version: "3.1.0+2"
  recase:
    dependency: transitive
    description:
      name: recase
      sha256: e4eb4ec2dcdee52dcf99cb4ceabaffc631d7424ee55e56f280bc039737f89213
      url: "https://pub.dev"
    source: hosted
    version: "4.1.0"
  server_universe_dart:
    dependency: "direct main"
    description:
      path: "../../../../../server_universe/package/server_universe_dart"
      relative: true
    source: path
    version: "0.0.0"
  server_universe_dart_http_client:
    dependency: "direct main"
    description:
      path: "../../../../../server_universe/package/server_universe_dart_http_client"
      relative: true
    source: path
    version: "0.0.0"
  server_universe_scheme:
    dependency: transitive
    description:
      path: "../../../../../server_universe/package/server_universe_scheme"
      relative: true
    source: path
    version: "0.0.0"
  shelf:
    dependency: transitive
    description:
      name: shelf
      sha256: ad29c505aee705f41a4d8963641f91ac4cee3c8fad5947e033390a7bd8180fa4
      url: "https://pub.dev"
    source: hosted
    version: "1.4.1"
  shelf_packages_handler:
    dependency: transitive
    description:
      name: shelf_packages_handler
      sha256: "89f967eca29607c933ba9571d838be31d67f53f6e4ee15147d5dc2934fee1b1e"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.2"
  shelf_static:
    dependency: transitive
    description:
      name: shelf_static
      sha256: a41d3f53c4adf0f57480578c1d61d90342cd617de7fc8077b1304643c2d85c1e
      url: "https://pub.dev"
    source: hosted
    version: "1.1.2"
  shelf_web_socket:
    dependency: transitive
    description:
      name: shelf_web_socket
      sha256: "9ca081be41c60190ebcb4766b2486a7d50261db7bd0f5d9615f2d653637a84c1"
      url: "https://pub.dev"
    source: hosted
    version: "1.0.4"
  source_gen:
    dependency: transitive
    description:
      name: source_gen
      sha256: "14658ba5f669685cd3d63701d01b31ea748310f7ab854e471962670abcf57832"
      url: "https://pub.dev"
    source: hosted
    version: "1.5.0"
  source_map_stack_trace:
    dependency: transitive
    description:
      name: source_map_stack_trace
      sha256: "84cf769ad83aa6bb61e0aa5a18e53aea683395f196a6f39c4c881fb90ed4f7ae"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.1"
  source_maps:
    dependency: transitive
    description:
      name: source_maps
      sha256: "708b3f6b97248e5781f493b765c3337db11c5d2c81c3094f10904bfa8004c703"
      url: "https://pub.dev"
    source: hosted
    version: "0.10.12"
  source_span:
    dependency: transitive
    description:
      name: source_span
      sha256: "53e943d4206a5e30df338fd4c6e7a077e02254531b138a15aec3bd143c1a8b3c"
      url: "https://pub.dev"
    source: hosted
    version: "1.10.0"
  stack_trace:
    dependency: transitive
    description:
      name: stack_trace
      sha256: "73713990125a6d93122541237550ee3352a2d84baad52d375a4cad2eb9b7ce0b"
      url: "https://pub.dev"
    source: hosted
    version: "1.11.1"
  stream_channel:
    dependency: transitive
    description:
      name: stream_channel
      sha256: ba2aa5d8cc609d96bbb2899c28934f9e1af5cddbd60a827822ea467161eb54e7
      url: "https://pub.dev"
    source: hosted
    version: "2.1.2"
  string_scanner:
    dependency: transitive
    description:
      name: string_scanner
      sha256: "556692adab6cfa87322a115640c11f13cb77b3f076ddcc5d6ae3c20242bedcde"
      url: "https://pub.dev"
    source: hosted
    version: "1.2.0"
  system_info_fetch:
    dependency: "direct main"
    description:
      name: system_info_fetch
      sha256: "264a33576e612888f640d625631fef9f2daf8cc41078a1138adbd75510771d22"
      url: "https://pub.dev"
    source: hosted
    version: "0.0.14"
  telegram_client:
    dependency: "direct main"
    description:
      path: "../.."
      relative: true
    source: path
    version: "0.8.5"
  term_glyph:
    dependency: transitive
    description:
      name: term_glyph
      sha256: a29248a84fbb7c79282b40b8c72a1209db169a2e0542bce341da992fe1bc7e84
      url: "https://pub.dev"
    source: hosted
    version: "1.2.1"
  test:
    dependency: "direct dev"
    description:
      name: test
      sha256: d72b538180efcf8413cd2e4e6fcc7ae99c7712e0909eb9223f9da6e6d0ef715f
      url: "https://pub.dev"
    source: hosted
    version: "1.25.4"
  test_api:
    dependency: transitive
    description:
      name: test_api
      sha256: "2419f20b0c8677b2d67c8ac4d1ac7372d862dc6c460cdbb052b40155408cd794"
      url: "https://pub.dev"
    source: hosted
    version: "0.7.1"
  test_core:
    dependency: transitive
    description:
      name: test_core
      sha256: "4d070a6bc36c1c4e89f20d353bfd71dc30cdf2bd0e14349090af360a029ab292"
      url: "https://pub.dev"
    source: hosted
    version: "0.6.2"
  translate_client:
    dependency: "direct main"
    description:
      name: translate_client
      sha256: d62eb30c3169cc97d8f1efac1f8fbd862a8a12bcbfd03c9e5b7d227742d244de
      url: "https://pub.dev"
    source: hosted
    version: "0.0.2"
  ts2dart:
    dependency: transitive
    description:
      name: ts2dart
      sha256: c459351c85478f7d0c03ea642196d0a57d97e98505ba0b21b9553539afc2e8a7
      url: "https://pub.dev"
    source: hosted
    version: "0.0.6+1"
  typed_data:
    dependency: transitive
    description:
      name: typed_data
      sha256: facc8d6582f16042dd49f2463ff1bd6e2c9ef9f3d5da3d9b087e244a7b564b3c
      url: "https://pub.dev"
    source: hosted
    version: "1.3.2"
  typings:
    dependency: transitive
    description:
      name: typings
      sha256: "0cc1ae719b3f0edb3399f4de1416d91396a8fd30fcd18ea792e487691f9b13e0"
      url: "https://pub.dev"
    source: hosted
    version: "0.0.6+2"
  universal_io:
    dependency: transitive
    description:
      name: universal_io
      sha256: "1722b2dcc462b4b2f3ee7d188dad008b6eb4c40bbd03a3de451d82c78bba9aad"
      url: "https://pub.dev"
    source: hosted
    version: "2.2.2"
  vector_math:
    dependency: transitive
    description:
      name: vector_math
      sha256: "80b3257d1492ce4d091729e3a67a60407d227c27241d6927be0130c98e741803"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.4"
  vm_service:
    dependency: transitive
    description:
      name: vm_service
      sha256: "3923c89304b715fb1eb6423f017651664a03bf5f4b29983627c4da791f74a4ec"
      url: "https://pub.dev"
    source: hosted
    version: "14.2.1"
  watcher:
    dependency: transitive
    description:
      name: watcher
      sha256: "3d2ad6751b3c16cf07c7fca317a1413b3f26530319181b37e3b9039b84fc01d8"
      url: "https://pub.dev"
    source: hosted
    version: "1.1.0"
  web:
    dependency: transitive
    description:
      name: web
      sha256: "97da13628db363c635202ad97068d47c5b8aa555808e7a9411963c533b449b27"
      url: "https://pub.dev"
    source: hosted
    version: "0.5.1"
  web_ffi:
    dependency: transitive
    description:
      name: web_ffi
      sha256: "48ef8037f7bc051d11b88d0f2903e02bec21092c51833d37c3361c36e3edc4f7"
      url: "https://pub.dev"
    source: hosted
    version: "0.7.2"
  web_socket_channel:
    dependency: transitive
    description:
      name: web_socket_channel
      sha256: "58c6666b342a38816b2e7e50ed0f1e261959630becd4c879c4f26bfa14aa5a42"
      url: "https://pub.dev"
    source: hosted
    version: "2.4.5"
  webkit_inspection_protocol:
    dependency: transitive
    description:
      name: webkit_inspection_protocol
      sha256: "87d3f2333bb240704cd3f1c6b5b7acd8a10e7f0bc28c28dcf14e782014f4a572"
      url: "https://pub.dev"
    source: hosted
    version: "1.2.1"
  win32:
    dependency: transitive
    description:
      name: win32
      sha256: "0a989dc7ca2bb51eac91e8fd00851297cfffd641aa7538b165c62637ca0eaa4a"
      url: "https://pub.dev"
    source: hosted
    version: "5.4.0"
  yaml:
    dependency: transitive
    description:
      name: yaml
      sha256: "75769501ea3489fca56601ff33454fe45507ea3bfb014161abc3b43ae25989d5"
      url: "https://pub.dev"
    source: hosted
    version: "3.1.2"
  yaml_writer:
    dependency: transitive
    description:
      name: yaml_writer
      sha256: f182931a598f9a3fd29ff528f0caab98fffa713583e30c12c7a27ce0b66c1308
      url: "https://pub.dev"
    source: hosted
    version: "2.0.0"
sdks:
  dart: ">=3.3.0 <4.0.0"
""",
    children: [],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    fileSystemEntity: File("pubspec.yaml"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.file,
    value: r"""name: 'telegram_bot'
description: 'A Example Quick Start Telegram Userbot BY @AZKADEV'
version: '0.0.0'
repository: 'https://github.com/azkadev/telegram_client'
homepage: 'https://github.com/azkadev/telegram_client'
issue_tracker: 'https://github.com/azkadev/telegram_client/issues'
documentation: 'https://github.com/azkadev/telegram_client/tree/main/docs'
funding: 
  - 'https://github.com/sponsors/azkadev'

environment: 
  sdk: '^3.3.0'
dependencies: 
  general_lib: '^0.0.34'
  http: '^1.1.2'
  mason_logger: '^0.2.12'
  packagex: '^0.0.50'
  path: '^1.9.0'
  system_info_fetch: '^0.0.14'
  translate_client: '^0.0.2'
  telegram_client: 
    path: '../../'
  server_universe_dart: 
    path: '../../../../../server_universe/package/server_universe_dart'
  server_universe_dart_http_client: 
    path: '../../../../../server_universe/package/server_universe_dart_http_client'
dependency_overrides: 
  general_lib: 
    path: '../../../../../general_project/library/general_lib'
dev_dependencies: 

  lints: '^3.0.0'
  test: '^1.24.0'
server_universe: 
  supabase: 
    input_file: 'bin/telegram_bot_supabase.dart'
    output_directory: 'supabase/functions/telegram_bot'
""",
    children: [],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    fileSystemEntity: File("README.md"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.file,
    value: r"""""",
    children: [],
  )
];
