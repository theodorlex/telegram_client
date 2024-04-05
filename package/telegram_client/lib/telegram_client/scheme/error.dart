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

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions unused_import
import "json_dart.dart";
// import "dart:convert";

class Error extends JsonScheme {
  Error(super.rawData);

  static Map get defaultData {
    return {
      "@type": "error",
      "code": 500,
      "message": "",
      "description": "",
      "@extra": ""
    };
  }

  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  int? get code {
    try {
      if (rawData["code"] is int == false) {
        return null;
      }
      return rawData["code"] as int;
    } catch (e) {
      return null;
    }
  }

  String? get message {
    try {
      if (rawData["message"] is String == false) {
        return null;
      }
      return rawData["message"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get description {
    try {
      if (rawData["description"] is String == false) {
        return null;
      }
      return rawData["description"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get special_extra {
    try {
      if (rawData["@extra"] is String == false) {
        return null;
      }
      return rawData["@extra"] as String;
    } catch (e) {
      return null;
    }
  }

  static Error create({
    String special_type = "error",
    int? code,
    String? message,
    String? description,
    String special_extra = "",
  }) {
    // Error error = Error({
    Map error_data_create_json = {
      "@type": special_type,
      "code": code,
      "message": message,
      "description": description,
      "@extra": special_extra,
    };

    error_data_create_json.removeWhere((key, value) => value == null);
    Error error_data_create = Error(error_data_create_json);

    return error_data_create;
  }
}
