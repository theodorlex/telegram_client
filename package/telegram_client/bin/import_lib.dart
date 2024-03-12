// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:universal_io/io.dart';

void main(List<String> args) async {
  Directory directory_function = Directory(
      "/home/galaxeus/Documents/galaxeus/app/telegram_client/package/telegram_client/lib/telegram_client/function");
  List<FileSystemEntity> files = directory_function.listSync();
  print("Starrt");
  for (var i = 0; i < files.length; i++) {
    FileSystemEntity fileSystemEntity = files[i];
    if (fileSystemEntity is File) {
      List<String> data = (await fileSystemEntity.readAsString()).split("\n");

      bool is_not_found_data = true;
      // data.removeWhere((element) => element.trim() == "await invoke");
      for (var index = 0; index < data.length; index++) {
        String sub_data = data[index];
        if (index == 0) {
          continue;
        }
        if (sub_data.trim() == "await invoke") {
          is_not_found_data = false;

          data[index] = "await callApiInvoke";
          break;
        }
      }
      // if (is_not_found_data) {
      //   for (var index = 0; index < data.length; index++) {
      //     String sub_data = data[index];
      //     if (index == 0) {
      //       continue;
      //     }
      //     if (RegExp(r"import ", caseSensitive: false).hasMatch(sub_data)) {
      //       data.insert(index + 1, "import 'package:telegram_client/telegram_client/call_api_invoke.dart';");
      //       break;
      //     }
      //   }
      // }

      await fileSystemEntity.writeAsString(data.join("\n"));
      // print(fileSystemEntity.path);
      // exit(0);
    }
  }

  exit(0);
}
