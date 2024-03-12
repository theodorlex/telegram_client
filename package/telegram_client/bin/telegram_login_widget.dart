// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions empty_catches, empty_catches

import 'package:general_lib/general_lib.dart';
import 'package:telegram_client/telegram_login_widget/scheme/user_telegram_login_widget.dart';
import 'package:telegram_client/telegram_login_widget/telegram_login_widget.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) async {
  TelegramLogin telegramLogin = TelegramLogin(botId: "", botDomain: "");
  File file = File("./cookie.txt");
  if (file.existsSync() == false) {
    await file.create(recursive: true);
  }
  String cookies = await () async {
    try {
      return await file.readAsString();
    } catch (e) {}
    return "";
  }();
  telegramLogin.session.cookies = cookies;
  // print(telegramLogin.session.cookies);
  bool is_send_code = await telegramLogin.loginTelegram(phoneNumber: "");
  print(is_send_code);
  while (true) {
    await Future.delayed(Duration(milliseconds: 10));
    bool check_is_login = await telegramLogin.checkIsLogin();
    print(check_is_login);
    if (check_is_login) {
      break;
    }
  }
  while (true) {
    await Future.delayed(Duration(milliseconds: 10));
    bool is_login = await telegramLogin.confirmLogin();
    if (is_login) {
      break;
    }
    print(is_login);
  }
  //
  UserTelegramLoginWidget getMe = await telegramLogin.getMe();
  getMe.toJson().printPretty(2);
  await file.writeAsString(telegramLogin.session.cookies);

  exit(0);
}
