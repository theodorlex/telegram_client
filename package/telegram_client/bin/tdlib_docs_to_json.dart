// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:general_lib/general_lib.dart';

void main(List<String> args) async {
  String params = """

bool 	use_test_dc_
 	Pass true to use Telegram test environment instead of the production environment.
 
string 	database_directory_
 	The path to the directory for the persistent database; if empty, the current working directory will be used.
 
string 	files_directory_
 	The path to the directory for storing files; if empty, database_directory will be used.
 
bytes 	database_encryption_key_
 	Encryption key for the database. If the encryption key is invalid, then an error with code 401 will be returned.
 
bool 	use_file_database_
 	Pass true to keep information about downloaded and uploaded files between application restarts.
 
bool 	use_chat_info_database_
 	Pass true to keep cache of users, basic groups, supergroups, channels and secret chats between restarts. Implies use_file_database.
 
bool 	use_message_database_
 	Pass true to keep cache of chats and messages between restarts. Implies use_chat_info_database.
 
bool 	use_secret_chats_
 	Pass true to enable support for secret chats.
 
int32 	api_id_
 	Application identifier for Telegram API access, which can be obtained at https://my.telegram.org.
 
string 	api_hash_
 	Application identifier hash for Telegram API access, which can be obtained at https://my.telegram.org.
 
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
      .map((e) => RegExp("^(([a-z]+)([ \t])+((.*)(_)))", caseSensitive: false)
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
