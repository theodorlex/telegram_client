// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:general_lib/script_generate/script_generate.dart';

List<ScriptGenerator> userbot_script_generators = [
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("userbot"),
    fileSystemEntity: Directory("bin"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.directory,
    value: r"""""",
    children: [
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("userbot"),
        fileSystemEntity: File("bin/userbot.dart"),
        state_data: {},
        fileSystemEntityType: FileSystemEntityType.file,
        value: r"""import 'package:userbot/userbot.dart' as userbot;

void main(List<String> arguments) {
  print('Hello world: ${userbot.calculate()}!');
}
""",
        children: [],
      )
    ],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("userbot"),
    fileSystemEntity: Directory("lib"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.directory,
    value: r"""""",
    children: [
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("userbot"),
        fileSystemEntity: File("lib/userbot.dart"),
        state_data: {},
        fileSystemEntityType: FileSystemEntityType.file,
        value: r"""int calculate() {
  return 6 * 7;
}
""",
        children: [],
      )
    ],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("userbot"),
    fileSystemEntity: Directory("test"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.directory,
    value: r"""""",
    children: [
      ScriptGenerator(
        is_generate: true,
        directory_base: Directory("userbot"),
        fileSystemEntity: File("test/userbot_test.dart"),
        state_data: {},
        fileSystemEntityType: FileSystemEntityType.file,
        value: r"""import 'package:userbot/userbot.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
}
""",
        children: [],
      )
    ],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("userbot"),
    fileSystemEntity: File(".gitignore"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.file,
    value: r"""# https://dart.dev/guides/libraries/private-files
# Created by `dart pub`
.dart_tool/
""",
    children: [],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("userbot"),
    fileSystemEntity: File("analysis_options.yaml"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.file,
    value:
        r"""# This file configures the static analysis results for your project (errors,
# warnings, and lints).
#
# This enables the 'recommended' set of lints from `package:lints`.
# This set helps identify many issues that may lead to problems when running
# or consuming Dart code, and enforces writing Dart using a single, idiomatic
# style and format.
#
# If you want a smaller set of lints you can change this to specify
# 'package:lints/core.yaml'. These are just the most critical lints
# (the recommended set includes the core lints).
# The core lints are also what is used by pub.dev for scoring packages.

include: package:lints/recommended.yaml

# Uncomment the following section to specify additional rules.

# linter:
#   rules:
#     - camel_case_types

# analyzer:
#   exclude:
#     - path/to/excluded/files/**

# For more information about the core and recommended set of lints, see
# https://dart.dev/go/core-lints

# For additional information about configuring this file, see
# https://dart.dev/guides/language/analysis-options
""",
    children: [],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("userbot"),
    fileSystemEntity: File("CHANGELOG.md"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.file,
    value: r"""## 1.0.0

- Initial version.
""",
    children: [],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("userbot"),
    fileSystemEntity: File("pubspec.yaml"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.file,
    value: r"""name: userbot
description: A sample command-line application.
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.3.0

# Add regular dependencies here.
dependencies:
  # path: ^1.8.0

dev_dependencies:
  lints: ^3.0.0
  test: ^1.24.0
""",
    children: [],
  ),
  ScriptGenerator(
    is_generate: true,
    directory_base: Directory("userbot"),
    fileSystemEntity: File("README.md"),
    state_data: {},
    fileSystemEntityType: FileSystemEntityType.file,
    value:
        r"""A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.
""",
    children: [],
  )
];
