# Telegram Client library
<p align="center">
  <img src="https://raw.githubusercontent.com/azkadev/telegram_client/main/assets/telegram.png" width="350px">
</p>
<h2 align="center">Ultra Fast, Enjoyable & Cross Platform Telegram Client</h2>

[![Pub Version](https://img.shields.io/pub/v/telegram_client?label=pub.dev&labelColor=333940&logo=dart)](https://pub.dev/packages/telegram_client)

**Telegram Client** Dart **library** for make telegram base flutter **bot**, **userbot**, **App** Support Run Server Side And Client Side, This library 100% easy for make multiples **client or accounts** because this library you just call function not execute shell command so update account will show at function event emitter

## Features

- 🚀 **Work On Cross Platform**: Mobile, Desktop, Browser, Server Side
- ⚡ **Good Performance and efficient**
- ❤️ **Simple, Easey Powerfull, Can Extend To Scala Bussiness**

### Information

This Library only update if there ae feature that i want, if you want library with full documentation so it usually **makes things easier DEVELOP PROGRAM** you just need to buy / donate at azkadev

## Example Project Use This Library


1. [AZKA GRAM](https://github.com/azkadev/azkagram)
    
 **Telegram Application** with **redesign** with new some features userbot and other **features which is not officially provided on Telegram** First this project open source but we closed it to **close source** because our program is easy to read and allows other people to edit the source code and then use it for criminal acts
 
|                                                 CHAT PAGE                                                  |                                                SIGN UP PAGE                                                |                                                                                                  HOME PAGE |                                          GUIDE PAGE                                           |
|:----------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------:|-----------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------:|
| ![](https://user-images.githubusercontent.com/82513502/205481759-b6815e2f-bd5d-4d72-9570-becd3829dd36.png) | ![](https://user-images.githubusercontent.com/82513502/173319331-9e96fbe7-3e66-44b2-8577-f6685d86a368.png) | ![](https://user-images.githubusercontent.com/82513502/173319541-19a60407-f410-4e95-8ac0-d0da2eaf2457.png) | ![](https://raw.githubusercontent.com/GLXCORP/glx_bot_app/main/screenshots/home_telegram.png) |

2. [AzkaDev Bot App](https://github.com/azkadev/products_azkadev_bot_app)
  
  **Cross Platform** app for Run Multiple bot / userbot in cloud or local device, for run optimal we need modern devices with high end specs.

|                                     SIGN IN PAGE                                     |                                         SIGN UP PAGE                                          |                                                                            HOME PAGE |                                          GUIDE PAGE                                           |
|:------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------:|-------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------:|
| ![](https://raw.githubusercontent.com/GLXCORP/glx_bot_app/main/screenshots/home.png) | ![](https://raw.githubusercontent.com/GLXCORP/glx_bot_app/main/screenshots/home_telegram.png) | ![](https://raw.githubusercontent.com/GLXCORP/glx_bot_app/main/screenshots/home.png) | ![](https://raw.githubusercontent.com/GLXCORP/glx_bot_app/main/screenshots/home_telegram.png) |
  

1. [AZKADEV BOT](https://t.me/azkadevbot?start=ref_library_telegram_client)
  
  Complex Paid Telegram bot that can handle many groups, ch, private, with many payment gateway features, Automation Store, clone userbot bot, made with this library without mixing other code languages, This bot runs only using < 100mb on a very light server because it uses dart


|                                         Setting Menu                                         |                                         Manage Chat                                          |                                                                                   Extra Menu |                                         Feature MEnu                                         |
|:--------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------:|---------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------:|
| ![](https://github.com/azkadev/telegram_client/raw/main/assets/example/bot/azkadevbot_1.jpg) | ![](https://github.com/azkadev/telegram_client/raw/main/assets/example/bot/azkadevbot_2.png) | ![](https://github.com/azkadev/telegram_client/raw/main/assets/example/bot/azkadevbot_3.png) | ![](https://github.com/azkadev/telegram_client/raw/main/assets/example/bot/azkadevbot_4.png) |
  
---

## Guide on how to use this library

Before using this library, make sure you know basic coding
And your laptop has the programming language installed [dart](https://dart.dev)

### Install Library

1. Install Library
   
   To install the library you need to type the command below in the terminal

```bash
dart pub add telegram_client
```
   
  If you want to create your application use this command

1. For Flutter
```bash
flutter pub add telegram_client telegram_client_linux telegram_client_android telegram_client_ios telegram_client_macos telegram_client_windows
```

### Add Library

```dart
import 'package:telegram_client/telegram_client.dart';
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
<!-- START GLOBAL CORPORATION -->
<h3 align="center">
  Global Corporation

  ![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/global_corporation.png)
</h3>


<h3 align="center">
  Welcome to Global Corporation profile!
  <img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="28">
</h3>

<!-- Social icons section -->
<p align="center">
  <a href="https://www.instagram.com/global__corporation/"><img width="32px" alt="Instagram" title="Telegram" src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png"/></a>
  &#8287;&#8287;&#8287;&#8287;&#8287;
  <a href="https://t.me/GLOBAL_CORPORATION_ORG"><img width="32px" alt="Twitter" title="Telegram" src="https://upload.wikimedia.org/wikipedia/commons/8/82/Telegram_logo.svg"/></a>
  &#8287;&#8287;&#8287;&#8287;&#8287;
  <a href="https://twitter.com/global_corp_org"><img width="32px" alt="Twitter" title="Twitter" src="https://upload.wikimedia.org/wikipedia/commons/6/6f/Logo_of_Twitter.svg"/></a>
  &#8287;&#8287;&#8287;&#8287;&#8287;
  <a href="https://www.youtube.com/@global_Corporation"><img width="32px" alt="Youtube" title="Youtube" src="https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png"/></a>
  &#8287;&#8287;&#8287;&#8287;&#8287;
</p>

**Global Corporation** Is a **leading company** that takes a leading role in **accelerating** and **maintaining** enterprise security. 

With a sharp focus on innovation and technological excellence

**Global Corporation** providing effective proactive solutions to secure company operations and prevent potential adverse risks. 

With a committed team of experts, advanced technology, and a holistic approach to corporate security, Global Corporation has become a benchmark for other companies that prioritize security and safety as a top priority in their business.

[![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/powered.png)](https://www.youtube.com/@Global_Corporation)

## Application / Product / Project Official

<h3 align="center">
  Global App

  ![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/global_corporation.png)
</h3>

  Super Cross-platform application allows you to do social media / chat as well as a place for buying and selling businesses to find work
[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/global_app)

<h3 align="center">
  Global Bot App

  ![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/global_corporation.png)
</h3>

  Super cross-platform application allows you to handle lots of bots / userbots / AI for your assistants, making it easier for you in all your affairs
  
[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/global_bot_app)

### Global Studio Developer

  The cross-platform Studio Developer application allows you to code on various platforms

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/global_bot_app)

<h3 align="center">
  Ads Gateway

  ![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/ads_gateway.png)
</h3>

  **Applikasi** Cross platform advertising allows you to advertise on various platforms easily

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/coinlox)

<h3 align="center">
  Archivon

  ![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/archivon.png)
</h3>

  **Applikasi** Linux based operating system which will be released

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/coinlox)

<h3 align="center">
  Coinlox

  ![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/coinlox.png)
</h3>

  **Applikasi** Cross Platform Wallet allows you to store money on the internet safely

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/coinlox)



### Global Bot Telegram

  Super Bot Telegram allows you to manage various chat groups / private / channels as well as a place to buy and sell the products we sell, you can buy this service from
  IDR: 25k / bulan
  $: 1,5 Dollar

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/global_bot_telegram)

### Global Userbot Telegram

  Super Bot Telegram allows you to manage various chat groups / private / channels as well as a place to buy and sell the products we sell, you can buy this service from
  IDR: 25k / bulan
  $: 1,5 Dollar

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/global_userbot_telegram)

### Global Bot Whatsapp

  Super Bot Telegram allows you to manage various chat groups / private / channels as well as a place to buy and sell the products we sell, you can buy this service from
  IDR: 25k / bulan
  $: 1,5 Dollar

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/global_bot_whatsapp)

## Social Media

<h3 align="center">
  Telegram
  <img src="https://upload.wikimedia.org/wikipedia/commons/8/82/Telegram_logo.svg" width="20">
</h3>

1. [Group Developer Global Public](https://t.me/DEVELOPER_GLOBAL_PUBLIC)

## Product / Services

1. **Clone Bot / Userbot**
  Hi, do you want to have a bot / userbot with lots of features?. 
  - **Features**:
    - **Repeat Message**
    - **Manage Chat Private / Channel / Group**
  - **Platform Support**:
    - **Telegram**
    - **Whatsapp**
    - **Twitter**
    - **Github**
    - **Google** 
1. **Products**
    - **Black Products**
    - **Group / Channel**
    - **Nsfw**
    - **Payment Gateway**
    - **Paid Promote**
    - **Pre Release / Beta**
    - **Promo Cheap**
    - **Source Code Bot / USerbot**
    - **Trade**
2. **Services**
    - **Developer**
    - **Goal**
    - **Partner**
    - **Promote**
    - **Recommendation**
    - **Sortcut Cheat Sheet**
    - **Terminate**
    - **Upgrade**

## Cara Beli Jasa / Products 

- **Lewat Telegram Bot**
  Jika kamu ingin membeli bisa lewat telegram automatis pembayaran hingga proses
  (jika proses lama itu bukan **SCAM !!** kemungkinan **server down** jadi proses bisa lebih lama jika ragu tap menu report lalu isi keluhan)
  -  Buka Bot: https://t.me/GLOBAL_CORP_ORG_BOT
  -  Isi data pribadi / subscribe channel
  -  Tap Main menu pilih services / products
  -  Pilih Product / Services
  -  Pastikan coin mencukupi
  -  Isi data yang di butuhkan

- **Lewat Telegram USER**
  -  Buka: https://t.me/general_user
  -  Ucapin apapun yang kamu butuh jasa dev / apapun

  
Video Tutorial
[![Watch the video](https://img.youtube.com/vi/TY0Y21C6asM/maxresdefault.jpg)](https://www.youtube.com/watch?v=TY0Y21C6asM)

- **Lewat App**
  jika kamu ingin melihat product / jasa dengan full demo kamu bisa beli lewat app

## 📺 Latest YouTube Videos

  <!-- prettier-ignore-start -->
  <!-- BEGIN YOUTUBE-CARDS -->
[![Userbot LIFE TIME Subsription Telegram Murah Unlimited Akun Ultra FAST | Global Corporation](https://ytcards.demolab.com/?id=LfNt8A2fCLQ&title=Userbot+LIFE+TIME+Subsription+Telegram+Murah+Unlimited+Akun+Ultra+FAST+%7C+Global+Corporation&lang=id&timestamp=1712129787&background_color=%230d1117&title_color=%23ffffff&stats_color=%23dedede&max_title_lines=1&width=250&border_radius=5 "Userbot LIFE TIME Subsription Telegram Murah Unlimited Akun Ultra FAST | Global Corporation")](https://www.youtube.com/watch?v=LfNt8A2fCLQ)
[![Tolong 😭 Siapapun beli satu jasa aku ntr aku kasih harga seiklasnya / ada yang mau donasi | GLOBAL](https://ytcards.demolab.com/?id=BFl2AT_pdOw&title=Tolong+%F0%9F%98%AD+Siapapun+beli+satu+jasa+aku+ntr+aku+kasih+harga+seiklasnya+%2F+ada+yang+mau+donasi+%7C+GLOBAL&lang=id&timestamp=1710988807&background_color=%230d1117&title_color=%23ffffff&stats_color=%23dedede&max_title_lines=1&width=250&border_radius=5 "Tolong 😭 Siapapun beli satu jasa aku ntr aku kasih harga seiklasnya / ada yang mau donasi | GLOBAL")](https://www.youtube.com/watch?v=BFl2AT_pdOw)
[![Cara beli ai telegram versi bot dan cara pakai| Global Corporation](https://ytcards.demolab.com/?id=7LZhoklvS9A&title=Cara+beli+ai+telegram+versi+bot+dan+cara+pakai%7C+Global+Corporation&lang=id&timestamp=1710937415&background_color=%230d1117&title_color=%23ffffff&stats_color=%23dedede&max_title_lines=1&width=250&border_radius=5 "Cara beli ai telegram versi bot dan cara pakai| Global Corporation")](https://www.youtube.com/watch?v=7LZhoklvS9A)
[![Ai Userbot Telegram Demo Cara Pakai Dan Beli | Global Corporation](https://ytcards.demolab.com/?id=4mAZ6EgAhUo&title=Ai+Userbot+Telegram+Demo+Cara+Pakai+Dan+Beli+%7C+Global+Corporation&lang=id&timestamp=1710936251&background_color=%230d1117&title_color=%23ffffff&stats_color=%23dedede&max_title_lines=1&width=250&border_radius=5 "Ai Userbot Telegram Demo Cara Pakai Dan Beli | Global Corporation")](https://www.youtube.com/watch?v=4mAZ6EgAhUo)
[![CARA BELI USERBOT TELEGRAM CLOUD  | Global Corporation](https://ytcards.demolab.com/?id=uiDJwK9r3Cg&title=CARA+BELI+USERBOT+TELEGRAM+CLOUD++%7C+Global+Corporation&lang=id&timestamp=1710900440&background_color=%230d1117&title_color=%23ffffff&stats_color=%23dedede&max_title_lines=1&width=250&border_radius=5 "CARA BELI USERBOT TELEGRAM CLOUD  | Global Corporation")](https://www.youtube.com/watch?v=uiDJwK9r3Cg)
[![Cara Top Up Automatis Menggunakan Payment Gateway Di GLOBAL BOT APP](https://ytcards.demolab.com/?id=ADqzS5ORJsU&title=Cara+Top+Up+Automatis+Menggunakan+Payment+Gateway+Di+GLOBAL+BOT+APP&lang=id&timestamp=1710721879&background_color=%230d1117&title_color=%23ffffff&stats_color=%23dedede&max_title_lines=1&width=250&border_radius=5 "Cara Top Up Automatis Menggunakan Payment Gateway Di GLOBAL BOT APP")](https://www.youtube.com/watch?v=ADqzS5ORJsU)
<!-- END YOUTUBE-CARDS -->
  <!-- prettier-ignore-end -->

<!-- END GLOBAL CORPORATION -->