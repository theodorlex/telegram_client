// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class KeyboardData extends JsonScheme {

  
  KeyboardData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"keyboardData","type":"","text":""};
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


  
  String? get text {
    try {
      if (rawData["text"] is String == false){
        return null;
      }
      return rawData["text"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set text(String? value) {
    rawData["text"] = value;
  }


  
  static KeyboardData create({

    String special_type = "keyboardData",
    String? type,
    String? text,
})  {
    // KeyboardData keyboardData = KeyboardData({
Map keyboardData_data_create_json = {
  
      "@type": special_type,
      "type": type,
      "text": text,


};


          keyboardData_data_create_json.removeWhere((key, value) => value == null);
KeyboardData keyboardData_data_create = KeyboardData(keyboardData_data_create_json);

return keyboardData_data_create;



      }
}