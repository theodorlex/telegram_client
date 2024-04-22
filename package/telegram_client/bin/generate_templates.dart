// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:general_lib/script_generate/script_generate.dart';
import 'package:universal_io/io.dart';

import "package:path/path.dart" as path;

void main(List<String> args) async {
  Directory directory_template =
      Directory(path.join(Directory.current.path, "template"));
  List<FileSystemEntity> fileSystemEntitys = directory_template
      .listSync()
      .where((element) =>
          element.statSync().type == FileSystemEntityType.directory)
      .toList();
  for (var element in fileSystemEntitys) {
    String base_name = "${path.basename(element.path)}_telegram_client";
    if (element is Directory) {
      List<ScriptGenerator> scirpts = element.listSync().toScriptGenerate();
      String script = scirpts.toScriptDart(scriptName: base_name);
      File file = File(path.join(Directory.current.path, "lib", "templates",
          "${base_name}_template.dart"));
      if (file.parent.existsSync() == false) {
        file.parent.createSync(
          recursive: true,
        );
      }
      file.writeAsStringSync(script);
    }
  }
}
