import 'dart:async';
import 'dart:convert';

import 'package:universal_io/io.dart';

void main(List<String> args) async {
  print("asps");
  Completer completer = Completer();
  print("wait");

  stdin.listen((event) {
    String text = utf8.decode(event, allowMalformed: true).trim();
    if (text == "complete") {
      completer.complete(() async {
        return "";
      }());
    }
  });
  print("futur");
  await completer.future.timeout(
    Duration(seconds: 2),
    onTimeout: () {
      return "d";
    },
  );
  print("complete");
  print(completer.isCompleted);
  completer;
  print("ksoa");
}
