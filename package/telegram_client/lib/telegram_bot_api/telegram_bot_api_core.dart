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
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions slash_for_doc_comments, empty_catches, unnecessary_brace_in_string_interps

// ignore: slash_for_doc_comments
//
import 'dart:async' show Completer, Future, FutureOr, Stream, StreamTransformer;
// import 'dart:convert';

// import 'package:alfred/alfred.dart';
import 'package:general_lib/general_lib.dart';
import 'package:http/http.dart';
import 'package:telegram_client/alfred/alfred.dart';
import 'package:telegram_client/telegram_bot_api/scheme/tg_client_client_data.dart';
// import 'package:telegram_client/telegram_bot_api/telegram_bot_api.dart';
import 'package:telegram_client/telegram_bot_api/update_bot.dart';
import 'package:telegram_client/util/telegram_bot_api_file_data.dart';
// import "update_api.dart";
import 'package:telegram_client/util/util.dart';
import 'package:universal_io/io.dart';
import 'dart:convert' as convert;

/// Telegram Bot Api library:
/// example:
/// ```dart
/// TelegramBotApi tg = TelegramBotApi("token_bot");
/// tg.request("sendMessage",  parameters: {
///   "chat_id": 12345,
///   "text": "Hello world"
/// });
/// ````
///
class TelegramBotApi {
  late String token_bot;
  Alfred? alfred;
  bool is_init_server = false;
  Uri telegram_url_webhook = Uri.parse("http://0.0.0.0:8080/telegram/webhook");
  Crypto telegram_crypto = Crypto(key: "");
  Client http_client = Client();
  Map client_option = {
    "api_id": 0,
    "api_hash": "",
    "botPath": "/bot/",
    "userPath": "/user/",
    "port": 8080,
    "type": "bot",
    "logger": false,
    "api": "https://api.telegram.org/",
    "allowed_updates": [
      "message",
      "edited_message",
      "channel_post",
      "edited_channel_post",
      "inline_query",
      "chosen_inline_result",
      "callback_query",
      "shipping_query",
      "pre_checkout_query",
      "poll",
      "poll_answer",
      "my_chat_member",
      "chat_member",
      "chat_join_request",
    ],
  };

  EventEmitter event_emitter = EventEmitter();
  List state_data = [];
  String event_invoke = "invoke";
  String event_update = "update";

  /// list methods:
  /// api:
  /// ```dart
  /// tg.request("getMe");
  /// ```
  ///
  TelegramBotApi({
    required String tokenBot,
    Map? clientOption,
    this.alfred,
    String telegramCryptoKey = "aeatmlvodkm9ii37l2p0WGkaAAF3BWCh",
    EventEmitter? eventEmitter,
    this.event_invoke = "invoke",
    this.event_update = "update",
    Uri? telegramUrlWebhook,
    Client? httpClient,
  }) {
    if (httpClient != null) {
      http_client = httpClient;
    }
    telegram_crypto.defaultKey = telegramCryptoKey;
    if (telegramUrlWebhook != null) {
      telegram_url_webhook = telegramUrlWebhook;
    }

    if (eventEmitter != null) {
      event_emitter = eventEmitter;
    }
    token_bot = tokenBot;
    if (clientOption != null) {
      client_option.addAll(clientOption);
    }
  }

  void initServer() {
    if (alfred != null) {
      if (dart.isWeb == false) {
        if (is_init_server == false) {
          is_init_server = true;

          alfred!.post(telegram_url_webhook.path,
              (HttpRequest req, HttpResponse res) async {
            try {
              Map query = (req.uri.queryParameters).clone();
              Map<String, dynamic> body = await req.bodyAsJsonMap;
              event_emitter.emit(
                event_update,
                null,
                UpdateBot(
                  uri: req.uri,
                  body: body,
                  query: query,
                  type: "glx",
                ),
              );
              return {"@type": "ok"};
            } catch (e) {
              return {
                "@type": "ok",
              };
            }
          });
        }
      }
    }
  }

  TgClientClientData tgClientData({
    required Map query,
  }) {
    if (query["tg"] is String == false) {
      query["tg"] = "";
    }
    Map decyprt =
        convert.json.decode(telegram_crypto.decrypt(data_base64: query["tg"]));

    if (decyprt["client_user_id"] == null || decyprt["client_user_id"] == 0) {
      decyprt["client_user_id"] =
          TgUtils.parserBotUserIdFromToken(decyprt["client_token"]);
    }
    return TgClientClientData(decyprt);
  }

  Future<Map> initIsolate({
    String? tokenBot,
    int owner_user_id = 0,
    int from_bot_user_id = 0,
    int expire_date = 0,
    String type_bot = "glx",
    String? path,
    String version = "regular",
    Iterable<String>? pathSegments,
  }) async {
    tokenBot ??= token_bot;

    Map getMe = await request(
      "getMe",
      tokenBot: tokenBot,
    );
    Map client_data = {
      "client_token": tokenBot,
      "owner_user_id": owner_user_id,
      "client_type": type_bot,
      "client_title": getMe["result"]["first_name"],
      "client_username": getMe["result"]["username"],
      "from_bot_user_id": from_bot_user_id,
      "expire_date": expire_date,
      "version": version,
    };
    String query_telegram_webhook =
        telegram_crypto.encryptMapToBase64(data: client_data);
    Map result_webhook = await request(
      "setWebhook",
      parameters: {
        "url": telegram_url_webhook.replace(
          path: path,
          pathSegments: pathSegments,
          queryParameters: {
            "tg": query_telegram_webhook,
          },
        ).toString()
      },
      tokenBot: tokenBot,
    );
    Map new_scheme = {
      "webhook": result_webhook["result"],
      "user": getMe["result"],
      "client_data": client_data,
    };

    return new_scheme;
  }

  Future<Map> initIsolateNewClient({
    required String tokenBot,
    int owner_user_id = 0,
    int from_bot_user_id = 0,
    int expire_date = 0,
    String type_bot = "glx",
    String? path,
    String version = "regular",
    Iterable<String>? pathSegments,
  }) async {
    return await initIsolate(
      tokenBot: tokenBot,
      owner_user_id: owner_user_id,
      from_bot_user_id: from_bot_user_id,
      expire_date: expire_date,
      type_bot: type_bot,
      path: path,
      version: version,
      pathSegments: pathSegments,
    );
  }

  /// example:
  /// ```dart
  /// tg.on(tg.event_update, (update) async {
  ///    print(update);
  /// });
  /// ```
  /// add this for handle update api
  Listener on(String type_update,
      FutureOr<dynamic> Function(UpdateBot updateBot) callback) {
    return event_emitter.on(type_update, null, (Event ev, context) async {
      try {
        if (ev.eventData is UpdateBot) {
          UpdateBot updateApi = ev.eventData as UpdateBot;
          await callback(updateApi);
          return;
        }
      } catch (e) {}
    });
  }

  /// call latest [Bot Api](https://core.telegram.org/bots/api#available-methods)
  /// example:
  /// [sendMessage]()
  /// ```dart
  /// tg.emit(tg.event_update, "");
  /// ```
  /// add this for handle update api
  void emit(String type_update, UpdateBot updateBot) {
    return event_emitter.emit(type_update, null, updateBot);
  }

  Map typeFile(dynamic content) {
    Map data = {};
    if (content is String) {
      if (RegExp(r"^http", caseSensitive: false).hashData(content)) {
        data = {"@type": 'inputFileRemote', "data": content};
      }
      if (content is int) {
        data = {"@type": 'inputFileId', "data": content};
      } else {
        data = {"@type": 'inputFileRemote', "data": content};
      }
    } else {
      data = {"@type": 'inputFileRemote', "data": content};
    }
    return data;
  }

  /// call api latest [bot api](https://core.telegram.org/bots/api#available-methods)
  /// example:
  /// ```dart
  /// invoke("sendMessage", parameters: {
  ///   "chat_id": 123456,
  ///   "text": "<b>Hello</b> <code>word</code>",
  ///   "parse_mode": "html"
  /// });
  /// ```
  Future<Map> invoke(
    String method, {
    Map? parameters,
    bool is_form = false,
    String? tokenBot,
    String? urlApi,
    String? clientType,
    bool isThrowOnError = true,
    void Function(int bytesCount, int totalBytes)? onUploadProgress,
    Client? httpClient,
  }) async {
    httpClient ??= http_client;
    parameters ??= {};
    clientType ??= client_option["type"];
    urlApi ??= client_option["api"];
    tokenBot ??= token_bot;
    var option = {
      "method": "post",
    };

    var url = Uri.parse((urlApi ?? "")).replace(pathSegments: [
      (clientType ?? "bot") + tokenBot,
      method,
    ]).toString();
    if (!is_form) {
      List<String> methodForm = [
        "sendDocument",
        "sendPhoto",
        "sendAudio",
        "sendVideo",
        "sendVoice",
        "setChatPhoto",
        "sendVideoNote",
        "sendAnimation",
        "sendMediaGroup",
      ];
      List<String> keyForm = [
        "video",
        "audio",
        "voice",
        "document",
        "photo",
        "animation",
        "video_note",
        "media",
      ];

      if (methodForm
          .map((e) => e.toLowerCase())
          .toList()
          .contains(method.toLowerCase())) {
        parameters.forEach((key, value) {
          if (parameters == null) {
            return;
          }
          try {
            if (keyForm.contains(key)) {
              if (key == "media") {
                if (value is List) {
                  for (var i = 0; i < value.length; i++) {
                    Map value_data = value[i];
                    value_data.forEach((key_loop, value_loop) {
                      if (key_loop == "media") {
                        if (value_loop is File) {
                          value[i][key_loop] = value_loop.uri.toString();
                        } else {
                          try {
                            value[i][key_loop] = typeFile(value_loop)["data"];
                            if (value[i][key_loop] is String == false) {
                              is_form = true;
                            }
                          } catch (e) {}
                        }
                      }
                    });
                  }
                }
              } else if (value is File) {
                parameters[key] = value.uri.toString();
              } else {
                parameters[key] = typeFile(value)["data"];
                if (parameters[key] is String == false) {
                  is_form = true;
                }
              }
            }
          } catch (e) {}
        });
      }
    }
    try {
      if (is_form) {
        HttpClient httpClientForm = HttpClient();
        final request = await httpClientForm.postUrl(Uri.parse(url));
        var form = MultipartRequest("post", Uri.parse(url));

        parameters.forEach((key, value) async {
          if (value is File) {
            form.fields[key] = value.uri.toString();
          } else if (value is Map) {
            if (value["is_post_file"] == true) {
              var files = await MultipartFile.fromPath(key, value["file_path"]);
              form.files.add(files);
            } else if (value["is_post_buffer"] == true) {
              var files = MultipartFile.fromBytes(
                  key, (value["buffer"] as List).cast<int>(),
                  filename: value["name"], contentType: value["content_type"]);
              form.files.add(files);
            } else {
              form.fields[key] = convert.json.encode(value);
            }
          } else if (value is TelegramBotApiFileData) {
            var files = MultipartFile.fromBytes(key, value.buffer_data,
                filename: value.name, contentType: null);
            form.files.add(files);
          } else if (value is String) {
            form.fields[key] = value;
          } else if (key == "media" && value is List<Map>) {
            List<Map> values = [];
            for (var i = 0; i < value.length; i++) {
              Map value_data = value[i];
              Map jsonData = {};
              value_data.forEach((key_loop, value_loop) {
                if (key_loop == "media" && value_loop is Map) {
                  if (value_loop["is_post_buffer"] == true) {
                    String name_file = "file_${i}_${value_loop["name"]}";
                    var files = MultipartFile.fromBytes(
                      name_file,
                      value_loop["buffer"],
                      filename: value_loop["name"],
                      contentType: value_loop["content_type"],
                    );
                    form.files.add(files);
                    jsonData[key_loop] = "attach://${name_file}";
                  } else {
                    jsonData[key_loop] = value_loop.toString();
                  }
                } else if (value_loop is TelegramBotApiFileData) {
                  String name_file = "file_${i}_${value_loop.name}";
                  var files = MultipartFile.fromBytes(
                    name_file,
                    value_loop.buffer_data,
                    filename: value_loop.name,
                    contentType: null,
                  );
                  form.files.add(files);
                  jsonData[key_loop] = "attach://${name_file}";
                } else if (value_loop is File) {
                  jsonData[key_loop] = value_loop.uri.toString();
                } else {
                  jsonData[key_loop] = value_loop.toString();
                }
              });
              values.add(jsonData);
            }
            form.fields[key] = convert.json.encode(values);
          } else {
            form.fields[key] = value.toString();
          }
        });

        utils_remove_parameters(data: parameters);
        var msStream = form.finalize();
        var totalByteLength = form.contentLength;
        request.contentLength = totalByteLength;
        request.headers.set(
          HttpHeaders.contentTypeHeader,
          form.headers[HttpHeaders.contentTypeHeader]!,
        );
        int byteCount = 0;
        Stream<List<int>> streamUpload = msStream.transform(
          StreamTransformer.fromHandlers(
            handleData: (data, sink) {
              sink.add(data);
              byteCount += data.length;
              if (onUploadProgress != null) {
                onUploadProgress(byteCount, totalByteLength);
              }
            },
            handleError: (error, stack, sink) {
              throw error;
            },
            handleDone: (sink) {
              sink.close();
            },
          ),
        );
        await request.addStream(streamUpload);
        final httpResponse = await request.close();
        var statusCode = httpResponse.statusCode;
        var completer = Completer<String>();
        var contents = StringBuffer();
        httpResponse.transform(convert.utf8.decoder).listen((String data) {
          contents.write(data);
        }, onDone: () => completer.complete(contents.toString()));
        var body = convert.json.decode(await completer.future);
        if (statusCode == 200) {
          return body;
        } else {
          if (isThrowOnError) {
            throw body;
          } else {
            return body;
          }
        }
      } else {
        utils_remove_parameters(data: parameters);
        option["body"] = convert.json.encode(parameters);
        var response = await httpClient.post(
          Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
          },
          body: option["body"],
        );
        if (response.statusCode == 200) {
          if (method.toString().toLowerCase() == "getfile") {
            var getFile = convert.json.decode(response.body);
            var url = "${urlApi}file/$clientType${tokenBot.toString()}";
            getFile["result"]["file_url"] =
                "$url/${getFile["result"]["file_path"]}";
            return getFile;
          } else {
            return convert.json.decode(response.body);
          }
        } else {
          var json = convert.json.decode(response.body);
          if (isThrowOnError) {
            throw json;
          } else {
            return json;
          }
        }
      }
    } catch (e) {
      if (RegExp(r"^(send)", caseSensitive: false).hasMatch(method)) {
        if (e is Map) {
          if (RegExp("Unsupported start tag", caseSensitive: false)
              .hasMatch(e["description"])) {
            parameters.remove("parse_mode");
            return await invoke(
              method,
              parameters: parameters,
              is_form: is_form,
              isThrowOnError: isThrowOnError,
              tokenBot: tokenBot,
              urlApi: urlApi,
              clientType: clientType,
              onUploadProgress: onUploadProgress,
            );
            // Bad Request: can't parse entities: Unsupported start tag "spoir" at byte offset 79
          }
        }
        rethrow;
      } else {
        rethrow;
      }
    }
  }

  void utils_remove_parameters({
    required Map data,
  }) {
    data.removeWhere((key, value) {
      if (value is File) {
        return true;
      }
      if (value is Map) {
        utils_remove_parameters(data: data[key] as Map);
      }
      if (value is List) {
        utils_remove_parameterss(datas: value);
      }
      return false;
    });
  }

  void utils_remove_parameterss({
    required List datas,
  }) {
    datas.removeWhere((element) {
      if (element is Map) {
        utils_remove_parameters(data: element);
      }
      if (element is List) {
        utils_remove_parameterss(datas: element);
      }
      return false;
    });
  }

  /// call api latest [bot api](https://core.telegram.org/bots/api#available-methods)
  /// example:
  /// ```dart
  /// request("sendMessage", parameters: {
  ///   "chat_id": 123456,
  ///   "text": "<b>Hello</b> <code>word</code>",
  ///   "parse_mode": "html"
  /// });
  /// ```
  Future<Map> request(
    String method, {
    Map? parameters,
    bool is_form = false,
    String? tokenBot,
    String? urlApi,
    String? clientType,
    void Function(int bytesCount, int totalBytes)? onUploadProgress,
    bool isAutoExtendMessage = false,
    bool isThrowOnError = true,
    Client? httpClient,
  }) async {
    parameters ??= {};
    clientType ??= client_option["type"];
    urlApi ??= client_option["api"];
    tokenBot ??= token_bot;

    if (parameters["is_natural"] == true) {}

    if (isAutoExtendMessage) {
      if (parameters["text"] is String) {
        String text = parameters["text"];
        if (text.length >= 4096) {
          List<String> messagesJson = TgUtils.splitByLength(text, 4096);
          List result = [];
          for (var i = 0; i < messagesJson.length; i++) {
            var loopData = messagesJson[i];
            try {
              await Future.delayed(Duration(milliseconds: 500));
              parameters["text"] = loopData;
              if (RegExp("(editMessageText)", caseSensitive: false)
                  .hashData(method)) {
                if (i != 0) {
                  method = "sendMessage";
                }
              }
              var res = await invoke(
                method,
                parameters: parameters,
                is_form: is_form,
                tokenBot: tokenBot,
                urlApi: urlApi,
                clientType: clientType,
                onUploadProgress: onUploadProgress,
                isThrowOnError: isThrowOnError,
                httpClient: httpClient,
              );
              result.add(res);
            } catch (e) {
              result.add(e);
            }
          }
          return {"result": result};
        }
      }

      if (parameters["caption"] is String) {
        String caption = parameters["caption"];
        if (caption.length >= 1024) {
          List<String> messagesJson = TgUtils.splitByLength(caption, 1024);
          List result = [];
          for (var i = 0; i < messagesJson.length; i++) {
            var loopData = messagesJson[i];
            try {
              await Future.delayed(Duration(milliseconds: 500));
              parameters["caption"] = loopData;
              if (RegExp("(editMessageCaption)", caseSensitive: false)
                  .hashData(method)) {
                if (i != 0) {
                  parameters["text"] = loopData;
                  method = "sendMessage";
                }
              }
              var res = await invoke(
                method,
                parameters: parameters,
                is_form: is_form,
                tokenBot: tokenBot,
                urlApi: urlApi,
                clientType: clientType,
                onUploadProgress: onUploadProgress,
                isThrowOnError: isThrowOnError,
                httpClient: httpClient,
              );
              result.add(res);
            } catch (e) {
              result.add(e);
            }
          }
          return {"result": result};
        }
      }
    }

    return await invoke(
      method,
      parameters: parameters,
      is_form: is_form,
      tokenBot: tokenBot,
      urlApi: urlApi,
      clientType: clientType,
      onUploadProgress: onUploadProgress,
      isThrowOnError: isThrowOnError,
      httpClient: httpClient,
    );
  }

  /// call api latest [bot api](https://core.telegram.org/bots/api#available-methods) with upload file
  /// example:
  /// ```dart
  /// requestForm("sendDocument",  parameters: {
  ///   "chat_id": 123456,
  ///   "document": tg.file("./doc.json"),
  ///   "parse_mode": "html"
  /// });
  /// ```
  Future<Map> requestForm(
    String method, {
    Map parameters = const {},
    bool is_form = false,
    String? tokenBot,
    String? urlApi,
    String? clientType,
    void Function(int bytesCount, int totalBytes)? onUploadProgress,
    bool isAutoExtendMessage = false,
    bool isThrowOnError = true,
    Client? httpClient,
  }) async {
    tokenBot ??= token_bot;
    return await request(
      method,
      parameters: parameters,
      is_form: true,
      tokenBot: tokenBot,
      urlApi: urlApi,
      clientType: clientType,
      onUploadProgress: onUploadProgress,
      isAutoExtendMessage: isAutoExtendMessage,
      isThrowOnError: isThrowOnError,
      httpClient: httpClient,
    );
  }

  /// donload file with proggres
  Future<String> fileDownload(
    String url, {
    required String path,
    void Function(int bytes, int totalBytes)? onDownloadProgress,
  }) async {
    final httpClient = HttpClient();
    final request = await httpClient.getUrl(Uri.parse(url));
    request.headers
        .add(HttpHeaders.contentTypeHeader, "application/octet-stream");
    var httpResponse = await request.close();
    int byteCount = 0;
    int totalBytes = httpResponse.contentLength;
    File file = File(path);
    var raf = file.openSync(mode: FileMode.write);
    Completer completer = Completer<String>();
    httpResponse.listen(
      (data) {
        byteCount += data.length;
        raf.writeFromSync(data);
        if (onDownloadProgress != null) {
          onDownloadProgress(byteCount, totalBytes);
        }
      },
      onDone: () {
        raf.closeSync();
        completer.complete(file.path);
      },
      onError: (e) {
        raf.closeSync();
        file.deleteSync();
        completer.completeError(e);
      },
      cancelOnError: true,
    );
    return await completer.future;
  }
}
