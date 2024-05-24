// ignore_for_file: non_constant_identifier_names

// import 'dart:io';
import 'package:general_lib/script_generate/script_generate.dart';
import 'package:universal_io/io.dart';

List<ScriptGenerator> telegram_bot_telegram_client_script_generators = [
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    file_system_entity: Directory(".github"),
    state_data: {},
    file_system_entity_type: FileSystemEntityType.directory,
    value: r"""""",
    children: [
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        file_system_entity: File(".github/FUNDING.yaml"),
        state_data: {},
        file_system_entity_type: FileSystemEntityType.file,
        value: r"""github: [azkadev]
custom: []""",
        children: [],
      )
    ],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    file_system_entity: Directory("bin"),
    state_data: {},
    file_system_entity_type: FileSystemEntityType.directory,
    value: r"""""",
    children: [
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        file_system_entity: File("bin/telegram_bot.dart"),
        state_data: {},
        file_system_entity_type: FileSystemEntityType.file,
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

  Directory database_telegram =
      Directory(join(Directory.current.path, "database_telegram"));
  if (!database_telegram.existsSync()) {
    await database_telegram.create(recursive: true);
  }

  Directory database_user = await Future(() async {
    List<Directory> dirs = Directory(join(database_telegram.path))
        .listSync()
        .where((element) {
          if (element is Directory &&
              RegExp(r"^(client_(.*))$", caseSensitive: false)
                  .hasMatch(basename(element.path))) {
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
        return basename(choice.path)
            .replaceAll(RegExp(r"^(client_)", caseSensitive: false), "");
      },
    );
    if (basename(directory_choose.path) == "create_new_client") {
      while (true) {
        String new_client_name = logger.prompt("❔️ New Client Name: ").trim();
        if (new_client_name.isEmpty) {
          logger.err("Tolong isi data dengan benar!");
          continue;
        }
        Directory directory_new_client = Directory(
            join(database_telegram.path, "client_${new_client_name}"));
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
                Map terms_of_service =
                    update["authorization_state"]["terms_of_service"] as Map;
                if (terms_of_service["text"] is Map) {
                  await tg.tdlib.invoke(
                    "registerUser",
                    parameters: {
                      "first_name": "random name",
                      "last_name": "generalfoss ${DateTime.now().toString()}",
                    },
                    clientId:
                        updateTelegramClient.telegramClientData.tdlib_client_id,
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
              print(
                  "close: ${updateTelegramClient.telegramClientData.tdlib_client_id}");
              await tg.tdlib.exitClientById(
                  updateTelegramClient.telegramClientData.tdlib_client_id,
                  isClose: false);
            }

            if (authStateType == "authorizationStateWaitPhoneNumber") {
              while (true) {
                await Future.delayed(Duration(milliseconds: 10));
                String phone_number_or_token_bot_procces = logger
                    .prompt("❔️ Nomor Ponsel / Token Bot @botfather",
                        defaultValue:
                            "+628888888888 / 123456789:abcdfghijklmnopqrstuvwxyz ",
                        hidden: false)
                    .trim()
                    .replaceAll(
                      RegExp(r"( |\+)", caseSensitive: false),
                      "",
                    );
                if (phone_number_or_token_bot_procces.isEmpty) {
                  logger.err("Tolong isi data dengan benar!");
                  continue;
                }
                logger
                    .info("Request Code: ${phone_number_or_token_bot_procces}");
                var res = {};

                if (RegExp(r"^(([0-9]+):AA(.*))$", caseSensitive: false)
                    .hasMatch(phone_number_or_token_bot_procces)) {
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
                String code_procces = logger
                    .prompt("❔️ Code", defaultValue: "12345 ", hidden: false)
                    .trim()
                    .replaceAll(RegExp(r"( |\+)", caseSensitive: false), "");
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
            if (authStateType ==
                "authorizationStateWaitOtherDeviceConfirmation") {}
            if (authStateType == "authorizationStateReady") {
              var getMe = await tg.tdlib.getMe(
                  clientId:
                      updateTelegramClient.telegramClientData.tdlib_client_id);

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
        file_system_entity: File("bin/telegram_bot_native.dart"),
        state_data: {},
        file_system_entity_type: FileSystemEntityType.file,
        value: r"""import 'dart:io';

import 'package:server_universe/native/native.dart';
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
      return res.json({
        "@type": "error",
        "message": "path_not_found",
        "description": "PATH: Not Found"
      });
    },
    onError: (req, res, e, stack) {
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

  await app.listen(port: port, bindIp: host);

  print("Server on");
}
""",
        children: [],
      ),
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        file_system_entity: File("bin/telegram_bot_supabase.dart"),
        state_data: {},
        file_system_entity_type: FileSystemEntityType.file,
        value: r"""import 'package:server_universe/edge/edge.dart';
import 'package:server_universe/edge_http/server_universe_http_client.dart';
import 'package:telegram_bot/config/config.dart';
import 'package:telegram_client/telegram_client.dart';

void main() async {
  print("start");
  ServerUniverseEdge app = ServerUniverseEdge(
    onNotFound: (req, res) async {
      return res.status(404).json({
        "@type": "error",
        "message": "path_not_found",
        "description": "PATH: ${req.path} Not Found"
      });
    },
    onError: (req, res, object, stackTrace) {
      return res
          .status(500)
          .json({"@type": "error", "message": "server_crash"});
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
    file_system_entity: Directory("lib"),
    state_data: {},
    file_system_entity_type: FileSystemEntityType.directory,
    value: r"""""",
    children: [
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        file_system_entity: Directory("lib/config"),
        state_data: {},
        file_system_entity_type: FileSystemEntityType.directory,
        value: r"""""",
        children: [
          ScriptGenerator(
            is_generate: true,
            directory_base: Directory("telegram_bot"),
            file_system_entity: File("lib/config/config.dart"),
            state_data: {},
            file_system_entity_type: FileSystemEntityType.file,
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
        file_system_entity: Directory("lib/logger"),
        state_data: {},
        file_system_entity_type: FileSystemEntityType.directory,
        value: r"""""",
        children: [
          ScriptGenerator(
            is_generate: true,
            directory_base: Directory("telegram_bot"),
            file_system_entity: File("lib/logger/logger.dart"),
            state_data: {},
            file_system_entity_type: FileSystemEntityType.file,
            value: r"""// ignore_for_file: unnecessary_brace_in_string_interps

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
import 'package:mason_logger/mason_logger.dart';

Logger logger = Logger(
    theme: LogTheme(
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
        file_system_entity: Directory("lib/update"),
        state_data: {},
        file_system_entity_type: FileSystemEntityType.directory,
        value: r"""""",
        children: [
          ScriptGenerator(
            is_generate: true,
            directory_base: Directory("telegram_bot"),
            file_system_entity: File("lib/update/update.dart"),
            state_data: {},
            file_system_entity_type: FileSystemEntityType.file,
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
            file_system_entity: File("lib/update/update_message.dart"),
            state_data: {},
            file_system_entity_type: FileSystemEntityType.file,
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
// ignore_for_file: non_constant_identifier_names, 

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

  String chat_type = (msg["chat"]["type"] as String)
      .replaceAll(RegExp(r"(super)", caseSensitive: false), "");
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
      parameters: {
        "@type": "sendMessage",
        "chat_id": chat_id,
        "text": "Hai Saya robot"
      },
      telegramClientData: updateTelegramClient.telegramClientData,
    );
  }
  if (RegExp(r"^((/)?ping)$", caseSensitive: false).hasMatch(caption_msg)) {
    return await tg.request(
      parameters: {"@type": "sendMessage", "chat_id": chat_id, "text": "PONG"},
      telegramClientData: updateTelegramClient.telegramClientData,
    );
  }

  if (RegExp(r"^((/)?systeminfo|info|env|neofetch|pfetch)$",
          caseSensitive: false)
      .hasMatch(caption_msg)) {
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
        "text": caption_msg.replaceAll(
            RegExp(r"^((/)?(echo[ ]+))", caseSensitive: false), ""),
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
        file_system_entity: File("lib/telegram_bot.dart"),
        state_data: {},
        file_system_entity_type: FileSystemEntityType.file,
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
    file_system_entity: Directory("test"),
    state_data: {},
    file_system_entity_type: FileSystemEntityType.directory,
    value: r"""""",
    children: [
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("telegram_bot"),
        file_system_entity: File("test/telegram_bot_test.dart"),
        state_data: {},
        file_system_entity_type: FileSystemEntityType.file,
        value: r"""""",
        children: [],
      )
    ],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    file_system_entity: File(".gitignore"),
    state_data: {},
    file_system_entity_type: FileSystemEntityType.file,
    value: r"""# https://dart.dev/guides/libraries/private-files
# Created by `dart pub`
.dart_tool/
""",
    children: [],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    file_system_entity: File("analysis_options.yaml"),
    state_data: {},
    file_system_entity_type: FileSystemEntityType.file,
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
    file_system_entity: File("CHANGELOG.md"),
    state_data: {},
    file_system_entity_type: FileSystemEntityType.file,
    value: r"""## 1.0.0

- Initial version.
""",
    children: [],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    file_system_entity: File("guide-telegram_client.md"),
    state_data: {},
    file_system_entity_type: FileSystemEntityType.file,
    value: r"""# Guide Telegram Client

Telegram Client Library is from DEVELOPER FROM COMPANY GLOBAL CORPORATION
Created By: [AZKADEV](https://github.com/azkadev)

If you use tdlib you must install tdlib

dart run telegram_client install library tdlib""",
    children: [],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("telegram_bot"),
    file_system_entity: File("pubspec.yaml"),
    state_data: {},
    file_system_entity_type: FileSystemEntityType.file,
    value: r"""name: 'telegram_bot'
description: 'A Example Quick Start Telegram Userbot BY @AZKADEV'
version: '0.0.0'
repository: 'https://github.com/azkadev/telegram_client'
homepage: 'https://github.com/azkadev/telegram_client'
issue_tracker: 'https://github.com/azkadev/telegram_client/issues'
documentation: 'https://github.com/azkadev/telegram_client/tree/main/docs'
funding: 
  - 'https://github.com/sponsors/azkadev'
publish_to: 'none'
environment: 
  sdk: '^3.3.0'
dependencies:  
  http: '^1.1.2'
  mason_logger: '^0.2.12'
  packagex: '^0.0.53'
  path: '^1.9.0'
  system_info_fetch: '^0.0.16'
  translate_client: '^0.0.2'
  
  general_lib: '^0.0.38'
  telegram_client: '^0.8.16'
  server_universe: '^0.0.13'
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
    file_system_entity: File("README.md"),
    state_data: {},
    file_system_entity_type: FileSystemEntityType.file,
    value: r"""""",
    children: [],
  )
];
