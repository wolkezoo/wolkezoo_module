import 'package:flustars/flustars.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:wolkezoo_module/extension/log_extension.dart';
import 'package:wolkezoo_module/tools/object/object_tools.dart';
import 'package:wolkezoo_module/tools/random/random_tools.dart';

/// 时间工具
class DateTools {
  /// 获取一次NTP时间
  static Future<DateTime> obtainOnceNtpDateTime() async {
    String lookUpAddress = "ntp.aliyun.com";
    DateTime dateTime = await NTP.now(
      lookUpAddress: lookUpAddress,
    );
    return dateTime;
  }

  /// 获取多次NTP时间
  /// 10次内循环
  static Future<DateTime?> getNtpDateTime({
    List<String>? lookUpAddress,
    int loopTotal = 10,
  }) async {
    lookUpAddress ??= [
      "ntp.aliyun.com",
      "ntp1.aliyun.com",
      "ntp2.aliyun.com",
      "ntp3.aliyun.com",
      "ntp4.aliyun.com",
      "ntp5.aliyun.com",
      "ntp6.aliyun.com",
      "ntp7.aliyun.com",
    ];
    try {
      int loopCount = 0;
      while (true) {
        // 获取随机lookUpAddress
        DateTime dateTime = await NTP
            .now(
              lookUpAddress: lookUpAddress[RandomTools.generateRandomInt(0, lookUpAddress.length - 1)],
            )
            .timeout(const Duration(milliseconds: 2000), onTimeout: () => DateTime(1999));
        if (dateTime.year != 1999) {
          return dateTime;
        }
        "获取时间失败，进入下次循环获取".error;
        // 错误时间，进入下一次轮训
        loopCount = loopCount + 1;
        if (loopCount > loopTotal) {
          return null;
        }
      }
    } catch (e) {
      "获取网络时间失败 >> $e".info;
      return DateTime.now();
    }
  }

  /// 格式化时间
  /// format dateTime
  static String format({required DateTime date, required String format}) {
    return DateFormat(format).format(date);
  }

  /// 时间前
  static String timeAgo(DateTime time, {String local = "zh", String pattern = "yyyy/MM/dd"}) {
    return GetTimeAgo.parse(time, locale: local, pattern: pattern);
  }

  static String formatDuration(Duration duration, {bool? simpleHours}) {
    String hours = duration.inHours.toString().padLeft(2, '0');
    String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (ObjectTools.isEmpty(hours)) {
      return "$minutes:$seconds";
    }
    if(hours == "00" && simpleHours != null && simpleHours){
      return "$minutes:$seconds";
    }
    return "$hours:$minutes:$seconds";
  }
}
