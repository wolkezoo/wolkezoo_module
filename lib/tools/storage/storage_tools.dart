import 'package:get_storage/get_storage.dart';

/// 存储工具
class StorageTools {
  factory StorageTools() => _getInstance();
  static StorageTools? _instance;
  late GetStorage _box;

  static StorageTools _getInstance() {
    _instance ??= StorageTools._init();
    return _instance!;
  }

  StorageTools._init(){
    _box = GetStorage();
  }

  GetStorage get box => _box;

  /// 存储
  Future<void> write(key, value) async => await _box.write(key, value);

  /// 读取
  dynamic read(key) => _box.read(key) ?? "";

  /// 删除
  void remove(key) => _box.remove(key);

  /// 清空所有字段
  void erase() => _box.erase();
}