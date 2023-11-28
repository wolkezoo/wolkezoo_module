import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 获取空组件
Widget get obtainEmptyWidget => const SizedBox(width: 0, height: 0);

// 空边距
EdgeInsets get obtainEmptyEdgeInsets => const EdgeInsets.all(0);

// 获取下划线
Widget obtainUnderscore({double height = 0, double thickness = 0.5, Color? color}) => Divider(
      height: height,
      thickness: thickness,
      color: color,
    );

///
/// 收起键盘
void hideKeyboard() => FocusScope.of(Get.context!).requestFocus(FocusNode());