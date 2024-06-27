// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "document.dart";
import "photo.dart";

 
class ContentMessageData extends JsonScheme {

  
  ContentMessageData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"contentMessageData","is_loading":false,"type":"text","document":{"@type":"document","name":"","size":0,"file_id":""},"photo":{"@type":"photo","name":"","size":0,"file_id":""},"video":"","url":"","caption":"","text":""};
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


  
  bool? get is_loading {
    try {
      if (rawData["is_loading"] is bool == false){
        return null;
      }
      return rawData["is_loading"] as bool;
    } catch (e) {
      return null;
    }
  }

  
  set is_loading(bool? value) {
    rawData["is_loading"] = value;
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


  
  Document get document {
    try {
      if (rawData["document"] is Map == false){
        return Document({}); 
      }
      return Document(rawData["document"] as Map);
    } catch (e) {  
      return Document({}); 
    }
  }


  
  set document(Document value) {
    rawData["document"] = value.toJson();
  }



  
  Photo get photo {
    try {
      if (rawData["photo"] is Map == false){
        return Photo({}); 
      }
      return Photo(rawData["photo"] as Map);
    } catch (e) {  
      return Photo({}); 
    }
  }


  
  set photo(Photo value) {
    rawData["photo"] = value.toJson();
  }



  
  String? get video {
    try {
      if (rawData["video"] is String == false){
        return null;
      }
      return rawData["video"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set video(String? value) {
    rawData["video"] = value;
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


  
  static ContentMessageData create({

    String special_type = "contentMessageData",
    bool? is_loading,
    String? type,
      Document? document,
      Photo? photo,
    String? video,
    String? url,
    String? caption,
    String? text,
})  {
    // ContentMessageData contentMessageData = ContentMessageData({
Map contentMessageData_data_create_json = {
  
      "@type": special_type,
      "is_loading": is_loading,
      "type": type,
      "document": (document != null)?document.toJson(): null,
      "photo": (photo != null)?photo.toJson(): null,
      "video": video,
      "url": url,
      "caption": caption,
      "text": text,


};


          contentMessageData_data_create_json.removeWhere((key, value) => value == null);
ContentMessageData contentMessageData_data_create = ContentMessageData(contentMessageData_data_create_json);

return contentMessageData_data_create;



      }
}