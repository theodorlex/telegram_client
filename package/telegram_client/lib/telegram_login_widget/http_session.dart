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
// ignore_for_file: unused_catch_stack, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:http/http.dart' as http;

/// run executable telegram bot api
class HttpSession {
  String cookies = "";
  late http.Client http_client;

  /// run executable telegram bot api
  HttpSession({
    http.Client? httpClient,
  }) {
    if (httpClient != null) {
      http_client = httpClient;
    } else {
      http_client = http.Client();
    }
  }

  /// run executable telegram bot api
  Future<String> get({
    required String url,
    required Map<String, String> headers,
    required http.Client? httpClient,
  }) async {
    httpClient ??= http_client;
    var uri = Uri.parse(url);
    headers["cookie"] = cookies;
    final response = await httpClient.get(uri, headers: headers);
    if (response.headers["set-cookie"] != null) {
      cookies = '${cookies}${response.headers["set-cookie"]!};';
    }
    return response.body;
  }

  /// run executable telegram bot api
  String addCookiesFromCookiesInfo(String cookies, List<String> cookiesInfo) {
    for (String s in cookiesInfo) {
      if (s.split('=').length < 2) {
        continue;
      }
      var name = s.split('=')[0];
      if (!(name.contains("path")) &&
          !(name.contains("samesite")) &&
          !(name.contains("secure")) &&
          !(name.contains("expires"))) {
        s = s.replaceAll('HttpOnly,', '');
        cookies = '$cookies$s;';
      }
    }
    return cookies;
  }

  /// run executable telegram bot api
  Future<String> post({
    required String url,
    required Map<String, String> headers,
    required String body,
    required http.Client? httpClient,
  }) async {
    httpClient ??= http_client;
    var uri = Uri.parse(url);
    headers["cookie"] = cookies;
    final response = await httpClient.post(uri, headers: headers, body: body);

    var cookiesInfo = response.headers["set-cookie"]?.split(';');
    if (cookiesInfo != null) {
      cookies = addCookiesFromCookiesInfo(cookies, cookiesInfo);
    }
    return response.body;
  }
}
