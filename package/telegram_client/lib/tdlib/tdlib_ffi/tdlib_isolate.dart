// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions empty_catches

// import 'dart:io';

// import 'package:telegram_client/isolate/isolate.dart';
// import 'package:telegram_client/scheme/tdlib_client.dart';
import 'package:telegram_client/tdlib/tdlib.dart';
import 'package:telegram_client/tdlib/tdlib_ffi/tdlib_io.dart';

/// add this for multithread new client on flutter apps
Future<void> tdlibIsolate(TdlibIsolateData tdlibIsolateData) async {
  try {
    Duration duration =
        tdlibIsolateData.delayUpdate ?? Duration(microseconds: 1);
    while (true) {
      await Future.delayed(duration);
      Map? new_update = LibTdJson.td_receive_static(
        timeout: tdlibIsolateData.timeOutUpdate,
        path_tdlib: tdlibIsolateData.pathTdlib,
      );
      if (new_update != null) {
        tdlibIsolateData.sendPort.send(
          TdlibIsolateReceiveData(
            updateData: new_update,
            clientId: new_update["@client_id"],
          ),
        );
        //
      }
    }
  } catch (e) {
    tdlibIsolateData.sendPort.send(
      TdlibIsolateReceiveDataError(),
    );
  }
}
