import 'package:flutter/material.dart';
import 'package:general_lib_flutter/widget/widget.dart';
import 'package:telegram_client_documentation/telegram_client_documentation_core.dart';

void telegram_client_documentation_main_app(List<String> arguments) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TelegramClientDocumentationMainApp());
}

class TelegramClientDocumentationMainApp extends StatelessWidget {
  static GeneralLibFlutterApp generalLibFlutterApp = GeneralLibFlutterApp();
  const TelegramClientDocumentationMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralLibFlutterAppMain(
      generalLibFlutterApp: generalLibFlutterApp,
      builder: (themeMode, lightTheme, darkTheme, widget) {
        Widget child = MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          home: const TelegramClientDocumentationApp(),
        );

        return child;
      },
    );
  }
}
