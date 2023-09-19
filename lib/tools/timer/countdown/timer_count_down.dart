import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TimerCountDown {
  static Widget countDown({
    required int seconds,
    required Widget Function(double) build,
    Duration duration = const Duration(milliseconds: 1000),
    Function()? onFinished,
  }) {
    return Countdown(
      seconds: seconds,
      build: (BuildContext context, double time) => build(time),
      interval: duration,
      onFinished: onFinished,
    );
  }
}
