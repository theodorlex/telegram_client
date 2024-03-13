// export "isolate_io.dart" if (dart.library.html) "isolate_web.dart";
export "isolate_none.dart"
    if (dart.library.io) 'isolate_io.dart'
    if (dart.library.html) 'isolate_web.dart';
// export "isolate_web.dart";
