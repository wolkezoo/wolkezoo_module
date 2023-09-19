import 'package:flustars/flustars.dart';

/// 操作系统文件配置
class DirConfig {
  String? _androidPath;
  String? _iosPath;

  String? _basePath;

  DirConfig({String? androidPath, String? iosPath, String? basePath}) {
    _androidPath = androidPath ?? "/storage/emulated/0/";
    _iosPath = iosPath ?? "/storage/emulated/0/";
    _basePath = basePath;
  }

  examineConfig() async {
    if (ObjectUtil.isEmpty(_androidPath)) {
      throw Exception(
          "use DirTools.init(dirConfig0: dirConfig0) configuration androidPath");
    }
    if (ObjectUtil.isEmpty(_iosPath)) {
      throw Exception(
          "use DirTools.init(dirConfig0: dirConfig0) configuration iosPath");
    }
    if (ObjectUtil.isEmpty(_basePath)) {
      throw Exception(
          "use DirTools.init(dirConfig0: dirConfig0) configuration basePath");
    }
  }

  String get basePath => _basePath ?? "";

  set basePath(String value) {
    _basePath = value;
  }

  String get iosPath => _iosPath ?? "/storage/emulated/0/";

  set iosPath(String value) {
    _iosPath = value;
  }

  String get androidPath => _androidPath ?? "/storage/emulated/0/";

  set androidPath(String value) {
    _androidPath = value;
  }
}
