// ignore_for_file: non_constant_identifier_names

// import 'package:galaxeus_lib/galaxeus_lib.dart';
import 'package:general_lib/general_lib.dart';
import 'package:path/path.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) async {
  print("Screenshot");
  List<String> methods = [
    "getMe",
    "getMyCommands",
    "setMyCommands",
    "deleteMyCommands",
    "getMyDefaultAdministratorRights",
    "setMyDefaultAdministratorRights",
    "getMyName",
    "setMyName",
    "getMyDescription",
    "setMyDescription",
    "getMyshortDescription",
    "setMyshortDescription",
    "getChatMenuButton",
    "setChatMenuButton",
    "getUserProfilePhotos",
    "sendMessage",
    "sendAnimation",
    "sendAudio",
    "sendDice",
    "sendDocument",
    "sendPhoto",
    "sendSticker",
    "sendVideo",
    "sendVideoNote",
    "sendVoice",
    "sendGame",
    "sendInvoice",
    "sendLocation",
    "sendVenue",
    "sendContact",
    "sendPoll",
    "stopPoll",
    "copyMessage",
    "forwardMessage",
    "sendMediaGroup",
    "sendChatAction",
    "editMessageText",
    "editMessageLiveLocation",
    "stopMessageLiveLocation",
    "editMessageMedia",
    "editMessageCaption",
    "editMessageReplyMarkup",
    "deleteMessage",
    "createInvoiceLink",
    "setGameScore",
    "getGameHighScores",
    "answerWebAppQuery",
    "answerInlineQuery",
    "answerCallbackQuery",
    "answerShippingQuery",
    "answerPreCheckoutQuery",
    "exportChatInviteLink",
    "createChatInviteLink",
    "editChatInviteLink",
    "revokeChatInviteLink",
    "getChat",
    "setChatPhoto",
    "deleteChatPhoto",
    "setChatTitle",
    "setChatPermissions",
    "setChatDescription",
    "pinChatMessage",
    "unPinChatMessage",
    "unPinAllChatMessages",
    "setChatStickerSet",
    "deleteChatStickerSet",
    "getForumTopicIconStickers",
    "createForumTopic",
    "editForumTopic",
    "closeForumTopic",
    "reOpenForumTopic",
    "deleteForumTopic",
    "unPinAllForumTopicMessages",
    "editGeneralForumTopic",
    "closeGeneralForumTopic",
    "reOpenGeneralForumTopic",
    "hideGeneralTorumTopic",
    "unHideGeneralForumTopic",
    "unPinAllGeneralForumTopicMessages",
    "getChatMember",
    "getChatAdministrators",
    "getChatMemberCount",
    "getChatMembersCount",
    "leaveChat",
    "promoteChatMember",
    "setChatAdministratorCustomTitle",
    "banChatMember",
    "kickChatMember",
    "restrictChatMember",
    "unbanChatMember",
    "banChatSenderChat",
    "unbanChatSenderChat",
    "approveChatJoinRequest",
    "declineChatJoinRequest",
    "getStickerSet",
    "getCustomEmojiStickers",
    "uploadStickerFile",
    "createNewStickerSet",
    "addStickerToSet",
    "setStickerSetTitle",
    "setStickerSetThumb",
    "setStickerSetThumbnail",
    "setCustomEmojiStickerSetThumbnail",
    "deleteStickerSet",
    "setStickerPositionInset",
    "deleteStickerFromSet",
    "setStickerEmojiList",
    "setStickerKeywords",
    "setStickerMaskPosition",
    "setPassportDataErrors",
    "sendCustomRequest",
    "answerCustomQuery",
    "getUpdates",
    "setWebhook",
    "deleteWebhook",
    "getWebhookInfo",
    "getFile",
    "sendChatScreenshotTakenNotification",
  ];

  Directory directory = Directory(
      join(Directory.current.path, "lib", "telegram_client", "extension"));
  if (!directory.existsSync()) {
    await directory.create(recursive: true);
  }
  for (var i = 0; i < methods.length; i++) {
    String method_origin = methods[i];
    String function_data = """
// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:async';

import 'package:telegram_client/telegram_client/telegram_client.dart';

import 'package:general_lib/extension/extension.dart';

import 'package:telegram_client/util/util.dart';

/// method ${method_origin.toUpperCaseFirstData()}
extension ${method_origin.toUpperCaseFirstData()}DataOn on TelegramClient {

  /// method ${method_origin.toUpperCaseFirstData()}
  FutureOr<Map> ${method_origin.toLowerCaseFirstData()}({
    required Map parameters,
        required TelegramClientCallApiInvoke callApiInvoke,
    required TelegramClientData telegramClientData,
  }) async {

    Map newScheme = {
      "@type": "template",
    };
    return newScheme;
  }
}
""";
    String name_file = "";
    for (var index = 0; index < method_origin.length; index++) {
      if (RegExp(r"[A-Z]+", caseSensitive: true)
          .hasMatch(method_origin[index])) {
        name_file += "_${method_origin[index]}";
      } else {
        name_file += method_origin[index];
      }
    }
    if (RegExp("_", caseSensitive: false).hasMatch(name_file) == false) {
      continue;
    }
    name_file = name_file.toLowerCase();
    if (["get_chat", "get_user"].contains(name_file)) {
      continue;
    }
    File file = File(join(
      directory.path,
      "${name_file.toLowerCase()}.dart",
    ));
    if (file.existsSync()) {
      continue;
    }

    await file.writeAsString(function_data);
  }
  exit(0);
}
