// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'package:general_lib/general_lib.dart';
import 'package:telegram_client/tdlib/tdlib.dart';

void main(List<String> args) async {
  Tdlib tg = Tdlib();

  int create_client_id = tg.td_json_client_create();

  print(create_client_id);

  tg.td_json_client_send(
    create_client_id,
    {
      "@type": "getMe",
      "@extra": "e",
    },
  );
  while (true) {
    await Future.delayed(Duration(milliseconds: 1));
    Map? update = tg.td_json_client_receive(create_client_id);
    if (update == null) {
      continue;
    }
    print(update.toStringifyPretty());
  }
}
