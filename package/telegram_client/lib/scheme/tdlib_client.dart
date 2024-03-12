// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions empty_catches

import 'dart:convert';

/// add state data
class TdlibClient {
  int client_id;
  int client_user_id;
  bool is_bot;
  Map client_option;
  Map client_dynamic = {};
  DateTime join_date = DateTime.now();

  TdlibClient({
    required this.client_id,
    required this.client_option,
    this.is_bot = false,
    this.client_user_id = 0,
  });

  Map toJson() {
    return {
      "client_id": client_id,
      "client_user_id": client_user_id,
      "join_date": join_date.millisecondsSinceEpoch,
    };
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}

/// add state data
class TdlibClientExit {
  int client_id;

  TdlibClientExit({
    required this.client_id,
  });
}
