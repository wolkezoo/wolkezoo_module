import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:wolkezoo_module/extension/log_extension.dart';
import 'package:wolkezoo_module/tools/dir/extension/dir_extension.dart';
import 'package:wolkezoo_module/tools/file/enums/file_kind_enums.dart';

class VideoThumbnailTools {
  static Future<Uint8List?> thumbnailData({required String filePath}) async {
    if (!filePath.existsFileSync) {
      "文件不存在 filePath >> $filePath".error;
      return null;
    }
    if (!FileKindEnums.isVideo(basename(filePath))) {
      "文件不是视频格式".error;
      return null;
    }
    return await VideoThumbnail.thumbnailData(
      video: filePath,
      imageFormat: ImageFormat.PNG,
      maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 25,
    );
  }
}
