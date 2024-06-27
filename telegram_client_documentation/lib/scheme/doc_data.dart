// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class DocData extends JsonScheme {

  
  DocData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"docData","doc_id":"","title":"","description":""};
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


  
  String? get doc_id {
    try {
      if (rawData["doc_id"] is String == false){
        return null;
      }
      return rawData["doc_id"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set doc_id(String? value) {
    rawData["doc_id"] = value;
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


  
  String? get description {
    try {
      if (rawData["description"] is String == false){
        return null;
      }
      return rawData["description"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set description(String? value) {
    rawData["description"] = value;
  }


  
  static DocData create({

    String special_type = "docData",
    String? doc_id,
    String? title,
    String? description,
})  {
    // DocData docData = DocData({
Map docData_data_create_json = {
  
      "@type": special_type,
      "doc_id": doc_id,
      "title": title,
      "description": description,


};


          docData_data_create_json.removeWhere((key, value) => value == null);
DocData docData_data_create = DocData(docData_data_create_json);

return docData_data_create;



      }
}