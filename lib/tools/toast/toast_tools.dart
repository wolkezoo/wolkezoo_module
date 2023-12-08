import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wolkezoo_module/component/text/wolke_text.dart';

/// 吐司弹框
Future<bool?> toast(String input) async => Fluttertoast.showToast(msg: input);

class ToastTools {
  factory ToastTools() => _getInstance();
  static ToastTools? _instance;

  static ToastTools _getInstance() {
    _instance ??= ToastTools._init();
    return _instance!;
  }

  late FToast fToast;

  ToastTools._init() {
    fToast = FToast();
    fToast.init(Get.context!);
  }

  // static showToast(String msg) {
  //   toastification.show(
  //     context: Get.context!,
  //     alignment: Alignment.bottomCenter,
  //     title:  msg,
  //     type: ToastificationType.info,
  //     style: ToastificationStyle.simple,
  //     autoCloseDuration: Duration(seconds: 3),
  //   );
  // }

  showContextToast(
    String msg, {
    toastLength = Toast.LENGTH_SHORT,
    gravity = ToastGravity.TOP,
    Color? backgroundColor,
    textColor = Colors.white,
    double? fontSize,
  }) {
    fontSize ??= 14.sp;
    backgroundColor ??= Colors.grey;

    Widget toast = Container(
      // 设置阴影效果
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          text(text: msg, size: fontSize, color: textColor),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: gravity,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
