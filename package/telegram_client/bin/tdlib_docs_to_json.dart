// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:general_lib/general_lib.dart';

void main(List<String> args) async {
  String params = """
 
string 	system_language_code_
 	IETF language tag of the user's operating system language; must be non-empty.
 
string 	device_model_
 	Model of the device the application is being run on; must be non-empty.
 
string 	system_version_
 	Version of the operating system the application is being run on. If empty, the version is automatically detected by TDLib.
 
string 	application_version_
 	Application version; must be non-empty.
"""
      .trim();

  Map parameters_data = {};

  List<RegExpMatch> parameters_regex = params
      .split("\n")
      .map((e) =>
          RegExp("^(([a-z0-9]+)([ \t])+((.*)(_)))", caseSensitive: false)
              .firstMatch(e))
      .whereType<RegExpMatch>()
      .toList();
  for (var i = 0; i < parameters_regex.length; i++) {
    RegExpMatch regExpMatch = parameters_regex[i];
    String value = regExpMatch.group(2) ?? "";

    String key = regExpMatch.group(5) ?? "";
    parameters_data[key] = () {
      if (value == "bool") {
        if (RegExp("test", caseSensitive: false).hasMatch(key)) {
          return false;
        }
        return true;
      }
      if (value == "int64") {
        return 0;
      }
      if (value == "int32") {
        return 0;
      }
      if (value == "bytes") {
        return "";
      }
      if (value == "string") {
        return "";
      }
      print("undefined: ${value} = ${key}");

      return null;
    }();
  }
  parameters_data.printPretty();
  print("done");
}
