import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// 表单项
/// 包含 输入框 单选 多选 下拉 下拉搜索 富文本编辑器等
///
class WolkeFormItem extends StatelessWidget {
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? borderColor;
  final Color? fillColor;

  const WolkeFormItem(
      {super.key,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.borderColor,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? Colors.white,
          labelStyle: TextStyle(fontSize: 14.sp),
          contentPadding: EdgeInsets.only(left: 15.w, top: 2.h, bottom: 0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: enabledBorderColor ?? Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: focusedBorderColor ?? Colors.black)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: borderColor ?? Colors.black)),
        ),
      ),
    );
  }
}
