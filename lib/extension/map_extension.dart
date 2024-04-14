import 'package:get/get.dart';

extension MapExtension on Map {
  void insert<T, E>(int index, T key, E value) {
    if(index < 0) {
      throw MapException("insert error, index less than 0");
    }
    if (containsKey(key)) {
      throw MapException("insert error, the key already exists in the current map and cannot be inserted.");
    }

    if(index >= length) {
      addIf(true, key, value);
      return;
    }

    Map<T, E> reorganizeMap = <T, E>{};
    for (int i = 0; i < keys.length; i++) {
      if (i != index) {
        reorganizeMap.putIfAbsent(keys.toList()[i], () => this[keys.toList()[i]]);
      } else {
        reorganizeMap.addIf(true, key, value);
        reorganizeMap.putIfAbsent(keys.toList()[i], () => this[keys.toList()[i]]);
      }
    }

    clear();
    addAll(reorganizeMap);
  }

  int indexOfKey<T>(T key){
    return keys.toList().indexOf(key);
  }

  int indexOfValue<T>(T value) {
    return values.toList().indexOf(value);
  }
}

class MapException implements Exception {
  late String message;

  MapException(this.message);
}
