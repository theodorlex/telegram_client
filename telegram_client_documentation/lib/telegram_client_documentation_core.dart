import 'package:flutter/material.dart';

class TelegramClientDocumentationApp extends StatefulWidget {
  const TelegramClientDocumentationApp({super.key});

  @override
  State<TelegramClientDocumentationApp> createState() => _TelegramClientDocumentationAppState();
}

class _TelegramClientDocumentationAppState extends State<TelegramClientDocumentationApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
