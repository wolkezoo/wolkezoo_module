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

  InterfaceAddressConfig({
    required String baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Map<String, Object>? headers,
  }) {
    _baseUrl = baseUrl;
    _connectTimeout = connectTimeout;
    _receiveTimeout = receiveTimeout;
    _headers = headers;
  }

  check() {
    if (ObjectUtil.isEmpty(_baseUrl)) {
      throw Exception(
          "dio error，interface address config baseUrl is not null，place call DioTools.init()");
    }
  }
}
