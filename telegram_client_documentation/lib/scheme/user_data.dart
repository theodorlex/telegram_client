// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class UserData extends JsonScheme {

  
  UserData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"userData","id":0,"title":"","first_name":"","last_name":"","username":"","profile_picture":"","type":"","status":""};
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


  
  static UserData create({

    String special_type = "userData",
    num? id,
    String? title,
    String? first_name,
    String? last_name,
    String? username,
    String? profile_picture,
    String? type,
    String? status,
})  {
    // UserData userData = UserData({
Map userData_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "title": title,
      "first_name": first_name,
      "last_name": last_name,
      "username": username,
      "profile_picture": profile_picture,
      "type": type,
      "status": status,


};


          userData_data_create_json.removeWhere((key, value) => value == null);
UserData userData_data_create = UserData(userData_data_create_json);

return userData_data_create;



      }
}