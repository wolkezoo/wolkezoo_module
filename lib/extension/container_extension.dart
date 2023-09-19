import 'package:flutter/material.dart';

// extension wight
extension ContainerExtension on Widget {
  click({
    Function()? onTap,
    Function()? onDoubleTap,
    Function()? onLongPress,
  }) {
    return GestureDetector(
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      onTap: onTap,
      child: this,
    );
  }
}
