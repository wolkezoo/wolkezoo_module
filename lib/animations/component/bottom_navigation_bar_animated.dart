import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

typedef IndexedWidgetBuilder = Widget Function(int index, bool isActive);

class BottomNavigationBarAnimated extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTap;
  final IndexedWidgetBuilder builder;
  final int itemCount;

  const BottomNavigationBarAnimated({
    super.key,
    required this.activeIndex,
    required this.builder,
    required this.itemCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      onTap: onTap,
      activeIndex: activeIndex,
      tabBuilder: builder,
      itemCount: itemCount,
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.defaultEdge,
    );
  }
}
