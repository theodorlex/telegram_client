// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unused_local_variable

import 'package:general_lib/general_lib.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart';
import 'package:telegram_client/telegram_client.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) async {
  Logger logger = Logger(level: Level.verbose);
  logger.info("Telegram Client");
  Directory directory_tg = Directory(join(Directory.current.path, "tg"));
  if (!directory_tg.existsSync()) {
    await directory_tg.create(recursive: true);
  }

  String name = () {
    List<Directory> clients = directory_tg
        .listSync()
        .where((e) {
          print(basenameWithoutExtension(e.path));
          if (RegExp(r"^(client_)", caseSensitive: false)
              .hasMatch(basenameWithoutExtension(e.path))) {
            return true;
          }
          return false;
        })
        .map((e) => Directory(e.path))
        .toList();
    if (clients.isNotEmpty) {
      Directory result = logger.chooseOne(
        "Pilih Clients",
        choices: [
          Directory("create_new"),
          ...clients,
        ],
        display: (choice) {
          return basenameWithoutExtension(choice.path);
        },
      );
      if (basenameWithoutExtension(result.path) != "create_new") {
        return basenameWithoutExtension(result.path)
            .replaceAll(RegExp(r"^(client_)", caseSensitive: false), "");
      }
    }
    String res = logger.prompt("Name :");
    while (true) {
      if (res.isNotEmpty) {
        return res;
      }
    }
  }()
      .toLowerCase()
      .replaceAll(RegExp(r"([ \+]+)", caseSensitive: false), "");

  Directory database_directory =
      Directory(join(directory_tg.path, "client_${name}"));

  TelegramClient tg = TelegramClient();

  tg.on(
    event_name: tg.event_update,
    onUpdate: (UpdateTelegramClient updateTelegramClient) async {
      try {
        await tg.autoSetData(updateTelegramClient);

        Map? update = await updateTelegramClient.update;
        if (update == null) {
          return null;
        }

        if (update["@type"] == "updateAuthorizationState") {
          if (update["authorization_state"] is Map) {
            Map authorization_state = update["authorization_state"];
            if (authorization_state["@type"] ==
                "authorizationStateWaitPhoneNumber") {
              String phone_number_or_token_bot = () {
                String res = logger.prompt("Phone Number / Token Bot:");
                while (true) {
                  if (res.isNotEmpty) {
                    return res;
                  }
                }
              }()
                  .replaceAll(RegExp(r"([ \+]+)", caseSensitive: false), "");

              if (RegExp(r"^([0-9]+:AA[a-z0-9_-]+)$", caseSensitive: false)
                  .hashData(phone_number_or_token_bot)) {
                Map res = await tg.invoke(
                  parameters: {
                    "@type": "checkAuthenticationBotToken",
                    "token": phone_number_or_token_bot,
                  },
                  telegramClientData: updateTelegramClient.telegramClientData,
                );

                print(res);
              } else {
                Map res = await tg.invoke(
                  parameters: {
                    "@type": "setAuthenticationPhoneNumber",
                    "phone_number": phone_number_or_token_bot,
                  },
                  telegramClientData: updateTelegramClient.telegramClientData,
                );

                print(res);
              }
            }
            if (authorization_state["@type"] == "authorizationStateWaitCode") {
              String code = () {
                String res = logger.prompt("Code Number:");
                while (true) {
                  if (res.isNotEmpty) {
                    return res;
                  }
                }
              }()
                  .toLowerCase()
                  .replaceAll(RegExp(r"([ \+]+)", caseSensitive: false), "");

              Map res = await tg.invoke(
                parameters: {
                  "@type": "checkAuthenticationCode",
                  "code": code,
                },
                telegramClientData: updateTelegramClient.telegramClientData,
              );

              print(res);
            }

            if (authorization_state["@type"] == "authorizationStateReady") {
              Map get_me = (await tg.request(
                parameters: {"@type": "getMe"},
                telegramClientData: updateTelegramClient.telegramClientData,
              ))["result"];
              get_me.removeByKeys(["phone_number"]);
              get_me.printPretty(2);
            }
            return null;
          }
          update.printPretty(2);
          return null;
        }

        if (update["message"] is Map) {
          Map msg = update["message"];
          int from_id = msg["from"]["id"];
          int chat_id = msg["chat"]["id"];
          bool is_outgoing = (msg["is_outgoing"] == true);
          String text_command = () {
            if (msg["caption"] is String) {
              return msg["caption"];
            }
            if (msg["text"] is String) {
              return msg["text"];
            }
            return "";
          }();

          Map parameters_request = {
            "@type": (is_outgoing) ? "editMessageText" : "sendMessage"
          };

          RegExp regExpCommand = RegExp(r"^(/|\.|!)", caseSensitive: false);
          if (regExpCommand.hashData(text_command)) {
            String command = text_command.replaceFirst(regExpCommand, "");

            if (RegExp(r"^(ping)$", caseSensitive: false).hasMatch(command)) {
              return await tg.request(
                parameters: {
                  "@type": "sendMessage",
                  "chat_id": chat_id,
                  "text": "PONG"
                },
                telegramClientData: updateTelegramClient.telegramClientData,
              );
            }
          }
        }
      } catch (e, stack) {
        logger.err("${e} ${stack}");
      }
    },
    onError: (error, stackTrace) {},
  );

  tg.ensureInitialized(
    pathTdlib: TgUtils.pathTdlib(),
    telegramClientTdlibOption: TelegramClientTdlibOption(
      clientOption: {
        "database_directory": database_directory.path,
        'files_directory': directory_tg.path,
      },
    ),
  );
  await tg.tdlib.initIsolate();
}
