// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class DocContents extends JsonScheme {

  
  DocContents(super.rawData);
   
  static Map get defaultData {
    return {"@type":"docContents","content":""};
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


  
  String? get content {
    try {
      if (rawData["content"] is String == false){
        return null;
      }
      return rawData["content"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set content(String? value) {
    rawData["content"] = value;
  }


  
  static DocContents create({

    String special_type = "docContents",
    String? content,
})  {
    // DocContents docContents = DocContents({
Map docContents_data_create_json = {
  
      "@type": special_type,
      "content": content,


};


          docContents_data_create_json.removeWhere((key, value) => value == null);
DocContents docContents_data_create = DocContents(docContents_data_create_json);

return docContents_data_create;



      }
}