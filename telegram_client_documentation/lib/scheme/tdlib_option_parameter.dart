// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class TdlibOptionParameter extends JsonScheme {

  
  TdlibOptionParameter(super.rawData);
   
  static Map get defaultData {
    return {"@type":"tdlibOptionParameter"};
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


  
  static TdlibOptionParameter create({

    String special_type = "tdlibOptionParameter",
})  {
    // TdlibOptionParameter tdlibOptionParameter = TdlibOptionParameter({
Map tdlibOptionParameter_data_create_json = {
  
      "@type": special_type,


};


          tdlibOptionParameter_data_create_json.removeWhere((key, value) => value == null);
TdlibOptionParameter tdlibOptionParameter_data_create = TdlibOptionParameter(tdlibOptionParameter_data_create_json);

return tdlibOptionParameter_data_create;



      }
}