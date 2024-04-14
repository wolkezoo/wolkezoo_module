import 'package:wolkezoo_module/tools/function/function_tools.dart';

extension FunctionExtension on Function {
  throttle(String throttlerName) {
    FunctionTools().throttle(throttlerName, this);
  }

  void throttleWithTimeout(String throttlerName, {int? timeout}) {
    FunctionTools().throttle(throttlerName, this, timeout: timeout);
  }

  void debounce(String debounceName, {int? timeout}) {
    FunctionTools().debounce(debounceName, this, timeout: timeout);
  }
}
