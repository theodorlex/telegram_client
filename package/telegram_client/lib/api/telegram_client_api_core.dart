// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, unused_local_variable

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
import 'package:telegram_client/api/extensions.dart';
import 'package:telegram_client/api/template.dart';
import 'package:universal_io/io.dart';

import "package:yaml/yaml.dart" as yaml;
import 'package:yaml_writer/yaml_writer.dart';

/// Telegram Client Api For Interact With Library
class TelegramClientApi {
  /// Telegram Client Api For Interact With Library
  TelegramClientApi();

  /// Telegram Client Api For create project
  FutureOr<dynamic> create({
    required String newName,
    required Directory directoryBase,
    required TelegramClientProjectTemplate telegramClientProjectTemplate,
  }) async {
    Directory directory_project = await Future(() async {
      return Directory(
          Directory(path.join(directoryBase.uri.toFilePath(), newName.trim()))
              .uri
              .toFilePath());
    });
    String project_name = path.basename(directory_project.path);

    File file_pubspec = File(path.join(directory_project.path, "pubspec.yaml"));
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
    }

    List<ScriptGenerator> scripts =
        await telegramClientProjectTemplate.scripts();
    await scripts.generateToDirectory(
      directoryBase: directory_project,
    );
    Map yaml_code =
        (yaml.loadYaml(file_pubspec.readAsStringSync(), recover: true) as Map);
    Map pubspecPackageFullTemplate = (yaml_code.clone());

    File file_guide =
        File(path.join(directory_project.path, "guide-telegram_client.md"));

    await file_guide.writeAsString(guide_telegram_client_markdown());

    // supabase file script
    File file_script_example = File(path.join(
        directory_project.path, "bin", "${project_name}_example.dart"));

    if (!file_script_example.existsSync()) {
      // await file_script_example.writeAsString(script_telegram_client_native());
    }

    // supabase directory deploy
    Directory directory_script_supabase = Directory(path.join(
        directory_project.path, "supabase", "functions", project_name));

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
    pubspecPackageFullTemplate.telegram_client_updateMapIfNotSameOrEmptyOrNull(
      data: pubspecPackageFullTemplate_default,
      ignoreKeys: [
        "@type",
      ],
    );
    String yaml_documents_new = YamlWriter().write(pubspecPackageFullTemplate);
    await file_pubspec.writeAsString(yaml_documents_new);
    // finished update pubspec
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

  /// Telegram Client Api For
  static String guide_telegram_client_markdown() {
    return r"""
# Guide Server Universe
"""
        .trim();
  }
}
