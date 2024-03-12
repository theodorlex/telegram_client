// ignore_for_file: camel_case_extensions, non_constant_identifier_names, empty_catches

extension TelegramClientExtension_on_ObjectData on Object {

  /// check apakah ada error di timeout jika true error jika false tidak
  /// jika true berarti ada masalah pada koneksi internet anda 
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
