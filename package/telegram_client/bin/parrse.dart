// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

void main(List<String> args) {
  Map reply_markup = {
    "inline_keyboard": [
      [
        {"text": "slebew", "url": "googl.eomc"}
      ]
    ]
  };
  print(
      ("tg_cli telegram_bot_api --@type sendMessage --chat_id azkadev --text slebew --reply_markup ${json.encode(json.encode(reply_markup))}"));
}
