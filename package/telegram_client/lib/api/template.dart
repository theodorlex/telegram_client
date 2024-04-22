// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:general_lib/script_generate/script_generate.dart';
import 'package:telegram_client/templates/telegram_app_telegram_client_template.dart';
import 'package:telegram_client/templates/telegram_bot_telegram_client_template.dart';
import 'package:telegram_client/templates/telegram_userbot_telegram_client_template.dart';

/// telegram client projedct template
class TelegramClientProjectTemplate {
  String name;
  bool is_application;
  FutureOr<List<ScriptGenerator>> Function() scripts;
  //
  TelegramClientProjectTemplate({
    required this.name,
    required this.is_application,
    required this.scripts,
  });

  /// default templates
  static List<TelegramClientProjectTemplate> get templates {
    return [
      TelegramClientProjectTemplate(
        name: "Bot",
        is_application: false,
        scripts: () {
          return telegram_bot_telegram_client_script_generators;
        },
      ),
      TelegramClientProjectTemplate(
        name: "Telegram Application",
        is_application: true,
        scripts: () {
          return telegram_app_telegram_client_script_generators;
        },
      ),
      TelegramClientProjectTemplate(
        name: "Userbot",
        is_application: false,
        scripts: () {
          return telegram_userbot_telegram_client_script_generators;
        },
      ),
    ];
  }
}
