import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wolkezoo_module/component/text/wolke_text.dart';

///
/// 表单项
/// 包含 输入框 单选 多选 下拉 下拉搜索 富文本编辑器等
///
class WolkeFormItem extends StatelessWidget {
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? borderColor;
  final Color? fillColor;
  final EdgeInsets? outerRingPadding;
  final EdgeInsets? contentPadding;
  final String? hintText;
  final double? hintTextSize;
  final Color? hintColor;
  final FontWeightEnum? hintFontWeight;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final double? height;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final TextStyle? inputTextStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const WolkeFormItem({
    super.key,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.borderColor,
    this.fillColor,
    this.hintText,
    this.hintTextSize,
    this.hintColor,
    this.hintFontWeight,
    this.onChange,
    this.controller,
    this.keyboardType,
    this.height,
    this.contentPadding,
    this.textInputAction,
    this.onSubmitted,
    this.maxLines,
    this.inputTextStyle,
    this.prefixIcon,
    this.suffixIcon,
    EdgeInsets? outerRingPadding,
  }) : outerRingPadding =
            outerRingPadding ?? const EdgeInsets.only(left: 20, right: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: outerRingPadding,
      child: TextField(
        textInputAction: textInputAction,
        controller: controller,
        onChanged: onChange,
        maxLines: maxLines,
        style: inputTextStyle ?? textStyle(size: 14.sp),
        keyboardType: keyboardType,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? Colors.white,
          labelStyle: textStyle(size: 14.sp),
          contentPadding: contentPadding ?? EdgeInsets.only(left: 15.w, top: 2.h, bottom: 0),
          hintText: hintText,
          hintStyle: textStyle(
            size: hintTextSize,
            color: hintColor,
            weight: hintFontWeight,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            borderSide: BorderSide(color: enabledBorderColor ?? Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            borderSide: BorderSide(color: focusedBorderColor ?? Colors.black),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            borderSide: BorderSide(color: borderColor ?? Colors.black),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
