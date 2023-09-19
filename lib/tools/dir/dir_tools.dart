import 'dart:io';

import 'package:flustars/flustars.dart';
import 'package:wolkezoo_module/tools/dir/config/dir_config.dart';
import 'package:wolkezoo_module/tools/dir/extension/dir_extension.dart';

/// 目录操作工具类
class DirTools {
  factory DirTools() => _getInstance();
  static DirTools? _instance;

  static DirTools _getInstance() {
    if (ObjectUtil.isEmpty(_dirConfig)) {
      throw Exception(
          "use DirTools.init(dirConfig0: dirConfig0) configuration");
    }
    _instance ??= DirTools._init();
    return _instance!;
  }

  static late DirConfig _dirConfig;

  /// 初始化DirTools
  /// 如需使用该工具类，使用后该操作会触发授权鉴定
  /// android 初始化该工具类后会在DirConfig._androidPath下创建一个basePath路径的文件夹
  /// ios 初始化该工具类后会在DirConfig._iosPath下创建一个basePath路径的文件夹
  static void init({required DirConfig dirConfig0}) {
    // 检查接口配置
    dirConfig0.examineConfig();
    _dirConfig = dirConfig0;
    _getInstance();
  }

  DirTools._init();

  // (检查/创建)文件夹
  bool _examineByDirectory(String directoryPath) {
    Directory directory = Directory(directoryPath);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    return directory.existsSync();
  }

  // (检查/创建)文件
  String _examineByFile(String directoryPath, String fileName) {
    _examineByDirectory(directoryPath);

    final File file = "$directoryPath/$fileName".file;
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    return file.path;
  }

  // 获取根目录
  String getBaseDirectory() {
    String path = "";
    if (Platform.isAndroid) {
      path = _dirConfig.androidPath + _dirConfig.basePath;
    }
    bool createResult = _examineByDirectory(path);
    if (!createResult) {
      throw Exception("create directory error");
    }
    return path;
  }
}
