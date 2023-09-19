import 'dart:io';

extension DirExtension on String {
  Directory get directory => Directory(this);
  File get file => File(this);

  bool get existsDirectorySync => Directory(this).existsSync();
  bool get existsFileSync => File(this).existsSync();
}