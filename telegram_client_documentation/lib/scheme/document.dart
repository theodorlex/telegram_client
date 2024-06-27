// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class Document extends JsonScheme {

  
  Document(super.rawData);
   
  static Map get defaultData {
    return {"@type":"document","name":"","size":0,"file_id":""};
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


  
  String? get name {
    try {
      if (rawData["name"] is String == false){
        return null;
      }
      return rawData["name"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set name(String? value) {
    rawData["name"] = value;
  }


  
  num? get size {
    try {
      if (rawData["size"] is num == false){
        return null;
      }
      return rawData["size"] as num;
    } catch (e) {
      return null;
    }
  }

  
  set size(num? value) {
    rawData["size"] = value;
  }


  
  String? get file_id {
    try {
      if (rawData["file_id"] is String == false){
        return null;
      }
      return rawData["file_id"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set file_id(String? value) {
    rawData["file_id"] = value;
  }


  
  static Document create({

    String special_type = "document",
    String? name,
    num? size,
    String? file_id,
})  {
    // Document document = Document({
Map document_data_create_json = {
  
      "@type": special_type,
      "name": name,
      "size": size,
      "file_id": file_id,


};


          document_data_create_json.removeWhere((key, value) => value == null);
Document document_data_create = Document(document_data_create_json);

return document_data_create;



      }
}