import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

/// time count down widget
Widget timeCountDown({
  required int seconds,
  required Widget Function(double) build,
  Duration duration = const Duration(milliseconds: 1000),
  Function()? onFinished,
}) => Countdown(
  seconds: seconds,
  build: (BuildContext context, double time) => build(time),
  interval: duration,
  onFinished: onFinished,
);
