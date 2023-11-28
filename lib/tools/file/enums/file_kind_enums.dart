enum FileKindEnums {
  video(kinds: ["mp4", "mov", "avi", "wmv", "mpg", "mpeg", "rm", "ram", "swf", "flv"]),
  image(kinds: ["jpg", "jpeg", "png", "gif", "bmp"]),
  ppt(kinds: ["ppt", "potx", "pptm"]),
  excel(kinds: ["xls", "xlsx", "xlsm", "xlsb"]),
  word(kinds: ["doc", "docx", "docm", "csv"]),
  txt(kinds: ["txt"]),
  compress(kinds: ["zip", "rar", "7z", "gz", "tar", "dmg"]),
  ;

  const FileKindEnums({required this.kinds});

  final List<String> kinds;

  static bool isVideo(String fileName) {
    FileKindEnums? kind = isKind(fileName);
    if (kind == null) {
      return false;
    }
    return kind == FileKindEnums.video;
  }

  static bool isImage(String fileName) {
    FileKindEnums? kind = isKind(fileName);
    if (kind == null) {
      return false;
    }
    return kind == FileKindEnums.image;
  }

  static bool isPpt(String fileName) {
    FileKindEnums? kind = isKind(fileName);
    if (kind == null) {
      return false;
    }
    return kind == FileKindEnums.ppt;
  }

  static bool isExcel(String fileName) {
    FileKindEnums? kind = isKind(fileName);
    if (kind == null) {
      return false;
    }
    return kind == FileKindEnums.excel;
  }

  static bool isWord(String fileName) {
    FileKindEnums? kind = isKind(fileName);
    if (kind == null) {
      return false;
    }
    return kind == FileKindEnums.word;
  }

  static bool isTxt(String fileName) {
    FileKindEnums? kind = isKind(fileName);
    if (kind == null) {
      return false;
    }
    return kind == FileKindEnums.txt;
  }

  static bool isCompress(String fileName) {
    FileKindEnums? kind = isKind(fileName);
    if (kind == null) {
      return false;
    }
    return kind == FileKindEnums.compress;
  }

  static FileKindEnums? isKind(String fileName) {
    List<String> splitFile = fileName.split(".");
    if (splitFile.isEmpty || splitFile.length < 2) {
      return null;
    }
    String suffixFileName = splitFile[1];

    if (FileKindEnums.video.kinds.contains(suffixFileName)) {
      return FileKindEnums.video;
    }
    if (FileKindEnums.image.kinds.contains(suffixFileName)) {
      return FileKindEnums.image;
    }
    if (FileKindEnums.ppt.kinds.contains(suffixFileName)) {
      return FileKindEnums.ppt;
    }
    if (FileKindEnums.excel.kinds.contains(suffixFileName)) {
      return FileKindEnums.excel;
    }
    if (FileKindEnums.word.kinds.contains(suffixFileName)) {
      return FileKindEnums.word;
    }
    if (FileKindEnums.txt.kinds.contains(suffixFileName)) {
      return FileKindEnums.txt;
    }
    if (FileKindEnums.compress.kinds.contains(suffixFileName)) {
      return FileKindEnums.compress;
    }
    return null;
  }
}
