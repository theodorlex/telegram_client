// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:telegram_client_documentation/data/mtproto.dart';
import 'package:telegram_client_documentation/scheme/scheme.dart';
import 'package:telegram_client_documentation/telegram_client_documentation.dart';
import 'package:telegram_client_documentation/widget/markdown/markdown.dart';

class DocumentationPageTelegramClientDocumentation extends StatefulWidget {
  final DocData docData;
  const DocumentationPageTelegramClientDocumentation({
    super.key,
    required this.docData,
  });

  @override
  State<DocumentationPageTelegramClientDocumentation> createState() => _DocumentationPageTelegramClientDocumentationState();
}

class _DocumentationPageTelegramClientDocumentationState extends State<DocumentationPageTelegramClientDocumentation> {
  GlobalKey globalKey = GlobalKey();
  ScrollController scrollController = ScrollController();

  DocsData docsData = DocsData({});
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      refresh();
    });
  }

  Future<void> refresh() async {
    setState(() {});

    await Future(() async {
      docsData = docs_datas.firstWhere((element) => element.doc_id == widget.docData.doc_id);
      setState(() {});
      setContent(contentId: docsData.sidebars.first.navigate_content_id ?? "");
    });

    setState(() {});
  }

  void setContent({
    required String contentId,
  }) {
    navigate_content_id = contentId;
    setState(() {});
    content = docsData.contents.firstWhere((element) => element.content_id == navigate_content_id).content ?? "";
    setState(() {});
  }

  String navigate_content_id = "";

  String content = "";

  @override
  void dispose() {
    navigate_content_id = "";
    content = "";
    // TODO: implement dispose
    super.dispose();
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
                    "${docsData.title}".trim(),
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
                    child: bodySideBar(),
                  ),
                  VerticalDivider(
                    color: context.theme.cardColor,
                  ),
                  Expanded(
                    flex: 5,
                    child: bodyContent(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodySideBar() {
    List<Widget> children = [];

    for (var element in docsData.sidebars) {
      children.add(
        TextButton(
          onPressed: () async {
            setContent(contentId: element.navigate_content_id ?? "");
          },
          child: Text(
            "${element.title}",
            style: TextStyle(color: context.theme.indicatorColor, fontSize: 25),
          ),
        ),
      );
    }
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.height - globalKey.sizeRenderBox().height,
          minWidth: context.width,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }

  Widget bodyContent() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.height - globalKey.sizeRenderBox().height,
          minWidth: context.width,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: MarkdownWidget(
            alignment: Alignment.center,
            text: () async {
              return content.trim();
            },
          ),
        ),
      ),
    );
  }
}
