import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class CheckboxAnimation extends StatelessWidget {
  final RxBool isChecked;
  final double size;
  final Function(bool selected)? onChanged;
  final Color checkedColor;

  const CheckboxAnimation({
    super.key,
    required this.isChecked,
    this.size = 60,
    this.checkedColor = Colors.blue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => MSHCheckbox(
      size: size,
      value: isChecked.value,
      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
        checkedColor: checkedColor,
      ),
      style: MSHCheckboxStyle.fillScaleCheck,
      onChanged: (selected) {
        isChecked..value = selected..refresh();
        onChanged?.call(selected);
      },
    ));
  }
}
