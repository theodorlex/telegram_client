export "tdlib_none.dart"
    if (dart.library.io) 'tdlib_io.dart'
    if (dart.library.html) 'tdlib_web.dart';
