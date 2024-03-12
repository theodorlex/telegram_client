import 'package:telegram_client/telegram_client/telegram_client_core.dart';

void main(List<String> args) async {
  TelegramClient tg = TelegramClient();
  tg.ensureInitialized();
}
