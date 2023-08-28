import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wolkezoo_module/extension/log_extension.dart';

///
/// 构造自适应、字体不随着手机改变而变的MaterialApp
Bindings? controllerBinding;

class WolkeMaterialApp extends StatelessWidget {
  final Size designSize;
  final bool minTextAdapt;
  final bool debugShowCheckedModeBanner;
  final Widget home;
  final String title;
  final Bindings? bindings;
  final ThemeData? theme;

  const WolkeMaterialApp({
    Key? key,
    required this.designSize,
    required this.home,
    required this.title,
    this.minTextAdapt = true,
    this.debugShowCheckedModeBanner = false,
    this.bindings,
    this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bindings != null) {
      "register controller bindings".info;
      controllerBinding = bindings;
    }
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      builder: (_, child) => GetMaterialApp(
        theme: theme,
        initialBinding: bindings,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        home: home,
        title: title,
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
