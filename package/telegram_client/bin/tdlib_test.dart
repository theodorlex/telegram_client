// ignore_for_file: empty_catches, unused_local_variable

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:convert' as convert;

typedef TdPointerNative = Pointer;
typedef TdPointerFunctionNative = TdPointerNative Function();

typedef TdStringNative = Pointer<Utf8>;
typedef TdReceiveNative = TdStringNative Function(Double timout);
typedef TdReceiveDart = TdStringNative Function(double timout);

typedef TdSendNative = Void Function(TdPointerNative client, TdStringNative request);
typedef TdSendDart = void Function(TdPointerNative client, TdStringNative request);

typedef TdExecuteNative = TdStringNative Function(TdStringNative parameters);

typedef TdDestroyNative = Void Function(Pointer clientId);
typedef TdDestroyDart = void Function(Pointer clientId);

int tdCreateClientId({
  required DynamicLibrary tdLib,
}) {
  int clientIdNew = using((Arena arena) {
    // https://core.telegram.org/tdlib/docs/td__json__client_8h.html#a7feda953a66eee36bc207eb71a55c490
    TdPointerFunctionNative tdPointerNativeFunction = tdLib.lookupFunction<TdPointerFunctionNative, TdPointerFunctionNative>('td_create_client_id');
    Pointer tdPointerNativeResult = arena.using(tdPointerNativeFunction(), freeMemory);
    int clientIdNew = tdPointerNativeResult.address;

    return clientIdNew;
  });
  return clientIdNew;
}

/// td_send
void tdSend({
  required int clientId,
  Map? parameters,
  required DynamicLibrary tdLib,
}) {
  using((Arena arena) {
    Pointer clientIdAddresData = Pointer.fromAddress(clientId);
    TdStringNative requestData = convert.json.encode(parameters).toNativeUtf8();
    Arena arena = Arena();
    TdSendDart tdSendFunction = tdLib.lookupFunction<TdSendNative, TdSendDart>('td_send');
    void tdSendResult = arena.using(tdSendFunction(clientIdAddresData, requestData), (p0) {});

    malloc.free(requestData);
  });
  return;
}

Map<String, dynamic>? tdReceiveStatic({
  required DynamicLibrary tdLib,
  double timeout = 1.0,
  bool isAndroid = false,
}) {
  try {
    Map<String, dynamic>? result = using((Arena arena) {
      /// Docs: https://core.telegram.org/tdlib/docs/td__json__client_8h.html#a62715bea8e41a554d1bac763c187b662
      TdReceiveDart tdReceiveFunction = tdLib.lookupFunction<TdReceiveNative, TdReceiveDart>(
        '${isAndroid ? "_" : ""}td_receive',
      );
      TdStringNative update = arena.using(tdReceiveFunction(timeout), freeMemory);
      if (update.address != 0) {
        String updateString = update.toDartString();

        if (updateString.isEmpty) {
          return null;
        }
        Map<String, dynamic>? updateOrigin;
        try {
          updateOrigin = convert.json.decode(update.toDartString());
        } catch (e) {}
        if (updateOrigin != null) {
          return updateOrigin;
        }
      } else {}
      return null;
    });
    return result;
  } catch (e) {}
  return null;
}

void freeMemory(Pointer<NativeType> pointer) {
  // malloc.free(pointer);
}

void main(List<String> args) async {
  // open library tdlib
  // Tdlib docs: https://core.telegram.org/tdlib/docs/td__json__client_8h.html
  // Tdlib is Telegram Database Library for interact with telegram api so you can make
  // Program Application, Bot, Userbot Custom
  DynamicLibrary tdLib = DynamicLibrary.open("libtdjson.so");
  int clientId = tdCreateClientId(tdLib: tdLib);
  tdSend(clientId: clientId, tdLib: tdLib, parameters: {
    "@type": "getOption",
    "name": "version",
  });
  while (true) {
    // await Future.delayed(Duration(microseconds: 1));

    Map? update = tdReceiveStatic(tdLib: tdLib);
    if (update != null) {
      print(update);
    }
  }
}
