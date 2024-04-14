import 'dart:async';

Future<T> wait<T>(int milliseconds, [FutureOr<T> Function()? computation]) {
  return Future<T>.delayed(Duration(milliseconds: milliseconds), computation);
}


