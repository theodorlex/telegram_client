# Telegram Client library
<p align="center">
  <img src="https://raw.githubusercontent.com/azkadev/telegram_client/main/assets/telegram.png" width="350px">
</p>
<h2 align="center">Cepat, Menyenangkan & Multi Platform Telegram Client</h2>

[![Pub Version](https://img.shields.io/pub/v/telegram_client?label=pub.dev&labelColor=333940&logo=dart)](https://pub.dev/packages/telegram_client)


Telegram client dart library untuk membuat telegram based flutter bot userbot bisa di server side dan client side, library ini 100% mudah di gunakan untuk membuat multi client sekaligus karena di library Telegram Client ini kamu hanya perlu memanggil fungsi saja dan update automatis akan di terima di event emitter


## Fitur

- 🚀 Bisa Di Berbagai Platform: mobile, desktop, browser, server
- ⚡ Performance Bagus Dan Effisien
- ❤️ Simple, Mudah Powerfull, Bisa di extend ke scala bisnis

## Review Cepat

  Video singkat cara menggunakan library ini untuk membuat project yang ingin anda bikin dengan template yang sudah saya buat.

<!-- ![](https://raw.githubusercontent.com/azkadev/telegram_client/main/.github/telegram_client_cli_demo.gif) -->

 <!-- ![](https://raw.githubusercontent.com/azkadev/telegram_client/main/.github/telegram_app.gif) -->

### Informasi

Library hanya update jika ada feature yang saya ingin update jika kamu butuh library dengan dokumentasi lengkap sehingga bisa develop app / bot / userbot / apapun itu kamu bisa membeli layanan Azkadev (50k / bulan) akses semua feature library umum

## Contoh Project Yang Menggunakan Library ini


1. [AZKA GRAM](https://github.com/azkadev/azkagram)
    
 Telegram Application dengan menambahkan design baru serta fitur userbot dan fitur lain yang tidak di sediakan secara resmi oleh telegram project ini sudah di close source code karena banyak yang berusaha membuat app ini untuk melakukan tindakan kriminal (spam, scam), Jika anda ingin membuat silahkan pelajari library ini 

|                                                 CHAT PAGE                                                  |                                                SIGN UP PAGE                                                |                                                                                                  HOME PAGE |                                          GUIDE PAGE                                           |
|:----------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------:|-----------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------:|
| ![](https://user-images.githubusercontent.com/82513502/205481759-b6815e2f-bd5d-4d72-9570-becd3829dd36.png) | ![](https://user-images.githubusercontent.com/82513502/173319331-9e96fbe7-3e66-44b2-8577-f6685d86a368.png) | ![](https://user-images.githubusercontent.com/82513502/173319541-19a60407-f410-4e95-8ac0-d0da2eaf2457.png) | ![](https://raw.githubusercontent.com/GLXCORP/glx_bot_app/main/screenshots/home_telegram.png) |

2. [AzkaDev Bot App](https://github.com/azkadev/products_azkadev_bot_app)

  Sebuah Applikasi untuk menjalankana berbagai bot di cloud dan local device saat ini tersedia di handphone dan membutuhkan specs yang mumpuni agar applikasi ini bisa berjalan optimal

|                                     SIGN IN PAGE                                     |                                         SIGN UP PAGE                                          |                                                                            HOME PAGE |                                          GUIDE PAGE                                           |
|:------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------:|-------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------:|
| ![](https://raw.githubusercontent.com/GLXCORP/glx_bot_app/main/screenshots/home.png) | ![](https://raw.githubusercontent.com/GLXCORP/glx_bot_app/main/screenshots/home_telegram.png) | ![](https://raw.githubusercontent.com/GLXCORP/glx_bot_app/main/screenshots/home.png) | ![](https://raw.githubusercontent.com/GLXCORP/glx_bot_app/main/screenshots/home_telegram.png) |
  

## Contoh Bot / Userbot Yang Menggunakan Telegram Client

1. [AZKADEV BOT](https://t.me/azkadevbot?start=ref_library_telegram_client)
  Telegram bot Berbayar complex yang bisa menghandle banyak group, ch, private, dengan banyak fitur payment gateway, Automation Store, clone userbot bot, dibikin dengan library ini tanpa campur bahasa code lain, Bot ini berjalan hanya menggunakan < 100mb di server sangat ringan karena menggunakan dart


|                                         Setting Menu                                         |                                         Manage Chat                                          |                                                                                   Extra Menu |                                         Feature MEnu                                         |
|:--------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------:|---------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------:|
| ![](https://github.com/azkadev/telegram_client/raw/main/assets/example/bot/azkadevbot_1.jpg) | ![](https://github.com/azkadev/telegram_client/raw/main/assets/example/bot/azkadevbot_2.png) | ![](https://github.com/azkadev/telegram_client/raw/main/assets/example/bot/azkadevbot_3.png) | ![](https://github.com/azkadev/telegram_client/raw/main/assets/example/bot/azkadevbot_4.png) |
  

 
---

## Panduan Cara pakai library ini

Sebelum memakai library ini pastikan kamu tahu basic coding
Dan laptop kamu sudah terinstal bahasa program [dart](https://dart.dev)

### Install Library

1. Install Library
   
  Untuk menginstall libary kamu perlu typing command di bawah ini di terminal

```bash
dart pub add telegram_client
```
   
  Jika anda ingin membuat applikasi kamu pakai command ini

1. For Flutter
```bash
flutter pub add telegram_client telegram_client_linux telegram_client_android telegram_client_ios telegram_client_macos telegram_client_windows
```

1. Cli
   
  Jika anda ingin meninstall versi cli silahkan gunakan perintah di bawah ini

```bash
dart pub global activate telegram_client
```

1. Setup

Setup automatis agar kamu tidak ribet compile tdlib, telegram-bot-api

```bash
telegram_client setup -f
```

### Menambah Library

```dart
import 'package:telegram_client/telegram_client.dart';
```

### Menggunakan Template Yang sudah ada Agar Cepat Selesai

```bash
telegram_client create name_project --template telegram_bot_tdlib_template
```

### Docs

### Library Fitur
- ```telegram client dart```
    - ✅️ Bisa Di Server & Client
    - ✅️ Bisa multi Client ( bot / userbot ) 
    - ✅️ Bisa bot and userbot
    - ✅️ Bisa telegram-bot-api (local / [Bot-Api](https://core.telegram.org/bots/api#recent-changes)
    - ✅️ Bisa Menggunakan **Telegram Database Library** ( [TDLIB](https://github.com/tdlib/td) )
    - ✅️ Api yang mudah di gunakan dan bagus jadi bisa move dari bot api dengan mudah tanpa ada perubahan banyak kode
    - ✅️ Sangat Mudah dalam mengoperasikan banyak client sekaligus

## Install Untuk Flutter Manaual

### Menambahkan Library TDLIB
  Jika anda ingin menggunakan library ini pastikan anda sudah bisa mengcompile tdlib ya

- Automatis
  Jika anda tidak tahu cara mengcompile gunakan ini
```bash
flutter pub add telegram_client_flutter
```
 
- Manual

Untuk menambahkan library kamu  wajib mengcompile ke platform yang ingin kamu buat Build [Tdlib](https://github.com/td/tdlib)

### Android
Kopi `.so` Files dari archive ke `example/android/app/main/jniLibs`:
```txt
└── example 
    └── android 
        └── app 
            └── main 
                └── jniLibs 
                    └── arm64-v8a
                    │   └── libtdjson.so
                    └── armeabi-v7a
                    │   └── libtdjson.so
                    └── x86
                    │   └── libtdjson.so
                    └── x86_64
                        └── libtdjson.so
```
Buka file `example/android/app/build.gradle`

Ganti
```groovy
sourceSets {
  main.java.srcDirs += 'src/main/kotlin'
}
```
ke
```groovy
sourceSets {
  main {
    java.srcDirs += 'src/main/kotlin'
    jniLibs.srcDirs = ['src/main/jniLibs']
  }
}
```

### iOS and macOS
1. Kopi `libtdjson.dylib` dari archive ke `example/ios`
2. Kopi `libtdjson.dylib` dari archive ke `example/macos`
```txt
└── example 
    └── ios 
    │   └── libtdjson.dylib
    └── macos
        └── libtdjson.dylib
```
3. Buka `Runner.xcworkspace` Di Dalam Xcode.
4. Tambahkan `.dylib` file to project.
5. Cari `Frameworks, Libraries, Dan EmbeddedContent`.
6. Ganti `libtdjson.dylib` Pilih `Embed & Sign`.
7. Cari`Signing & Capabilities`.
8. Di Dalam `App Sandbox (Debug and Profile)` Atur true `Outgoing Connections (Client)`.

### Windows
1. Kopi files Dari Archive Ke `example/windows/tdlib`
```txt
└── example 
    └── windows 
        └── tdlib 
            └── libcrypto-1_1.dll
            └── libssl-1_1.dll
            └── tdjson.dll
            └── zlib1.dll
```
2. Buka `example/windows/CMakeLists.txt`.
3. Taambahkan Text ini Di bawah `set(INSTALL_BUNDLE_LIB_DIR "${CMAKE_INSTALL_PREFIX}")`:
```c
# begin td
set(dll_path "${CMAKE_CURRENT_SOURCE_DIR}/tdlib")
install(FILES "${dll_path}/libcrypto-1_1.dll" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}" COMPONENT Runtime)
install(FILES "${dll_path}/libssl-1_1.dll" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}" COMPONENT Runtime)
install(FILES "${dll_path}/tdjson.dll" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}" COMPONENT Runtime)
install(FILES "${dll_path}/zlib1.dll" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}" COMPONENT Runtime)
# end td
```

### Linux
1. Kopi file Dari archive ke `example/linux/tdlib`
```
└── example 
    └── linux 
        └── tdlib 
            └── libtdjson.so
```
2. Buka `example/linux/CMakeLists.txt`.
3. Tambahkan di akhir text file:
```c
# begin td
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/tdlib/libtdjson.so" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
    COMPONENT Runtime)
# end td
```

- [Doc + Contoh](https://github.com/azkadev/telegram_client/tree/main/dart/telegram_client/doc)
- [Youtube-Tutorial](https://www.youtube.com/@azkadev)
  
## Dokumentasi

- [Tdlib](#tdlib)
- [Telegram Bot Api](#telegrambotapi)
- [Mtproto](#mtproto)
- [Tdlib-Official](https://core.telegram.org/tdlib/docs/classtd_1_1_tl_object.html)

---

## Tdlib
gunakan ini untuk membuat userbot / bot / application based tdlib,
Contoh Cepat:

- Satu Client
```dart
import 'dart:io';
import 'package:telegram_client/telegram_client.dart';
void main(List<String> args) async {
  var path = Directory.current.path;
  Tdlib tg = Tdlib(pathTdl:"./tdjson.so", clientOption: {
    'api_id': 12345,
    'api_hash': 'abcdefgjjaijiajdisd',
    'database_directory': "$path/user/",
    'files_directory': "$path/user/",
  });
  tg.on("update", (UpdateTd update) {
    print(update.raw);
  });
  tg.ensureInitializedIsolate();
}
```
- Multi Client (Bisa lebih dari 4 tergantug spek device)

Di library ini kamu bisa membuat banyak client tanpa perlu repot menambahkan banyak kode sangat simpel dan ringkas menjadi satu

```dart
import 'dart:io';
import 'package:telegram_client/telegram_client.dart';
void main(List<String> args) async {
  var path = Directory.current.path;
  Tdlib tg = Tdlib(pathTdl:"./tdjson.so", clientOption:{
    'api_id': 12345678, /// telegram_api_id
    'api_hash': 'asaskaoskaoskoa', /// telegram_api_hash
    'database_directory': "$path/user_0/",
    'files_directory': "$path/user_0/",
  });
  tg.on("update", (UpdateTd update) {
    if (tg.client_id == update.client_id) {
      print("user_0");
    } else {
      print("user_1");
    }
    print(update.raw);
  });
  tg.ensureInitializedIsolate();
  tg.ensureInitializedIsolateNewClient(clientId: tg.client_create(), clientOption: {
    'database_directory': "${path}/user_1/",
    'files_directory': "${path}/user_1/",
  });
}
```

#### constructor

| No |      key       |                             value                              | Deskripsi                                         | `required` |
|----|:--------------:|:--------------------------------------------------------------:|:--------------------------------------------------|:----------:|
| 1  |   `pathTdl`    |                       String path tdlib                        |                                                   |   `yes`    |
| 2  | `clientOption` | [object](https://core.telegram.org/bots/api#available-methods) | parameters di butuhkan jika method membutuhkannya |    `no`    |
- examples
```js
Tdlib tg = Tdlib(pathTdl:"./tdjson.so", clientOption: {
  'api_id': 123435,
  'api_hash': 'asmamskmaks',
  'database_directory': "",
  'files_directory': "",
  "use_file_database": true,
  "use_chat_info_database": true,
  "use_message_database": true,
  "use_secret_chats": true,
  'enable_storage_optimizer': true,
  'system_language_code': 'en',
  'new_verbosity_level': 0,
  'application_version': 'v1',
  'device_model': 'Telegram Client Hexaminate',
});
```

#### on
| No |      key      |       value       | Deskripsi                                         | `required` |
|----|:-------------:|:-----------------:|:--------------------------------------------------|:----------:|
| 1  | `type_update` | String path tdlib |                                                   |   `yes`    |
| 2  |  `function`   | [object](#object) | parameters di butuhkan jika method membutuhkannya |   `yes`    |
- examples
```js
tg.on("update", (UpdateTd update) {
  print(update.raw);    
});
```

#### initIsolate
| No |      key       |                             value                              | Deskripsi                                         | `required` |
|----|:--------------:|:--------------------------------------------------------------:|:--------------------------------------------------|:----------:|
| 1  |   `clientId`   |                    int addres client_create                    |                                                   |    `no`    |
| 2  | `clientOption` | [object](https://core.telegram.org/bots/api#available-methods) | parameters di butuhkan jika method membutuhkannya |    `no`    |
- examples
```js
tg.initIsolate();
```

#### request
| No |      key      |        value         | Deskripsi                                         | `required` |
|----|:-------------:|:--------------------:|:--------------------------------------------------|:----------:|
| 1  | `name_method` |        String        | more method check [tdlib-docs]()                  |   `yes`    |
| 2  | `parameters`  | [object](#methods-1) | parameters di butuhkan jika method membutuhkannya | `options`  |
- examples
```js
tg.request("sendMessage", parameters: {
  "chat_id": 123456,
  "text": "Hello world"
});
```
#### invoke
| No |     key      |        value         | Deskripsi                                         | `required` |
|----|:------------:|:--------------------:|:--------------------------------------------------|:----------:|
| 1  | `parameters` | [object](#methods-1) | parameters di butuhkan jika method membutuhkannya |   `yes`    |
- examples
```js
tg.invoke({
  "@type": "getMe",
});
```
#### invokeSync
| No |     key      |        value         | Deskripsi                                         | `required` |
|----|:------------:|:--------------------:|:--------------------------------------------------|:----------:|
| 1  | `parameters` | [object](#methods-1) | parameters di butuhkan jika method membutuhkannya |   `yes`    |
- examples
```js
tg.invokeSync({
  "@type": "getMe",
});
```
---
### Object
---
### UpdateTd

#### raw 

---
### methods
more method check [tdlib-docs]()
#### sendMessage
| No |    key    |     value     | Deskripsi | `required` |
|----|:---------:|:-------------:|:----------|:----------:|
| 1  | `chat_id` | String or int |           |   `yes`    |
| 2  |  `text`   |    String     |           |   `yes`    |

#### sendPhoto
| No |    key    |     value     | Deskripsi | `required` |
|----|:---------:|:-------------:|:----------|:----------:|
| 1  | `chat_id` | String or int |           |   `yes`    |
| 2  |  `photo`  |    String     |           |   `yes`    |

---

## TelegramBotApi
Gunakan ini untuk berinteraksi dengan api telegram, semua method disini sudah auto update

quickstart:
- with domain public
```dart 
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions unused_local_variable

import 'dart:convert';
import 'package:telegram_client/alfred/alfred.dart';
import 'package:telegram_client/telegram_client.dart';

void main(List<String> args) async {
  Alfred alfred = Alfred(
    logLevel: LogType.error,
  );
  await alfred.listen();
  print("Server on: http://${alfred.server!.address.host}:${alfred.server!.port}");
  String telegram_token_bot = "";
  Uri telegram_url_webhook = Uri.parse("https://{your_host_com}/telegram/webhook");
  TelegramBotApi tg = TelegramBotApi(
    tokenBot: telegram_token_bot,
    alfred: alfred,
    telegramUrlWebhook: telegram_url_webhook,
  );
  tg.on(tg.event_update, (updateBot) async {
    try {
      Map update = updateBot.body;
      if (update["message"] is Map) {
        Map msg = update["message"];
        int form_id = msg["from"]["id"];
        int chat_id = msg["chat"]["id"];
        String caption_msg = () {
          if (msg["text"] is String) {
            return msg["text"];
          }
          if (msg["caption"] is String) {
            return msg["caption"];
          }

          return "";
        }();
        if (caption_msg.isNotEmpty) {
          if (RegExp(r"^/(start)", caseSensitive: false).hasMatch(caption_msg)) {
            return await tg.request(
              "sendMessage",
              parameters: {
                "chat_id": chat_id,
                "text": "Hai saya adalah robot",
              },
              isAutoExtendMessage: true,
            );
          }
        }
        await tg.request(
          "sendMessage",
          parameters: {
            "chat_id": chat_id,
            "text": json.encode(msg),
          },
          isAutoExtendMessage: true,
        );
      }
    } catch (e) {
      print(e);
    }
  });
  Map client = tg.ensureInitializedIsolate();
  print(client);
}
```
- local without domain public but need [telegram-bot-api](https://github.com/tdlib/telegram-bot-api)
```dart
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions unused_local_variable

import 'dart:convert';
import 'package:telegram_client/alfred/alfred.dart';
import 'package:telegram_client/telegram_client.dart';

void main(List<String> args) async {
  Alfred alfred = Alfred(
    logLevel: LogType.error,
  );
  await alfred.listen();
  TelegramBotApiServer telegramBotApiServer = TelegramBotApiServer();
  await telegramBotApiServer.run(
    executable: "telegram-bot-api",
    arguments: telegramBotApiServer.optionsParameters(
      api_id: "telegram_api_id",
      api_hash: "telegram_api_hash",
    ),
    host: "0.0.0.0",
    tg_bot_api_port: 9000,
  );
  print("Server on: http://${alfred.server!.address.host}:${alfred.server!.port}");
  String telegram_token_bot = "";
  Uri telegram_url_webhook = Uri.parse("https://0.0.0.0:3000/telegram/webhook");
  TelegramBotApi tg = TelegramBotApi(
    tokenBot: telegram_token_bot,
    alfred: alfred,
    clientOption: {
      "api": "http://0.0.0.0:9000"
    },
    telegramUrlWebhook: telegram_url_webhook,
  );
  tg.on(tg.event_update, (updateBot) async {
    try {
      Map update = updateBot.body;
      if (update["message"] is Map) {
        Map msg = update["message"];
        int form_id = msg["from"]["id"];
        int chat_id = msg["chat"]["id"];
        String caption_msg = () {
          if (msg["text"] is String) {
            return msg["text"];
          }
          if (msg["caption"] is String) {
            return msg["caption"];
          }

          return "";
        }();
        if (caption_msg.isNotEmpty) {
          if (RegExp(r"^/(start)", caseSensitive: false).hasMatch(caption_msg)) {
            return await tg.request(
              "sendMessage",
              parameters: {
                "chat_id": chat_id,
                "text": "Hai saya adalah robot",
              },
              isAutoExtendMessage: true,
            );
          }
        }
        await tg.request(
          "sendMessage",
          parameters: {
            "chat_id": chat_id,
            "text": json.encode(msg),
          },
          isAutoExtendMessage: true,
        );
      }
    } catch (e) {
      print(e);
    }
  });
  Map client = tg.ensureInitializedIsolate();
  print(client);
}
```

##### request 
| No |      key      |       value       | Deskripsi                                                                                     | `required` |
|----|:-------------:|:-----------------:|:----------------------------------------------------------------------------------------------|:----------:|
| 1  | `name_method` |      String       | more method check [Telegram Bot Method](https://core.telegram.org/bots/api#available-methods) |   `yes`    |
| 2  | `parameters`  | object json / Map | parameters di butuhkan jika method membutuhkannya                                             | `options`  |
- examples
```dart
tg.request("sendMessage", parameters:{
  "chat_id": 123456,
  "text": "Hello world"
});
```

---

## MtProto
Untuk mtproto telegram ini belum jadi ya karena saya belum mengerti cara connect mtproto
Quickstart:
```dart
import 'package:telegram_client/telegram_client.dart';
void main() async {
  Mtproto tg = Mtproto();
  tg.connect();
  tg.on("update", (data) {
    print(data);
  });
}
```
----
- Tags:
  #telegram #telegram_client #tdlib #mtproto #telegram_bot_api #telegram_dart #telegram_flutter #telegram_clone #telegram_userbot #telegram_bot

- Seo
  Telegram Dart
  Telegram Client
  Telegram Flutter
  Telegram userbot
  Telegram Bot
  Telegram Tdlib
  Tdlib
  Mtproto
  Telegram Bot Api
  Telegram Library
  Telegram clone
  Telegram clone flutter
  Tdlib Dart
  Tdlib Flutter
  Mtproto dart
  Mtproto flutter
  Telegram Bot Api
  Telegram Bot Api dart
  Telegram Bot Api Flutter
---