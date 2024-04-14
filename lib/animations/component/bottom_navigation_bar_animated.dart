import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wolkezoo_module/extension/container_extension.dart';

typedef IndexedWidgetBuilder = Widget Function(int index, bool isActive);

class BottomNavigationBarAnimated extends StatelessWidget {
  final int activeIndex;
  final int itemCount;
  final IndexedWidgetBuilder builder;
  final Function(int) onTap;

  const BottomNavigationBarAnimated({
    super.key,
    required this.activeIndex,
    required this.itemCount,
    required this.builder,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            itemCount,
            (index) => activeIndex == index
                ? Bounce(
                    duration: const Duration(milliseconds: 800),
                    animate: activeIndex == index,
                    from: 10,
                    child: builder(index, activeIndex == index),
                  )
                : builder(index, activeIndex == index).click(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                onTap.call(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}

// typedef IndexedWidgetBuilder = Widget Function(int index, bool isActive);

// class BottomNavigationBarAnimated extends StatelessWidget {
//   final int activeIndex;
//   final Function(int) onTap;
//   final IndexedWidgetBuilder builder;
//   final int itemCount;
//
//   const BottomNavigationBarAnimated({
//     super.key,
//     required this.activeIndex,
//     required this.builder,
//     required this.itemCount,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBottomNavigationBar.builder(
//       onTap: onTap,
//       activeIndex: activeIndex,
//       tabBuilder: builder,
//       itemCount: itemCount,
//       gapLocation: GapLocation.none,
//       notchSmoothness: NotchSmoothness.defaultEdge,
//       scaleFactor: 0.7,
//     );
//   }
// }
