import 'package:general_lib/general_lib.dart';
import 'package:telegram_client/telegram_client.dart';

void main(List<String> args) {
  String anu = TgUtils.telegram_post(chat_id: -1001201210, message_id: 102903);
  anu.printPretty();
  print(TgUtils.telegram_chat_text(chat_username: "azkadev", text: "alow"));
}
