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

class UserTelegramLoginWidget extends JsonScheme {
  UserTelegramLoginWidget(super.rawData);

  static Map get defaultData {
    return {
      "@type": "userTelegramLoginWidget",
      "id": "",
      "first_name": "Gi",
      "username": "",
      "hash": "",
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

  String? get id {
    try {
      if (rawData["id"] is String == false) {
        return null;
      }
      return rawData["id"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get first_name {
    try {
      if (rawData["first_name"] is String == false) {
        return null;
      }
      return rawData["first_name"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get username {
    try {
      if (rawData["username"] is String == false) {
        return null;
      }
      return rawData["username"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get hash {
    try {
      if (rawData["hash"] is String == false) {
        return null;
      }
      return rawData["hash"] as String;
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

  static UserTelegramLoginWidget create({
    String special_type = "userTelegramLoginWidget",
    String? id,
    String? first_name,
    String? username,
    String? hash,
    String special_extra = "",
  }) {
    // UserTelegramLoginWidget userTelegramLoginWidget = UserTelegramLoginWidget({
    Map userTelegramLoginWidget_data_create_json = {
      "@type": special_type,
      "id": id,
      "first_name": first_name,
      "username": username,
      "hash": hash,
      "@extra": special_extra,
    };

    userTelegramLoginWidget_data_create_json
        .removeWhere((key, value) => value == null);
    UserTelegramLoginWidget userTelegramLoginWidget_data_create =
        UserTelegramLoginWidget(userTelegramLoginWidget_data_create_json);

    return userTelegramLoginWidget_data_create;
  }
}
