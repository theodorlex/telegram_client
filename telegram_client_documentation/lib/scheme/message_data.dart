// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class MessageData extends JsonScheme {

  
  MessageData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"messageData","is_outgoing":false,"id":0,"first_name":"","last_name":"","type":"","is_bot":false,"caption":""};
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


  
  bool? get is_bot {
    try {
      if (rawData["is_bot"] is bool == false){
        return null;
      }
      return rawData["is_bot"] as bool;
    } catch (e) {
      return null;
    }
  }

  
  set is_bot(bool? value) {
    rawData["is_bot"] = value;
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


  
  static MessageData create({

    String special_type = "messageData",
    bool? is_outgoing,
    num? id,
    String? first_name,
    String? last_name,
    String? type,
    bool? is_bot,
    String? caption,
})  {
    // MessageData messageData = MessageData({
Map messageData_data_create_json = {
  
      "@type": special_type,
      "is_outgoing": is_outgoing,
      "id": id,
      "first_name": first_name,
      "last_name": last_name,
      "type": type,
      "is_bot": is_bot,
      "caption": caption,


};


          messageData_data_create_json.removeWhere((key, value) => value == null);
MessageData messageData_data_create = MessageData(messageData_data_create_json);

return messageData_data_create;



      }
}