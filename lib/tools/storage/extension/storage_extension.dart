import 'package:wolkezoo_module/tools/storage/storage_tools.dart';

/// 缓存扩展类
extension StorageExtension on String {
  /// 写入缓存
  writeStorage({required dynamic value}) async {
    await StorageTools().write(this, value);
  }

  /// 读取缓存
  dynamic get readStorage => StorageTools().read(this);

  /// 删除缓存
  get remove => StorageTools().remove(this);
}
