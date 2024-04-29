// import 'dart:ffi';
// import 'dart:math';
// import 'package:ffi/ffi.dart';

// typedef MyLibStringNative = Pointer<Utf8>;
// typedef MyLibReceiveNative = MyLibStringNative Function(Double timout);
// typedef MyLibReceiveDart = MyLibStringNative Function(double timout);

// void main(List<String> args) {
//   // Create an arena for memory allocation
//   final arena = Arena();

//   DynamicLibrary myLib = DynamicLibrary.open("liblibrary.so");
//   MyLibReceiveDart myLibReceiveFunction = myLib.lookupFunction<MyLibReceiveNative, MyLibReceiveDart>("my_function");

//   while (true) {
//     // Allocate memory for the return value within the arena
//     Pointer<Utf8> allocatedPointer = arena.allocate<Utf8>(sizeOf<Utf8>());
//     arena.using(myLibReceiveFunction(10), (p0) { });
//     // Call the native function, passing the allocated memory address
//     final update = myLibReceiveFunction(10.0, allocatedPointer);

//     if (update.address != 0) {
//       // Read the string from the allocated memory using toDartString
//       final updateString = update.toDartString();
//       print(updateString);

//       // Deallocate the memory after use to prevent leaks
//       arena.free(allocatedPointer);
//     } else {
//       break; // Handle error or termination condition
//     }
//   }

//   arena.releaseAll();
//   // Deallocate the arena when finished
//   arena.dispose();
// }
