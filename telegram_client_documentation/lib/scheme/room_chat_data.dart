// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "chat_message_data.dart";

 
class RoomChatData extends JsonScheme {

  
  RoomChatData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"roomChatData","id":0,"title":"","first_name":"","last_name":"","username":"","star_count":5,"type":"","status":"","members_count":0,"caption":"","profile_picture":"","messages":[{"@type":"chatMessageData","id":0,"is_outgoing":false,"show_status":true,"from":{"@type":"userData","id":0,"title":"","first_name":"","last_name":"","username":"","profile_picture":"","type":"","status":""},"chat":{"@type":"chatData","id":0,"title":"","first_name":"","last_name":"","username":"","type":"","profile_picture":"","status":""},"date":0,"status":"","content":{"@type":"contentMessageData","is_loading":false,"type":"text","document":{"name":"","size":0,"file_id":""},"photo":{"name":"","size":0,"file_id":""},"video":"","url":"","caption":"","text":""},"reply_markup":{"@type":"replyMarkupData","type":"inline_keyboard","inline_keyboard":[[{"@type":"inlineKeyboardData","type":"url","text":"","url":"","callback_data":""}]],"keyboard":[[{"@type":"keyboardData","type":"","text":""}]]}}]};
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


  
  String? get title {
    try {
      if (rawData["title"] is String == false){
        return null;
      }
      return rawData["title"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set title(String? value) {
    rawData["title"] = value;
  }


  
  String? get first_name {
    try {
      if (rawData["first_name"] is String == false){
        return null;
      }
      return rawData["first_name"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set first_name(String? value) {
    rawData["first_name"] = value;
  }


  
  String? get last_name {
    try {
      if (rawData["last_name"] is String == false){
        return null;
      }
      return rawData["last_name"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set last_name(String? value) {
    rawData["last_name"] = value;
  }


  
  String? get username {
    try {
      if (rawData["username"] is String == false){
        return null;
      }
      return rawData["username"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set username(String? value) {
    rawData["username"] = value;
  }


  
  num? get star_count {
    try {
      if (rawData["star_count"] is num == false){
        return null;
      }
      return rawData["star_count"] as num;
    } catch (e) {
      return null;
    }
  }

  
  set star_count(num? value) {
    rawData["star_count"] = value;
  }


  
  String? get type {
    try {
      if (rawData["type"] is String == false){
        return null;
      }
      return rawData["type"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set type(String? value) {
    rawData["type"] = value;
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


  
  num? get members_count {
    try {
      if (rawData["members_count"] is num == false){
        return null;
      }
      return rawData["members_count"] as num;
    } catch (e) {
      return null;
    }
  }

  
  set members_count(num? value) {
    rawData["members_count"] = value;
  }


  
  String? get caption {
    try {
      if (rawData["caption"] is String == false){
        return null;
      }
      return rawData["caption"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set caption(String? value) {
    rawData["caption"] = value;
  }


  
  String? get profile_picture {
    try {
      if (rawData["profile_picture"] is String == false){
        return null;
      }
      return rawData["profile_picture"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set profile_picture(String? value) {
    rawData["profile_picture"] = value;
  }

  
  List<ChatMessageData> get messages {
    try {
      if (rawData["messages"] is List == false){
        return [];
      }
      return (rawData["messages"] as List).map((e) => ChatMessageData(e as Map)).toList().cast<ChatMessageData>();
    } catch (e) {
      return [];
    }
  }


  
  set messages(List<ChatMessageData> values) {
    rawData["messages"] = values.map((value) => value.toJson()).toList();
  }



  
  static RoomChatData create({

    String special_type = "roomChatData",
    num? id,
    String? title,
    String? first_name,
    String? last_name,
    String? username,
    num? star_count,
    String? type,
    String? status,
    num? members_count,
    String? caption,
    String? profile_picture,
      List<ChatMessageData>? messages,
})  {
    // RoomChatData roomChatData = RoomChatData({
Map roomChatData_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "title": title,
      "first_name": first_name,
      "last_name": last_name,
      "username": username,
      "star_count": star_count,
      "type": type,
      "status": status,
      "members_count": members_count,
      "caption": caption,
      "profile_picture": profile_picture,
      "messages": (messages != null)? messages.toJson(): null,


};


          roomChatData_data_create_json.removeWhere((key, value) => value == null);
RoomChatData roomChatData_data_create = RoomChatData(roomChatData_data_create_json);

return roomChatData_data_create;



      }
}