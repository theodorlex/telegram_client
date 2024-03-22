/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!


<!-- END LICENSE --> */
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
