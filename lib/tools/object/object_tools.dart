import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

/// 不为空
bool isNotEmpty(Object? input) => ObjectUtil.isNotEmpty(input);

/// 为空
bool isEmpty(Object? input) => !isNotEmpty(input);

bool equals(Object a, Object b){
  return a == b;
}

// ----------------------------------- Convert Type -------------------------------------------------

T _defaultValue<T>(T? defaultValue, String callBackErrorMessage) {
  if (defaultValue == null) {
    throw ObjectToolsException(callBackErrorMessage);
  }

  debugPrint('\u001b[31m【 Convert Waring 】\u001b[0m error to convert，back defaultValue');
  return defaultValue;
}

// safe conversion
T safeCast<T>(input, T defaultValue) => input is T ? input : defaultValue;

int toInt<T>(T? input, {int? defaultValue}) {
  if (isEmpty(input)) {
    return _defaultValue(defaultValue, "convert input is empty.");
  }
  try {
    if (input is int) {
      return input;
    }
    if (input is String) {
      return int.parse(input);
    }

    return input as int;
  } catch (convertException) {
    return _defaultValue(defaultValue, "convert exception，exception message: 【 ${convertException.toString()} 】");
  }
}

String toStr(dynamic input, {String? defaultValue}) {
  if (isEmpty(input)) {
    return _defaultValue(defaultValue, "convert input is empty.");
  }
  try {
    return input.toString();
  } catch (convertException) {
    return _defaultValue(defaultValue, "convert exception，exception message: 【 ${convertException.toString()} 】");
  }
}

bool toBool(dynamic input, {bool? defaultValue}) {
  if (isEmpty(input)) {
    return _defaultValue(defaultValue, "convert input is empty.");
  }
  try {
    if (input is bool) {
      return input;
    }

    if (input is String) {
      input = input.trim().toLowerCase();
      if (input == '0') {
        return false;
      }
      if (input == '1') {
        return true;
      }
      return bool.parse(input, caseSensitive: false);
    }

    if (input is int) {
      input = toStr(input).trim().toLowerCase();
      if (input == '0') {
        return false;
      }
      if (input == '1') {
        return true;
      }
      return bool.parse(input, caseSensitive: false);
    }

    return bool.parse(input);
  } catch (convertException) {
    return _defaultValue(defaultValue, "convert exception，exception message: 【 ${convertException.toString()} 】");
  }
}

class ObjectToolsException implements Exception {
  late final String message;

  ObjectToolsException(this.message);

  @override
  String toString() {
    return 'ObjectToolsException: $message';
  }
}
