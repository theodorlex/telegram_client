import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:telegram_client_documentation/telegram_client_documentation.dart';
import 'package:telegram_client_documentation/widget/markdown/markdown.dart';

class MtprotoPageTelegramClientDocumentation extends StatefulWidget {
  const MtprotoPageTelegramClientDocumentation({super.key});

  @override
  State<MtprotoPageTelegramClientDocumentation> createState() => _MtprotoPageTelegramClientDocumentationState();
}

class _MtprotoPageTelegramClientDocumentationState extends State<MtprotoPageTelegramClientDocumentation> {
  GlobalKey globalKey = GlobalKey();
  ScrollController scrollController = ScrollController();
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
                  IconButton(
                    onPressed: () {
                      context.navigator().pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    "Mtproto",
                    style: TextStyle(
                      color: context.theme.indicatorColor,
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
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.height,
          minWidth: context.width,
          maxHeight: context.height,
          maxWidth: context.width,
        ),
        child: Column(
          children: [
            SizedBox.fromSize(
              size: globalKey.sizeRenderBox(),
            ),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () async {},
                            child: Text(
                              "Intro",
                              style: TextStyle(color: context.theme.indicatorColor, fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: context.theme.cardColor,
                    ),
                    Expanded(
                      flex: 5,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: context.height,
                            minWidth: context.width,
                          ),
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              MarkdownWidget(
                                alignment: Alignment.center,
                                text: () async {
                                  return "sas";
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              
            ),
          ],
        ),
      ),
    );
  }
}
