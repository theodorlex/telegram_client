// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class FooterData extends JsonScheme {

  
  FooterData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"footerData","title":"","url":""};
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


  
  static FooterData create({

    String special_type = "footerData",
    String? title,
    String? url,
})  {
    // FooterData footerData = FooterData({
Map footerData_data_create_json = {
  
      "@type": special_type,
      "title": title,
      "url": url,


};


          footerData_data_create_json.removeWhere((key, value) => value == null);
FooterData footerData_data_create = FooterData(footerData_data_create_json);

return footerData_data_create;



      }
}