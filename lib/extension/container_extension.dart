import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wolkezoo_module/component/widget/common_widget.dart';
import 'package:wolkezoo_module/extension/log_extension.dart';
import 'package:wolkezoo_module/tools/common/route_tools.dart';
import 'package:wolkezoo_module/tools/object/object_tools.dart';

enum MoveDirection { left, right }

// extension wight
extension ContainerExtension on Widget {
  /// 组件点击事件
  Widget click({
    Function()? onTap,
    Function()? onDoubleTap,
    Function()? onLongPress,
    Function()? onLeftMove,
    Function()? onRightMove,
    Function(MoveDirection direction)? onMovePress,
    double leftMoveOffset = 120,
    double rightMoveOffset = -120,
  }) {
    Offset initialSwipeOffset = Offset.zero;
    Offset finalSwipeOffset = Offset.zero;
    bool onMove = false;
    Function(DragStartDetails details) onHorizontalDragStart = (details) {};
    Function(DragUpdateDetails details) onHorizontalDragUpdate = (details) {};
    Function(DragEndDetails details) onHorizontalDragEnd = (details) {};
    if (onLeftMove != null || onRightMove != null || onMovePress != null) {
      onHorizontalDragStart = (details) {
        onMove = false;
        initialSwipeOffset = details.globalPosition;
      };
      onHorizontalDragUpdate = (details) {
        onMove = true;
        finalSwipeOffset = details.globalPosition;
      };
      onHorizontalDragEnd = (details) {
        if (initialSwipeOffset != Offset.zero && onMove) {
          final offsetDifference = initialSwipeOffset.dx - finalSwipeOffset.dx;
          if (offsetDifference > 0) {
            // 左滑
            if (offsetDifference > leftMoveOffset) {
              onLeftMove?.call();
              onMovePress?.call(MoveDirection.left);
            }
          } else {
            // 右滑
            if (offsetDifference < rightMoveOffset) {
              onRightMove?.call();
              onMovePress?.call(MoveDirection.right);
            }
          }
        }
      };
    }

    return GestureDetector(
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      onTap: onTap,
      child: this,
    );
  }

  /// 返回事件
  Widget backTap({
    Object? result,
  }) {
    return GestureDetector(
      onTap: () => back(result: result),
      child: this,
    );
  }

  /// 控制是否显示
  Widget onShow({required bool showExpression, Widget? expressionFalseWidget}) {
    return showExpression ? this : expressionFalseWidget ?? obtainEmptyWidget;
  }

  /// forEach to widget
  /// If used inside Column[], you need to add (...) in front of Widget,
  /// such as:
  /// Column(
  ///   children: [
  ///     ...Container().cycle()
  ///   ]
  /// )
  ///
  /// Or directly replace Column []
  /// such as:
  /// Column(
  ///   children: Container().cycle()
  /// )
  @Deprecated('未完成')
  List<Widget> cycle({int? cycles, List<Map<String, dynamic>>? loopData}) {
    if (ObjectTools.isEmpty(cycles) && ObjectTools.isEmpty(loopData)) {
      throw Exception(
        "cycle error, the cycles and loopData pick one of two，cannot exist at the same time",
      );
    }
    List<Widget> result = [];

    "toDiagnosticsNode().toTimelineArguments() >> ${toDiagnosticsNode().toJsonMap(DiagnosticsSerializationDelegate())}".info;

    if (ObjectTools.isNotEmpty(cycles)) {
      for (var i in Iterable.generate(cycles!)) {
        result.add(this);
      }
    }

    if (ObjectTools.isNotEmpty(loopData)) {
      result = loopData!.map((e) => this).toList();
    }

    return result;
  }
}
