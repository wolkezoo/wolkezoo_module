import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wolkezoo_module/component/text/wolke_text.dart';

class PopupBoxComponent {
  static openPopupBox({
    required String title,
    Color? titleTextColor,
    double? titleTextSize,
    FontWeightEnum? weight,
    EdgeInsets? titlePadding,
    required Widget content,
    EdgeInsets? contentPadding,
    String? textConfirm,
    String? textCancel,
    Function()? onConfirm,
    Function()? onCancel,
    Color? buttonColor,
    Color? cancelTextColor,
    Color? confirmTextColor,
    bool? barrierDismissible
  }) =>
      Get.defaultDialog(
        title: title,
        titleStyle: textStyle(
          color: titleTextColor,
          size: titleTextSize ?? 18.sp,
          weight: weight ?? FontWeightEnum.bold,
        ),
        titlePadding: titlePadding ?? EdgeInsets.only(top: 20.h),
        content: content,
        contentPadding: contentPadding ??
            EdgeInsets.only(top: 10.h, bottom: 20.h, left: 25.w, right: 25.w),
        textConfirm: textConfirm ?? "确认",
        textCancel: textCancel ?? "取消",
        onConfirm: onConfirm,
        onCancel: onCancel,
        buttonColor: buttonColor,
        confirmTextColor: confirmTextColor ?? Colors.white,
        cancelTextColor: cancelTextColor ?? Colors.black,
        barrierDismissible: barrierDismissible ?? true,
      );
}
