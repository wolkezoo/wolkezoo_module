import 'package:permission_handler/permission_handler.dart';

/// 权限工具
class PermissionTools {

  static Future<Map<Permission, PermissionStatus>> applyPermission(List<Permission> permissionList) async {
    return await permissionList.request();
  }

  static List<Permission> getStorePermission() {
    return [
      Permission.storage,
      Permission.manageExternalStorage,
    ];
  }

  static Future<bool> applyFilePermission() async {
    final status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  static Future<bool> applyManageStoragePermission() async {
    final status = await Permission.manageExternalStorage.request();
    if (status == PermissionStatus.granted) {
      return true;
    }
    return false;
  }
}
