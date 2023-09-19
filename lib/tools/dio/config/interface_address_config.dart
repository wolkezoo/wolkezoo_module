import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';

/// 接口地址配置
class InterfaceAddressConfig {
  /// base地址
  String? _baseUrl;

  /// 连接超时时间
  Duration? _connectTimeout;

  /// 接收超时时间
  Duration? _receiveTimeout;

  /// 默认请求头
  Map<String, dynamic>? _headers;

  Function(Map<String, dynamic>)? _convertResponse;

  /// 拦截器
  List<Interceptor>? _interceptors;

  // 是否开启日志
  bool? _openRequestLog;

  // 日志配置
  RequestLogConfig? _requestLogConfig;

  // 开启请求头添加时间戳
  bool? _openHeaderTimestamp;
  String? _headerTimestampName;

  // 开启token添加
  bool? _openHeaderToken;
  String? _headerTokenName;

  /// 获取token的方式，提供_tokenValue或者从StorageTools中获得
  String? _tokenValue;
  String? _tokenStorageName;
  String? _tokenHeaderSuffix;

  String get baseUrl => _baseUrl ?? "";

  set baseUrl(String value) {
    _baseUrl = value;
  }

  Duration get connectTimeout =>
      _connectTimeout ?? const Duration(seconds: 300);

  set connectTimeout(Duration value) {
    _connectTimeout = value;
  }

  Duration get receiveTimeout =>
      _receiveTimeout ?? const Duration(seconds: 300);

  set receiveTimeout(Duration value) {
    _receiveTimeout = value;
  }

  Map<String, dynamic> get headers =>
      _headers ??
      {
        "api": "1.0.0",
      };

  set headers(Map<String, dynamic> value) {
    _headers = value;
  }

  List<Interceptor> get interceptors => _interceptors ?? [];

  set interceptors(List<Interceptor> value) {
    _interceptors = value;
  }

  bool get openRequestLog => _openRequestLog ?? false;

  set openRequestLog(bool value) {
    _openRequestLog = value;
  }

  RequestLogConfig get requestLogConfig =>
      _requestLogConfig ?? RequestLogConfig();

  set requestLogConfig(RequestLogConfig value) {
    _requestLogConfig = value;
  }

  Function(Map<String, dynamic>) get convertResponse =>
      _convertResponse ?? (map) {};

  set convertResponse(Function(Map<String, dynamic>) value) {
    _convertResponse = value;
  }

  bool get openHeaderTimestamp => _openHeaderTimestamp ?? false;

  set openHeaderTimestamp(bool value) {
    _openHeaderTimestamp = value;
  }

  String get headerTimestampName => _headerTimestampName ?? "timestamp";

  set headerTimestampName(String value) {
    _headerTimestampName = value;
  }

  bool get openHeaderToken => _openHeaderToken ?? false;

  set openHeaderToken(bool value) {
    _openHeaderToken = value;
  }

  String get headerTokenName => _headerTokenName ?? "Authorization";

  set headerTokenName(String value) {
    _headerTokenName = value;
  }


  String get tokenValue => _tokenValue ?? "";

  set tokenValue(String value) {
    _tokenValue = value;
  }

  String get tokenStorageName => _tokenStorageName ?? "";

  set tokenStorageName(String value) {
    _tokenStorageName = value;
  }

  String get tokenHeaderSuffix => _tokenHeaderSuffix ?? "";

  set tokenHeaderSuffix(String value) {
    _tokenHeaderSuffix = value;
  }

  InterfaceAddressConfig({
    required String baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Map<String, Object>? headers,
    List<Interceptor>? interceptors,
    bool? openRequestLog,
    RequestLogConfig? requestLogConfig,
    Function(Map<String, dynamic>)? convertResponse,
    bool? openHeaderTimestamp,
    String? headerTimestampName,
    bool? openHeaderToken,
    String? headerTokenName,
    String? tokenValue,
    String? tokenStorageName,
    String? tokenHeaderSuffix,
  }) {
    _baseUrl = baseUrl;
    _connectTimeout = connectTimeout;
    _receiveTimeout = receiveTimeout;
    _headers = headers;
    _interceptors = interceptors;
    _openRequestLog = openRequestLog;
    _requestLogConfig = requestLogConfig;
    _convertResponse = convertResponse;
    _openHeaderTimestamp = openHeaderTimestamp;
    _headerTimestampName = headerTimestampName;
    _openHeaderToken = openHeaderToken;
    _headerTokenName = headerTokenName;
    _tokenValue = tokenValue;
    _tokenStorageName = tokenStorageName;
    _tokenHeaderSuffix = tokenHeaderSuffix;
  }

  examineConfig() {
    if (ObjectUtil.isEmpty(_baseUrl)) {
      throw Exception(
          "dio error，interface address config baseUrl is not null，place call DioTools.init()");
    }
    if(openHeaderToken) {
      if(ObjectUtil.isEmpty(_tokenValue) && ObjectUtil.isEmpty(_tokenStorageName)){
        throw Exception(
            "dio error，You have enabled the request header adding token mode. Please provide a way to obtain the token. Setting _tokenValue or _tokenStorageName");
      }
    }
    if (ObjectUtil.isNotEmpty(_tokenValue) &&
        ObjectUtil.isNotEmpty(_tokenStorageName)) {
      throw Exception(
        ""
        "dio error, dio config _tokenValue or _tokenStorageName pick one of two",
      );
    }
  }
}

class RequestLogConfig {
  bool request;
  bool requestBody;
  bool requestHeader;
  bool responseHeader;
  bool responseBody;
  bool error;
  bool compact;

  RequestLogConfig({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = true,
    this.responseBody = true,
    this.error = true,
    this.compact = true,
  });
}
