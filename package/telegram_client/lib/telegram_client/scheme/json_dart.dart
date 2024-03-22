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
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions unused_import
import 'dart:convert';

/// return original data json
class JsonScheme {
  /// return original data json
  Map rawData;

  /// return original data json
  JsonScheme(this.rawData);

  /// return original data json
  static Map get defaultData {
    return {
      "@type": "jsonDart",
    };
  }

  /// return original data json
  static JsonScheme create({
    String special_type = "JsonScheme",
  }) {
    Map jsonCreate = {
      "@type": special_type,
    };

    jsonCreate.forEach((key, value) {
      try {
        if (value == null) {
          jsonCreate.remove(key);
          // jsonCreate[key] = value;
        }
      } catch (e, stack) {
        print("Azka ${e.toString()}, ${stack.toString()}");
      }
    });
    return JsonScheme(jsonCreate);
  }

  /// operator map data
  operator *(value) {}

  /// operator map data
  operator /(value) {}

  /// operator map data
  Map operator +(Map value) {
    rawData.addAll(value);
    return rawData;
  }

  /// return original data json
  Map operator -(List values) {
    utils_remove_by_keys_void(values);
    return rawData;
  }

  /// operator map data
  operator [](key) {
    return rawData[key];
  }

  /// operator map data
  void operator []=(key, value) {
    rawData[key] = value;
  }

  /// return original data json
  void utils_remove_values_null_void() {
    rawData.forEach((key, value) {
      if (value == null) {
        rawData.remove(key);
      }
    });
  }

  /// return original data json
  Map utils_remove_values_null() {
    utils_remove_values_null_void();
    return rawData;
  }

  /// return original data json
  void utils_remove_by_values_void(List values) {
    rawData.forEach((key, value) {
      for (var element in values) {
        if (value == element) {
          rawData.remove(key);
        }
      }
    });
  }

  /// return original data json
  Map utils_remove_by_values(List values) {
    utils_remove_by_values_void(values);
    return rawData;
  }

  void utils_remove_by_keys_void(List keys) {
    for (var element in keys) {
      rawData.remove(element);
    }
  }

  /// return original data json
  Map utils_remove_by_keys(List keys) {
    utils_remove_by_keys_void(keys);
    return rawData;
  }

  /// return original data json
  Map utils_filter_by_keys(List keys) {
    Map jsonData = {};
    for (var key in keys) {
      jsonData[key] = rawData[key];
    }
    return jsonData;
  }

  /// return original data json
  Map toMap() {
    return rawData;
  }

  /// return original data json
  Map toJson() {
    return rawData;
  }

  /// return string data encode json original data
  String toStringPretty() {
    return JsonEncoder.withIndent(" " * 2).convert(toJson());
  }

  /// return string data encode json original data
  @override
  String toString() {
    return json.encode(rawData);
  }
}

extension JsonSchemeExtensions on List<JsonScheme> {
  List<Map> toJson() {
    return map((e) => e.toJson()).toList().cast<Map>();
  }

  /// return string data encode json original data
  String toStringPretty() {
    return JsonEncoder.withIndent(" " * 2).convert(toJson());
  }
}
