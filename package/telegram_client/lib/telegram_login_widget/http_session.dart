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
