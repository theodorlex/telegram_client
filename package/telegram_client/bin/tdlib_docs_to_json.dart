// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:general_lib/general_lib.dart';

void main(List<String> args) async {
  String params = """

int64 	id_
 	Session identifier.
 
bool 	is_current_
 	True, if this session is the current session.
 
bool 	is_password_pending_
 	True, if a 2-step verification password is needed to complete authorization of the session.
 
bool 	is_unconfirmed_
 	True, if the session wasn't confirmed from another session.
 
bool 	can_accept_secret_chats_
 	True, if incoming secret chats can be accepted by the session.
 
bool 	can_accept_calls_
 	True, if incoming calls can be accepted by the session.
 
object_ptr< SessionType > 	type_
 	Session type based on the system and application version, which can be used to display a corresponding icon.
 
int32 	api_id_
 	Telegram API identifier, as provided by the application.
 
string 	application_name_
 	Name of the application, as provided by the application.
 
string 	application_version_
 	The version of the application, as provided by the application.
 
bool 	is_official_application_
 	True, if the application is an official application or uses the api_id of an official application.
 
string 	device_model_
 	Model of the device the application has been run or is running on, as provided by the application.
 
string 	platform_
 	Operating system the application has been run or is running on, as provided by the application.
 
string 	system_version_
 	Version of the operating system the application has been run or is running on, as provided by the application.
 
int32 	log_in_date_
 	Point in time (Unix timestamp) when the user has logged in.
 
int32 	last_active_date_
 	Point in time (Unix timestamp) when the session was last used.
 
string 	ip_address_
 	IP address from which the session was created, in human-readable format.
 
string 	location_
 	A human-readable description of the location from which the session was created, based on the IP address.
"""
      .trim();

  Map parameters_data = {};

  List<RegExpMatch> parameters_regex = params.split("\n").map((e) => RegExp("^(([a-z0-9]+)([ \t])+((.*)(_)))", caseSensitive: false).firstMatch(e)).whereType<RegExpMatch>().toList();
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
