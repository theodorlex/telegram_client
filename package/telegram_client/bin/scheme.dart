// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:io';

import 'package:general_lib/general_lib.dart';

void main(List<String> args) async {
  List<Map> scripts_origin = [
    {
      "@type": "userTelegramLoginWidget",
      "id": "6609944680",
      "first_name": "Gi",
      "username": "Hhhhhhhhhyhh",
      "hash":
          "b8e56bd623ce43fdb58f386eaec2c5ab320fe3fd3a561c51576f6e41208084fe",
    },
    // {
    //   "@type": "ok",
    // },
    // {
    //   "@type": "error",
    //   "code": 500,
    //   "message": "",
    //   "description": "",
    // },
    // {
    //   "@type": "chat",
    //   "id": 0,
    //   "first_name": "",
    //   "last_name": "",
    //   "username": "",
    // }
  ];
  for (var i = 0; i < scripts_origin.length; i++) {
    scripts_origin[i]["@extra"] = "";
  }
  await jsonToScripts(scripts_origin,
      directory: Directory(
          "/home/galaxeus/Documents/galaxeus/app/telegram_client/package/telegram_client/lib/telegram_login_widget/scheme"));
}
