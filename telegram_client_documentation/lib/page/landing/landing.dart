import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:general_lib_flutter/extension/build_context.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:telegram_client_documentation/telegram_client_documentation.dart';
import 'package:telegram_client_documentation/widget/markdown/markdown.dart';

class LandingPageTelegramClientDocumentation extends StatefulWidget {
  const LandingPageTelegramClientDocumentation({super.key});

  @override
  State<LandingPageTelegramClientDocumentation> createState() => _LandingPageTelegramClientDocumentationState();
}

class _LandingPageTelegramClientDocumentationState extends State<LandingPageTelegramClientDocumentation> {
  GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      refresh();
    });
  }

  Future<void> refresh() async {
    setState(() {});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          context.width,
          450,
        ),
        child: Container(
          key: globalKey,
          decoration: BoxDecoration(
            // borderRadius: const BorderRadius.only(
            //   bottomLeft: Radius.circular(40),
            //   bottomRight: Radius.circular(40),
            // ),
            color: context.theme.dialogBackgroundColor.withOpacity(0.85),
            boxShadow: [
              BoxShadow(
                color: context.theme.shadowColor.withAlpha(110),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.mediaQueryData.padding.top,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      context.navigator().pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return const LandingPageTelegramClientDocumentation();
                        },
                      ));
                    },
                    child: Text(
                      "Telegram Client Documentation",
                      style: TextStyle(
                        color: context.theme.indicatorColor,
                      ),
                    ),
                  ),
                  // auto change theme
                  Builder(
                    builder: (context) {
                      // theme mode
                      return IconButton(
                        onPressed: () {
                          TelegramClientDocumentationMainApp.generalLibFlutterApp.autoChangeTheme(
                            onChangeBrightness: () {
                              return context.mediaQueryData.platformBrightness;
                            },
                          );
                          setState(() {});
                        },
                        icon: Icon(
                          () {
                            if (TelegramClientDocumentationMainApp.generalLibFlutterApp.themeMode == ThemeMode.dark) {
                              return Icons.dark_mode;
                            }
                            if (TelegramClientDocumentationMainApp.generalLibFlutterApp.themeMode == ThemeMode.light) {
                              return Icons.light_mode;
                            }

                            return Icons.auto_mode;
                          }(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: context.height, minWidth: context.width),
          child: Column(
            children: [
              SizedBox.fromSize(
                size: globalKey.sizeRenderBox(),
              ),
              //
              //

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo/telegram.png",
                    ),
                    Text(
                      "Telegram Client Documentation",
                      style: TextStyle(
                        color: context.theme.indicatorColor,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      """
Telegram Client adalah library yang memanfaatkan api telegram untuk di implementasikan ke berbagai platform, library ini user friendly
sehingga mudah di gunakan untuk membuat project seperti applikasi, bot, userbot, web dalam skala bisnis besar
"""
                          .trim(),
                      style: TextStyle(
                        color: context.theme.indicatorColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: MarkdownWidget(
                  alignment: Alignment.center,
                  text: () async {
                    return """
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

### Docs
 
1. [Github Docs](https://github.com/azkadev/telegram_client/tree/main/docs)
2. [Support Group](https://t.me/DEVELOPER_GLOBAL_PUBLIC)
3. [Youtube](https://youtube.com/@azkadev)


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
                        .trim();
                  },
                ),
              ),
              
              // 
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Example Project Use This Library",
                      style: TextStyle(
                        color: context.theme.indicatorColor,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      """
Berikut adalah beberapa contoh project yang menggunakan library telegram_client
"""
                          .trim(),
                      style: TextStyle(
                        color: context.theme.indicatorColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // 
              // 
              
            ],
          ),
        ),
      ),
    );
  }
}
