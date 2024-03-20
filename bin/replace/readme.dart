// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart';
import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;

Future<String> get content_readme async {
  Response response = await get(Uri.parse("https://raw.githubusercontent.com/globalcorporation/.github/main/profile/readme.md"));

  return response.body;
}

void main(List<String> args) async {
  Directory directory = Directory.current;
  File file_readme = File(path.join(directory.path, "README.md"));

// <!-- START GLOBAL CORPORATION -->

// <!-- END GLOBAL CORPORATION -->
//
  List<String> datas =(await file_readme.readAsString()).split("\n");

  await file_readme.writeAsString(datas.join("\n"));
  exit(0);
}
