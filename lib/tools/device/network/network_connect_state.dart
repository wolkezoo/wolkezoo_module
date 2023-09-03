import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectState {
  // 监听当前连接的网络情况
  ConnectivityResult? _connectivityResult;
  // 监听当前连接的网络是否可用
  bool? _connectivityInternet;

  ConnectivityResult get connectivityResult => _connectivityResult ?? ConnectivityResult.none;

  set connectivityResult(ConnectivityResult value) {
    _connectivityResult = value;
  }

  bool get connectivityInternet => _connectivityInternet ?? false;

  set connectivityInternet(bool value) {
    _connectivityInternet = value;
  }
}
