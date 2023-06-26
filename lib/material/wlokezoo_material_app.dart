import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
/// 构造自适应、包含字体不变MaterialApp
class WlokezooMaterialApp extends StatelessWidget {
  final Size designSize;
  final bool minTextAdapt;
  final bool debugShowCheckedModeBanner;
  final Widget home;
  final String title;

  const WlokezooMaterialApp({
    Key? key,
    required this.designSize,
    required this.home,
    required this.title,
    this.minTextAdapt = true,
    this.debugShowCheckedModeBanner = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        home: home,
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
      ),
    );
  }
}
