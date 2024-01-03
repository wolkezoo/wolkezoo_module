import 'package:wolkezoo_module/tools/object/object_tools.dart';

class StrUtil {
  /// 给定字符串数组全部做去首尾空格
  ///
  /// @param strs 字符串数组
  static void trim(List<String> strs) {
    if (strs.isEmpty) {
      return;
    }

    String str;
    for (int i = 0; i < strs.length; i++) {
      str = strs[i];
      if (str != null) {
        strs[i] = str.trim();
      }
    }
  }

  /// 格式化文本，使用 {varName} 占位<br>
  /// map = {a: "aValue", b: "bValue"} format("{a} and {b}", map) ---=》 aValue and bValue
  ///
  /// @param template   文本模板，被替换的部分用 {key} 表示
  /// @param map        参数值对
  /// @param ignoreNull 是否忽略 {@code null} 值，忽略则 {@code null} 值对应的变量不被替换，否则替换为""
  /// @return 格式化后的文本
  /// @since 5.7.10
  static String format(String template, Map<dynamic, dynamic>? map, bool ignoreNull) {
    if (isEmpty(template)) {
      return "";
    }

    if (null == map || map.isEmpty) {
      return template.toString();
    }

    String template0 = template.toString();
    String value;
    for (MapEntry<dynamic, dynamic> entry in map.entries) {
      value = entry.value;
      if (null == value && ignoreNull) {
        continue;
      }

      template0 = template0.replaceAll("{${entry.key()}}", value);
    }

    return template0;
  }
}
