import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef MyLibStringNative = Pointer<Utf8>;
typedef MyLibReceiveNative = MyLibStringNative Function(Double timout);
typedef MyLibReceiveDart = MyLibStringNative Function(double timout);
void main(List<String> args) {
  // open library
  DynamicLibrary myLib = DynamicLibrary.open("liblibrary.so");
  // use arena
  Arena arena = Arena();
  MyLibReceiveDart myLibReceiveFunction = myLib.lookupFunction<MyLibReceiveNative, MyLibReceiveDart>("my_function");
  MyLibStringNative update = arena.using(myLibReceiveFunction(10), (p0) {});
  if (update.address != 0) {
    String updateString = update.toDartString();
    print(updateString);
  }
  // get free up memory
  arena.releaseAll();
}
