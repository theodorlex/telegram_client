// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class JobPosition extends JsonScheme {

  
  JobPosition(super.rawData);
   
  static Map get defaultData {
    return {"@type":"jobPosition","job_id":"","title":"as","qualifications_detail":["sa"],"qualifications_short":["sa"],"task":["s"]};
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


  
  List<String> get qualifications_detail {
    try {
      if (rawData["qualifications_detail"] is List == false){
        return [];
      }
      return (rawData["qualifications_detail"] as List).cast<String>();
    } catch (e) {
      return [];
    }
  }


  
  set qualifications_detail(List<String> value) {
    rawData["qualifications_detail"] = value;
  }


  
  List<String> get qualifications_short {
    try {
      if (rawData["qualifications_short"] is List == false){
        return [];
      }
      return (rawData["qualifications_short"] as List).cast<String>();
    } catch (e) {
      return [];
    }
  }


  
  set qualifications_short(List<String> value) {
    rawData["qualifications_short"] = value;
  }


  
  List<String> get task {
    try {
      if (rawData["task"] is List == false){
        return [];
      }
      return (rawData["task"] as List).cast<String>();
    } catch (e) {
      return [];
    }
  }


  
  set task(List<String> value) {
    rawData["task"] = value;
  }


  
  static JobPosition create({

    String special_type = "jobPosition",
    String? job_id,
    String? title,
      List<String>? qualifications_detail,
      List<String>? qualifications_short,
      List<String>? task,
})  {
    // JobPosition jobPosition = JobPosition({
Map jobPosition_data_create_json = {
  
      "@type": special_type,
      "job_id": job_id,
      "title": title,
      "qualifications_detail": qualifications_detail,
      "qualifications_short": qualifications_short,
      "task": task,


};


          jobPosition_data_create_json.removeWhere((key, value) => value == null);
JobPosition jobPosition_data_create = JobPosition(jobPosition_data_create_json);

return jobPosition_data_create;



      }
}