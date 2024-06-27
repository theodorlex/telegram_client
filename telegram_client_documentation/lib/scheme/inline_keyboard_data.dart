// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class InlineKeyboardData extends JsonScheme {

  
  InlineKeyboardData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"inlineKeyboardData","type":"url","text":"","url":"","callback_data":""};
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


  
  String? get url {
    try {
      if (rawData["url"] is String == false){
        return null;
      }
      return rawData["url"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set url(String? value) {
    rawData["url"] = value;
  }


  
  String? get callback_data {
    try {
      if (rawData["callback_data"] is String == false){
        return null;
      }
      return rawData["callback_data"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set callback_data(String? value) {
    rawData["callback_data"] = value;
  }


  
  static InlineKeyboardData create({

    String special_type = "inlineKeyboardData",
    String? type,
    String? text,
    String? url,
    String? callback_data,
})  {
    // InlineKeyboardData inlineKeyboardData = InlineKeyboardData({
Map inlineKeyboardData_data_create_json = {
  
      "@type": special_type,
      "type": type,
      "text": text,
      "url": url,
      "callback_data": callback_data,


};


          inlineKeyboardData_data_create_json.removeWhere((key, value) => value == null);
InlineKeyboardData inlineKeyboardData_data_create = InlineKeyboardData(inlineKeyboardData_data_create_json);

return inlineKeyboardData_data_create;



      }
}