import 'dart:io';

import 'package:file_picker/file_picker.dart';

enum FileTypeEnum {
  any,
  media,
  image,
  video,
  audio,
  custom,
}


class FileChooseTools {
  static Future<FilePickerResult?> get fileChoose async => await FilePicker.platform.pickFiles();

  static Future<File?> get fileChooseConvertFile async {
    FilePickerResult? result = await fileChoose;
    if (result == null) {
      return null;
    }

    return File(result.files.single.path!);
  }

  static Future<File?> customObtainChooseFile({FileTypeEnum type = FileTypeEnum.any}) async {
    FileType chooseType = FileType.values.firstWhere((element) => element.name == type.name);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: chooseType,
    );
    if(result == null) {
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
