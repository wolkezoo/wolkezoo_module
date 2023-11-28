import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderComponent extends StatelessWidget {
  final double sliderValue;
  final ValueChanged<double> onChanger;
  final double min;
  final double max;

  final double? trackHeight;
  final SliderTrackShape? trackShape;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? thumbColor;
  final double? thumbShapeRadius;
  final double? overlayShapeRadius;

  const SliderComponent({
    required this.sliderValue,
    required this.onChanger,
    required this.min,
    required this.max,
    this.trackHeight,
    this.trackShape,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.thumbShapeRadius,
    this.overlayShapeRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: trackHeight ?? 5.h,
        // 轨道高度
        trackShape: trackShape ?? const RectangularSliderTrackShape(),
        // 轨道形状，可以自定义
        activeTrackColor: activeTrackColor ?? Colors.blueGrey,
        // 激活的轨道颜色
        inactiveTrackColor: inactiveTrackColor ?? Colors.black26,
        // 未激活的轨道颜色
        thumbShape: RoundSliderThumbShape(
          //  滑块形状，可以自定义
          enabledThumbRadius: thumbShapeRadius ?? 10.r, // 滑块大小
        ),
        thumbColor: thumbColor ?? Colors.white,
      ),
      child: Slider(
        value: sliderValue,
        min: min,
        max: max,
        onChanged: onChanger,
      ),
    );
  }
}
