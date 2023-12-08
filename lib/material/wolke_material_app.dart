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

  final Translations? translations;
  final Locale? locale;
  final Locale? fallbackLocale;

  const WolkeMaterialApp({
    super.key,
    required this.designSize,
    required this.home,
    required this.title,
    this.minTextAdapt = true,
    this.debugShowCheckedModeBanner = false,
    this.bindings,
    this.theme,
    this.translations,
    this.locale,
    this.fallbackLocale,
  });

  @override
  Widget build(BuildContext context) {
    if (bindings != null) {
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
        translations: translations,
        locale: locale,
        fallbackLocale: fallbackLocale,
        builder: (context, child) => Overlay(
          initialEntries: [
            if (child != null) ...[
              OverlayEntry(
                builder: (context) => child,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
