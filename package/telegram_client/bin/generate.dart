// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:general_lib/general_lib.dart';
import 'package:path/path.dart';
import 'package:universal_io/io.dart';

// import ;
void main(List<String> args) async {
  String data = """
updateActiveNotifications, updateAnimatedEmojiMessageClicked, updateAnimationSearchParameters, updateAuthorizationState, updateBasicGroup, updateBasicGroupFullInfo, updateCall, updateChatAction, updateChatActionBar, updateChatDefaultDisableNotification, updateChatDraftMessage, updateChatFilters, updateChatHasProtectedContent, updateChatHasScheduledMessages, updateChatIsBlocked, updateChatIsMarkedAsUnread, updateChatLastMessage, updateChatMember, updateChatMessageSender, updateChatMessageTtl, updateChatNotificationSettings, updateChatOnlineMemberCount, updateChatPendingJoinRequests, updateChatPermissions, updateChatPhoto, updateChatPosition, updateChatReadInbox, updateChatReadOutbox, updateChatReplyMarkup, updateChatTheme, updateChatThemes, updateChatTitle, updateChatUnreadMentionCount, updateChatVideoChat, updateConnectionState, updateDeleteMessages, updateDiceEmojis, updateFavoriteStickers, updateFile, updateFileGenerationStart, updateFileGenerationStop, updateGroupCall, updateGroupCallParticipant, updateHavePendingNotifications, updateInstalledStickerSets, updateLanguagePackStrings, updateMessageContent, updateMessageContentOpened, updateMessageEdited, updateMessageInteractionInfo, updateMessageIsPinned, updateMessageLiveLocationViewed, updateMessageMentionRead, updateMessageSendAcknowledged, updateMessageSendFailed, updateMessageSendSucceeded, updateNewCallbackQuery, updateNewCallSignalingData, updateNewChat, updateNewChatJoinRequest, updateNewChosenInlineResult, updateNewCustomEvent, updateNewCustomQuery, updateNewInlineCallbackQuery, updateNewInlineQuery, updateNewMessage, updateNewPreCheckoutQuery, updateNewShippingQuery, updateNotification, updateNotificationGroup, updateOption, updatePoll, updatePollAnswer, updateRecentStickers, updateSavedAnimations, updateScopeNotificationSettings, updateSecretChat, updateSelectedBackground, updateServiceNotification, updateStickerSet, updateSuggestedActions, updateSupergroup, updateSupergroupFullInfo, updateTermsOfService, updateTrendingStickerSets, updateUnreadChatCount, updateUnreadMessageCount, updateUser, updateUserFullInfo, updateUserPrivacySettingRules, updateUsersNearby, updateUserStatus
"""
      .trim();

  List<String> datas = data.split(",");
  List<String> methods = [];
  for (var i = 0; i < datas.length; i++) {
    String dataLoop = (datas[i]).trim();

    String newData = "";

    for (var index = 0; index < dataLoop.length; index++) {
      if (RegExp("([a-z]+)").hashData(dataLoop[index])) {
        newData += dataLoop[index];
      } else {
        newData += "_${dataLoop[index]}".toLowerCase();
      }
    }
    methods.add(newData);
  }

  // print(json.encode(methods));

  for (var i = 0; i < methods.length; i++) {
    String method = methods[i];
    File file = File(join(Directory.current.path, "lib", "telegram_client",
        "update", "$method.dart"));
    if (file.existsSync()) {
      continue;
    }
    await file.create(recursive: true);
  }

  methods.map((e) => "export \"${e}.dart\";").join("\n").printPretty(2);

  exit(0);
}
