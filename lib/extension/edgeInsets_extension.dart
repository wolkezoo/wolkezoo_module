import 'package:flutter/material.dart';

extension EdgeInsetsExtension on EdgeInsets {
  EdgeInsets append({
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return EdgeInsets.only(
      left: left ?? this.left,
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
    );
  }
}
