import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileChooseTools {
  static Future<FilePickerResult?> get fileChoose async => await FilePicker.platform.pickFiles();

  static Future<File?> get fileChooseConvertFile async {
    FilePickerResult? result = await fileChoose;
    if (result == null) {
      return null;
    }

    return File(result.files.single.path!);
  }

  static Future<FilePickerResult?> get fileMultipleChoose async => await FilePicker.platform.pickFiles(allowMultiple: true);

  static Future<List<File>?> get fileMultipleChooseConvertFile async {
    FilePickerResult? result = await fileMultipleChoose;
    if (result == null) {
      return null;
    }

    return result.paths.map((path) => File(path!)).toList();
  }

  static Future<String?> get selectedDirectory async => await FilePicker.platform.getDirectoryPath();
}
