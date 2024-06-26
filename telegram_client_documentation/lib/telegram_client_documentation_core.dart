import 'package:flutter/material.dart';
import 'package:general_lib_flutter/extension/build_context.dart';
import 'package:telegram_client_documentation/page/landing/landing.dart';

class TelegramClientDocumentationApp extends StatefulWidget {
  const TelegramClientDocumentationApp({super.key});

  @override
  State<TelegramClientDocumentationApp> createState() => _TelegramClientDocumentationAppState();
}

class _TelegramClientDocumentationAppState extends State<TelegramClientDocumentationApp> {
  @override
  void initState() { 
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      navigate();
    });
  }

  void navigate() async {
    setState(() {});

    Future(() async {
      await Future.delayed(Durations.extralong4);
      context.navigator().push(MaterialPageRoute(
        builder: (context) {
          return const LandingPageTelegramClientDocumentation();
        },
      ));
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
