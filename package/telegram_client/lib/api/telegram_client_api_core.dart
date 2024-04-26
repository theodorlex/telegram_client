// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, unused_local_variable, constant_identifier_names

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
import 'dart:async';

import 'package:general_lib/general_lib.dart';
import 'package:general_lib/script_generate/script_generate.dart';
import "package:path/path.dart" as path;
import 'package:telegram_client/api/telegram_client_api.dart';
import 'package:universal_io/io.dart';

import "package:yaml/yaml.dart" as yaml;
import 'package:yaml_writer/yaml_writer.dart';

enum TelegramClientApiStatusType {
  succes,
  failed,
  info,
  start,
  progress_start,
  progress,
  progress_complete,
}

class TelegramClientApiStatus {
  String value;
  TelegramClientApiStatusType telegramClientApiStatusType;
  TelegramClientApiStatus({
    required this.telegramClientApiStatusType,
    required this.value,
  });
}

/// Telegram Client Api For Interact With Library
class TelegramClientApi {
  /// Telegram Client Api For Interact With Library
  TelegramClientApi();

  /// Telegram Client Api For create project
  Stream<TelegramClientApiStatus> create({
    required String newName,
    required Directory directoryBase,
    required TelegramClientProjectTemplate telegramClientProjectTemplate,
  }) async* {
    Directory directory_project = await Future(() async {
      return Directory(
          Directory(path.join(directoryBase.uri.toFilePath(), newName.trim()))
              .uri
              .toFilePath());
    });
    String project_name = path.basename(directory_project.path);

    yield TelegramClientApiStatus(
        telegramClientApiStatusType: TelegramClientApiStatusType.info,
        value: "Starting Create Project: ${project_name}");

    File file_pubspec = File(path.join(directory_project.path, "pubspec.yaml"));
    yield TelegramClientApiStatus(
        telegramClientApiStatusType: TelegramClientApiStatusType.info,
        value: "Check: ${path.basename(file_pubspec.path)}");
    if (!file_pubspec.existsSync()) {
      List<String> arguments = () {
        List<String> defaults_args = [
          "create",
          newName,
          "--no-pub",
        ];
        if (telegramClientProjectTemplate.is_application) {
          defaults_args.addAll([
            "--offline",
          ]);
        } else {
          defaults_args.addAll([
            "--force",
          ]);
        }
        return defaults_args;
      }();
      Process process = await Process.start(
        (telegramClientProjectTemplate.is_application) ? "flutter" : "dart",
        arguments,
        workingDirectory: directory_project.parent.uri.toFilePath(),
      );
      process.stderr.listen((event) {
        stderr.add(event);
      });
      process.stdout.listen((event) {
        stdout.add(event);
      });
      int exit_code = await (process.exitCode);
      if (exit_code != 0) {
        yield (TelegramClientApiStatus(
            telegramClientApiStatusType: TelegramClientApiStatusType.failed,
            value: "Failed Create"));
        return;
      }
    }

    List<ScriptGenerator> scripts =
        await telegramClientProjectTemplate.scripts();

    yield (TelegramClientApiStatus(
        telegramClientApiStatusType: TelegramClientApiStatusType.progress_start,
        value: "Starting Generate: ${directory_project.path}"));

    await for (var event
        in scripts.generateToDirectory(directoryBase: directory_project)) {
      await Future.delayed(Duration(microseconds: 50));
      yield TelegramClientApiStatus(
          telegramClientApiStatusType: TelegramClientApiStatusType.progress,
          value:
              "Generate: ${path.relative(event.file_system_entity.path, from: directory_project.path)}");
    }
    yield (TelegramClientApiStatus(
        telegramClientApiStatusType: TelegramClientApiStatusType.progress_start,
        value: "Finished Generate: ${directory_project.path}"));

    Map yaml_code =
        (yaml.loadYaml(file_pubspec.readAsStringSync(), recover: true) as Map);

    Map pubspecPackageFullTemplate = (yaml_code.clone());

    File file_guide =
        File(path.join(directory_project.path, "guide-telegram_client.md"));
    yield TelegramClientApiStatus(
        telegramClientApiStatusType: TelegramClientApiStatusType.info,
        value: "Check File Guide: ${path.basename(file_guide.path)}");

    await file_guide.writeAsString(guide_telegram_client_markdown());

    // default configuration pubspec
    Map pubspecPackageFullTemplate_default = {
      "repository": "https://github.com/azkadev/telegram_client",
      "homepage": "https://github.com/azkadev/telegram_client",
      "issue_tracker": "https://github.com/azkadev/telegram_client/issues",
      "documentation":
          "https://github.com/azkadev/telegram_client/tree/main/docs",
      "funding": [
        "https://github.com/sponsors/azkadev",
      ],
      "dependencies": {
        "telegram_client": "any",
        "general_lib": "any",
      },
    };

    // update pubspec default
    pubspecPackageFullTemplate
        .general_lib_utils_updateMapIfNotSameOrEmptyOrNull(
      data: pubspecPackageFullTemplate_default,
      ignoreKeys: [
        "@type",
      ],
    );
    pubspecPackageFullTemplate
        .general_lib_utils_removeRecursiveByKeys(keyDatas: ["@type"]);

    String yaml_documents_new = YamlWriter().write(pubspecPackageFullTemplate);
    await file_pubspec.writeAsString(yaml_documents_new);
    // finished update pubspec
    yield (TelegramClientApiStatus(
        telegramClientApiStatusType: TelegramClientApiStatusType.succes,
        value: "Finished"));
  }

  /// Telegram Client Api For run
  FutureOr<int> run({
    required Directory directoryBase,
    required Directory? directoryOutputBuildPackageFullTemplate,
    required String? inputFileName,
    required TelegramClientProjectTemplate telegramClientProjectTemplate,
  }) async {
    if (Dart.isWeb) {
      return 1;
    }
    File file_pubspec = File(path.join(directoryBase.path, "pubspec.yaml"));
    if (!file_pubspec.existsSync()) {
      print("pubspec not found");
      return 1;
    }

    return 1;
  }

  Stream<TelegramClientApiStatus> installLibrary({
    required TelegramClientLibraryType telegramClientLibraryType,
  }) async* {
    if (Dart.isWeb) {
      yield TelegramClientApiStatus(
          telegramClientApiStatusType: TelegramClientApiStatusType.failed,
          value: "Can't Install Library on Web Platform");
      return;
    }
    Directory directory_working =
        Directory(path.join(Directory.current.path, "temp"));
    yield TelegramClientApiStatus(
        telegramClientApiStatusType: TelegramClientApiStatusType.info,
        value: "Check Folder: ${directory_working.path}");

    if (directory_working.existsSync() == false) {
      yield TelegramClientApiStatus(
          telegramClientApiStatusType: TelegramClientApiStatusType.info,
          value: "Create Folder: ${directory_working.path}");
      directory_working.createSync(recursive: true);
    } else {
      yield TelegramClientApiStatus(
          telegramClientApiStatusType: TelegramClientApiStatusType.info,
          value: "Folder Exist: ${directory_working.path}");
    }

    if (telegramClientLibraryType == TelegramClientLibraryType.tdlib) {
      // install dependecies
      //
      if (Dart.isLinux) {
        yield TelegramClientApiStatus(
            telegramClientApiStatusType: TelegramClientApiStatusType.info,
            value:
                "Install Dependencies: make git zlib1g-dev libssl-dev gperf php-cli cmake g++");

        Process process = await Process.start(
          "sudo",
          [
            "apt-get",
            "install",
            "-y",
            ...("make git zlib1g-dev libssl-dev gperf php-cli cmake g++"
                .split(" ")),
          ],
        );
        process.stderr.listen((event) {
          stderr.add(event);
        });
        process.stdout.listen((event) {
          stdout.add(event);
        });
        int exit_code = await (process.exitCode);
        if (exit_code != 0) {
          yield TelegramClientApiStatus(
              telegramClientApiStatusType: TelegramClientApiStatusType.failed,
              value:
                  "Succes Dependencies: make git zlib1g-dev libssl-dev gperf php-cli cmake g++");
          return;
        }
        yield TelegramClientApiStatus(
            telegramClientApiStatusType: TelegramClientApiStatusType.succes,
            value:
                "Succes Dependencies: make git zlib1g-dev libssl-dev gperf php-cli cmake g++");
      }

      // clone tdlib
      //
      yield TelegramClientApiStatus(
          telegramClientApiStatusType: TelegramClientApiStatusType.info,
          value: "Clone Repo: https://github.com/tdlib/td.git");
      Process process = await Process.start(
        "git",
        [
          "clone",
          "https://github.com/tdlib/td.git",
        ],
        workingDirectory: directory_working.path,
      );
      process.stderr.listen((event) {
        stderr.add(event);
      });
      process.stdout.listen((event) {
        stdout.add(event);
      });
      int exit_code = await (process.exitCode);
      if (exit_code != 0) {
        yield TelegramClientApiStatus(
            telegramClientApiStatusType: TelegramClientApiStatusType.failed,
            value: "Clone Repo: https://github.com/tdlib/td.git");
        return;
      }
      yield TelegramClientApiStatus(
          telegramClientApiStatusType: TelegramClientApiStatusType.succes,
          value: "Clone Repo: https://github.com/tdlib/td.git");

      Directory directory_build =
          Directory(path.join(directory_working.path, "td", "build"));

      yield TelegramClientApiStatus(
          telegramClientApiStatusType: TelegramClientApiStatusType.info,
          value: "Check Folder: ${directory_build.path}");

      if (directory_build.existsSync() == false) {
        yield TelegramClientApiStatus(
            telegramClientApiStatusType: TelegramClientApiStatusType.info,
            value: "Create Folder: ${directory_build.path}");
        directory_build.createSync(recursive: true);
      } else {
        yield TelegramClientApiStatus(
            telegramClientApiStatusType: TelegramClientApiStatusType.info,
            value: "Folder Exist: ${directory_build.path}");
      }

      if (Dart.isLinux) {
        yield TelegramClientApiStatus(
            telegramClientApiStatusType: TelegramClientApiStatusType.info,
            value: "Started Cmake: Release");

        Process process = await Process.start(
          "cmake",
          ["-DCMAKE_BUILD_TYPE=Release", ".."],
          workingDirectory: directory_build.path,
        );
        process.stderr.listen((event) {
          stderr.add(event);
        });
        process.stdout.listen((event) {
          stdout.add(event);
        });
        int exit_code = await (process.exitCode);
        if (exit_code != 0) {
          yield TelegramClientApiStatus(
              telegramClientApiStatusType: TelegramClientApiStatusType.failed,
              value: "Failed Cmake: Release");
          return;
        }
        yield TelegramClientApiStatus(
            telegramClientApiStatusType: TelegramClientApiStatusType.succes,
            value: "Succes Cmake: Release");
      }
      // build
      if (Dart.isLinux) {
        yield TelegramClientApiStatus(
            telegramClientApiStatusType: TelegramClientApiStatusType.info,
            value: "Started Cmake: Build");

        Process process = await Process.start(
          "cmake",
          [
            "--build",
            ".",
          ],
          workingDirectory: directory_build.path,
        );
        process.stderr.listen((event) {
          stderr.add(event);
        });
        process.stdout.listen((event) {
          stdout.add(event);
        });
        int exit_code = await (process.exitCode);

        if (exit_code != 0) {
          yield TelegramClientApiStatus(
              telegramClientApiStatusType: TelegramClientApiStatusType.failed,
              value: "Failed Cmake: Build");
          return;
        }
        yield TelegramClientApiStatus(
            telegramClientApiStatusType: TelegramClientApiStatusType.succes,
            value: "Succes Cmake: Build");
      }
      // install
      if (Dart.isLinux) {
        yield TelegramClientApiStatus(
            telegramClientApiStatusType: TelegramClientApiStatusType.info,
            value: "Started Cmake: Install");
        Process process = await Process.start(
          "sudo",
          ["cmake", "--build", ".", "--target", "install"],
          workingDirectory: directory_build.path,
        );
        process.stderr.listen((event) {
          stderr.add(event);
        });
        process.stdout.listen((event) {
          stdout.add(event);
        });
        int exit_code = await (process.exitCode);

        if (exit_code != 0) {
          yield TelegramClientApiStatus(
              telegramClientApiStatusType: TelegramClientApiStatusType.failed,
              value: "Failed Cmake: Install");
          return;
        }
        yield TelegramClientApiStatus(
            telegramClientApiStatusType: TelegramClientApiStatusType.succes,
            value: "Succes Cmake: Install");
      }
    }
  }

  /// Telegram Client Api For
  static String guide_telegram_client_markdown() {
    return r"""
# Guide Telegram Client

Telegram Client Library is from DEVELOPER FROM COMPANY GLOBAL CORPORATION
Created By: [AZKADEV](https://github.com/azkadev)

If you use tdlib you must install tdlib

dart run telegram_client install library tdlib
"""
        .trim();
  }
}
