import 'package:general_lib/general_lib.dart';
import 'package:path/path.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) async {
  List<Map> datas = [
    {
      "@type": "tgClientClientData",

      "id": 0,
      "created_at": "2022-12-26T05:26:40.500935+00:00",
      // "group": [],
      // "private": [],
      "client_user_id": 0,
      "client_title": "",
      "client_token": "",
      "owner_user_id": 0,
      "client_type": "",
      "from_bot_type": null,
      "can_join_groups": false,
      "can_read_all_group_messages": false,
      "from_bot_user_id": 0,
      "expire_date": 0,
      "client_username": "",
      "version": "",
      "client_id": 0,

      "client_data": "{}"
      // "channel": [],
    }
  ];

  await jsonToScripts(
    datas,
    directory: Directory(
      join(Directory.current.path, "lib", "telegram_bot_api", "scheme"),
      // "/home/galaxeus/Documents/galaxeus/app/telegram_client/package/telegram_client/lib/telegram_bot_api/scheme",
    ),
  );
}
