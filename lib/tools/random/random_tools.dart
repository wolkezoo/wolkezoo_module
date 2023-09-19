import 'dart:math';

/// 生成随机数工具
class RandomTools {
  static final Random _random = Random();

  // 生成指定范围内的随机整数
  static int generateRandomInt(int min, int max) {
    return min + _random.nextInt(max - min + 1);
  }

  // 生成指定长度的随机数字字符串
  static String generateRandomNumberString(int length) {
    String result = '';

    for (int i = 0; i < length; i++) {
      result += _random.nextInt(10).toString();
    }

    return result;
  }

  // 生成指定长度的随机字母字符串
  static String generateRandomLetterString(
    int length, {
    String? letters,
    bool? toUpper,
    bool? toLower,
  }) {
    if (toUpper != null && toLower != null) {
      throw Exception(
        "random tools error，toUppers and to Lower cannot exist at the same time",
      );
    }
    letters ??= 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String result = '';

    for (int i = 0; i < length; i++) {
      result += letters[_random.nextInt(letters.length)];
    }

    if (toUpper != null && toUpper) {
      return result.toUpperCase();
    }

    if (toLower != null && toLower) {
      return result.toLowerCase();
    }

    return result;
  }

  // 生成随机字符串
  static String generateRandomString(
    int length, {
    bool? toUpper,
    bool? toLower,
  }) {
    const letters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    return generateRandomLetterString(
      length,
      letters: letters,
      toUpper: toUpper,
      toLower: toLower,
    );
  }
}
