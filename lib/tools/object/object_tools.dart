import 'package:flustars/flustars.dart';

/// 超类工具
/// 包转ObjectUtil类
class ObjectTools {

  /// 不为空
  static bool isNotEmpty(Object? object){
    return ObjectUtil.isNotEmpty(object);
  }

  /// 为空
  static bool isEmpty(Object? object){
    return !isNotEmpty(object);
  }

  // 安全转换
  static T cast<T>(x, T defaultValue) => x is T ? x : defaultValue;
}