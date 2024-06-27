// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "account_data.dart";

 
class CodeData extends JsonScheme {

  
  CodeData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"codeData","title":"","file_name":"","code":"","account":{"@type":"accountData","id":0,"first_name":"","last_name":"","username":"","profile_picture":"","bio":"","social_medias":[{"@type":"linkData","icon":"","title":"","value":""}]}};
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


  
  String? get file_name {
    try {
      if (rawData["file_name"] is String == false){
        return null;
      }
      return rawData["file_name"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set file_name(String? value) {
    rawData["file_name"] = value;
  }


  
  String? get code {
    try {
      if (rawData["code"] is String == false){
        return null;
      }
      return rawData["code"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set code(String? value) {
    rawData["code"] = value;
  }


  
  AccountData get account {
    try {
      if (rawData["account"] is Map == false){
        return AccountData({}); 
      }
      return AccountData(rawData["account"] as Map);
    } catch (e) {  
      return AccountData({}); 
    }
  }


  
  set account(AccountData value) {
    rawData["account"] = value.toJson();
  }



  
  static CodeData create({

    String special_type = "codeData",
    String? title,
    String? file_name,
    String? code,
      AccountData? account,
})  {
    // CodeData codeData = CodeData({
Map codeData_data_create_json = {
  
      "@type": special_type,
      "title": title,
      "file_name": file_name,
      "code": code,
      "account": (account != null)?account.toJson(): null,


};


          codeData_data_create_json.removeWhere((key, value) => value == null);
CodeData codeData_data_create = CodeData(codeData_data_create_json);

return codeData_data_create;



      }
}