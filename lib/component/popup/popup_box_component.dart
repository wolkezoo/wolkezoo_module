import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wolkezoo_module/component/text/wolke_text.dart';
import 'package:wolkezoo_module/extension/container_extension.dart';
import 'package:wolkezoo_module/tools/common/route_tools.dart';

class PopupBoxComponent {
  static Future<T?> openPopupBox<T>({
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
    bool? barrierDismissible,
  }) async =>
      await Get.defaultDialog<T>(
        title: title,
        titleStyle: textStyle(
          color: titleTextColor,
          size: titleTextSize ?? 18.sp,
          weight: weight ?? FontWeightEnum.bold,
        ),
        titlePadding: titlePadding ?? EdgeInsets.only(top: 20.h),
        content: content,
        contentPadding: contentPadding ?? EdgeInsets.only(top: 10.h, bottom: 20.h, left: 25.w, right: 25.w),
        textConfirm: textConfirm ?? "确认",
        textCancel: textCancel ?? "取消",
        onConfirm: onConfirm,
        onCancel: onCancel,
        buttonColor: buttonColor,
        confirmTextColor: confirmTextColor ?? Colors.white,
        cancelTextColor: cancelTextColor ?? Colors.black,
        barrierDismissible: barrierDismissible ?? true,
      );

  static Future<T?> openCustomPopupBox<T>(
    List<Widget> widget, {
    AlignmentGeometry alignment = Alignment.bottomCenter,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.end,
    Color backgroundColor = Colors.white,
    EdgeInsetsGeometry? margin,
    bool barrierDismissible = true,
    bool isInputTop = false,
  }) async {
    margin ??= EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.w);
    Widget popupWidget = Stack(
      children: [
        Align(
          alignment: alignment,
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                margin: margin,
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Material(
                  color: backgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: widget,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );

    return await Get.dialog<T>(
      isInputTop
          ? Scaffold(
              backgroundColor: Colors.transparent,
              body: popupWidget.click(onTap: () {}),
            ).click(onTap: () {
              if (barrierDismissible) {
                back();
              }
            })
          : popupWidget,
      barrierDismissible: barrierDismissible,
    );
  }
}
