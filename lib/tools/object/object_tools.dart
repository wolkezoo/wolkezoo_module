import 'package:flustars/flustars.dart';

/// 超类工具
class ObjectTools {

  static bool isNotEmpty(Object? object){
    return ObjectUtil.isNotEmpty(object);
  }

  static bool isEmpty(Object? object){
    return !isNotEmpty(object);
  }

}