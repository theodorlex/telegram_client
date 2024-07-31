// ignore_for_file: , non_constant_identifier_names, unnecessary_brace_in_string_interps, empty_catches

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

import 'dart:convert';
import 'dart:isolate';

import 'package:collection/collection.dart';
import 'package:general_lib/general_lib.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:telegram_client/api/librarys.dart';
import 'package:telegram_client/api/telegram_client_api_core.dart';
import 'package:telegram_client/api/template.dart';
import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;

Logger logger = Logger();

/// Telegram Client Api For Interact With Library
Future<void> telegramClientCli(List<String> args_raw) async {
  final TelegramClientApi packageFullTemplateDartApi = TelegramClientApi();
  final Args args = Args(args_raw);

  String executable = Dart.executable.trim();

  if (path.split(executable).contains("dart")) {
    executable = "telegram_client";
  }

  bool is_interactive = true;
  if (Platform.environment["no_interactive"] == "true") {
    is_interactive = false;
  }
  // bool is_help = (args.contains("-h")) ? true : args.contains("--help");

  String command = (args.arguments.firstOrNull ?? "").toLowerCase();
  List<String> commands = [
    "build",
    "create",
    "deploy",
    "install",
    "run",
    "reload",
    "telegram_bot_api",
  ];
  commands.sort();
  if (commands.contains(command) == false) {
    if (is_interactive) {
      command = logger.chooseOne(
        "Pilih",
        choices: commands,
        display: (choice) {
          return choice.toUpperCaseFirstData();
        },
      );
    } else {
      print("Please use command: ${commands.join("\n")}");
      exit(1);
    }
  }

  if (command == "create") {
    final List<TelegramClientProjectTemplate> telegramClientProjectTemplates =
        TelegramClientProjectTemplate.templates;
    telegramClientProjectTemplates.sort((a, b) => a.name.compareTo(b.name));
    if (["--help", "-h"].contains(args.after(command) ?? "")) {
      final String help_create = """
For Create Program With Template Please Use Command

Commands: 

${executable} create name_poject options

OPTIONS:

--template - ${telegramClientProjectTemplates.map((e) => e.name).join(", ")}

Example: ${executable} create name_project --template ${telegramClientProjectTemplates.first.name}
""";

      print(help_create.trim());
      exit(0);
    }
    Directory directory_current = Directory.current;
    String new_project_name = await Future(() async {
      String new_project_name_from_command =
          (args.after(command) ?? "").toLowerCase();
      if (new_project_name_from_command.isNotEmpty) {
        return new_project_name_from_command;
      }
      if (is_interactive) {
        while (true) {
          await Future.delayed(Duration(microseconds: 1));
          String server_universeDartPlatformType = logger.prompt(
            "Name New Project: ",
          );

          if (server_universeDartPlatformType.isNotEmpty) {
            return server_universeDartPlatformType;
          }
        }
      }
      return "";
    });
    TelegramClientProjectTemplate telegramClientProjectTemplate =
        await Future(() async {
      String type_procces =
          (args.after("--template") ?? "").toLowerCase().trim();
      TelegramClientProjectTemplate? telegramClientProjectTemplate =
          telegramClientProjectTemplates.firstWhereOrNull(
              (element) => element.name.toLowerCase() == type_procces);
      if (telegramClientProjectTemplate != null) {
        return telegramClientProjectTemplate;
      }
      if (is_interactive) {
        while (true) {
          await Future.delayed(Duration(microseconds: 1));
          TelegramClientProjectTemplate telegramClientProjectTemplate =
              logger.chooseOne(
            "Template: ",
            choices: telegramClientProjectTemplates,
            display: (choice) {
              return choice.name;
            },
          );

          return telegramClientProjectTemplate;
        }
      }
      return telegramClientProjectTemplates.first;
    });
    if (new_project_name.isEmpty) {
      print("Failed");
      exit(1);
    }
    var strm = packageFullTemplateDartApi
        .create(
            newName: new_project_name,
            directoryBase: directory_current,
            telegramClientProjectTemplate: telegramClientProjectTemplate)
        .listen((event) {
      printed(event);
    });

    await strm.asFuture();
    exit(0);
  }
  if (command == "install") {
    List<String> script_types = [
      "library",
      "script",
    ];
    script_types.sort();
    String command_after = (args.after(command) ?? "").trim();

    if (["--help", "-h"].contains(command_after)) {
      String help_create = """
For Install 

Commands: 

${executable} install {script_types}

Script Types:
${script_types.map((e) => "${" " * 2} - ${e}").join("\n")}

Example: ${executable} install library tdlib
""";

      print(help_create.trim());
      exit(0);
    }
    if (script_types.contains(command_after) == false) {
      command_after = await Future(() async {
        if (is_interactive) {
          while (true) {
            await Future.delayed(Duration(microseconds: 1));
            String script_type = logger.chooseOne(
              "Install Type: ",
              choices: script_types,
              display: (choice) {
                return choice;
              },
            );

            return script_type;
          }
        }
        return script_types.first;
      });
    }
    if (command_after == "library") {
      List<String> library_types = [
        "tdlib",
      ];
      String command_after_library = (args.after(command_after) ?? "").trim();

      if (["--help", "-h"].contains(command_after_library)) {
        String help_create = """
For Install Library

Commands: 

${executable} install library {library_types}

Library Types:
${library_types.map((e) => "${" " * 2} - ${e}").join("\n")}

Example: ${executable} install library ${library_types.first}
""";

        print(help_create.trim());
        exit(0);
      }
      TelegramClientLibraryType telegramClientLibraryType =
          await Future(() async {
        // TelegramClientLibraryType? telegramClientLibraryType = TelegramClientLibraryType.values.firstWhereOrNull((element) => element.name.toLowerCase() == command_after_library);

        if (is_interactive) {
          while (true) {
            await Future.delayed(Duration(microseconds: 1));
            TelegramClientLibraryType telegramClientLibraryType =
                logger.chooseOne(
              "Library Type: ",
              choices: TelegramClientLibraryType.values,
              display: (choice) {
                return choice.name;
              },
            );

            return telegramClientLibraryType;
          }
        }
        return TelegramClientLibraryType.tdlib;
      });
      var strm = packageFullTemplateDartApi
          .installLibrary(telegramClientLibraryType: telegramClientLibraryType)
          .listen((event) {
        printed(event);
      });

      await strm.asFuture();

      exit(0);
      //
      //
    }
  }
  if (command == "telegram_bot_api") {
    List<Map<dynamic, dynamic>> parametersRequest = [];
    String input_file =
        (args.after("-i") ?? args.after("--input") ?? "").trim();

    File file_input = File(input_file);
    if (file_input.existsSync()) {
      try {
        parametersRequest = json.decode(file_input.readAsStringSync());
      } catch (e) {}
    }

    Map<dynamic, dynamic> json_data = <dynamic, dynamic>{};
    if (args.contains("--@type") || args.contains("-@type")) {
      String parameters_key = "";
      for (var element in args.arguments) {
        if (RegExp(r"(-(-)?(@)?[a-z]+)", caseSensitive: false)
            .hasMatch(element)) {
          parameters_key = element.replaceAll(RegExp("-(-)?"), "");
          json_data[parameters_key] = "";
          continue;
        }
        if (parameters_key.isEmpty) {
          continue;
        }
        if ([
          "chat_id",
          "message_id",
          "from_chat_id",
          "reply_to_message_id",
        ].contains(parameters_key)) {
          if (RegExp("^(@)", caseSensitive: false).hasMatch(element)) {
            json_data[parameters_key] = element;
          } else if (RegExp("([a-z_]+)", caseSensitive: false)
              .hasMatch(element)) {
            json_data[parameters_key] = "@${element.trim()}";
          } else {
            json_data[parameters_key] = (num.tryParse(element) ?? 0).toInt();
          }
        } else {
          try {
            json_data[parameters_key] = json.decode(element);
          } catch (e) {
            json_data[parameters_key] = element;
          }
        }
      }
      if (json_data.isNotEmpty) {
        parametersRequest.insert(0, json_data);
      }
    }

    await packageFullTemplateDartApi
        .telegramBotApi(parametersRequest: parametersRequest)
        .listen((event) {
      printed(event);
    }).asFuture();

    exit(0);
  }
  if (command == "reload") {
    File? file = getPackageDirectory();
    if (file == null) {
      exit(1);
    }
    Directory directory = file.parent.parent;
    Directory directory_pub =
        Directory(path.join(directory.path, ".dart_tool", "pub"));
    if (directory_pub.existsSync()) {
      await directory_pub.delete(recursive: true);
    }
    logger.info("Succes Reload");
    exit(0);
  }
  exit(1);
}

File? getPackageDirectory({
  String package_name = "package:telegram_client/telegram_client.dart",
}) {
  Uri? res = Isolate.resolvePackageUriSync(Uri.parse(package_name));
  if (res == null) {
    return null;
  }
  return File(res.toFilePath());
  // print(re);
  // List<String> paths = [...res.pathSegments];
  // for (var i = 0; i < package_name.split("/").length; i++) {
  //   paths.removeLast();
  // }
  // Directory directory = Directory(path.joinAll(paths));

  // if (!directory.existsSync()) {
  //   directory = Directory(path.joinAll(["/", ...paths]));
  // }
  // return directory;
}

List<Progress> progresss = [];
// Progress progress = logger.progress("message");
void printed(TelegramClientApiStatus event) {
  if ([
    TelegramClientApiStatusType.progress_start,
    TelegramClientApiStatusType.progress_complete,
    TelegramClientApiStatusType.progress
  ].contains(event.telegramClientApiStatusType)) {
    if (event.telegramClientApiStatusType ==
        TelegramClientApiStatusType.progress_start) {
      progresss.add(logger.progress(event.value));
      // progress.cancel();
      // progress = logger.progress(event.value);
      return;
    }
    Progress progress = () {
      if (progresss.isEmpty) {
        Progress progress = logger.progress(event.value);
        progresss.add(progress);
        return progress;
      } else {
        return progresss.last;
      }
    }();
    if (event.telegramClientApiStatusType ==
        TelegramClientApiStatusType.progress) {
      progress.update(event.value);
      return;
    }
    if (event.telegramClientApiStatusType ==
        TelegramClientApiStatusType.progress_complete) {
      progress.complete(event.value);

      // progress.cancel();
      return;
    }
  }
  if (event.telegramClientApiStatusType == TelegramClientApiStatusType.succes) {
    logger.success(event.value);
    return;
  }
  if (event.telegramClientApiStatusType == TelegramClientApiStatusType.failed) {
    logger.err(event.value);
    return;
  }

  logger.info(event.value);
}
