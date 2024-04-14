import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityStorageException implements Exception{
  String message;
  SecurityStorageException(this.message);
}

class SecurityStorageAndroidOptions {
  bool encryptedSharedPreferences = false;
  bool restOnError = false;
}

class SecurityStorageIosOptions {
  String? groupId;
  String? accountName = AppleOptions.defaultAccountName;
  bool synchronizable = false;
}

class SecurityStorageTools {
  factory SecurityStorageTools() => _getInstance();
  static SecurityStorageTools? _instance;

  // init security tools
  static bool _initialization = false;

  /// android security options
  static AndroidOptions? _obtainAndroidOptions;

  /// ios security options
  static IOSOptions? _obtainIosOptions;

  static late FlutterSecureStorage storage;

  static void init({SecurityStorageAndroidOptions? androidOptions, SecurityStorageIosOptions? iosOptions}) {
    if (androidOptions != null) {
      _obtainAndroidOptions = AndroidOptions(
        encryptedSharedPreferences: androidOptions.encryptedSharedPreferences,
        resetOnError: androidOptions.restOnError,
      );
    }

    if (iosOptions != null) {
      _obtainIosOptions = IOSOptions(
        groupId: iosOptions.groupId,
        accountName: iosOptions.accountName,
      );
    }

    _initialization = true;
    storage = FlutterSecureStorage(
        aOptions: _obtainAndroidOptions ?? AndroidOptions.defaultOptions, iOptions: _obtainIosOptions ?? IOSOptions.defaultOptions);
  }

  static SecurityStorageTools _getInstance() {
    // check init
    if (!_initialization) {
      throw SecurityStorageException("Initialize SecurityStorageTools with SecurityStorageTools.init when calling SecurityStorageTools.");
    }

    _instance ??= SecurityStorageTools._init();
    return _instance!;
  }

  SecurityStorageTools._init();

  Future<String?> read(key) async => await storage.read(key: key);

  Future<Map<String, String>> readAll(key) async => await storage.readAll();

  Future<void> write(key, value) async => await storage.write(key: key, value: value);

  Future<void> remove(key) async => await storage.delete(key: key);

  Future<void> removeAll() async => await storage.deleteAll();
}
