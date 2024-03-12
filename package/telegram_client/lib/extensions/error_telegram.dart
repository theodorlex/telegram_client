// ignore_for_file: camel_case_extensions

extension TelegramClientExtension_on_ObjectData on Object {
  bool get telegram_client_is_error_time_out_limit {
    try {
      if (this is Map) {
        if ((this as Map)["message"] == "time_out_limit") {
          return true;
        }
      }
    } catch (e) {}
    return false;
  }
}
