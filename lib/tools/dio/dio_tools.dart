import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:wolkezoo_module/config/dio/interface_address_config.dart';
import 'package:wolkezoo_module/extension/log_extension.dart';

/// Dio 请求方法
enum DioMethod {
  get,
  post,
  put,
  delete,
}

/// Dio工具类
class DioTools {
  Map<String, Function> requestMap = {};

  factory DioTools({
    String? baseUrl,
    bool showLoading = false,
  }) =>
      _getInstance(
        baseUrl: baseUrl,
        showLoading: showLoading,
      );
  static DioTools? _instance;
  CancelToken token = CancelToken();

  // 接口地址参数
  static late InterfaceAddressConfig interfaceAddressConfig;

  // 模型值
  Map<DioMethod, String> methodValues = {
    DioMethod.get: 'get',
    DioMethod.post: 'post',
    DioMethod.delete: 'delete',
    DioMethod.put: 'put',
  };

  /// 初始化Dio
  static void init({required InterfaceAddressConfig interfaceAddressConfig0}) {
    interfaceAddressConfig = interfaceAddressConfig0;
    _getInstance(showLoading: false);
  }

  static DioTools _getInstance({
    String? baseUrl,
    bool? showLoading,
  }) {
    _instance ??= DioTools._init();

    if (baseUrl == null) {
      return _instance!._normal(showLoading!);
    } else {
      return _instance!._baseUrl(baseUrl, showLoading!);
    }
  }

  Dio? _dio;

  Dio get dio => _dio!;

  DioTools._init() {
    _dio ??= Dio(
      BaseOptions(
        /// 请求基地址
        baseUrl: interfaceAddressConfig.baseUrl,

        /// 连接服务器超时时间，单位是毫秒
        connectTimeout: interfaceAddressConfig.connectTimeout,

        /// 接收数据的最长时限
        receiveTimeout: interfaceAddressConfig.receiveTimeout,

        /// Http请求头
        headers: interfaceAddressConfig.headers,
      ),
    );
    // _dio!.interceptors.add(TokenInterceptor());
    // _dio!.interceptors.add(OnErrorInterceptors());
    // _dio!.interceptors.add(PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: false,
    //     error: true,
    //     compact: true));
  }

  //用于指定特定域名
  DioTools _baseUrl(String baseUrl, bool showLoading) {
    if (_dio != null) {
      if (ObjectUtil.isNotEmpty(baseUrl)) {
        _dio!.options.baseUrl = baseUrl;
      }
    }
    return this;
  }

  //一般请求，默认域名
  DioTools _normal(bool showLoading) {
    if (_dio != null) {
      if (_dio!.options.baseUrl != interfaceAddressConfig.baseUrl) {
        _dio!.options.baseUrl = interfaceAddressConfig.baseUrl;
      }
    }
    return this;
  }

  /// get请求
  Future get({
    /// 请求地址
    required String url,

    /// 请求参数
    Map<String, dynamic>? params,

    /// 是否使用token
    bool useToken = true,

    /// 使用Us转译
    bool useUs = false,

    /// 请求取消token
    CancelToken? cancelToken,

    /// 是否使用通用模型
    bool isBaseModel = true,

    /// 使用重试方法
    Function? retryFunction,

    /// 重试次数
    int retrySize = 3,

    /// 重试间隔
    Duration? retryInterval,
  }) async {
    if (ObjectUtil.isEmpty(cancelToken)) {
      cancelToken = token;
    }
    return await requestHttp(
      url,
      method: DioMethod.get,
      params: params,
      useToken: useToken,
      useUS: useUs,
      cancelToken: cancelToken,
      isBaseModel: isBaseModel,
      retryFunction: retryFunction,
      retrySize: retrySize,
      retryInterval: retryInterval,
    );
  }

  /// post 请求
  Future post({
    required String url,
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
    FormData? formData,
    bool useToken = true,
    bool useUs = false,
    CancelToken? cancelToken,
    bool isBaseModel = true,
    Function(int count, int total)? onSendProgress,
  }) async {
    if (ObjectUtil.isEmpty(cancelToken)) {
      cancelToken = token;
    }
    return await requestHttp(
      url,
      method: DioMethod.post,
      params: params,
      header: header,
      formData: formData,
      useToken: useToken,
      useUS: useUs,
      isBaseModel: isBaseModel,
      onSendProgress: onSendProgress,
    );
  }

  /// 取消请求
  /// 同一个cancel token可以用于多个请求，当一个cancel token取消时，所有使用该token的都取消。
  void cancelRequests() {
    "当前请求已被取消".info;
    token.cancel("canceled");
    token = CancelToken();
  }

  /// Dio request 方法
  Future requestHttp(
    String url, {
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
    FormData? formData,
    bool? useToken,
    bool? isBaseModel,
    bool? useUS,
    CancelToken? cancelToken,
    Function(int count, int total)? onSendProgress,
    Function? retryFunction,
    int retrySize = 3,
    Duration? retryInterval,
  }) async {
    // 生成当前请求ID
    // String requestId = nanoid(10);
    // if (retryFunction != null) {
    //   requestMap[requestId] = retryFunction;
    //   _dio!.options.headers.addAll({
    //     "retryId": requestId,
    //     "retrySize": retrySize,
    //     "retryInterval": retryInterval ?? const Duration(seconds: 10)
    //   });
    // }
    // 添加 token
    // dynamic token = StorageTools().read(Storage.token)!;
    // if (token.isNotEmpty && useToken!) {
    //   _dio!.options.headers.addAll({'Authorization': 'Bearer $token'});
    // }
    if (useUS!) {
      _dio!.options.headers.addAll({'accept-language': 'en-US'});
    } else {
      _dio!.options.headers.addAll({'accept-language': 'zh-CN'});
    }

    if (header != null) {
      _dio!.options.headers.addAll(header);
    }

    Response response;
    // 不同请求方法，不同的请求参数。按实际项目需求分，这里 get 是 queryParameters，其它用 data. FormData 也是 data
    // 注意: 只有 post 方法支持发送 FormData.
    switch (method) {
      case DioMethod.get:
        _dio!.options.headers.addAll({HttpHeaders.contentLengthHeader: 0});
        response = await _dio!.request(
          url,
          queryParameters: params,
          options: Options(method: methodValues[method]),
          cancelToken: cancelToken,
        );
        break;
      default:
        if (formData != null) {
          if (ObjectUtil.isNotEmpty(onSendProgress)) {
            response = await _dio!.request(
              url,
              data: formData,
              options: Options(method: methodValues[method]),
              cancelToken: cancelToken,
              onSendProgress: onSendProgress,
            );
          } else {
            response = await _dio!.request(
              url,
              data: formData,
              options: Options(method: methodValues[method]),
              cancelToken: cancelToken,
            );
          }
        } else {
          response = await _dio!.request(
            url,
            data: params,
            options: Options(method: methodValues[method]),
            cancelToken: cancelToken,
          );
        }
        break;
    }
    if (isBaseModel!) {
      // JSON 序列化, Response<dynamic> 转 Map<String, dynamic>
      var result = json.decode(
          (response.data is Map) ? json.encode(response.data) : response.data);
      // PS: 取得 json 数据后, 只返回需要的数据，
      // 如果数据没有在外面包一层 BaseModel, 直接返回就可以。
      // var resultVo = R.from(result);
      // return resultVo;
      return result;
    } else {
      return response;
    }
  }
}
