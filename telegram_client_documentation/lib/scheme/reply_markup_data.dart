// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "inline_keyboard_data.dart";
import "keyboard_data.dart";

 
class ReplyMarkupData extends JsonScheme {

  
  ReplyMarkupData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"replyMarkupData","type":"inline_keyboard","inline_keyboard":[[{"@type":"inlineKeyboardData","type":"url","text":"","url":"","callback_data":""}]],"keyboard":[[{"@type":"keyboardData","type":"","text":""}]]};
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

  
List<List<InlineKeyboardData>> get inline_keyboard {
    try {
      if (rawData["inline_keyboard"] is List == false){
        return [];
      }
      return ((rawData["inline_keyboard"] as List).cast<List>()).map((e) => e.map((e) => InlineKeyboardData(e as Map)).toList().cast<InlineKeyboardData>()).toList().cast<List<InlineKeyboardData>>();
    } catch (e) {
      return [];
    }
  }

  
  set inline_keyboard(List<List<InlineKeyboardData>> values) {
    rawData["inline_keyboard"] = values.map((value) => value.map((value) => value.toJson()).toList()).toList();
  }


  
List<List<KeyboardData>> get keyboard {
    try {
      if (rawData["keyboard"] is List == false){
        return [];
      }
      return ((rawData["keyboard"] as List).cast<List>()).map((e) => e.map((e) => KeyboardData(e as Map)).toList().cast<KeyboardData>()).toList().cast<List<KeyboardData>>();
    } catch (e) {
      return [];
    }
  }

  
  set keyboard(List<List<KeyboardData>> values) {
    rawData["keyboard"] = values.map((value) => value.map((value) => value.toJson()).toList()).toList();
  }



  
  static ReplyMarkupData create({

    String special_type = "replyMarkupData",
    String? type,
      List<List<InlineKeyboardData>>? inline_keyboard,
      List<List<KeyboardData>>? keyboard,
})  {
    // ReplyMarkupData replyMarkupData = ReplyMarkupData({
Map replyMarkupData_data_create_json = {
  
      "@type": special_type,
      "type": type,
      "inline_keyboard": (inline_keyboard != null)? inline_keyboard.map((res) => res.map((e) => e.toJson()).toList().cast<Map>()).toList().cast<List<Map>>(): null,
      "keyboard": (keyboard != null)? keyboard.map((res) => res.map((e) => e.toJson()).toList().cast<Map>()).toList().cast<List<Map>>(): null,


};


          replyMarkupData_data_create_json.removeWhere((key, value) => value == null);
ReplyMarkupData replyMarkupData_data_create = ReplyMarkupData(replyMarkupData_data_create_json);

return replyMarkupData_data_create;



      }
}