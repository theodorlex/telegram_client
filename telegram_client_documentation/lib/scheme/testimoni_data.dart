// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "message_data.dart";

 
class TestimoniData extends JsonScheme {

  
  TestimoniData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"testimoniData","id":0,"first_name":"","last_name":"","username":"","star_count":5,"caption":"","profile_picture":"","proof_chats":[{"@type":"messageData","is_outgoing":false,"id":0,"first_name":"","last_name":"","type":"","is_bot":false,"caption":""}]};
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

  
  List<MessageData> get proof_chats {
    try {
      if (rawData["proof_chats"] is List == false){
        return [];
      }
      return (rawData["proof_chats"] as List).map((e) => MessageData(e as Map)).toList().cast<MessageData>();
    } catch (e) {
      return [];
    }
  }


  
  set proof_chats(List<MessageData> values) {
    rawData["proof_chats"] = values.map((value) => value.toJson()).toList();
  }



  
  static TestimoniData create({

    String special_type = "testimoniData",
    num? id,
    String? first_name,
    String? last_name,
    String? username,
    num? star_count,
    String? caption,
    String? profile_picture,
      List<MessageData>? proof_chats,
})  {
    // TestimoniData testimoniData = TestimoniData({
Map testimoniData_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "first_name": first_name,
      "last_name": last_name,
      "username": username,
      "star_count": star_count,
      "caption": caption,
      "profile_picture": profile_picture,
      "proof_chats": (proof_chats != null)? proof_chats.toJson(): null,


};


          testimoniData_data_create_json.removeWhere((key, value) => value == null);
TestimoniData testimoniData_data_create = TestimoniData(testimoniData_data_create_json);

return testimoniData_data_create;



      }
}