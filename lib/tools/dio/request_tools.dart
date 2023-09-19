import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:wolkezoo_module/tools/dio/method_tools.dart';

/// 请求工具类
class RequestTools {

  // 转换Get请求参数
  static RequestOptions convertGetParams(RequestOptions options){
    if(!MethodTools.isGet(options.method)) return options;

    // 获取请求地址
    String path = options.path;

    // 从请求地址提取参数
    Uri uri = Uri.parse(path);
    if(!ObjectUtil.isEmptyMap(uri.queryParameters)) {
      options.queryParameters.addAll(uri.queryParameters);
      options.path = uri.path;
    }

    return options;
  }

}