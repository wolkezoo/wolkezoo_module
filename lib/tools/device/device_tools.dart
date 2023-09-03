import 'dart:io';

import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:wolkezoo_module/extension/log_extension.dart';

/// 设备工具类
class DeviceTools {
  // 检查设备越狱情况
  static Future<bool> examineDevicePrisonBreak() async {
    bool jailbroken = await FlutterJailbreakDetection.jailbroken;
    if(jailbroken) {
      // 设备不安全，已越狱
      "当前设备已越狱 jailbroken >> $jailbroken".info;
      return true;
    }

    return false;
  }
}