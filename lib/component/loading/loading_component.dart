import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wolkezoo_module/component/text/wolke_text.dart';

class LoadingComponent {
  static void buildLoadingDialog({String? title, Color? backgroundColor}) {
    title ??= "加载中";
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 110.r,
            height: 110.r,
            decoration: BoxDecoration(color: backgroundColor ?? Colors.white, borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                //LoadingAnimationWidget.beat(color: const Color(0xFF333333), size: 40.sp),
                const CircularProgressIndicator(),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: text(text: title, size: 12.sp, weight: FontWeightEnum.bold, color: const Color(0xFF333333), decoration: TextDecoration.none),
                )
              ],
            ),
          )
        ],
      ),
      name: "loading",
    );
  }
}