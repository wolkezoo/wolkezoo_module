import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:wolkezoo_module/extension/log_extension.dart';

class FunctionTools {
  factory FunctionTools() => _getInstance();
  static FunctionTools? _instance;

  static FunctionTools _getInstance() {
    _instance ??= FunctionTools._init();
    return _instance!;
  }

  FunctionTools._init();

  void debounce(String debounceName, Function fun, {int? timeout}) {
    EasyDebounce.debounce(
      debounceName,
      Duration(milliseconds: timeout ?? 500),
      () => fun(),
    );
  }

  void debounceCancel(String debounceName) {
    EasyDebounce.cancel(debounceName);
  }

  void throttle(String throttlerName, Function fun, {int? timeout, Function? throttleCallback}) {
    EasyThrottle.throttle(throttlerName, Duration(milliseconds: timeout ?? 500), () => fun(), onAfter: () => throttleCallback?.call());
  }
}
