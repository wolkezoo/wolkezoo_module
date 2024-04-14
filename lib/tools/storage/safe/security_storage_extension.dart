import 'package:wolkezoo_module/tools/storage/safe/security_storage_tools.dart';
import 'package:wolkezoo_module/tools/storage/unsafe/storage_tools.dart';

/// 缓存扩展类
extension SecurityStorageExtension on String {
  /// 写入缓存
  Future<void> writeSafeStorage({required dynamic value}) async {
    await SecurityStorageTools().write(this, value);
  }

  /// 读取缓存
  Future<String?> get readStorage => SecurityStorageTools().read(this);

  /// 删除缓存
  void get remove => SecurityStorageTools().remove(this);
}
