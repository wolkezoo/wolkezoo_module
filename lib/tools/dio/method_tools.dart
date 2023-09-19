 import 'package:flustars/flustars.dart';

enum MethodEnum {
  get("GET"),
  post("POST"),
   ;
  const MethodEnum(this.name);
  final String name;
}

class MethodTools {

  /// 判断请求方式是否一致
  static bool eq(String method0, String method1){
    if(ObjectUtil.isEmpty(method0) || ObjectUtil.isEmpty(method1)) return false;
    return method0.toUpperCase() == method1.toUpperCase();
  }

  // 判断是否为get请求
  static bool isGet(String methodName){
    if(ObjectUtil.isEmpty(methodName)) return false;
    return eq(methodName, MethodEnum.get.name);
  }

  // 判断是否为post请求
  static bool isPost(String methodName){
    if(ObjectUtil.isEmpty(methodName)) return false;
    return eq(methodName, MethodEnum.post.name);
  }

}