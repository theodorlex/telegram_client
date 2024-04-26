import 'package:general_lib/general_lib.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) {
  Directory? directory = Dart.pub.installFromDirectory(directoryPackage: Directory.current);
  directory.printPretty();
}
