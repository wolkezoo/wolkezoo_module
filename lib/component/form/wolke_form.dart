import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// 表单组件
/// 提供功能：表单校验、表单提交、基本表单样式
///
class WolkeForm extends StatelessWidget {
  /// 每个元素之间的空隙
  final EdgeInsets? spaceMargin;
  final EdgeInsets? padding;
  final List<Widget> children;
  const WolkeForm({required this.children, this.padding, this.spaceMargin, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      children: children.asMap().keys.map((index) => Container(
        margin: spaceMargin ?? EdgeInsets.only(bottom: index == children.length - 1 ? 0 : 10.h),
        padding: padding ?? EdgeInsets.zero,
        child: children[index],
      )).toList(),
    );
  }
}
