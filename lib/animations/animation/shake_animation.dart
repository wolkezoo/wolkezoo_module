import 'dart:math';

import 'package:flutter/material.dart';

/// 抖动动画组件
/// shakeController 抖动控制器
/// shakeCount 抖动次数
/// shakeDuration 抖动时间
class ShakeAnimation extends StatefulWidget {
  final Widget child;
  final ShakeController shakeController;
  final double shakeCount;
  final Duration shakeDuration;

  const ShakeAnimation({
    Key? key,
    required this.child,
    required this.shakeController,
    this.shakeCount = 4,
    this.shakeDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  _ShakeAnimationState createState() => _ShakeAnimationState();
}

class _ShakeAnimationState extends State<ShakeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _shakeController;

  @override
  void initState() {
    if (widget.shakeController.shakeController != null) {
      _shakeController = widget.shakeController.shakeController!;
    } else {
      _shakeController =
          AnimationController(vsync: this, duration: widget.shakeDuration);
      widget.shakeController.shakeController = _shakeController;
    }
    _shakeController.addListener(() {
      if (_shakeController.status == AnimationStatus.completed) {
        _shakeController.reset();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shakeController,
      builder: (context, child) {
        final sineValue =
        sin(widget.shakeCount * 2 * pi * _shakeController.value);
        return Transform.translate(
          offset: Offset(sineValue * 10, 0),
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _shakeController.dispose();
  }
}

class ShakeController {
  AnimationController? shakeController;

  shake() {
    shakeController?.forward();
  }

  dispose(){
    shakeController?.dispose();
  }

  ShakeController({this.shakeController});
}
