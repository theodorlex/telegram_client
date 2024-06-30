import 'package:documentation/scheme/scheme.dart';

DocumentationData get documentationData => DocumentationData.create(
  title: "Telegram Cliet Documentation",
  logo: "assets/logo/logo.png",
  description: """
Telegram Client adalah library yang memanfaatkan api telegram untuk di implementasikan ke berbagai platform, library ini user friendly
sehingga mudah di gunakan untuk membuat project seperti applikasi, bot, userbot, web dalam skala bisnis besar
""",
  content: """
<h2 align="center">Ultra Fast, Enjoyable & Cross Platform Telegram Client</h2>

**Telegram Client** Dart **library** for make telegram base flutter **bot**, **userbot**, **App** Support Run Server Side And Client Side, This library 100% easy for make multiples **client or accounts** because this library you just call function not execute shell command so update account will show at function event emitter

## Features

- 🚀 **Work On Cross Platform**: Mobile, Desktop, Browser, Server Side
- ⚡ **Good Performance and efficient**
- ❤️ **Simple, Easey Powerfull, Can Extend To Scala Bussiness**


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

### Quick Start

```dart
import 'package:telegram_client/telegram_client/telegram_client.dart';

void main(List<String> args) {
  TelegramClient tg = TelegramClient();
  tg.ensureInitialized();
  tg.on(
    event_name: tg.event_update,
    onUpdate: (updateTelegramClient) {
      // kode
    },
    onError: (error, stackTrace) {},
  );
  tg.tdlib.initIsolate();
}
``` 

## Important

**I really need funds so that this library can be easier to use. You can buy this library by subscribing/sponsoring me on GitHub:** [AZKADEV](https://github.com/azkadev)


"""
      .trim(),
  author_url_social_medias: {
    "https://youtube.com/@azkadev",
    "https://github.com/azkadev",
    "https://t.me/azkadev",
    "https://instagram.com/azka.developer",
    "https://twitter.com/azka_dev",
    "https://azkadev.netlify.app",
    // "https://tiktok.com/azkadev",
  }.toList(),
  footer: DocumentationFooterData.create(
    footers: [
      FootersData.create(
        title: "Other Information",
        footer: [
          FooterData.create(
            title: "About",
          ),
          FooterData.create(title: "Buy My Services On Telegram 🥺", url: "https://t.me/azkadevbot?start=ref_web_documentation"),
          FooterData.create(title: "Donate Me 🥺", url: "https://github.com/sponsor/azkadev"),
          FooterData.create(title: "Donate Me On Telegram 🥺", url: "https://t.me/azkadevbot?start=donate_web_documentation"),
        ],
      ),
      FootersData.create(
        title: "Other Library",
        footer: [
          FooterData.create(title: "Discord Client", url: "https://t.me/azkadevbot?start=ref_web_documentation"),
          FooterData.create(title: "DoodStream Client", url: "https://t.me/azkadevbot?start=ref_web_documentation"),
          FooterData.create(title: "Github Client", url: "https://t.me/azkadevbot?start=ref_web_documentation"),
          FooterData.create(title: "Google Client", url: "https://t.me/azkadevbot?start=ref_web_documentation"),
          FooterData.create(title: "Whatsapp Client", url: "https://t.me/azkadevbot?start=ref_web_documentation"),
        ],
      ),
    ],
  ),
  docs: [
    DocsData.create(
      doc_id: "mtproto",
      title: "Mtproto",
      description: """
Mtproto adalah library yang paling ringan cepat tidak memerlukan ffi namun jika menggunakan ini harap jangan flood / mencoba call api
berkali kali karena api ini direct ke telegram langsung sehingga akan sangat mudah di banned jika menggunakan ini (api ini di gunakan jika anda sudah mahir coding + perhitungan limitasi api)
"""
          .trim(),
      sidebars: [
        DocSideBar.create(
          title: "Intro",
          navigate_content_id: "intro",
        ),
        DocSideBar.create(
          title: "Demo",
          navigate_content_id: "intro",
        ),
      ],
      contents: [
        DocContents.create(
          content_id: "intro",
          content: """

<h2 align="center">Ultra Fast, Enjoyable & Cross Platform Telegram Client</h2>

**Telegram Client** Dart **library** for make telegram base flutter **bot**, **userbot**, **App** Support Run Server Side And Client Side, This library 100% easy for make multiples **client or accounts** because this library you just call function not execute shell command so update account will show at function event emitter

## Features

- 🚀 **Work On Cross Platform**: Mobile, Desktop, Browser, Server Side
- ⚡ **Good Performance and efficient**
- ❤️ **Simple, Easey Powerfull, Can Extend To Scala Bussiness**

<medias src="${("assets/logo/telegram.png " * 5).trim()}">

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

### Quick Start

```dart
import 'package:telegram_client/telegram_client/telegram_client.dart';

void main(List<String> args) {
  TelegramClient tg = TelegramClient();
  tg.ensureInitialized();
  tg.on(
    event_name: tg.event_update,
    onUpdate: (updateTelegramClient) {
      // kode
    },
    onError: (error, stackTrace) {},
  );
  tg.tdlib.initIsolate();
}
``` 

## Important

**I really need funds so that this library can be easier to use. You can buy this library by subscribing/sponsoring me on GitHub:** [AZKADEV](https://github.com/azkadev)

"""
              .trim(),
        )
      ],
    ),
    DocsData.create(
      doc_id: "tdlib",
      title: "Telegram Database Library (TDLIB)",
      description: """
Tdlib adalah library cross platform cpp, kami menggunakan ffi agar bisa mengakses tdlib, tdlib sangat di rekomendasikan karena
sangat mudah di gunakan, namun jika untuk skala bisnis lebih besar tidak cocok karena tdlib boros memory, cpu, walaupun nanti
kode anda sudah efficient akan terjadi lag / bottleneck
"""
          .trim(),
      sidebars: [
        DocSideBar.create(
          title: "Intro",
          navigate_content_id: "intro",
        ),
        DocSideBar.create(
          title: "Demo",
          navigate_content_id: "intro",
        ),
      ],
      contents: [
        DocContents.create(
          content_id: "intro",
          content: r"""
# Tdlib Documentation

Before trying to use this library, make sure your computer has it installed [TDLIB](https://github.com/tdlib/td/)

## Quickstart

```dart
 // ignore_for_file: non_constant_identifier_names,
import 'package:general_lib/general_lib.dart';
import 'package:telegram_client/tdlib/scheme/scheme.dart';
import 'package:telegram_client/tdlib/tdlib.dart';

void main(List<String> args) async {
  print("Start Program");
  Tdlib tdlib = Tdlib(
    pathTdl: "path_to_tdlib/libtdjson.so",
    clientOption: TdlibOptionParameter.create(
      api_id: 0,
      api_hash: "",
    ),
  );

  tdlib.on(tdlib.event_update, (UpdateTd updateTd) async {
    Map update = updateTd.update;

    if (update["@type"] == "updateAuthorizationState") {
      if (update["authorization_state"] is Map) {
        Map authorization_state = update["authorization_state"];
        if (authorization_state["@type"] == "authorizationStateWaitPhoneNumber") {
          Map res = await tdlib.invoke(
            "setAuthenticationPhoneNumber",
            parameters: {
              "phone_number": "62xxx",
            },
            clientId: updateTd.client_id,
          );
          print(res);
        }

        if (authorization_state["@type"] == "authorizationStateWaitCode") {
          Map res = await tdlib.invoke(
            "checkAuthenticationCode",
            parameters: {
              "code": "xxxxx",
            },
            clientId: updateTd.client_id,
          );
          print(res);
        }

        if (authorization_state["@type"] == "authorizationStateReady") {
          Map get_me = await tdlib.invoke(
            "getMe",
            clientId: updateTd.client_id,
          );
          get_me.printPretty();
        }
      }
    }
  });

  await tdlib.createclient(
    clientId: tdlib.td_create_client_id(),
  );
  print("Client running...");
}

```

### Call Method

currently we don't plan to build everything into dart so we can call the api using json data

  Full Method List: https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1_function.html


- Example Send Message: https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1send_message.html
  
```dart
  Map send_message = await tdlib.invoke(
    "sendMessage",
    parameters: {
      "chat_id": 0,
      "options": {
        "@type": "messageSendOptions",
        "disable_notification": true,
      },
      "input_message_content": {
        "@type": "inputMessageText",
        "text": tdlib.invokeSync(
          "parseTextEntities",
          parameters: {
            "parse_mode": {
              "@type": "textParseModeHTML",
            },
            "text": "Hai ${TgUtils.parseHtmlBold("Slebew")}"
          },
        ),
        "disable_web_page_preview": false,
      }
    },
    clientId: tdlib.client_id,
  );
  send_message.printPretty();
```

### Add New client

Our library is designed to make it very easy to add clients without adding a lot of scripts so it can fit up to hundreds of accounts depending on device specs


```dart
  tdlib.on(tdlib.event_update, (UpdateTd updateTd) async {
    // If you want to call the function method, make sure we replace id with id like the print script below
    print("CLIENT Number: ${updateTd.client_id}");
  });
  // If you want to add more, please just call the method below as many times as you want
  await tdlib.initIsolateNewClient(
    clientId: tdlib.td_create_client_id(),
    clientOption: {
      // Make sure the database directory path is different from the others
      "database_directory": "path_to_folder_session_account_new/",
    },
  );
```
"""
              .trim(),
        )
      ],
    ),
    DocsData.create(
      doc_id: "telegram_bot_api",
      title: "Telegram Bot Api",
      description: """
Telegram Bot Api adalah library + api official dari telegram yang menggunakan tdlib sebagai dasar, api
ini sangat mudah di gunakan jika anda punya public ip sangat di rekomendasikan menggunakan ini karena tidak boros memory, cpu
"""
          .trim(),
      sidebars: [
        DocSideBar.create(
          title: "Intro",
          navigate_content_id: "intro",
        ),
        DocSideBar.create(
          title: "Demo",
          navigate_content_id: "intro",
        ),
      ],
      contents: [
        DocContents.create(
          content_id: "intro",
          content: """

<h2 align="center">Ultra Fast, Enjoyable & Cross Platform Telegram Client</h2>

**Telegram Client** Dart **library** for make telegram base flutter **bot**, **userbot**, **App** Support Run Server Side And Client Side, This library 100% easy for make multiples **client or accounts** because this library you just call function not execute shell command so update account will show at function event emitter

## Features

- 🚀 **Work On Cross Platform**: Mobile, Desktop, Browser, Server Side
- ⚡ **Good Performance and efficient**
- ❤️ **Simple, Easey Powerfull, Can Extend To Scala Bussiness**

<medias src="${("assets/logo/telegram.png " * 5).trim()}">

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

### Quick Start

```dart
import 'package:telegram_client/telegram_client/telegram_client.dart';

void main(List<String> args) {
  TelegramClient tg = TelegramClient();
  tg.ensureInitialized();
  tg.on(
    event_name: tg.event_update,
    onUpdate: (updateTelegramClient) {
      // kode
    },
    onError: (error, stackTrace) {},
  );
  tg.tdlib.initIsolate();
}
``` 

## Important

**I really need funds so that this library can be easier to use. You can buy this library by subscribing/sponsoring me on GitHub:** [AZKADEV](https://github.com/azkadev)

"""
              .trim(),
        )
      ],
    ),
    DocsData.create(
      doc_id: "telegram_client",
      title: "Telegram Client",
      description: """
Telegram Client merupakan library resmi yang saya buat, metode ini saya gunakan di semua project saya,
metode ini sangat flexible dan customizable sehingga anda bisa mengintegrasikan (tdlib / mtproto / telegram bot api),
metode ini tidak hanya untuk membuat bot melainkan userbot, saya menggunakan style code telegram bot api hal ini 
di karenakan agar mudah di gunakan
"""
          .trim(),
      sidebars: [
        DocSideBar.create(
          title: "Intro",
          navigate_content_id: "intro",
        ),
        DocSideBar.create(
          title: "Demo",
          navigate_content_id: "intro",
        ),
      ],
      contents: [
        DocContents.create(
          content_id: "intro",
          content: """

<h2 align="center">Ultra Fast, Enjoyable & Cross Platform Telegram Client</h2>

**Telegram Client** Dart **library** for make telegram base flutter **bot**, **userbot**, **App** Support Run Server Side And Client Side, This library 100% easy for make multiples **client or accounts** because this library you just call function not execute shell command so update account will show at function event emitter

## Features

- 🚀 **Work On Cross Platform**: Mobile, Desktop, Browser, Server Side
- ⚡ **Good Performance and efficient**
- ❤️ **Simple, Easey Powerfull, Can Extend To Scala Bussiness**

<medias src="${("assets/logo/telegram.png " * 5).trim()}">

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

### Quick Start

```dart
import 'package:telegram_client/telegram_client/telegram_client.dart';

void main(List<String> args) {
  TelegramClient tg = TelegramClient();
  tg.ensureInitialized();
  tg.on(
    event_name: tg.event_update,
    onUpdate: (updateTelegramClient) {
      // kode
    },
    onError: (error, stackTrace) {},
  );
  tg.tdlib.initIsolate();
}
``` 

## Important

**I really need funds so that this library can be easier to use. You can buy this library by subscribing/sponsoring me on GitHub:** [AZKADEV](https://github.com/azkadev)
"""
              .trim(),
        ),
      ],
    ),
  
  
    DocsData.create(
      doc_id: "utils",
      title: "Utils",
      description: """
Utils merupakan bagian untuk mempermudahkan anda mendevelop project
"""
          .trim(),
      sidebars: [
        DocSideBar.create(
          title: "Intro",
          navigate_content_id: "intro",
        ),
        DocSideBar.create(
          title: "Demo",
          navigate_content_id: "intro",
        ),
      ],
      contents: [
        DocContents.create(
          content_id: "intro",
          content: """

<h2 align="center">Ultra Fast, Enjoyable & Cross Platform Telegram Client</h2>

**Telegram Client** Dart **library** for make telegram base flutter **bot**, **userbot**, **App** Support Run Server Side And Client Side, This library 100% easy for make multiples **client or accounts** because this library you just call function not execute shell command so update account will show at function event emitter

## Features

- 🚀 **Work On Cross Platform**: Mobile, Desktop, Browser, Server Side
- ⚡ **Good Performance and efficient**
- ❤️ **Simple, Easey Powerfull, Can Extend To Scala Bussiness**

<medias src="${("assets/logo/telegram.png " * 5).trim()}">

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

### Quick Start

```dart
import 'package:telegram_client/telegram_client/telegram_client.dart';

void main(List<String> args) {
  TelegramClient tg = TelegramClient();
  tg.ensureInitialized();
  tg.on(
    event_name: tg.event_update,
    onUpdate: (updateTelegramClient) {
      // kode
    },
    onError: (error, stackTrace) {},
  );
  tg.tdlib.initIsolate();
}
``` 

## Important

**I really need funds so that this library can be easier to use. You can buy this library by subscribing/sponsoring me on GitHub:** [AZKADEV](https://github.com/azkadev)
"""
              .trim(),
        ),
      ],
    ),
  
  
  
  ],
);
