// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "link_data.dart";
import "job_position.dart";

 
class OpenJobData extends JsonScheme {

  
  OpenJobData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"openJobData","id":0,"first_name":"","last_name":"","username":"","profile_picture":"","bio":"","open_position":"","social_medias":[{"@type":"linkData","icon":"","title":"","value":""}],"job_id":"","positions":[{"@type":"jobPosition","job_id":"","title":"as","qualifications_detail":["sa"],"qualifications_short":["sa"],"task":["s"]}]};
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


  
  String? get bio {
    try {
      if (rawData["bio"] is String == false){
        return null;
      }
      return rawData["bio"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set bio(String? value) {
    rawData["bio"] = value;
  }


  
  String? get open_position {
    try {
      if (rawData["open_position"] is String == false){
        return null;
      }
      return rawData["open_position"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set open_position(String? value) {
    rawData["open_position"] = value;
  }

  
  List<LinkData> get social_medias {
    try {
      if (rawData["social_medias"] is List == false){
        return [];
      }
      return (rawData["social_medias"] as List).map((e) => LinkData(e as Map)).toList().cast<LinkData>();
    } catch (e) {
      return [];
    }
  }


  
  set social_medias(List<LinkData> values) {
    rawData["social_medias"] = values.map((value) => value.toJson()).toList();
  }



  
  String? get job_id {
    try {
      if (rawData["job_id"] is String == false){
        return null;
      }
      return rawData["job_id"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set job_id(String? value) {
    rawData["job_id"] = value;
  }

  
  List<JobPosition> get positions {
    try {
      if (rawData["positions"] is List == false){
        return [];
      }
      return (rawData["positions"] as List).map((e) => JobPosition(e as Map)).toList().cast<JobPosition>();
    } catch (e) {
      return [];
    }
  }


  
  set positions(List<JobPosition> values) {
    rawData["positions"] = values.map((value) => value.toJson()).toList();
  }



  
  static OpenJobData create({

    String special_type = "openJobData",
    num? id,
    String? first_name,
    String? last_name,
    String? username,
    String? profile_picture,
    String? bio,
    String? open_position,
      List<LinkData>? social_medias,
    String? job_id,
      List<JobPosition>? positions,
})  {
    // OpenJobData openJobData = OpenJobData({
Map openJobData_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "first_name": first_name,
      "last_name": last_name,
      "username": username,
      "profile_picture": profile_picture,
      "bio": bio,
      "open_position": open_position,
      "social_medias": (social_medias != null)? social_medias.toJson(): null,
      "job_id": job_id,
      "positions": (positions != null)? positions.toJson(): null,


};


          openJobData_data_create_json.removeWhere((key, value) => value == null);
OpenJobData openJobData_data_create = OpenJobData(openJobData_data_create_json);

return openJobData_data_create;



      }
}