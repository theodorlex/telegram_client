import 'package:telegram_client/telegram_client/telegram_client.dart';

void main(List<String> args) {
  TelegramClient tg = TelegramClient();
  tg.ensureInitialized();
  tg.on(
    event_name: tg.event_update,
    onUpdate: (updateTelegramClient) {
      // kode
    },
    onError: (error, stackTrace) {},
  );
  tg.tdlib.initIsolate();
}
