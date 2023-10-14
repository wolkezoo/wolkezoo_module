import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:wolkezoo_module/tools/dir/extension/dir_extension.dart';

class FileTools {
  static Future<String?> getFileChecksumByPath({required String filePath}) async {
    if (!filePath.existsFileSync) {
      return "";
    }

    return getFileChecksum(file: filePath.file);
  }

  /// 计算文件md5值
  static Future<String?> getFileChecksum({required File file}) async {
    try {
      final stream = file.openRead();
      final hash = await md5.bind(stream).first;
      // NOTE: You might not need to convert it to base64
      return hash.toString();
    } catch (exception) {
      return null;
    }
  }

  /// 获取可读文件大小
  static String filesize(dynamic size, [int round = 2]) {
    /**
     * [size] can be passed as number or as string
     *
     * the optional parameter [round] specifies the number
     * of digits after comma/point (default is 2)
     */
    var divider = 1024;
    int size0;
    try {
      size0 = int.parse(size.toString());
    } catch (e) {
      throw ArgumentError('Can not parse the size parameter: $e');
    }

    if (size0 < divider) {
      return '$size0 B';
    }

    if (size0 < divider * divider && size0 % divider == 0) {
      return '${(size0 / divider).toStringAsFixed(0)} KB';
    }

    if (size0 < divider * divider) {
      return '${(size0 / divider).toStringAsFixed(round)} KB';
    }

    if (size0 < divider * divider * divider && size0 % divider == 0) {
      return '${(size0 / (divider * divider)).toStringAsFixed(0)} MB';
    }

    if (size0 < divider * divider * divider) {
      return '${(size0 / divider / divider).toStringAsFixed(round)} MB';
    }

    if (size0 < divider * divider * divider * divider && size0 % divider == 0) {
      return '${(size0 / (divider * divider * divider)).toStringAsFixed(0)} GB';
    }

    if (size0 < divider * divider * divider * divider) {
      return '${(size0 / divider / divider / divider).toStringAsFixed(round)} GB';
    }

    if (size0 < divider * divider * divider * divider * divider && size0 % divider == 0) {
      num r = size0 / divider / divider / divider / divider;
      return '${r.toStringAsFixed(0)} TB';
    }

    if (size0 < divider * divider * divider * divider * divider) {
      num r = size0 / divider / divider / divider / divider;
      return '${r.toStringAsFixed(round)} TB';
    }

    if (size0 < divider * divider * divider * divider * divider * divider && size0 % divider == 0) {
      num r = size0 / divider / divider / divider / divider / divider;
      return '${r.toStringAsFixed(0)} PB';
    } else {
      num r = size0 / divider / divider / divider / divider / divider;
      return '${r.toStringAsFixed(round)} PB';
    }
  }
}
