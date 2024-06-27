// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "user_data.dart";
import "chat_data.dart";
import "content_message_data.dart";
import "reply_markup_data.dart";

 
class ChatMessageData extends JsonScheme {

  
  ChatMessageData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"chatMessageData","id":0,"is_outgoing":false,"show_status":true,"from":{"@type":"userData","id":0,"title":"","first_name":"","last_name":"","username":"","profile_picture":"","type":"","status":""},"chat":{"@type":"chatData","id":0,"title":"","first_name":"","last_name":"","username":"","type":"","profile_picture":"","status":""},"date":0,"status":"","content":{"@type":"contentMessageData","is_loading":false,"type":"text","document":{"@type":"document","name":"","size":0,"file_id":""},"photo":{"@type":"photo","name":"","size":0,"file_id":""},"video":"","url":"","caption":"","text":""},"reply_markup":{"@type":"replyMarkupData","type":"inline_keyboard","inline_keyboard":[[{"@type":"inlineKeyboardData","type":"url","text":"","url":"","callback_data":""}]],"keyboard":[[{"@type":"keyboardData","type":"","text":""}]]}};
  }

  
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set special_type(String? value) {
    rawData["@type"] = value;
  }


  
  num? get id {
    try {
      if (rawData["id"] is num == false){
        return null;
      }
      return rawData["id"] as num;
    } catch (e) {
      return null;
    }
  }

  
  set id(num? value) {
    rawData["id"] = value;
  }


  
  bool? get is_outgoing {
    try {
      if (rawData["is_outgoing"] is bool == false){
        return null;
      }
      return rawData["is_outgoing"] as bool;
    } catch (e) {
      return null;
    }
  }

  
  set is_outgoing(bool? value) {
    rawData["is_outgoing"] = value;
  }


  
  bool? get show_status {
    try {
      if (rawData["show_status"] is bool == false){
        return null;
      }
      return rawData["show_status"] as bool;
    } catch (e) {
      return null;
    }
  }

  
  set show_status(bool? value) {
    rawData["show_status"] = value;
  }


  
  UserData get from {
    try {
      if (rawData["from"] is Map == false){
        return UserData({}); 
      }
      return UserData(rawData["from"] as Map);
    } catch (e) {  
      return UserData({}); 
    }
  }


  
  set from(UserData value) {
    rawData["from"] = value.toJson();
  }



  
  ChatData get chat {
    try {
      if (rawData["chat"] is Map == false){
        return ChatData({}); 
      }
      return ChatData(rawData["chat"] as Map);
    } catch (e) {  
      return ChatData({}); 
    }
  }


  
  set chat(ChatData value) {
    rawData["chat"] = value.toJson();
  }



  
  num? get date {
    try {
      if (rawData["date"] is num == false){
        return null;
      }
      return rawData["date"] as num;
    } catch (e) {
      return null;
    }
  }

  
  set date(num? value) {
    rawData["date"] = value;
  }


  
  String? get status {
    try {
      if (rawData["status"] is String == false){
        return null;
      }
      return rawData["status"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set status(String? value) {
    rawData["status"] = value;
  }


  
  ContentMessageData get content {
    try {
      if (rawData["content"] is Map == false){
        return ContentMessageData({}); 
      }
      return ContentMessageData(rawData["content"] as Map);
    } catch (e) {  
      return ContentMessageData({}); 
    }
  }


  
  set content(ContentMessageData value) {
    rawData["content"] = value.toJson();
  }



  
  ReplyMarkupData get reply_markup {
    try {
      if (rawData["reply_markup"] is Map == false){
        return ReplyMarkupData({}); 
      }
      return ReplyMarkupData(rawData["reply_markup"] as Map);
    } catch (e) {  
      return ReplyMarkupData({}); 
    }
  }


  
  set reply_markup(ReplyMarkupData value) {
    rawData["reply_markup"] = value.toJson();
  }



  
  static ChatMessageData create({

    String special_type = "chatMessageData",
    num? id,
    bool? is_outgoing,
    bool? show_status,
      UserData? from,
      ChatData? chat,
    num? date,
    String? status,
      ContentMessageData? content,
      ReplyMarkupData? reply_markup,
})  {
    // ChatMessageData chatMessageData = ChatMessageData({
Map chatMessageData_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "is_outgoing": is_outgoing,
      "show_status": show_status,
      "from": (from != null)?from.toJson(): null,
      "chat": (chat != null)?chat.toJson(): null,
      "date": date,
      "status": status,
      "content": (content != null)?content.toJson(): null,
      "reply_markup": (reply_markup != null)?reply_markup.toJson(): null,


};


          chatMessageData_data_create_json.removeWhere((key, value) => value == null);
ChatMessageData chatMessageData_data_create = ChatMessageData(chatMessageData_data_create_json);

return chatMessageData_data_create;



      }
}