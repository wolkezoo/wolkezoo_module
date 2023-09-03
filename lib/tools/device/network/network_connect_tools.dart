import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:wolkezoo_module/tools/device/network/network_connect_state.dart';

/// 网络连接工具
class NetworkConnectTools {
  // 创建单例模式
  factory NetworkConnectTools() => _getInstance();
  static NetworkConnectTools? _instance;

  // 网络连接返回参数
  Rx<NetworkConnectState> networkConnectState = NetworkConnectState().obs;

  // 监听网络情况流
  late StreamSubscription networkChangeSubscription;

  late StreamSubscription networkInternetSubscription;

  // 网络检查器
  FlutterNetworkConnectivity networkConnectivityExamine = FlutterNetworkConnectivity(
    isContinousLookUp: true,  // optional, false if you cont want continuous lookup
    lookUpDuration: const Duration(seconds: 30),  // optional, to override default lookup duration
    lookUpUrl: 'baidu.com',  // optional, to override default lookup url
  );

  static Future<NetworkConnectTools> init() async {
    NetworkConnectTools networkConnectTools = _getInstance();
    await networkConnectTools.networkConnectivityExamine.registerAvailabilityListener();

    return _getInstance();
  }

  static NetworkConnectTools _getInstance() {
    _instance ??= NetworkConnectTools._init();
    return _instance!;
  }

  NetworkConnectTools._init() {
    // 注册网络监听器
    networkChangeSubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // "当前使用网络 >> $result".info;
      networkConnectState..value.connectivityResult = result..refresh();
    });

    // 注册网络是否可用监听器
    networkInternetSubscription = networkConnectivityExamine.getInternetAvailabilityStream().listen((isInternetAvailable) {
      // "检查网络是否可用 >> $isInternetAvailable".info;
      networkConnectState..value.connectivityInternet = isInternetAvailable..refresh();
    });
  }

  // 动态检测网络可用性质方法
  Future<bool> isInternetConnectionAvailable() async {
    bool isNetworkConnectedOnCall = await networkConnectivityExamine.isInternetConnectionAvailable();
    networkConnectState..value.connectivityInternet = isNetworkConnectedOnCall..refresh();
    return networkConnectState.value.connectivityInternet;
  }

  // 注销方法
  dispose() async {
    await networkChangeSubscription.cancel();
    await networkInternetSubscription.cancel();
    await networkConnectivityExamine.unregisterAvailabilityListener();
  }
}