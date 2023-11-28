import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityResultEnum {
  /// Bluetooth: Device connected via bluetooth
  bluetooth,

  /// WiFi: Device connected via Wi-Fi
  wifi,

  /// Ethernet: Device connected to ethernet network
  ethernet,

  /// Mobile: Device connected to cellular network
  mobile,

  /// None: Device not connected to any network
  none,

  /// VPN: Device connected to a VPN
  ///
  /// Note for iOS and macOS:
  /// There is no separate network interface type for [vpn].
  /// It returns [other] on any device (also simulator).
  vpn,

  /// Other: Device is connected to an unknown network
  other;

  static ConnectivityResultEnum convertConnectivityResult(ConnectivityResult connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.bluetooth:
        return ConnectivityResultEnum.bluetooth;
      case ConnectivityResult.wifi:
        return ConnectivityResultEnum.wifi;
      case ConnectivityResult.ethernet:
        return ConnectivityResultEnum.ethernet;
      case ConnectivityResult.mobile:
        return ConnectivityResultEnum.mobile;
      case ConnectivityResult.none:
        return ConnectivityResultEnum.none;
      case ConnectivityResult.vpn:
        return ConnectivityResultEnum.vpn;
      case ConnectivityResult.other:
        return ConnectivityResultEnum.other;
    }
  }
}

class NetworkConnectState {
  // 监听当前连接的网络情况
  ConnectivityResultEnum? _connectivityResult;

  // 监听当前连接的网络是否可用
  bool? _connectivityInternet;

  ConnectivityResultEnum get connectivityResult => _connectivityResult ?? ConnectivityResultEnum.none;

  set connectivityResult(ConnectivityResultEnum value) {
    _connectivityResult = value;
  }

  bool get connectivityInternet => _connectivityInternet ?? false;

  set connectivityInternet(bool value) {
    _connectivityInternet = value;
  }
}
